// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'film_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilmState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FilmModel film) content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FilmModel film)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FilmModel film)? content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilmStateInitial value) loading,
    required TResult Function(FilmStateContent value) content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilmStateInitial value)? loading,
    TResult? Function(FilmStateContent value)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilmStateInitial value)? loading,
    TResult Function(FilmStateContent value)? content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilmStateCopyWith<$Res> {
  factory $FilmStateCopyWith(FilmState value, $Res Function(FilmState) then) =
      _$FilmStateCopyWithImpl<$Res, FilmState>;
}

/// @nodoc
class _$FilmStateCopyWithImpl<$Res, $Val extends FilmState>
    implements $FilmStateCopyWith<$Res> {
  _$FilmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FilmStateInitialImplCopyWith<$Res> {
  factory _$$FilmStateInitialImplCopyWith(_$FilmStateInitialImpl value,
          $Res Function(_$FilmStateInitialImpl) then) =
      __$$FilmStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilmStateInitialImplCopyWithImpl<$Res>
    extends _$FilmStateCopyWithImpl<$Res, _$FilmStateInitialImpl>
    implements _$$FilmStateInitialImplCopyWith<$Res> {
  __$$FilmStateInitialImplCopyWithImpl(_$FilmStateInitialImpl _value,
      $Res Function(_$FilmStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FilmStateInitialImpl implements FilmStateInitial {
  const _$FilmStateInitialImpl();

  @override
  String toString() {
    return 'FilmState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FilmStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FilmModel film) content,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FilmModel film)? content,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FilmModel film)? content,
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
    required TResult Function(FilmStateInitial value) loading,
    required TResult Function(FilmStateContent value) content,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilmStateInitial value)? loading,
    TResult? Function(FilmStateContent value)? content,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilmStateInitial value)? loading,
    TResult Function(FilmStateContent value)? content,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FilmStateInitial implements FilmState {
  const factory FilmStateInitial() = _$FilmStateInitialImpl;
}

/// @nodoc
abstract class _$$FilmStateContentImplCopyWith<$Res> {
  factory _$$FilmStateContentImplCopyWith(_$FilmStateContentImpl value,
          $Res Function(_$FilmStateContentImpl) then) =
      __$$FilmStateContentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FilmModel film});
}

/// @nodoc
class __$$FilmStateContentImplCopyWithImpl<$Res>
    extends _$FilmStateCopyWithImpl<$Res, _$FilmStateContentImpl>
    implements _$$FilmStateContentImplCopyWith<$Res> {
  __$$FilmStateContentImplCopyWithImpl(_$FilmStateContentImpl _value,
      $Res Function(_$FilmStateContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? film = null,
  }) {
    return _then(_$FilmStateContentImpl(
      film: null == film
          ? _value.film
          : film // ignore: cast_nullable_to_non_nullable
              as FilmModel,
    ));
  }
}

/// @nodoc

class _$FilmStateContentImpl implements FilmStateContent {
  const _$FilmStateContentImpl({required this.film});

  @override
  final FilmModel film;

  @override
  String toString() {
    return 'FilmState.content(film: $film)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilmStateContentImpl &&
            (identical(other.film, film) || other.film == film));
  }

  @override
  int get hashCode => Object.hash(runtimeType, film);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilmStateContentImplCopyWith<_$FilmStateContentImpl> get copyWith =>
      __$$FilmStateContentImplCopyWithImpl<_$FilmStateContentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FilmModel film) content,
  }) {
    return content(film);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FilmModel film)? content,
  }) {
    return content?.call(film);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FilmModel film)? content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(film);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilmStateInitial value) loading,
    required TResult Function(FilmStateContent value) content,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilmStateInitial value)? loading,
    TResult? Function(FilmStateContent value)? content,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilmStateInitial value)? loading,
    TResult Function(FilmStateContent value)? content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class FilmStateContent implements FilmState {
  const factory FilmStateContent({required final FilmModel film}) =
      _$FilmStateContentImpl;

  FilmModel get film;
  @JsonKey(ignore: true)
  _$$FilmStateContentImplCopyWith<_$FilmStateContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
