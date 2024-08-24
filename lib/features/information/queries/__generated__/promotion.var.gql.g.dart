// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPromotionVars> _$gPromotionVarsSerializer =
    new _$GPromotionVarsSerializer();

class _$GPromotionVarsSerializer
    implements StructuredSerializer<GPromotionVars> {
  @override
  final Iterable<Type> types = const [GPromotionVars, _$GPromotionVars];
  @override
  final String wireName = 'GPromotionVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPromotionVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPromotionVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPromotionVarsBuilder();

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

class _$GPromotionVars extends GPromotionVars {
  @override
  final String id;

  factory _$GPromotionVars([void Function(GPromotionVarsBuilder)? updates]) =>
      (new GPromotionVarsBuilder()..update(updates))._build();

  _$GPromotionVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GPromotionVars', 'id');
  }

  @override
  GPromotionVars rebuild(void Function(GPromotionVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPromotionVarsBuilder toBuilder() =>
      new GPromotionVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPromotionVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GPromotionVars')..add('id', id))
        .toString();
  }
}

class GPromotionVarsBuilder
    implements Builder<GPromotionVars, GPromotionVarsBuilder> {
  _$GPromotionVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GPromotionVarsBuilder();

  GPromotionVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPromotionVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPromotionVars;
  }

  @override
  void update(void Function(GPromotionVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPromotionVars build() => _build();

  _$GPromotionVars _build() {
    final _$result = _$v ??
        new _$GPromotionVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPromotionVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
