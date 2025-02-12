import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  _ResumeFormScreenState createState() => _ResumeFormScreenState();
}

class _ResumeFormScreenState extends ConsumerState<ResumeFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  final dobController = TextEditingController();
  late TextEditingController hobbyController;
  final skillsController = TextEditingController();
  final experienceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final resume = ref.read(resumeProvider);
    nameController = TextEditingController(text: resume.name);
    emailController = TextEditingController(text: resume.email);
    phoneController = TextEditingController(text: resume.phone);
    // dobController = TextEditingController(text: resume.DOB);
    hobbyController = TextEditingController(text: resume.hobby);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    hobbyController.dispose();
    skillsController.dispose();
    experienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resume = ref.watch(resumeProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Resume Builder'),
        actions: [
          IconButton(
            icon: Icon(
                ref.read(themeProvider) == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              ref.read(themeProvider.notifier).state =
                  ref.read(themeProvider) == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CTextField(
                controller: nameController,
                labelText: 'Name',
                textInputAction: TextInputAction.done,
                hintText: 'Enter your full name',
                onChanged: (value) =>
                    ref.read(resumeProvider.notifier).state = resume.copyWith(name: value),
              ),
              SizedBox(
                height: 15,
              ),
              CTextField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter your email',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) =>
                    ref.read(resumeProvider.notifier).state = resume.copyWith(email: value),
              ),
              SizedBox(
                height: 15,
              ),
              CTextField(
                controller: phoneController,
                labelText: 'Phone',
                textInputAction: TextInputAction.done,
                hintText: 'Enter your phone number',
                keyboardType: TextInputType.phone,
                onChanged: (value) =>
                    ref.read(resumeProvider.notifier).state = resume.copyWith(phone: value),
              ),
              SizedBox(
                height: 15,
              ),
              CTextField(
                controller: dobController,
                labelText: 'DOB',
                textInputAction: TextInputAction.done,
                hintText: 'Enter your birth date',
                keyboardType: TextInputType.phone,
                onChanged: (value) =>
                    ref.read(resumeProvider.notifier).state = resume.copyWith(phone: value),
              ),
              SizedBox(
                height: 15,
              ),
              CTextField(
                controller: hobbyController,
                labelText: 'hobby',
                textInputAction: TextInputAction.done,
                hintText: 'Enter your hobby',
                keyboardType: TextInputType.phone,
                onChanged: (value) =>
                    ref.read(resumeProvider.notifier).state = resume.copyWith(phone: value),
              ),
              SizedBox(
                height: 15,
              ),
              CTextField(
                controller: skillsController,
                labelText: 'Skills',
                textInputAction: TextInputAction.done,
                hintText: 'Enter skills (comma separated)',
                onSubmit: (value) {
                  final skills = value.split(',').map((e) => e.trim()).toList();
                  ref.read(resumeProvider.notifier).state = resume.copyWith(skills: skills);
                  skillsController.clear();
                },
              ),
              SizedBox(
                height: 15,
              ),
              CTextField(
                controller: experienceController,
                labelText: 'Experience',
                textInputAction: TextInputAction.done,
                hintText: 'Enter experience (comma separated)',
                onSubmit: (value) {
                  final experiences = value.split(',').map((e) => e.trim()).toList();
                  ref.read(resumeProvider.notifier).state =
                      resume.copyWith(experiences: experiences);
                  experienceController.clear();
                },
              ),
              SizedBox(height: 20),
              CoolAnimatedButton(
                onPressed: () => generatePDF(context, ref),
              )
            ],
          ),
        ),
      ),
    );
  }
}
