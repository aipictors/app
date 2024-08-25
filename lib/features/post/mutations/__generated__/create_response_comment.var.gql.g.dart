// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_response_comment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateResponseCommentVars> _$gCreateResponseCommentVarsSerializer =
    new _$GCreateResponseCommentVarsSerializer();

class _$GCreateResponseCommentVarsSerializer
    implements StructuredSerializer<GCreateResponseCommentVars> {
  @override
  final Iterable<Type> types = const [
    GCreateResponseCommentVars,
    _$GCreateResponseCommentVars
  ];
  @override
  final String wireName = 'GCreateResponseCommentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateResponseCommentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateResponseCommentInput)),
    ];

    return result;
  }

  @override
  GCreateResponseCommentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateResponseCommentVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i1.GCreateResponseCommentInput))!
              as _i1.GCreateResponseCommentInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateResponseCommentVars extends GCreateResponseCommentVars {
  @override
  final _i1.GCreateResponseCommentInput input;

  factory _$GCreateResponseCommentVars(
          [void Function(GCreateResponseCommentVarsBuilder)? updates]) =>
      (new GCreateResponseCommentVarsBuilder()..update(updates))._build();

  _$GCreateResponseCommentVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GCreateResponseCommentVars', 'input');
  }

  @override
  GCreateResponseCommentVars rebuild(
          void Function(GCreateResponseCommentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateResponseCommentVarsBuilder toBuilder() =>
      new GCreateResponseCommentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateResponseCommentVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateResponseCommentVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateResponseCommentVarsBuilder
    implements
        Builder<GCreateResponseCommentVars, GCreateResponseCommentVarsBuilder> {
  _$GCreateResponseCommentVars? _$v;

  _i1.GCreateResponseCommentInputBuilder? _input;
  _i1.GCreateResponseCommentInputBuilder get input =>
      _$this._input ??= new _i1.GCreateResponseCommentInputBuilder();
  set input(_i1.GCreateResponseCommentInputBuilder? input) =>
      _$this._input = input;

  GCreateResponseCommentVarsBuilder();

  GCreateResponseCommentVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateResponseCommentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateResponseCommentVars;
  }

  @override
  void update(void Function(GCreateResponseCommentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateResponseCommentVars build() => _build();

  _$GCreateResponseCommentVars _build() {
    _$GCreateResponseCommentVars _$result;
    try {
      _$result =
          _$v ?? new _$GCreateResponseCommentVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateResponseCommentVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
