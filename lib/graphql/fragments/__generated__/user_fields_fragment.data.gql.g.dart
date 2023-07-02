// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserFieldsData> _$gUserFieldsDataSerializer =
    new _$GUserFieldsDataSerializer();
Serializer<GUserFieldsData_iconImage> _$gUserFieldsDataIconImageSerializer =
    new _$GUserFieldsData_iconImageSerializer();
Serializer<GUserFieldsData_headerImage> _$gUserFieldsDataHeaderImageSerializer =
    new _$GUserFieldsData_headerImageSerializer();

class _$GUserFieldsDataSerializer
    implements StructuredSerializer<GUserFieldsData> {
  @override
  final Iterable<Type> types = const [GUserFieldsData, _$GUserFieldsData];
  @override
  final String wireName = 'GUserFieldsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserFieldsData object,
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
      'receivedLikesCount',
      serializers.serialize(object.receivedLikesCount,
          specifiedType: const FullType(int)),
      'receivedViewsCount',
      serializers.serialize(object.receivedViewsCount,
          specifiedType: const FullType(int)),
      'awardsCount',
      serializers.serialize(object.awardsCount,
          specifiedType: const FullType(int)),
      'followersCount',
      serializers.serialize(object.followersCount,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.biography;
    if (value != null) {
      result
        ..add('biography')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserFieldsData_iconImage)));
    }
    value = object.headerImage;
    if (value != null) {
      result
        ..add('headerImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserFieldsData_headerImage)));
    }
    return result;
  }

  @override
  GUserFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFieldsDataBuilder();

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
        case 'biography':
          result.biography = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'receivedLikesCount':
          result.receivedLikesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'receivedViewsCount':
          result.receivedViewsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'awardsCount':
          result.awardsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'followersCount':
          result.followersCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'iconImage':
          result.iconImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserFieldsData_iconImage))!
              as GUserFieldsData_iconImage);
          break;
        case 'headerImage':
          result.headerImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserFieldsData_headerImage))!
              as GUserFieldsData_headerImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFieldsData_iconImageSerializer
    implements StructuredSerializer<GUserFieldsData_iconImage> {
  @override
  final Iterable<Type> types = const [
    GUserFieldsData_iconImage,
    _$GUserFieldsData_iconImage
  ];
  @override
  final String wireName = 'GUserFieldsData_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFieldsData_iconImage object,
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
  GUserFieldsData_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFieldsData_iconImageBuilder();

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

class _$GUserFieldsData_headerImageSerializer
    implements StructuredSerializer<GUserFieldsData_headerImage> {
  @override
  final Iterable<Type> types = const [
    GUserFieldsData_headerImage,
    _$GUserFieldsData_headerImage
  ];
  @override
  final String wireName = 'GUserFieldsData_headerImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserFieldsData_headerImage object,
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
  GUserFieldsData_headerImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFieldsData_headerImageBuilder();

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

class _$GUserFieldsData extends GUserFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String? biography;
  @override
  final String login;
  @override
  final String name;
  @override
  final int receivedLikesCount;
  @override
  final int receivedViewsCount;
  @override
  final int awardsCount;
  @override
  final int followersCount;
  @override
  final GUserFieldsData_iconImage? iconImage;
  @override
  final GUserFieldsData_headerImage? headerImage;

  factory _$GUserFieldsData([void Function(GUserFieldsDataBuilder)? updates]) =>
      (new GUserFieldsDataBuilder()..update(updates))._build();

  _$GUserFieldsData._(
      {required this.G__typename,
      required this.id,
      this.biography,
      required this.login,
      required this.name,
      required this.receivedLikesCount,
      required this.receivedViewsCount,
      required this.awardsCount,
      required this.followersCount,
      this.iconImage,
      this.headerImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUserFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(login, r'GUserFieldsData', 'login');
    BuiltValueNullFieldError.checkNotNull(name, r'GUserFieldsData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        receivedLikesCount, r'GUserFieldsData', 'receivedLikesCount');
    BuiltValueNullFieldError.checkNotNull(
        receivedViewsCount, r'GUserFieldsData', 'receivedViewsCount');
    BuiltValueNullFieldError.checkNotNull(
        awardsCount, r'GUserFieldsData', 'awardsCount');
    BuiltValueNullFieldError.checkNotNull(
        followersCount, r'GUserFieldsData', 'followersCount');
  }

  @override
  GUserFieldsData rebuild(void Function(GUserFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFieldsDataBuilder toBuilder() =>
      new GUserFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        biography == other.biography &&
        login == other.login &&
        name == other.name &&
        receivedLikesCount == other.receivedLikesCount &&
        receivedViewsCount == other.receivedViewsCount &&
        awardsCount == other.awardsCount &&
        followersCount == other.followersCount &&
        iconImage == other.iconImage &&
        headerImage == other.headerImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, biography.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, receivedLikesCount.hashCode);
    _$hash = $jc(_$hash, receivedViewsCount.hashCode);
    _$hash = $jc(_$hash, awardsCount.hashCode);
    _$hash = $jc(_$hash, followersCount.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jc(_$hash, headerImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('biography', biography)
          ..add('login', login)
          ..add('name', name)
          ..add('receivedLikesCount', receivedLikesCount)
          ..add('receivedViewsCount', receivedViewsCount)
          ..add('awardsCount', awardsCount)
          ..add('followersCount', followersCount)
          ..add('iconImage', iconImage)
          ..add('headerImage', headerImage))
        .toString();
  }
}

class GUserFieldsDataBuilder
    implements Builder<GUserFieldsData, GUserFieldsDataBuilder> {
  _$GUserFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _biography;
  String? get biography => _$this._biography;
  set biography(String? biography) => _$this._biography = biography;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _receivedLikesCount;
  int? get receivedLikesCount => _$this._receivedLikesCount;
  set receivedLikesCount(int? receivedLikesCount) =>
      _$this._receivedLikesCount = receivedLikesCount;

  int? _receivedViewsCount;
  int? get receivedViewsCount => _$this._receivedViewsCount;
  set receivedViewsCount(int? receivedViewsCount) =>
      _$this._receivedViewsCount = receivedViewsCount;

  int? _awardsCount;
  int? get awardsCount => _$this._awardsCount;
  set awardsCount(int? awardsCount) => _$this._awardsCount = awardsCount;

  int? _followersCount;
  int? get followersCount => _$this._followersCount;
  set followersCount(int? followersCount) =>
      _$this._followersCount = followersCount;

  GUserFieldsData_iconImageBuilder? _iconImage;
  GUserFieldsData_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GUserFieldsData_iconImageBuilder();
  set iconImage(GUserFieldsData_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GUserFieldsData_headerImageBuilder? _headerImage;
  GUserFieldsData_headerImageBuilder get headerImage =>
      _$this._headerImage ??= new GUserFieldsData_headerImageBuilder();
  set headerImage(GUserFieldsData_headerImageBuilder? headerImage) =>
      _$this._headerImage = headerImage;

  GUserFieldsDataBuilder() {
    GUserFieldsData._initializeBuilder(this);
  }

  GUserFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _biography = $v.biography;
      _login = $v.login;
      _name = $v.name;
      _receivedLikesCount = $v.receivedLikesCount;
      _receivedViewsCount = $v.receivedViewsCount;
      _awardsCount = $v.awardsCount;
      _followersCount = $v.followersCount;
      _iconImage = $v.iconImage?.toBuilder();
      _headerImage = $v.headerImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFieldsData;
  }

  @override
  void update(void Function(GUserFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFieldsData build() => _build();

  _$GUserFieldsData _build() {
    _$GUserFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GUserFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserFieldsData', 'id'),
              biography: biography,
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GUserFieldsData', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GUserFieldsData', 'name'),
              receivedLikesCount: BuiltValueNullFieldError.checkNotNull(
                  receivedLikesCount, r'GUserFieldsData', 'receivedLikesCount'),
              receivedViewsCount: BuiltValueNullFieldError.checkNotNull(
                  receivedViewsCount, r'GUserFieldsData', 'receivedViewsCount'),
              awardsCount: BuiltValueNullFieldError.checkNotNull(
                  awardsCount, r'GUserFieldsData', 'awardsCount'),
              followersCount: BuiltValueNullFieldError.checkNotNull(
                  followersCount, r'GUserFieldsData', 'followersCount'),
              iconImage: _iconImage?.build(),
              headerImage: _headerImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
        _$failedField = 'headerImage';
        _headerImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserFieldsData_iconImage extends GUserFieldsData_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserFieldsData_iconImage(
          [void Function(GUserFieldsData_iconImageBuilder)? updates]) =>
      (new GUserFieldsData_iconImageBuilder()..update(updates))._build();

  _$GUserFieldsData_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFieldsData_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserFieldsData_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GUserFieldsData_iconImage', 'downloadURL');
  }

  @override
  GUserFieldsData_iconImage rebuild(
          void Function(GUserFieldsData_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFieldsData_iconImageBuilder toBuilder() =>
      new GUserFieldsData_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFieldsData_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GUserFieldsData_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserFieldsData_iconImageBuilder
    implements
        Builder<GUserFieldsData_iconImage, GUserFieldsData_iconImageBuilder> {
  _$GUserFieldsData_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserFieldsData_iconImageBuilder() {
    GUserFieldsData_iconImage._initializeBuilder(this);
  }

  GUserFieldsData_iconImageBuilder get _$this {
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
  void replace(GUserFieldsData_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFieldsData_iconImage;
  }

  @override
  void update(void Function(GUserFieldsData_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFieldsData_iconImage build() => _build();

  _$GUserFieldsData_iconImage _build() {
    final _$result = _$v ??
        new _$GUserFieldsData_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUserFieldsData_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserFieldsData_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GUserFieldsData_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GUserFieldsData_headerImage extends GUserFieldsData_headerImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserFieldsData_headerImage(
          [void Function(GUserFieldsData_headerImageBuilder)? updates]) =>
      (new GUserFieldsData_headerImageBuilder()..update(updates))._build();

  _$GUserFieldsData_headerImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFieldsData_headerImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserFieldsData_headerImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GUserFieldsData_headerImage', 'downloadURL');
  }

  @override
  GUserFieldsData_headerImage rebuild(
          void Function(GUserFieldsData_headerImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFieldsData_headerImageBuilder toBuilder() =>
      new GUserFieldsData_headerImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFieldsData_headerImage &&
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
    return (newBuiltValueToStringHelper(r'GUserFieldsData_headerImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserFieldsData_headerImageBuilder
    implements
        Builder<GUserFieldsData_headerImage,
            GUserFieldsData_headerImageBuilder> {
  _$GUserFieldsData_headerImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserFieldsData_headerImageBuilder() {
    GUserFieldsData_headerImage._initializeBuilder(this);
  }

  GUserFieldsData_headerImageBuilder get _$this {
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
  void replace(GUserFieldsData_headerImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFieldsData_headerImage;
  }

  @override
  void update(void Function(GUserFieldsData_headerImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFieldsData_headerImage build() => _build();

  _$GUserFieldsData_headerImage _build() {
    final _$result = _$v ??
        new _$GUserFieldsData_headerImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUserFieldsData_headerImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserFieldsData_headerImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GUserFieldsData_headerImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
