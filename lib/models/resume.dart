import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume.freezed.dart';
part 'resume.g.dart';

@freezed
class Resume with _$Resume {
  factory Resume({
    required String name,
    required String email,
    required String phone,
    required String dob, // Changed from dOB to dob
    required String hobby,
    String? image, // Nullable image field
    @Default([]) List<String> skills, // Default empty list to avoid null issues
    @Default([]) List<String> experiences,
  }) = _Resume;

  factory Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);
}
