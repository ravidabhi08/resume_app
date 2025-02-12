import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume.freezed.dart';
part 'resume.g.dart';

@freezed
class Resume with _$Resume {
  factory Resume({
    required String name,
    required String email,
    required String phone,
    required String dOB,
    required String hobby,
    required List<String> skills,
    required List<String> experiences,
  }) = _Resume;

  factory Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);
}
