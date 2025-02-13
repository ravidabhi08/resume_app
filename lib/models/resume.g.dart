// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResumeImpl _$$ResumeImplFromJson(Map<String, dynamic> json) => _$ResumeImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      dob: json['dob'] as String,
      hobby: json['hobby'] as String,
      image: json['image'] as String?,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      experiences: (json['experiences'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ResumeImplToJson(_$ResumeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'dob': instance.dob,
      'hobby': instance.hobby,
      'image': instance.image,
      'skills': instance.skills,
      'experiences': instance.experiences,
    };
