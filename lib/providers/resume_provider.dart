import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/resume.dart';

final resumeProvider = StateProvider<Resume>((ref) {
  return Resume(
    name: '',
    email: '',
    phone: '',
    skills: [],
    dOB: '',
    hobby: '',
    experiences: [],
  );
});
