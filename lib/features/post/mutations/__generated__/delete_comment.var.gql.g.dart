// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_comment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteCommentVars> _$gDeleteCommentVarsSerializer =
    new _$GDeleteCommentVarsSerializer();

class _$GDeleteCommentVarsSerializer
    implements StructuredSerializer<GDeleteCommentVars> {
  @override
  final Iterable<Type> types = const [GDeleteCommentVars, _$GDeleteCommentVars];
  @override
  final String wireName = 'GDeleteCommentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteCommentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GDeleteCommentInput)),
    ];

    return result;
  }

  @override
  GDeleteCommentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteCommentVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GDeleteCommentInput))!
              as _i1.GDeleteCommentInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteCommentVars extends GDeleteCommentVars {
  @override
  final _i1.GDeleteCommentInput input;

  factory _$GDeleteCommentVars(
          [void Function(GDeleteCommentVarsBuilder)? updates]) =>
      (new GDeleteCommentVarsBuilder()..update(updates))._build();

  _$GDeleteCommentVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GDeleteCommentVars', 'input');
  }

  @override
  GDeleteCommentVars rebuild(
          void Function(GDeleteCommentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteCommentVarsBuilder toBuilder() =>
      new GDeleteCommentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteCommentVars && input == other.input;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, input.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteCommentVars')
          ..add('input', input))
        .toString();
  }
}

class GDeleteCommentVarsBuilder
    implements Builder<GDeleteCommentVars, GDeleteCommentVarsBuilder> {
  _$GDeleteCommentVars? _$v;

  _i1.GDeleteCommentInputBuilder? _input;
  _i1.GDeleteCommentInputBuilder get input =>
      _$this._input ??= new _i1.GDeleteCommentInputBuilder();
  set input(_i1.GDeleteCommentInputBuilder? input) => _$this._input = input;

  GDeleteCommentVarsBuilder();

  GDeleteCommentVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteCommentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteCommentVars;
  }

  @override
  void update(void Function(GDeleteCommentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteCommentVars build() => _build();

  _$GDeleteCommentVars _build() {
    _$GDeleteCommentVars _$result;
    try {
      _$result = _$v ?? new _$GDeleteCommentVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteCommentVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
