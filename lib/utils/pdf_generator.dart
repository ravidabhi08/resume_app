import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../providers/resume_provider.dart';

Future<void> generatePDF(BuildContext context, WidgetRef ref) async {
  final resume = ref.read(resumeProvider);
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Padding(
          padding: pw.EdgeInsets.all(16),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(resume.name,
                  style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.Text(resume.email),
              pw.Text(resume.phone),
              pw.SizedBox(height: 10),
              pw.Text("Skills", style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Column(children: resume.skills.map((skill) => pw.Text("• $skill")).toList()),
              pw.SizedBox(height: 10),
              pw.Text("Experience",
                  style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Column(children: resume.experiences.map((exp) => pw.Text("• $exp")).toList()),
            ],
          ),
        );
      },
    ),
  );

  final output = await getExternalStorageDirectory();
  final file = File("${output!.path}/resume.pdf");
  await file.writeAsBytes(await pdf.save());

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
