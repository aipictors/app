// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_liked_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserLikedWorksVars> _$gUserLikedWorksVarsSerializer =
    new _$GUserLikedWorksVarsSerializer();

class _$GUserLikedWorksVarsSerializer
    implements StructuredSerializer<GUserLikedWorksVars> {
  @override
  final Iterable<Type> types = const [
    GUserLikedWorksVars,
    _$GUserLikedWorksVars
  ];
  @override
  final String wireName = 'GUserLikedWorksVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserLikedWorksVars object,
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
  GUserLikedWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserLikedWorksVarsBuilder();

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

class _$GUserLikedWorksVars extends GUserLikedWorksVars {
  @override
  final String user_id;
  @override
  final int offset;
  @override
  final int limit;

  factory _$GUserLikedWorksVars(
          [void Function(GUserLikedWorksVarsBuilder)? updates]) =>
      (new GUserLikedWorksVarsBuilder()..update(updates))._build();

  _$GUserLikedWorksVars._(
      {required this.user_id, required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        user_id, r'GUserLikedWorksVars', 'user_id');
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GUserLikedWorksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GUserLikedWorksVars', 'limit');
  }

  @override
  GUserLikedWorksVars rebuild(
          void Function(GUserLikedWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserLikedWorksVarsBuilder toBuilder() =>
      new GUserLikedWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserLikedWorksVars &&
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
    return (newBuiltValueToStringHelper(r'GUserLikedWorksVars')
          ..add('user_id', user_id)
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GUserLikedWorksVarsBuilder
    implements Builder<GUserLikedWorksVars, GUserLikedWorksVarsBuilder> {
  _$GUserLikedWorksVars? _$v;

  String? _user_id;
  String? get user_id => _$this._user_id;
  set user_id(String? user_id) => _$this._user_id = user_id;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GUserLikedWorksVarsBuilder();

  GUserLikedWorksVarsBuilder get _$this {
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
  void replace(GUserLikedWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserLikedWorksVars;
  }

  @override
  void update(void Function(GUserLikedWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserLikedWorksVars build() => _build();

  _$GUserLikedWorksVars _build() {
    final _$result = _$v ??
        new _$GUserLikedWorksVars._(
            user_id: BuiltValueNullFieldError.checkNotNull(
                user_id, r'GUserLikedWorksVars', 'user_id'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GUserLikedWorksVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GUserLikedWorksVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
