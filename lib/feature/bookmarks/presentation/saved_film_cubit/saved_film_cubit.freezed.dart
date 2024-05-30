// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_film_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SavedFilmState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<FilmEntity> films) content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<FilmEntity> films)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<FilmEntity> films)? content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SavedFilmStateInitial value) loading,
    required TResult Function(SavedFilmStateContent value) content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SavedFilmStateInitial value)? loading,
    TResult? Function(SavedFilmStateContent value)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SavedFilmStateInitial value)? loading,
    TResult Function(SavedFilmStateContent value)? content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedFilmStateCopyWith<$Res> {
  factory $SavedFilmStateCopyWith(
          SavedFilmState value, $Res Function(SavedFilmState) then) =
      _$SavedFilmStateCopyWithImpl<$Res, SavedFilmState>;
}

/// @nodoc
class _$SavedFilmStateCopyWithImpl<$Res, $Val extends SavedFilmState>
    implements $SavedFilmStateCopyWith<$Res> {
  _$SavedFilmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SavedFilmStateInitialImplCopyWith<$Res> {
  factory _$$SavedFilmStateInitialImplCopyWith(
          _$SavedFilmStateInitialImpl value,
          $Res Function(_$SavedFilmStateInitialImpl) then) =
      __$$SavedFilmStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavedFilmStateInitialImplCopyWithImpl<$Res>
    extends _$SavedFilmStateCopyWithImpl<$Res, _$SavedFilmStateInitialImpl>
    implements _$$SavedFilmStateInitialImplCopyWith<$Res> {
  __$$SavedFilmStateInitialImplCopyWithImpl(_$SavedFilmStateInitialImpl _value,
      $Res Function(_$SavedFilmStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SavedFilmStateInitialImpl implements SavedFilmStateInitial {
  const _$SavedFilmStateInitialImpl();

  @override
  String toString() {
    return 'SavedFilmState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedFilmStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<FilmEntity> films) content,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<FilmEntity> films)? content,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<FilmEntity> films)? content,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SavedFilmStateInitial value) loading,
    required TResult Function(SavedFilmStateContent value) content,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SavedFilmStateInitial value)? loading,
    TResult? Function(SavedFilmStateContent value)? content,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SavedFilmStateInitial value)? loading,
    TResult Function(SavedFilmStateContent value)? content,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SavedFilmStateInitial implements SavedFilmState {
  const factory SavedFilmStateInitial() = _$SavedFilmStateInitialImpl;
}

/// @nodoc
abstract class _$$SavedFilmStateContentImplCopyWith<$Res> {
  factory _$$SavedFilmStateContentImplCopyWith(
          _$SavedFilmStateContentImpl value,
          $Res Function(_$SavedFilmStateContentImpl) then) =
      __$$SavedFilmStateContentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FilmEntity> films});
}

/// @nodoc
class __$$SavedFilmStateContentImplCopyWithImpl<$Res>
    extends _$SavedFilmStateCopyWithImpl<$Res, _$SavedFilmStateContentImpl>
    implements _$$SavedFilmStateContentImplCopyWith<$Res> {
  __$$SavedFilmStateContentImplCopyWithImpl(_$SavedFilmStateContentImpl _value,
      $Res Function(_$SavedFilmStateContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? films = null,
  }) {
    return _then(_$SavedFilmStateContentImpl(
      films: null == films
          ? _value._films
          : films // ignore: cast_nullable_to_non_nullable
              as List<FilmEntity>,
    ));
  }
}

/// @nodoc

class _$SavedFilmStateContentImpl implements SavedFilmStateContent {
  const _$SavedFilmStateContentImpl({required final List<FilmEntity> films})
      : _films = films;

  final List<FilmEntity> _films;
  @override
  List<FilmEntity> get films {
    if (_films is EqualUnmodifiableListView) return _films;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_films);
  }

  @override
  String toString() {
    return 'SavedFilmState.content(films: $films)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedFilmStateContentImpl &&
            const DeepCollectionEquality().equals(other._films, _films));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_films));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedFilmStateContentImplCopyWith<_$SavedFilmStateContentImpl>
      get copyWith => __$$SavedFilmStateContentImplCopyWithImpl<
          _$SavedFilmStateContentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<FilmEntity> films) content,
  }) {
    return content(films);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<FilmEntity> films)? content,
  }) {
    return content?.call(films);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<FilmEntity> films)? content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(films);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SavedFilmStateInitial value) loading,
    required TResult Function(SavedFilmStateContent value) content,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SavedFilmStateInitial value)? loading,
    TResult? Function(SavedFilmStateContent value)? content,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SavedFilmStateInitial value)? loading,
    TResult Function(SavedFilmStateContent value)? content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class SavedFilmStateContent implements SavedFilmState {
  const factory SavedFilmStateContent({required final List<FilmEntity> films}) =
      _$SavedFilmStateContentImpl;

  List<FilmEntity> get films;
  @JsonKey(ignore: true)
  _$$SavedFilmStateContentImplCopyWith<_$SavedFilmStateContentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
