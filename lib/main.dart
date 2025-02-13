import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_app/providers/resume_provider.dart';
import 'package:resume_app/providers/theme_provider.dart';
import 'package:resume_app/utils/button.dart';
import 'package:resume_app/utils/c_text_field.dart';
import 'package:resume_app/utils/pdf_generator.dart';

void main() {
  runApp(ProviderScope(child: ResumeApp()));
}

class ResumeApp extends ConsumerWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume App',
      themeMode: themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: ResumeFormScreen(),
    );
  }
}

class ResumeFormScreen extends ConsumerStatefulWidget {
  const ResumeFormScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResumeFormScreenState createState() => _ResumeFormScreenState();
}

class _ResumeFormScreenState extends ConsumerState<ResumeFormScreen> {
  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate = DateTime.now();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController hobbyController;
  final skillsController = TextEditingController();
  final experienceController = TextEditingController();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    final resume = ref.read(resumeProvider);
    nameController = TextEditingController(text: resume.name);
    emailController = TextEditingController(text: resume.email);
    phoneController = TextEditingController(text: resume.phone);
    hobbyController = TextEditingController(text: resume.hobby);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    hobbyController.dispose();
    skillsController.dispose();
    experienceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      ref.read(resumeProvider.notifier).update((state) => state.copyWith(image: pickedFile.path));
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {}); // Ensure UI rebuilds with latest provider state
      generatePDF(context, ref);
    }
  }

  @override
  Widget build(BuildContext context) {
    final resume = ref.watch(resumeProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Resume Builder'),
        actions: [
          IconButton(
            icon: Icon(
                ref.watch(themeProvider) == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              ref.read(themeProvider.notifier).state =
                  ref.read(themeProvider) == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : (resume.image != null && resume.image!.isNotEmpty)
                            ? FileImage(File(resume.image!))
                            : null,
                    child: _selectedImage == null && (resume.image == null || resume.image!.isEmpty)
                        ? const Icon(Icons.camera_alt, size: 40, color: Colors.black54)
                        : null,
                  ),
                ),
                const SizedBox(height: 15),
                CTextField(
                  controller: nameController,
                  labelText: 'Name',
                  textInputAction: TextInputAction.done,
                  hintText: 'Enter your full name',
                  validator: (value) => value == null || value.isEmpty ? "Name is required" : null,
                  onChanged: (value) => ref
                      .read(resumeProvider.notifier)
                      .update((state) => state.copyWith(name: value)),
                ),
                const SizedBox(height: 15),
                CTextField(
                  controller: emailController,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value == null || value.isEmpty
                      ? "Email is required"
                      : (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)
                          ? "Enter a valid email"
                          : null),
                  onChanged: (value) => ref
                      .read(resumeProvider.notifier)
                      .update((state) => state.copyWith(email: value)),
                ),
                const SizedBox(height: 15),
                CTextField(
                  controller: phoneController,
                  labelText: 'Phone',
                  textInputAction: TextInputAction.done,
                  hintText: 'Enter your phone number',
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      value == null || value.isEmpty ? "Phone number is required" : null,
                  onChanged: (value) => ref
                      .read(resumeProvider.notifier)
                      .update((state) => state.copyWith(phone: value)),
                ),
                const SizedBox(height: 15),
                CTextField(
                  controller: hobbyController,
                  labelText: 'Hobby',
                  textInputAction: TextInputAction.done,
                  hintText: 'Enter your hobby',
                  validator: (value) => value == null || value.isEmpty ? "Hobby is required" : null,
                  onChanged: (value) => ref
                      .read(resumeProvider.notifier)
                      .update((state) => state.copyWith(hobby: value)),
                ),
                const SizedBox(height: 15),
                CTextField(
                  controller: skillsController,
                  labelText: 'Skills',
                  textInputAction: TextInputAction.done,
                  hintText: 'Enter skills (comma separated)',
                  onSubmit: (value) {
                    if (value.isNotEmpty) {
                      final skills = value.split(',').map((e) => e.trim()).toList();
                      ref
                          .read(resumeProvider.notifier)
                          .update((state) => state.copyWith(skills: skills));
                      skillsController.clear();
                    }
                  },
                ),
                const SizedBox(height: 15),
                CTextField(
                  controller: experienceController,
                  labelText: 'Experience',
                  textInputAction: TextInputAction.done,
                  hintText: 'Enter experience (comma separated)',
                  onSubmit: (value) {
                    if (value.isNotEmpty) {
                      final experiences = value.split(',').map((e) => e.trim()).toList();
                      ref
                          .read(resumeProvider.notifier)
                          .update((state) => state.copyWith(experiences: experiences));
                      experienceController.clear();
                    }
                  },
                ),
                const SizedBox(height: 20),
                CoolAnimatedButton(
                  onPressed: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
