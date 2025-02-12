// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Resume _$ResumeFromJson(Map<String, dynamic> json) {
  return _Resume.fromJson(json);
}

/// @nodoc
mixin _$Resume {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get dOB => throw _privateConstructorUsedError;
  String get hobby => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  List<String> get experiences => throw _privateConstructorUsedError;

  /// Serializes this Resume to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Resume
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResumeCopyWith<Resume> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResumeCopyWith<$Res> {
  factory $ResumeCopyWith(Resume value, $Res Function(Resume) then) =
      _$ResumeCopyWithImpl<$Res, Resume>;
  @useResult
  $Res call(
      {String name,
      String email,
      String phone,
      String dOB,
      String hobby,
      List<String> skills,
      List<String> experiences});
}

/// @nodoc
class _$ResumeCopyWithImpl<$Res, $Val extends Resume>
    implements $ResumeCopyWith<$Res> {
  _$ResumeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Resume
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? dOB = null,
    Object? hobby = null,
    Object? skills = null,
    Object? experiences = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      dOB: null == dOB
          ? _value.dOB
          : dOB // ignore: cast_nullable_to_non_nullable
              as String,
      hobby: null == hobby
          ? _value.hobby
          : hobby // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      experiences: null == experiences
          ? _value.experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResumeImplCopyWith<$Res> implements $ResumeCopyWith<$Res> {
  factory _$$ResumeImplCopyWith(
          _$ResumeImpl value, $Res Function(_$ResumeImpl) then) =
      __$$ResumeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String phone,
      String dOB,
      String hobby,
      List<String> skills,
      List<String> experiences});
}

/// @nodoc
class __$$ResumeImplCopyWithImpl<$Res>
    extends _$ResumeCopyWithImpl<$Res, _$ResumeImpl>
    implements _$$ResumeImplCopyWith<$Res> {
  __$$ResumeImplCopyWithImpl(
      _$ResumeImpl _value, $Res Function(_$ResumeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Resume
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? dOB = null,
    Object? hobby = null,
    Object? skills = null,
    Object? experiences = null,
  }) {
    return _then(_$ResumeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      dOB: null == dOB
          ? _value.dOB
          : dOB // ignore: cast_nullable_to_non_nullable
              as String,
      hobby: null == hobby
          ? _value.hobby
          : hobby // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      experiences: null == experiences
          ? _value._experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResumeImpl implements _Resume {
  _$ResumeImpl(
      {required this.name,
      required this.email,
      required this.phone,
      required this.dOB,
      required this.hobby,
      required final List<String> skills,
      required final List<String> experiences})
      : _skills = skills,
        _experiences = experiences;

  factory _$ResumeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResumeImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String dOB;
  @override
  final String hobby;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  final List<String> _experiences;
  @override
  List<String> get experiences {
    if (_experiences is EqualUnmodifiableListView) return _experiences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_experiences);
  }

  @override
  String toString() {
    return 'Resume(name: $name, email: $email, phone: $phone, dOB: $dOB, hobby: $hobby, skills: $skills, experiences: $experiences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.dOB, dOB) || other.dOB == dOB) &&
            (identical(other.hobby, hobby) || other.hobby == hobby) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality()
                .equals(other._experiences, _experiences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      phone,
      dOB,
      hobby,
      const DeepCollectionEquality().hash(_skills),
      const DeepCollectionEquality().hash(_experiences));

  /// Create a copy of Resume
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeImplCopyWith<_$ResumeImpl> get copyWith =>
      __$$ResumeImplCopyWithImpl<_$ResumeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResumeImplToJson(
      this,
    );
  }
}

abstract class _Resume implements Resume {
  factory _Resume(
      {required final String name,
      required final String email,
      required final String phone,
      required final String dOB,
      required final String hobby,
      required final List<String> skills,
      required final List<String> experiences}) = _$ResumeImpl;

  factory _Resume.fromJson(Map<String, dynamic> json) = _$ResumeImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get dOB;
  @override
  String get hobby;
  @override
  List<String> get skills;
  @override
  List<String> get experiences;

  /// Create a copy of Resume
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResumeImplCopyWith<_$ResumeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
