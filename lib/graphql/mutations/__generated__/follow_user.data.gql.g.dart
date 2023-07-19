// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_user.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFollowUserData> _$gFollowUserDataSerializer =
    new _$GFollowUserDataSerializer();
Serializer<GFollowUserData_followUser> _$gFollowUserDataFollowUserSerializer =
    new _$GFollowUserData_followUserSerializer();
Serializer<GFollowUserData_followUser_viewer>
    _$gFollowUserDataFollowUserViewerSerializer =
    new _$GFollowUserData_followUser_viewerSerializer();

class _$GFollowUserDataSerializer
    implements StructuredSerializer<GFollowUserData> {
  @override
  final Iterable<Type> types = const [GFollowUserData, _$GFollowUserData];
  @override
  final String wireName = 'GFollowUserData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFollowUserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'followUser',
      serializers.serialize(object.followUser,
          specifiedType: const FullType(GFollowUserData_followUser)),
    ];

    return result;
  }

  @override
  GFollowUserData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowUserDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'followUser':
          result.followUser.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFollowUserData_followUser))!
              as GFollowUserData_followUser);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowUserData_followUserSerializer
    implements StructuredSerializer<GFollowUserData_followUser> {
  @override
  final Iterable<Type> types = const [
    GFollowUserData_followUser,
    _$GFollowUserData_followUser
  ];
  @override
  final String wireName = 'GFollowUserData_followUser';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFollowUserData_followUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFollowUserData_followUser_viewer)));
    }
    return result;
  }

  @override
  GFollowUserData_followUser deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowUserData_followUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GFollowUserData_followUser_viewer))!
              as GFollowUserData_followUser_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowUserData_followUser_viewerSerializer
    implements StructuredSerializer<GFollowUserData_followUser_viewer> {
  @override
  final Iterable<Type> types = const [
    GFollowUserData_followUser_viewer,
    _$GFollowUserData_followUser_viewer
  ];
  @override
  final String wireName = 'GFollowUserData_followUser_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFollowUserData_followUser_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'isFollowee',
      serializers.serialize(object.isFollowee,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GFollowUserData_followUser_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowUserData_followUser_viewerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'isFollowee':
          result.isFollowee = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowUserData extends GFollowUserData {
  @override
  final String G__typename;
  @override
  final GFollowUserData_followUser followUser;

  factory _$GFollowUserData([void Function(GFollowUserDataBuilder)? updates]) =>
      (new GFollowUserDataBuilder()..update(updates))._build();

  _$GFollowUserData._({required this.G__typename, required this.followUser})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFollowUserData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        followUser, r'GFollowUserData', 'followUser');
  }

  @override
  GFollowUserData rebuild(void Function(GFollowUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowUserDataBuilder toBuilder() =>
      new GFollowUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowUserData &&
        G__typename == other.G__typename &&
        followUser == other.followUser;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, followUser.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFollowUserData')
          ..add('G__typename', G__typename)
          ..add('followUser', followUser))
        .toString();
  }
}

