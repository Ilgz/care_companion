// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_fav_status_updater_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleFavoriteStatusUpdaterState {
  List<Article> get articles => throw _privateConstructorUsedError;
  List<String> get favIdList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleFavoriteStatusUpdaterStateCopyWith<ArticleFavoriteStatusUpdaterState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleFavoriteStatusUpdaterStateCopyWith<$Res> {
  factory $ArticleFavoriteStatusUpdaterStateCopyWith(
          ArticleFavoriteStatusUpdaterState value,
          $Res Function(ArticleFavoriteStatusUpdaterState) then) =
      _$ArticleFavoriteStatusUpdaterStateCopyWithImpl<$Res,
          ArticleFavoriteStatusUpdaterState>;
  @useResult
  $Res call({List<Article> articles, List<String> favIdList});
}

/// @nodoc
class _$ArticleFavoriteStatusUpdaterStateCopyWithImpl<$Res,
        $Val extends ArticleFavoriteStatusUpdaterState>
    implements $ArticleFavoriteStatusUpdaterStateCopyWith<$Res> {
  _$ArticleFavoriteStatusUpdaterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
    Object? favIdList = null,
  }) {
    return _then(_value.copyWith(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      favIdList: null == favIdList
          ? _value.favIdList
          : favIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleFavoriteStatusUpdaterStateCopyWith<$Res>
    implements $ArticleFavoriteStatusUpdaterStateCopyWith<$Res> {
  factory _$$_ArticleFavoriteStatusUpdaterStateCopyWith(
          _$_ArticleFavoriteStatusUpdaterState value,
          $Res Function(_$_ArticleFavoriteStatusUpdaterState) then) =
      __$$_ArticleFavoriteStatusUpdaterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Article> articles, List<String> favIdList});
}

/// @nodoc
class __$$_ArticleFavoriteStatusUpdaterStateCopyWithImpl<$Res>
    extends _$ArticleFavoriteStatusUpdaterStateCopyWithImpl<$Res,
        _$_ArticleFavoriteStatusUpdaterState>
    implements _$$_ArticleFavoriteStatusUpdaterStateCopyWith<$Res> {
  __$$_ArticleFavoriteStatusUpdaterStateCopyWithImpl(
      _$_ArticleFavoriteStatusUpdaterState _value,
      $Res Function(_$_ArticleFavoriteStatusUpdaterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
    Object? favIdList = null,
  }) {
    return _then(_$_ArticleFavoriteStatusUpdaterState(
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      favIdList: null == favIdList
          ? _value._favIdList
          : favIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_ArticleFavoriteStatusUpdaterState
    implements _ArticleFavoriteStatusUpdaterState {
  _$_ArticleFavoriteStatusUpdaterState(
      {required final List<Article> articles,
      required final List<String> favIdList})
      : _articles = articles,
        _favIdList = favIdList;

  final List<Article> _articles;
  @override
  List<Article> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  final List<String> _favIdList;
  @override
  List<String> get favIdList {
    if (_favIdList is EqualUnmodifiableListView) return _favIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favIdList);
  }

  @override
  String toString() {
    return 'ArticleFavoriteStatusUpdaterState(articles: $articles, favIdList: $favIdList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleFavoriteStatusUpdaterState &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            const DeepCollectionEquality()
                .equals(other._favIdList, _favIdList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_articles),
      const DeepCollectionEquality().hash(_favIdList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleFavoriteStatusUpdaterStateCopyWith<
          _$_ArticleFavoriteStatusUpdaterState>
      get copyWith => __$$_ArticleFavoriteStatusUpdaterStateCopyWithImpl<
          _$_ArticleFavoriteStatusUpdaterState>(this, _$identity);
}

abstract class _ArticleFavoriteStatusUpdaterState
    implements ArticleFavoriteStatusUpdaterState {
  factory _ArticleFavoriteStatusUpdaterState(
          {required final List<Article> articles,
          required final List<String> favIdList}) =
      _$_ArticleFavoriteStatusUpdaterState;

  @override
  List<Article> get articles;
  @override
  List<String> get favIdList;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleFavoriteStatusUpdaterStateCopyWith<
          _$_ArticleFavoriteStatusUpdaterState>
      get copyWith => throw _privateConstructorUsedError;
}
