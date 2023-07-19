// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_muted_users.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerMutedUsersVars> _$gViewerMutedUsersVarsSerializer =
    new _$GViewerMutedUsersVarsSerializer();

class _$GViewerMutedUsersVarsSerializer
    implements StructuredSerializer<GViewerMutedUsersVars> {
  @override
  final Iterable<Type> types = const [
    GViewerMutedUsersVars,
    _$GViewerMutedUsersVars
  ];
  @override
  final String wireName = 'GViewerMutedUsersVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerMutedUsersVars object,
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
  GViewerMutedUsersVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerMutedUsersVarsBuilder();

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

class _$GViewerMutedUsersVars extends GViewerMutedUsersVars {
  @override
  final int offset;
  @override
  final int limit;

  factory _$GViewerMutedUsersVars(
          [void Function(GViewerMutedUsersVarsBuilder)? updates]) =>
      (new GViewerMutedUsersVarsBuilder()..update(updates))._build();

  _$GViewerMutedUsersVars._({required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GViewerMutedUsersVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GViewerMutedUsersVars', 'limit');
  }

  @override
  GViewerMutedUsersVars rebuild(
          void Function(GViewerMutedUsersVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerMutedUsersVarsBuilder toBuilder() =>
      new GViewerMutedUsersVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerMutedUsersVars &&
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
    return (newBuiltValueToStringHelper(r'GViewerMutedUsersVars')
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GViewerMutedUsersVarsBuilder
    implements Builder<GViewerMutedUsersVars, GViewerMutedUsersVarsBuilder> {
  _$GViewerMutedUsersVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GViewerMutedUsersVarsBuilder();

  GViewerMutedUsersVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerMutedUsersVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerMutedUsersVars;
  }

  @override
  void update(void Function(GViewerMutedUsersVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerMutedUsersVars build() => _build();

  _$GViewerMutedUsersVars _build() {
    final _$result = _$v ??
        new _$GViewerMutedUsersVars._(
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GViewerMutedUsersVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GViewerMutedUsersVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
