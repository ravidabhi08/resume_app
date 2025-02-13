import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/resume.dart';

final resumeProvider = StateProvider<Resume>((ref) {
  return Resume(
    name: '',
    email: '',
    phone: '',
    dob: '', // Changed from dOB to dob
    hobby: '',
    image: null, // Nullable image field
    skills: [],
    experiences: [],
  );
});

