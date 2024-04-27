// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_muted_tags.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerMutedTagsData> _$gViewerMutedTagsDataSerializer =
    new _$GViewerMutedTagsDataSerializer();
Serializer<GViewerMutedTagsData_viewer> _$gViewerMutedTagsDataViewerSerializer =
    new _$GViewerMutedTagsData_viewerSerializer();
Serializer<GViewerMutedTagsData_viewer_user>
    _$gViewerMutedTagsDataViewerUserSerializer =
    new _$GViewerMutedTagsData_viewer_userSerializer();
Serializer<GViewerMutedTagsData_viewer_mutedTags>
    _$gViewerMutedTagsDataViewerMutedTagsSerializer =
    new _$GViewerMutedTagsData_viewer_mutedTagsSerializer();

class _$GViewerMutedTagsDataSerializer
    implements StructuredSerializer<GViewerMutedTagsData> {
  @override
  final Iterable<Type> types = const [
    GViewerMutedTagsData,
    _$GViewerMutedTagsData
  ];
  @override
  final String wireName = 'GViewerMutedTagsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerMutedTagsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GViewerMutedTagsData_viewer)));
    }
    return result;
  }

  @override
  GViewerMutedTagsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerMutedTagsDataBuilder();

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
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GViewerMutedTagsData_viewer))!
              as GViewerMutedTagsData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerMutedTagsData_viewerSerializer
    implements StructuredSerializer<GViewerMutedTagsData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerMutedTagsData_viewer,
    _$GViewerMutedTagsData_viewer
  ];
  @override
  final String wireName = 'GViewerMutedTagsData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerMutedTagsData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GViewerMutedTagsData_viewer_user)),
      'mutedTags',
      serializers.serialize(object.mutedTags,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GViewerMutedTagsData_viewer_mutedTags)])),
    ];

    return result;
  }

  @override
  GViewerMutedTagsData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerMutedTagsData_viewerBuilder();

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
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GViewerMutedTagsData_viewer_user))!
              as GViewerMutedTagsData_viewer_user);
          break;
        case 'mutedTags':
          result.mutedTags.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GViewerMutedTagsData_viewer_mutedTags)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerMutedTagsData_viewer_userSerializer
    implements StructuredSerializer<GViewerMutedTagsData_viewer_user> {
  @override
  final Iterable<Type> types = const [
    GViewerMutedTagsData_viewer_user,
    _$GViewerMutedTagsData_viewer_user
  ];
  @override
  final String wireName = 'GViewerMutedTagsData_viewer_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerMutedTagsData_viewer_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GViewerMutedTagsData_viewer_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerMutedTagsData_viewer_userBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GViewerMutedTagsData_viewer_mutedTagsSerializer
    implements StructuredSerializer<GViewerMutedTagsData_viewer_mutedTags> {
  @override
  final Iterable<Type> types = const [
    GViewerMutedTagsData_viewer_mutedTags,
    _$GViewerMutedTagsData_viewer_mutedTags
  ];
  @override
  final String wireName = 'GViewerMutedTagsData_viewer_mutedTags';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerMutedTagsData_viewer_mutedTags object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GViewerMutedTagsData_viewer_mutedTags deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerMutedTagsData_viewer_mutedTagsBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerMutedTagsData extends GViewerMutedTagsData {
  @override
  final String G__typename;
  @override
  final GViewerMutedTagsData_viewer? viewer;

  factory _$GViewerMutedTagsData(
          [void Function(GViewerMutedTagsDataBuilder)? updates]) =>
      (new GViewerMutedTagsDataBuilder()..update(updates))._build();

  _$GViewerMutedTagsData._({required this.G__typename, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerMutedTagsData', 'G__typename');
  }

  @override
  GViewerMutedTagsData rebuild(
          void Function(GViewerMutedTagsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerMutedTagsDataBuilder toBuilder() =>
      new GViewerMutedTagsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerMutedTagsData &&
        G__typename == other.G__typename &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerMutedTagsData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerMutedTagsDataBuilder
    implements Builder<GViewerMutedTagsData, GViewerMutedTagsDataBuilder> {
  _$GViewerMutedTagsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerMutedTagsData_viewerBuilder? _viewer;
  GViewerMutedTagsData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerMutedTagsData_viewerBuilder();
  set viewer(GViewerMutedTagsData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerMutedTagsDataBuilder() {
    GViewerMutedTagsData._initializeBuilder(this);
  }

  GViewerMutedTagsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerMutedTagsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerMutedTagsData;
  }

  @override
  void update(void Function(GViewerMutedTagsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerMutedTagsData build() => _build();

  _$GViewerMutedTagsData _build() {
    _$GViewerMutedTagsData _$result;
    try {
      _$result = _$v ??
          new _$GViewerMutedTagsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerMutedTagsData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerMutedTagsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerMutedTagsData_viewer extends GViewerMutedTagsData_viewer {
  @override
  final String G__typename;
  @override
  final GViewerMutedTagsData_viewer_user user;
  @override
  final BuiltList<GViewerMutedTagsData_viewer_mutedTags> mutedTags;

  factory _$GViewerMutedTagsData_viewer(
          [void Function(GViewerMutedTagsData_viewerBuilder)? updates]) =>
      (new GViewerMutedTagsData_viewerBuilder()..update(updates))._build();

  _$GViewerMutedTagsData_viewer._(
      {required this.G__typename, required this.user, required this.mutedTags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerMutedTagsData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GViewerMutedTagsData_viewer', 'user');
    BuiltValueNullFieldError.checkNotNull(
        mutedTags, r'GViewerMutedTagsData_viewer', 'mutedTags');
  }

  @override
  GViewerMutedTagsData_viewer rebuild(
          void Function(GViewerMutedTagsData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerMutedTagsData_viewerBuilder toBuilder() =>
      new GViewerMutedTagsData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerMutedTagsData_viewer &&
        G__typename == other.G__typename &&
        user == other.user &&
        mutedTags == other.mutedTags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, mutedTags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerMutedTagsData_viewer')
          ..add('G__typename', G__typename)
          ..add('user', user)
          ..add('mutedTags', mutedTags))
        .toString();
  }
}

class GViewerMutedTagsData_viewerBuilder
    implements
        Builder<GViewerMutedTagsData_viewer,
            GViewerMutedTagsData_viewerBuilder> {
  _$GViewerMutedTagsData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerMutedTagsData_viewer_userBuilder? _user;
  GViewerMutedTagsData_viewer_userBuilder get user =>
      _$this._user ??= new GViewerMutedTagsData_viewer_userBuilder();
  set user(GViewerMutedTagsData_viewer_userBuilder? user) =>
      _$this._user = user;

  ListBuilder<GViewerMutedTagsData_viewer_mutedTags>? _mutedTags;
  ListBuilder<GViewerMutedTagsData_viewer_mutedTags> get mutedTags =>
      _$this._mutedTags ??=
          new ListBuilder<GViewerMutedTagsData_viewer_mutedTags>();
  set mutedTags(
          ListBuilder<GViewerMutedTagsData_viewer_mutedTags>? mutedTags) =>
      _$this._mutedTags = mutedTags;

  GViewerMutedTagsData_viewerBuilder() {
    GViewerMutedTagsData_viewer._initializeBuilder(this);
  }

  GViewerMutedTagsData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user.toBuilder();
      _mutedTags = $v.mutedTags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerMutedTagsData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerMutedTagsData_viewer;
  }

  @override
  void update(void Function(GViewerMutedTagsData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerMutedTagsData_viewer build() => _build();

  _$GViewerMutedTagsData_viewer _build() {
    _$GViewerMutedTagsData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerMutedTagsData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerMutedTagsData_viewer', 'G__typename'),
              user: user.build(),
              mutedTags: mutedTags.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'mutedTags';
        mutedTags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerMutedTagsData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerMutedTagsData_viewer_user
    extends GViewerMutedTagsData_viewer_user {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GViewerMutedTagsData_viewer_user(
          [void Function(GViewerMutedTagsData_viewer_userBuilder)? updates]) =>
      (new GViewerMutedTagsData_viewer_userBuilder()..update(updates))._build();

  _$GViewerMutedTagsData_viewer_user._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerMutedTagsData_viewer_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerMutedTagsData_viewer_user', 'id');
  }

  @override
  GViewerMutedTagsData_viewer_user rebuild(
          void Function(GViewerMutedTagsData_viewer_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerMutedTagsData_viewer_userBuilder toBuilder() =>
      new GViewerMutedTagsData_viewer_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerMutedTagsData_viewer_user &&
        G__typename == other.G__typename &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerMutedTagsData_viewer_user')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GViewerMutedTagsData_viewer_userBuilder
    implements
        Builder<GViewerMutedTagsData_viewer_user,
            GViewerMutedTagsData_viewer_userBuilder> {
  _$GViewerMutedTagsData_viewer_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GViewerMutedTagsData_viewer_userBuilder() {
    GViewerMutedTagsData_viewer_user._initializeBuilder(this);
  }

  GViewerMutedTagsData_viewer_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerMutedTagsData_viewer_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerMutedTagsData_viewer_user;
  }

  @override
  void update(void Function(GViewerMutedTagsData_viewer_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerMutedTagsData_viewer_user build() => _build();

  _$GViewerMutedTagsData_viewer_user _build() {
    final _$result = _$v ??
        new _$GViewerMutedTagsData_viewer_user._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GViewerMutedTagsData_viewer_user', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerMutedTagsData_viewer_user', 'id'));
    replace(_$result);
    return _$result;
  }
}

class _$GViewerMutedTagsData_viewer_mutedTags
    extends GViewerMutedTagsData_viewer_mutedTags {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GViewerMutedTagsData_viewer_mutedTags(
          [void Function(GViewerMutedTagsData_viewer_mutedTagsBuilder)?
              updates]) =>
      (new GViewerMutedTagsData_viewer_mutedTagsBuilder()..update(updates))
          ._build();

  _$GViewerMutedTagsData_viewer_mutedTags._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerMutedTagsData_viewer_mutedTags', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerMutedTagsData_viewer_mutedTags', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GViewerMutedTagsData_viewer_mutedTags', 'name');
  }

  @override
  GViewerMutedTagsData_viewer_mutedTags rebuild(
          void Function(GViewerMutedTagsData_viewer_mutedTagsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerMutedTagsData_viewer_mutedTagsBuilder toBuilder() =>
      new GViewerMutedTagsData_viewer_mutedTagsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerMutedTagsData_viewer_mutedTags &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerMutedTagsData_viewer_mutedTags')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GViewerMutedTagsData_viewer_mutedTagsBuilder
    implements
        Builder<GViewerMutedTagsData_viewer_mutedTags,
            GViewerMutedTagsData_viewer_mutedTagsBuilder> {
  _$GViewerMutedTagsData_viewer_mutedTags? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GViewerMutedTagsData_viewer_mutedTagsBuilder() {
    GViewerMutedTagsData_viewer_mutedTags._initializeBuilder(this);
  }

  GViewerMutedTagsData_viewer_mutedTagsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerMutedTagsData_viewer_mutedTags other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerMutedTagsData_viewer_mutedTags;
  }

  @override
  void update(
      void Function(GViewerMutedTagsData_viewer_mutedTagsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerMutedTagsData_viewer_mutedTags build() => _build();

  _$GViewerMutedTagsData_viewer_mutedTags _build() {
    final _$result = _$v ??
        new _$GViewerMutedTagsData_viewer_mutedTags._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GViewerMutedTagsData_viewer_mutedTags', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerMutedTagsData_viewer_mutedTags', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GViewerMutedTagsData_viewer_mutedTags', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
