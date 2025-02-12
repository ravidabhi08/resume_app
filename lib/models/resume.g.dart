// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResumeImpl _$$ResumeImplFromJson(Map<String, dynamic> json) => _$ResumeImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      dOB: json['dOB'] as String,
      hobby: json['hobby'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      experiences: (json['experiences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ResumeImplToJson(_$ResumeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'dOB': instance.dOB,
      'hobby': instance.hobby,
      'skills': instance.skills,
      'experiences': instance.experiences,
    };
