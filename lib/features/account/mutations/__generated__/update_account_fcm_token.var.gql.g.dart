// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_fcm_token.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateAccountFcmTokenVars> _$gUpdateAccountFcmTokenVarsSerializer =
    new _$GUpdateAccountFcmTokenVarsSerializer();

class _$GUpdateAccountFcmTokenVarsSerializer
    implements StructuredSerializer<GUpdateAccountFcmTokenVars> {
  @override
  final Iterable<Type> types = const [
    GUpdateAccountFcmTokenVars,
    _$GUpdateAccountFcmTokenVars
  ];
  @override
  final String wireName = 'GUpdateAccountFcmTokenVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateAccountFcmTokenVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'input',
      serializers.serialize(object.input,
          specifiedType: const FullType(_i1.GUpdateAccountFcmTokenInput)),
    ];

    return result;
  }

  @override
  GUpdateAccountFcmTokenVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateAccountFcmTokenVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          result.input.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i1.GUpdateAccountFcmTokenInput))!
              as _i1.GUpdateAccountFcmTokenInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateAccountFcmTokenVars extends GUpdateAccountFcmTokenVars {
  @override
  final _i1.GUpdateAccountFcmTokenInput input;

  factory _$GUpdateAccountFcmTokenVars(
          [void Function(GUpdateAccountFcmTokenVarsBuilder)? updates]) =>
      (new GUpdateAccountFcmTokenVarsBuilder()..update(updates))._build();

  _$GUpdateAccountFcmTokenVars._({required this.input}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        input, r'GUpdateAccountFcmTokenVars', 'input');
  }

  @override
  GUpdateAccountFcmTokenVars rebuild(
          void Function(GUpdateAccountFcmTokenVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateAccountFcmTokenVarsBuilder toBuilder() =>
      new GUpdateAccountFcmTokenVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateAccountFcmTokenVars && input == other.input;
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
    return (newBuiltValueToStringHelper(r'GUpdateAccountFcmTokenVars')
          ..add('input', input))
        .toString();
  }
}

class GUpdateAccountFcmTokenVarsBuilder
    implements
        Builder<GUpdateAccountFcmTokenVars, GUpdateAccountFcmTokenVarsBuilder> {
  _$GUpdateAccountFcmTokenVars? _$v;

  _i1.GUpdateAccountFcmTokenInputBuilder? _input;
  _i1.GUpdateAccountFcmTokenInputBuilder get input =>
      _$this._input ??= new _i1.GUpdateAccountFcmTokenInputBuilder();
  set input(_i1.GUpdateAccountFcmTokenInputBuilder? input) =>
      _$this._input = input;

  GUpdateAccountFcmTokenVarsBuilder();

  GUpdateAccountFcmTokenVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateAccountFcmTokenVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateAccountFcmTokenVars;
  }

  @override
  void update(void Function(GUpdateAccountFcmTokenVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateAccountFcmTokenVars build() => _build();

  _$GUpdateAccountFcmTokenVars _build() {
    _$GUpdateAccountFcmTokenVars _$result;
    try {
      _$result =
          _$v ?? new _$GUpdateAccountFcmTokenVars._(input: input.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateAccountFcmTokenVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
