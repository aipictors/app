// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTagVars> _$gTagVarsSerializer = new _$GTagVarsSerializer();

class _$GTagVarsSerializer implements StructuredSerializer<GTagVars> {
  @override
  final Iterable<Type> types = const [GTagVars, _$GTagVars];
  @override
  final String wireName = 'GTagVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTagVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GTagVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GTagVars extends GTagVars {
  @override
  final String name;

  factory _$GTagVars([void Function(GTagVarsBuilder)? updates]) =>
      (new GTagVarsBuilder()..update(updates))._build();

  _$GTagVars._({required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'GTagVars', 'name');
  }

  @override
  GTagVars rebuild(void Function(GTagVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagVarsBuilder toBuilder() => new GTagVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagVars && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTagVars')..add('name', name))
        .toString();
  }
}

class GTagVarsBuilder implements Builder<GTagVars, GTagVarsBuilder> {
  _$GTagVars? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GTagVarsBuilder();

  GTagVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTagVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagVars;
  }

  @override
  void update(void Function(GTagVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagVars build() => _build();

  _$GTagVars _build() {
    final _$result = _$v ??
        new _$GTagVars._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GTagVars', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
