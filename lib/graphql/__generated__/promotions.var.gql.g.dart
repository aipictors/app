// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotions.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPromotionsVars> _$gPromotionsVarsSerializer =
    new _$GPromotionsVarsSerializer();

class _$GPromotionsVarsSerializer
    implements StructuredSerializer<GPromotionsVars> {
  @override
  final Iterable<Type> types = const [GPromotionsVars, _$GPromotionsVars];
  @override
  final String wireName = 'GPromotionsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPromotionsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GPromotionsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPromotionsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GPromotionsVars extends GPromotionsVars {
  @override
  final int offset;
  @override
  final int limit;

  factory _$GPromotionsVars([void Function(GPromotionsVarsBuilder)? updates]) =>
      (new GPromotionsVarsBuilder()..update(updates))._build();

  _$GPromotionsVars._({required this.offset, required this.limit}) : super._() {
    BuiltValueNullFieldError.checkNotNull(offset, r'GPromotionsVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GPromotionsVars', 'limit');
  }

  @override
  GPromotionsVars rebuild(void Function(GPromotionsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPromotionsVarsBuilder toBuilder() =>
      new GPromotionsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPromotionsVars &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPromotionsVars')
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GPromotionsVarsBuilder
    implements Builder<GPromotionsVars, GPromotionsVarsBuilder> {
  _$GPromotionsVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GPromotionsVarsBuilder();

  GPromotionsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPromotionsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPromotionsVars;
  }

  @override
  void update(void Function(GPromotionsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPromotionsVars build() => _build();

  _$GPromotionsVars _build() {
    final _$result = _$v ??
        new _$GPromotionsVars._(
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GPromotionsVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GPromotionsVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
