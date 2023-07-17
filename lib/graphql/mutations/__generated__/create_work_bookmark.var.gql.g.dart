// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_work_bookmark.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateWorkBookmarkVars> _$gCreateWorkBookmarkVarsSerializer =
    new _$GCreateWorkBookmarkVarsSerializer();

class _$GCreateWorkBookmarkVarsSerializer
    implements StructuredSerializer<GCreateWorkBookmarkVars> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkBookmarkVars,
    _$GCreateWorkBookmarkVars
  ];
  @override
  final String wireName = 'GCreateWorkBookmarkVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkBookmarkVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GCreateWorkBookmarkInput)),
    ];

    return result;
  }

  @override
  GCreateWorkBookmarkVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkBookmarkVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCreateWorkBookmarkInput))!
              as _i1.GCreateWorkBookmarkInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkBookmarkVars extends GCreateWorkBookmarkVars {
  @override
  final _i1.GCreateWorkBookmarkInput input;

  factory _$GCreateWorkBookmarkVars(
          [void Function(GCreateWorkBookmarkVarsBuilder)? updates]) =>
      (new GCreateWorkBookmarkVarsBuilder()..update(updates))._build();

  _$GCreateWorkBookmarkVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GCreateWorkBookmarkVars', 'input');
  }

  @override
  GCreateWorkBookmarkVars rebuild(
          void Function(GCreateWorkBookmarkVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkBookmarkVarsBuilder toBuilder() =>
      new GCreateWorkBookmarkVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkBookmarkVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GCreateWorkBookmarkVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateWorkBookmarkVarsBuilder
    implements
        Builder<GCreateWorkBookmarkVars, GCreateWorkBookmarkVarsBuilder> {
  _$GCreateWorkBookmarkVars? _$v;

  _i1.GCreateWorkBookmarkInputBuilder? _input;
  _i1.GCreateWorkBookmarkInputBuilder get input =>
      _$this._input ??= new _i1.GCreateWorkBookmarkInputBuilder();
  set input(_i1.GCreateWorkBookmarkInputBuilder? input) =>
      _$this._input = input;

  GCreateWorkBookmarkVarsBuilder();

  GCreateWorkBookmarkVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkBookmarkVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkBookmarkVars;
  }

  @override
  void update(void Function(GCreateWorkBookmarkVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkBookmarkVars build() => _build();

  _$GCreateWorkBookmarkVars _build() {
    _$GCreateWorkBookmarkVars _$result;
    try {
      _$result = _$v ?? new _$GCreateWorkBookmarkVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateWorkBookmarkVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
