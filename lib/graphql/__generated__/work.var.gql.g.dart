// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkVars> _$gWorkVarsSerializer = new _$GWorkVarsSerializer();

class _$GWorkVarsSerializer implements StructuredSerializer<GWorkVars> {
  @override
  final Iterable<Type> types = const [GWorkVars, _$GWorkVars];
  @override
  final String wireName = 'GWorkVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorkVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GWorkVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkVars extends GWorkVars {
  @override
  final String id;

  factory _$GWorkVars([void Function(GWorkVarsBuilder)? updates]) =>
      (new GWorkVarsBuilder()..update(updates))._build();

  _$GWorkVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GWorkVars', 'id');
  }

  @override
  GWorkVars rebuild(void Function(GWorkVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkVarsBuilder toBuilder() => new GWorkVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkVars && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkVars')..add('id', id))
        .toString();
  }
}

class GWorkVarsBuilder implements Builder<GWorkVars, GWorkVarsBuilder> {
  _$GWorkVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GWorkVarsBuilder();

  GWorkVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkVars;
  }

  @override
  void update(void Function(GWorkVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkVars build() => _build();

  _$GWorkVars _build() {
    final _$result = _$v ??
        new _$GWorkVars._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'GWorkVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
