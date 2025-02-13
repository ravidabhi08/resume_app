import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../providers/resume_provider.dart';

Future<void> generatePDF(BuildContext context, WidgetRef ref) async {
  final resume = ref.read(resumeProvider);
  final pdf = pw.Document();

  // Load profile image if available
  pw.MemoryImage? profileImage;
  if (resume.image != null && resume.image!.isNotEmpty) {
    final imageFile = File(resume.image!);
    if (imageFile.existsSync()) {
      final imageBytes = await imageFile.readAsBytes();
      profileImage = pw.MemoryImage(imageBytes);
    }
  }

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Padding(
            padding: pw.EdgeInsets.all(20),
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                // Profile Image
                if (profileImage != null)
                  pw.Container(
                    width: 100,
                    height: 100,
                    decoration: pw.BoxDecoration(
                      shape: pw.BoxShape.circle,
                      image: pw.DecorationImage(
                        image: profileImage,
                        fit: pw.BoxFit.cover,
                      ),
                    ),
                  ),
                pw.SizedBox(height: 20),

                // Name & Contact Info
                pw.Text(resume.name,
                    style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 5),
                pw.Text(resume.email, style: pw.TextStyle(fontSize: 14)),
                pw.Text(resume.phone, style: pw.TextStyle(fontSize: 14)),
                pw.SizedBox(height: 15),

                // Date of Birth
                // pw.Text("Date of Birth: ${resume.dob}",
                //     style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
                // pw.SizedBox(height: 10),

                // Hobby
                pw.Text("Hobby: ${resume.hobby}",
                    style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 20),

                // Skills Section
                pw.Text("Skills",
                    style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 5),
                if (resume.skills.isNotEmpty)
                  pw.Column(
                    children: resume.skills
                        .map((skill) => pw.Text("• $skill", style: pw.TextStyle(fontSize: 14)))
                        .toList(),
                  )
                else
                  pw.Text("No skills added",
                      style: pw.TextStyle(fontSize: 12, color: PdfColors.grey)),
                pw.SizedBox(height: 20),

                // Experience Section
                pw.Text("Experience",
                    style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 5),
                if (resume.experiences.isNotEmpty)
                  pw.Column(
                    children: resume.experiences
                        .map((exp) => pw.Text("• $exp", style: pw.TextStyle(fontSize: 14)))
                        .toList(),
                  )
                else
                  pw.Text("No experience added",
                      style: pw.TextStyle(fontSize: 12, color: PdfColors.grey)),
              ],
            ),
          ),
        );
      },
    ),
  );

  // Save PDF to storage
  final output = await getExternalStorageDirectory();
  final file = File("${output!.path}/resume.pdf");
  await file.writeAsBytes(await pdf.save());

  // Show Dialog for Actions
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Resume Generated"),
        content: Text("What do you want to do?"),
        actions: [
          TextButton(
            onPressed: () {
              OpenFile.open(file.path);
              Navigator.pop(context);
            },
            child: Text("Open"),
          ),
          TextButton(
            onPressed: () {
              Share.shareXFiles([XFile(file.path)], text: "Here is my resume!");
              Navigator.pop(context);
            },
            child: Text("Share"),
          ),
        ],
      );
    },
  );
}
