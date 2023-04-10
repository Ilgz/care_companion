// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleDto {
  @HiveField(3)
  String get image => throw _privateConstructorUsedError;
  @HiveField(2)
  String get body => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(0)
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleDtoCopyWith<ArticleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleDtoCopyWith<$Res> {
  factory $ArticleDtoCopyWith(
          ArticleDto value, $Res Function(ArticleDto) then) =
      _$ArticleDtoCopyWithImpl<$Res, ArticleDto>;
  @useResult
  $Res call(
      {@HiveField(3) String image,
      @HiveField(2) String body,
      @HiveField(1) String name,
      @HiveField(0) DateTime date});
}

/// @nodoc
class _$ArticleDtoCopyWithImpl<$Res, $Val extends ArticleDto>
    implements $ArticleDtoCopyWith<$Res> {
  _$ArticleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? body = null,
    Object? name = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleDtoCopyWith<$Res>
    implements $ArticleDtoCopyWith<$Res> {
  factory _$$_ArticleDtoCopyWith(
          _$_ArticleDto value, $Res Function(_$_ArticleDto) then) =
      __$$_ArticleDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(3) String image,
      @HiveField(2) String body,
      @HiveField(1) String name,
      @HiveField(0) DateTime date});
}

/// @nodoc
class __$$_ArticleDtoCopyWithImpl<$Res>
    extends _$ArticleDtoCopyWithImpl<$Res, _$_ArticleDto>
    implements _$$_ArticleDtoCopyWith<$Res> {
  __$$_ArticleDtoCopyWithImpl(
      _$_ArticleDto _value, $Res Function(_$_ArticleDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? body = null,
    Object? name = null,
    Object? date = null,
  }) {
    return _then(_$_ArticleDto(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0)
class _$_ArticleDto extends _ArticleDto {
  _$_ArticleDto(
      {@HiveField(3) required this.image,
      @HiveField(2) required this.body,
      @HiveField(1) required this.name,
      @HiveField(0) required this.date})
      : super._();

  @override
  @HiveField(3)
  final String image;
  @override
  @HiveField(2)
  final String body;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(0)
  final DateTime date;

  @override
  String toString() {
    return 'ArticleDto(image: $image, body: $body, name: $name, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleDto &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, body, name, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleDtoCopyWith<_$_ArticleDto> get copyWith =>
      __$$_ArticleDtoCopyWithImpl<_$_ArticleDto>(this, _$identity);
}

abstract class _ArticleDto extends ArticleDto {
  factory _ArticleDto(
      {@HiveField(3) required final String image,
      @HiveField(2) required final String body,
      @HiveField(1) required final String name,
      @HiveField(0) required final DateTime date}) = _$_ArticleDto;
  _ArticleDto._() : super._();

  @override
  @HiveField(3)
  String get image;
  @override
  @HiveField(2)
  String get body;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(0)
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleDtoCopyWith<_$_ArticleDto> get copyWith =>
      throw _privateConstructorUsedError;
}
