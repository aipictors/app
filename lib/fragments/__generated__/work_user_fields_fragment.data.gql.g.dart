// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_user_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkUserFieldsData> _$gWorkUserFieldsDataSerializer =
    new _$GWorkUserFieldsDataSerializer();
Serializer<GWorkUserFieldsData_iconImage>
    _$gWorkUserFieldsDataIconImageSerializer =
    new _$GWorkUserFieldsData_iconImageSerializer();

class _$GWorkUserFieldsDataSerializer
    implements StructuredSerializer<GWorkUserFieldsData> {
  @override
  final Iterable<Type> types = const [
    GWorkUserFieldsData,
    _$GWorkUserFieldsData
  ];
  @override
  final String wireName = 'GWorkUserFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkUserFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GWorkUserFieldsData_iconImage)));
    }
    return result;
  }

  @override
  GWorkUserFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkUserFieldsDataBuilder();

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
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconImage':
          result.iconImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GWorkUserFieldsData_iconImage))!
              as GWorkUserFieldsData_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkUserFieldsData_iconImageSerializer
    implements StructuredSerializer<GWorkUserFieldsData_iconImage> {
  @override
  final Iterable<Type> types = const [
    GWorkUserFieldsData_iconImage,
    _$GWorkUserFieldsData_iconImage
  ];
  @override
  final String wireName = 'GWorkUserFieldsData_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkUserFieldsData_iconImage object,
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
  GWorkUserFieldsData_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkUserFieldsData_iconImageBuilder();

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

class _$GWorkUserFieldsData extends GWorkUserFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String login;
  @override
  final GWorkUserFieldsData_iconImage? iconImage;

  factory _$GWorkUserFieldsData(
          [void Function(GWorkUserFieldsDataBuilder)? updates]) =>
      (new GWorkUserFieldsDataBuilder()..update(updates))._build();

  _$GWorkUserFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkUserFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GWorkUserFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GWorkUserFieldsData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GWorkUserFieldsData', 'login');
  }

  @override
  GWorkUserFieldsData rebuild(
          void Function(GWorkUserFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkUserFieldsDataBuilder toBuilder() =>
      new GWorkUserFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkUserFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        login == other.login &&
        iconImage == other.iconImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkUserFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('login', login)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GWorkUserFieldsDataBuilder
    implements Builder<GWorkUserFieldsData, GWorkUserFieldsDataBuilder> {
  _$GWorkUserFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  GWorkUserFieldsData_iconImageBuilder? _iconImage;
  GWorkUserFieldsData_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GWorkUserFieldsData_iconImageBuilder();
  set iconImage(GWorkUserFieldsData_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GWorkUserFieldsDataBuilder() {
    GWorkUserFieldsData._initializeBuilder(this);
  }

  GWorkUserFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _login = $v.login;
      _iconImage = $v.iconImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkUserFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkUserFieldsData;
  }

  @override
  void update(void Function(GWorkUserFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkUserFieldsData build() => _build();

  _$GWorkUserFieldsData _build() {
    _$GWorkUserFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GWorkUserFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkUserFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkUserFieldsData', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GWorkUserFieldsData', 'name'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GWorkUserFieldsData', 'login'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkUserFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkUserFieldsData_iconImage extends GWorkUserFieldsData_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkUserFieldsData_iconImage(
          [void Function(GWorkUserFieldsData_iconImageBuilder)? updates]) =>
      (new GWorkUserFieldsData_iconImageBuilder()..update(updates))._build();

  _$GWorkUserFieldsData_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkUserFieldsData_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkUserFieldsData_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GWorkUserFieldsData_iconImage', 'downloadURL');
  }

  @override
  GWorkUserFieldsData_iconImage rebuild(
          void Function(GWorkUserFieldsData_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkUserFieldsData_iconImageBuilder toBuilder() =>
      new GWorkUserFieldsData_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkUserFieldsData_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GWorkUserFieldsData_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkUserFieldsData_iconImageBuilder
    implements
        Builder<GWorkUserFieldsData_iconImage,
            GWorkUserFieldsData_iconImageBuilder> {
  _$GWorkUserFieldsData_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkUserFieldsData_iconImageBuilder() {
    GWorkUserFieldsData_iconImage._initializeBuilder(this);
  }

  GWorkUserFieldsData_iconImageBuilder get _$this {
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
  void replace(GWorkUserFieldsData_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkUserFieldsData_iconImage;
  }

  @override
  void update(void Function(GWorkUserFieldsData_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkUserFieldsData_iconImage build() => _build();

  _$GWorkUserFieldsData_iconImage _build() {
    final _$result = _$v ??
        new _$GWorkUserFieldsData_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GWorkUserFieldsData_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkUserFieldsData_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GWorkUserFieldsData_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
