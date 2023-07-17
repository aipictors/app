// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stickers.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserStickersVars> _$gUserStickersVarsSerializer =
    new _$GUserStickersVarsSerializer();

class _$GUserStickersVarsSerializer
    implements StructuredSerializer<GUserStickersVars> {
  @override
  final Iterable<Type> types = const [GUserStickersVars, _$GUserStickersVars];
  @override
  final String wireName = 'GUserStickersVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserStickersVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_id',
      serializers.serialize(object.user_id,
          specifiedType: const FullType(String)),
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GUserStickersVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserStickersVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
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

class _$GUserStickersVars extends GUserStickersVars {
  @override
  final String user_id;
  @override
  final int offset;
  @override
  final int limit;

  factory _$GUserStickersVars(
          [void Function(GUserStickersVarsBuilder)? updates]) =>
      (new GUserStickersVarsBuilder()..update(updates))._build();

  _$GUserStickersVars._(
      {required this.user_id, required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        user_id, r'GUserStickersVars', 'user_id');
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GUserStickersVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GUserStickersVars', 'limit');
  }

  @override
  GUserStickersVars rebuild(void Function(GUserStickersVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserStickersVarsBuilder toBuilder() =>
      new GUserStickersVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserStickersVars &&
        user_id == other.user_id &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user_id.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserStickersVars')
          ..add('user_id', user_id)
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GUserStickersVarsBuilder
    implements Builder<GUserStickersVars, GUserStickersVarsBuilder> {
  _$GUserStickersVars? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GUserStickersVarsBuilder();

  GUserStickersVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user_id = $v.user_id;
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserStickersVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserStickersVars;
  }

  @override
  void update(void Function(GUserStickersVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserStickersVars build() => _build();

  _$GUserStickersVars _build() {
    final _$result = _$v ??
        new _$GUserStickersVars._(
            user_id: BuiltValueNullFieldError.checkNotNull(
                user_id, r'GUserStickersVars', 'user_id'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GUserStickersVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GUserStickersVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
