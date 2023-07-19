// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_muted_users.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerMutedUsersData> _$gViewerMutedUsersDataSerializer =
    new _$GViewerMutedUsersDataSerializer();
Serializer<GViewerMutedUsersData_viewer>
    _$gViewerMutedUsersDataViewerSerializer =
    new _$GViewerMutedUsersData_viewerSerializer();
Serializer<GViewerMutedUsersData_viewer_mutedUsers>
    _$gViewerMutedUsersDataViewerMutedUsersSerializer =
    new _$GViewerMutedUsersData_viewer_mutedUsersSerializer();
Serializer<GViewerMutedUsersData_viewer_mutedUsers_iconImage>
    _$gViewerMutedUsersDataViewerMutedUsersIconImageSerializer =
    new _$GViewerMutedUsersData_viewer_mutedUsers_iconImageSerializer();

class _$GViewerMutedUsersDataSerializer
    implements StructuredSerializer<GViewerMutedUsersData> {
  @override
  final Iterable<Type> types = const [
    GViewerMutedUsersData,
    _$GViewerMutedUsersData
  ];
  @override
  final String wireName = 'GViewerMutedUsersData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerMutedUsersData object,
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
            specifiedType: const FullType(GViewerMutedUsersData_viewer)));
    }
    return result;
  }

  @override
  GViewerMutedUsersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerMutedUsersDataBuilder();

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
                  specifiedType: const FullType(GViewerMutedUsersData_viewer))!
              as GViewerMutedUsersData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerMutedUsersData_viewerSerializer
    implements StructuredSerializer<GViewerMutedUsersData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerMutedUsersData_viewer,
    _$GViewerMutedUsersData_viewer
  ];
  @override
  final String wireName = 'GViewerMutedUsersData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerMutedUsersData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'mutedUsers',
      serializers.serialize(object.mutedUsers,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GViewerMutedUsersData_viewer_mutedUsers)])),
    ];

    return result;
  }

  @override
  GViewerMutedUsersData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerMutedUsersData_viewerBuilder();

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
        case 'mutedUsers':
          result.mutedUsers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GViewerMutedUsersData_viewer_mutedUsers)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerMutedUsersData_viewer_mutedUsersSerializer
    implements StructuredSerializer<GViewerMutedUsersData_viewer_mutedUsers> {
  @override
  final Iterable<Type> types = const [
    GViewerMutedUsersData_viewer_mutedUsers,
    _$GViewerMutedUsersData_viewer_mutedUsers
  ];
  @override
  final String wireName = 'GViewerMutedUsersData_viewer_mutedUsers';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerMutedUsersData_viewer_mutedUsers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GViewerMutedUsersData_viewer_mutedUsers_iconImage)));
    }
    return result;
  }

  @override
  GViewerMutedUsersData_viewer_mutedUsers deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerMutedUsersData_viewer_mutedUsersBuilder();

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
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconImage':
          result.iconImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GViewerMutedUsersData_viewer_mutedUsers_iconImage))!
              as GViewerMutedUsersData_viewer_mutedUsers_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerMutedUsersData_viewer_mutedUsers_iconImageSerializer
    implements
        StructuredSerializer<
            GViewerMutedUsersData_viewer_mutedUsers_iconImage> {
  @override
  final Iterable<Type> types = const [
    GViewerMutedUsersData_viewer_mutedUsers_iconImage,
    _$GViewerMutedUsersData_viewer_mutedUsers_iconImage
  ];
  @override
  final String wireName = 'GViewerMutedUsersData_viewer_mutedUsers_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerMutedUsersData_viewer_mutedUsers_iconImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'downloadURL',
      serializers.serialize(object.downloadURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GViewerMutedUsersData_viewer_mutedUsers_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder();

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
        case 'downloadURL':
          result.downloadURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerMutedUsersData extends GViewerMutedUsersData {
  @override
  final String G__typename;
  @override
  final GViewerMutedUsersData_viewer? viewer;

  factory _$GViewerMutedUsersData(
          [void Function(GViewerMutedUsersDataBuilder)? updates]) =>
      (new GViewerMutedUsersDataBuilder()..update(updates))._build();

  _$GViewerMutedUsersData._({required this.G__typename, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerMutedUsersData', 'G__typename');
  }

  @override
  GViewerMutedUsersData rebuild(
          void Function(GViewerMutedUsersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerMutedUsersDataBuilder toBuilder() =>
      new GViewerMutedUsersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerMutedUsersData &&
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
    return (newBuiltValueToStringHelper(r'GViewerMutedUsersData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerMutedUsersDataBuilder
    implements Builder<GViewerMutedUsersData, GViewerMutedUsersDataBuilder> {
  _$GViewerMutedUsersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerMutedUsersData_viewerBuilder? _viewer;
  GViewerMutedUsersData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerMutedUsersData_viewerBuilder();
  set viewer(GViewerMutedUsersData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerMutedUsersDataBuilder() {
    GViewerMutedUsersData._initializeBuilder(this);
  }

  GViewerMutedUsersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerMutedUsersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerMutedUsersData;
  }

  @override
  void update(void Function(GViewerMutedUsersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerMutedUsersData build() => _build();

  _$GViewerMutedUsersData _build() {
    _$GViewerMutedUsersData _$result;
    try {
      _$result = _$v ??
          new _$GViewerMutedUsersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerMutedUsersData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerMutedUsersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerMutedUsersData_viewer extends GViewerMutedUsersData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<GViewerMutedUsersData_viewer_mutedUsers> mutedUsers;

  factory _$GViewerMutedUsersData_viewer(
          [void Function(GViewerMutedUsersData_viewerBuilder)? updates]) =>
      (new GViewerMutedUsersData_viewerBuilder()..update(updates))._build();

  _$GViewerMutedUsersData_viewer._(
      {required this.G__typename, required this.mutedUsers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerMutedUsersData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        mutedUsers, r'GViewerMutedUsersData_viewer', 'mutedUsers');
  }

  @override
  GViewerMutedUsersData_viewer rebuild(
          void Function(GViewerMutedUsersData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerMutedUsersData_viewerBuilder toBuilder() =>
      new GViewerMutedUsersData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerMutedUsersData_viewer &&
        G__typename == other.G__typename &&
        mutedUsers == other.mutedUsers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, mutedUsers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerMutedUsersData_viewer')
          ..add('G__typename', G__typename)
          ..add('mutedUsers', mutedUsers))
        .toString();
  }
}

class GViewerMutedUsersData_viewerBuilder
    implements
        Builder<GViewerMutedUsersData_viewer,
            GViewerMutedUsersData_viewerBuilder> {
  _$GViewerMutedUsersData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GViewerMutedUsersData_viewer_mutedUsers>? _mutedUsers;
  ListBuilder<GViewerMutedUsersData_viewer_mutedUsers> get mutedUsers =>
      _$this._mutedUsers ??=
          new ListBuilder<GViewerMutedUsersData_viewer_mutedUsers>();
  set mutedUsers(
          ListBuilder<GViewerMutedUsersData_viewer_mutedUsers>? mutedUsers) =>
      _$this._mutedUsers = mutedUsers;

  GViewerMutedUsersData_viewerBuilder() {
    GViewerMutedUsersData_viewer._initializeBuilder(this);
  }

  GViewerMutedUsersData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _mutedUsers = $v.mutedUsers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerMutedUsersData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerMutedUsersData_viewer;
  }

  @override
  void update(void Function(GViewerMutedUsersData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerMutedUsersData_viewer build() => _build();

  _$GViewerMutedUsersData_viewer _build() {
    _$GViewerMutedUsersData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerMutedUsersData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerMutedUsersData_viewer', 'G__typename'),
              mutedUsers: mutedUsers.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mutedUsers';
        mutedUsers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerMutedUsersData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerMutedUsersData_viewer_mutedUsers
    extends GViewerMutedUsersData_viewer_mutedUsers {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GViewerMutedUsersData_viewer_mutedUsers_iconImage? iconImage;

  factory _$GViewerMutedUsersData_viewer_mutedUsers(
          [void Function(GViewerMutedUsersData_viewer_mutedUsersBuilder)?
              updates]) =>
      (new GViewerMutedUsersData_viewer_mutedUsersBuilder()..update(updates))
          ._build();

  _$GViewerMutedUsersData_viewer_mutedUsers._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerMutedUsersData_viewer_mutedUsers', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerMutedUsersData_viewer_mutedUsers', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GViewerMutedUsersData_viewer_mutedUsers', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GViewerMutedUsersData_viewer_mutedUsers', 'name');
  }

  @override
  GViewerMutedUsersData_viewer_mutedUsers rebuild(
          void Function(GViewerMutedUsersData_viewer_mutedUsersBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerMutedUsersData_viewer_mutedUsersBuilder toBuilder() =>
      new GViewerMutedUsersData_viewer_mutedUsersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerMutedUsersData_viewer_mutedUsers &&
        G__typename == other.G__typename &&
        id == other.id &&
        login == other.login &&
        name == other.name &&
        iconImage == other.iconImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerMutedUsersData_viewer_mutedUsers')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GViewerMutedUsersData_viewer_mutedUsersBuilder
    implements
        Builder<GViewerMutedUsersData_viewer_mutedUsers,
            GViewerMutedUsersData_viewer_mutedUsersBuilder> {
  _$GViewerMutedUsersData_viewer_mutedUsers? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder? _iconImage;
  GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder();
  set iconImage(
          GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder?
              iconImage) =>
      _$this._iconImage = iconImage;

  GViewerMutedUsersData_viewer_mutedUsersBuilder() {
    GViewerMutedUsersData_viewer_mutedUsers._initializeBuilder(this);
  }

  GViewerMutedUsersData_viewer_mutedUsersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _login = $v.login;
      _name = $v.name;
      _iconImage = $v.iconImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerMutedUsersData_viewer_mutedUsers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerMutedUsersData_viewer_mutedUsers;
  }

  @override
  void update(
      void Function(GViewerMutedUsersData_viewer_mutedUsersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerMutedUsersData_viewer_mutedUsers build() => _build();

  _$GViewerMutedUsersData_viewer_mutedUsers _build() {
    _$GViewerMutedUsersData_viewer_mutedUsers _$result;
    try {
      _$result = _$v ??
          new _$GViewerMutedUsersData_viewer_mutedUsers._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GViewerMutedUsersData_viewer_mutedUsers', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GViewerMutedUsersData_viewer_mutedUsers', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GViewerMutedUsersData_viewer_mutedUsers', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GViewerMutedUsersData_viewer_mutedUsers', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerMutedUsersData_viewer_mutedUsers',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerMutedUsersData_viewer_mutedUsers_iconImage
    extends GViewerMutedUsersData_viewer_mutedUsers_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GViewerMutedUsersData_viewer_mutedUsers_iconImage(
          [void Function(
                  GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder)?
              updates]) =>
      (new GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GViewerMutedUsersData_viewer_mutedUsers_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerMutedUsersData_viewer_mutedUsers_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerMutedUsersData_viewer_mutedUsers_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GViewerMutedUsersData_viewer_mutedUsers_iconImage', 'downloadURL');
  }

  @override
  GViewerMutedUsersData_viewer_mutedUsers_iconImage rebuild(
          void Function(
                  GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder toBuilder() =>
      new GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerMutedUsersData_viewer_mutedUsers_iconImage &&
        G__typename == other.G__typename &&
        id == other.id &&
        downloadURL == other.downloadURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, downloadURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerMutedUsersData_viewer_mutedUsers_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder
    implements
        Builder<GViewerMutedUsersData_viewer_mutedUsers_iconImage,
            GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder> {
  _$GViewerMutedUsersData_viewer_mutedUsers_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder() {
    GViewerMutedUsersData_viewer_mutedUsers_iconImage._initializeBuilder(this);
  }

  GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _downloadURL = $v.downloadURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerMutedUsersData_viewer_mutedUsers_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerMutedUsersData_viewer_mutedUsers_iconImage;
  }

  @override
  void update(
      void Function(GViewerMutedUsersData_viewer_mutedUsers_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerMutedUsersData_viewer_mutedUsers_iconImage build() => _build();

  _$GViewerMutedUsersData_viewer_mutedUsers_iconImage _build() {
    final _$result = _$v ??
        new _$GViewerMutedUsersData_viewer_mutedUsers_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerMutedUsersData_viewer_mutedUsers_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerMutedUsersData_viewer_mutedUsers_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GViewerMutedUsersData_viewer_mutedUsers_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
