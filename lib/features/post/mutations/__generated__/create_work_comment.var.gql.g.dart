// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_work_comment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateWorkCommentVars> _$gCreateWorkCommentVarsSerializer =
    new _$GCreateWorkCommentVarsSerializer();

class _$GCreateWorkCommentVarsSerializer
    implements StructuredSerializer<GCreateWorkCommentVars> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkCommentVars,
    _$GCreateWorkCommentVars
  ];
  @override
  final String wireName = 'GCreateWorkCommentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkCommentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateWorkCommentInput)),
    ];

    return result;
  }

  @override
  GCreateWorkCommentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkCommentVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCreateWorkCommentInput))!
              as _i1.GCreateWorkCommentInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkCommentVars extends GCreateWorkCommentVars {
  @override
  final _i1.GCreateWorkCommentInput input;

  factory _$GCreateWorkCommentVars(
          [void Function(GCreateWorkCommentVarsBuilder)? updates]) =>
      (new GCreateWorkCommentVarsBuilder()..update(updates))._build();

  _$GCreateWorkCommentVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GCreateWorkCommentVars', 'input');
  }

  @override
  GCreateWorkCommentVars rebuild(
          void Function(GCreateWorkCommentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkCommentVarsBuilder toBuilder() =>
      new GCreateWorkCommentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkCommentVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateWorkCommentVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateWorkCommentVarsBuilder
    implements Builder<GCreateWorkCommentVars, GCreateWorkCommentVarsBuilder> {
  _$GCreateWorkCommentVars? _$v;

  _i1.GCreateWorkCommentInputBuilder? _input;
  _i1.GCreateWorkCommentInputBuilder get input =>
      _$this._input ??= new _i1.GCreateWorkCommentInputBuilder();
  set input(_i1.GCreateWorkCommentInputBuilder? input) => _$this._input = input;

  GCreateWorkCommentVarsBuilder();

  GCreateWorkCommentVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkCommentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkCommentVars;
  }

  @override
  void update(void Function(GCreateWorkCommentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkCommentVars build() => _build();

  _$GCreateWorkCommentVars _build() {
    _$GCreateWorkCommentVars _$result;
    try {
      _$result = _$v ?? new _$GCreateWorkCommentVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateWorkCommentVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