class GFollowUserDataBuilder
    implements Builder<GFollowUserData, GFollowUserDataBuilder> {
  _$GFollowUserData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFollowUserData_followUserBuilder? _followUser;
  GFollowUserData_followUserBuilder get followUser =>
      _$this._followUser ??= new GFollowUserData_followUserBuilder();
  set followUser(GFollowUserData_followUserBuilder? followUser) =>
      _$this._followUser = followUser;

  GFollowUserDataBuilder() {
    GFollowUserData._initializeBuilder(this);
  }

  GFollowUserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _followUser = $v.followUser.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowUserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFollowUserData;
  }

  @override
  void update(void Function(GFollowUserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFollowUserData build() => _build();

  _$GFollowUserData _build() {
    _$GFollowUserData _$result;
    try {
      _$result = _$v ??
          new _$GFollowUserData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFollowUserData', 'G__typename'),
              followUser: followUser.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'followUser';
        followUser.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFollowUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFollowUserData_followUser extends GFollowUserData_followUser {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GFollowUserData_followUser_viewer? viewer;

  factory _$GFollowUserData_followUser(
          [void Function(GFollowUserData_followUserBuilder)? updates]) =>
      (new GFollowUserData_followUserBuilder()..update(updates))._build();

  _$GFollowUserData_followUser._(
      {required this.G__typename, required this.id, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFollowUserData_followUser', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFollowUserData_followUser', 'id');
  }

  @override
  GFollowUserData_followUser rebuild(
          void Function(GFollowUserData_followUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowUserData_followUserBuilder toBuilder() =>
      new GFollowUserData_followUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowUserData_followUser &&
        G__typename == other.G__typename &&
        id == other.id &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFollowUserData_followUser')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('viewer', viewer))
        .toString();
  }
}

class GFollowUserData_followUserBuilder
    implements
        Builder<GFollowUserData_followUser, GFollowUserData_followUserBuilder> {
  _$GFollowUserData_followUser? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GFollowUserData_followUser_viewerBuilder? _viewer;
  GFollowUserData_followUser_viewerBuilder get viewer =>
      _$this._viewer ??= new GFollowUserData_followUser_viewerBuilder();
  set viewer(GFollowUserData_followUser_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GFollowUserData_followUserBuilder() {
    GFollowUserData_followUser._initializeBuilder(this);
  }

  GFollowUserData_followUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowUserData_followUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFollowUserData_followUser;
  }

  @override
  void update(void Function(GFollowUserData_followUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFollowUserData_followUser build() => _build();

  _$GFollowUserData_followUser _build() {
    _$GFollowUserData_followUser _$result;
    try {
      _$result = _$v ??
          new _$GFollowUserData_followUser._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFollowUserData_followUser', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFollowUserData_followUser', 'id'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFollowUserData_followUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFollowUserData_followUser_viewer
    extends GFollowUserData_followUser_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isFollowee;

  factory _$GFollowUserData_followUser_viewer(
          [void Function(GFollowUserData_followUser_viewerBuilder)? updates]) =>
      (new GFollowUserData_followUser_viewerBuilder()..update(updates))
          ._build();

  _$GFollowUserData_followUser_viewer._(
      {required this.G__typename, required this.id, required this.isFollowee})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFollowUserData_followUser_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFollowUserData_followUser_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isFollowee, r'GFollowUserData_followUser_viewer', 'isFollowee');
  }

  @override
  GFollowUserData_followUser_viewer rebuild(
          void Function(GFollowUserData_followUser_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowUserData_followUser_viewerBuilder toBuilder() =>
      new GFollowUserData_followUser_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowUserData_followUser_viewer &&
        G__typename == other.G__typename &&
        id == other.id &&
        isFollowee == other.isFollowee;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isFollowee.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFollowUserData_followUser_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isFollowee', isFollowee))
        .toString();
  }
}

class GFollowUserData_followUser_viewerBuilder
    implements
        Builder<GFollowUserData_followUser_viewer,
            GFollowUserData_followUser_viewerBuilder> {
  _$GFollowUserData_followUser_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isFollowee;
  bool? get isFollowee => _$this._isFollowee;
  set isFollowee(bool? isFollowee) => _$this._isFollowee = isFollowee;

  GFollowUserData_followUser_viewerBuilder() {
    GFollowUserData_followUser_viewer._initializeBuilder(this);
  }

  GFollowUserData_followUser_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isFollowee = $v.isFollowee;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowUserData_followUser_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFollowUserData_followUser_viewer;
  }

  @override
  void update(
      void Function(GFollowUserData_followUser_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFollowUserData_followUser_viewer build() => _build();

  _$GFollowUserData_followUser_viewer _build() {
    final _$result = _$v ??
        new _$GFollowUserData_followUser_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GFollowUserData_followUser_viewer', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFollowUserData_followUser_viewer', 'id'),
            isFollowee: BuiltValueNullFieldError.checkNotNull(isFollowee,
                r'GFollowUserData_followUser_viewer', 'isFollowee'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
