// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_user_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialUserFieldsData> _$gPartialUserFieldsDataSerializer =
    new _$GPartialUserFieldsDataSerializer();
Serializer<GPartialUserFieldsData_iconImage>
    _$gPartialUserFieldsDataIconImageSerializer =
    new _$GPartialUserFieldsData_iconImageSerializer();

class _$GPartialUserFieldsDataSerializer
    implements StructuredSerializer<GPartialUserFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialUserFieldsData,
    _$GPartialUserFieldsData
  ];
  @override
  final String wireName = 'GPartialUserFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialUserFieldsData object,
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
            specifiedType: const FullType(GPartialUserFieldsData_iconImage)));
    }
    return result;
  }

  @override
  GPartialUserFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialUserFieldsDataBuilder();

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
                  specifiedType:
                      const FullType(GPartialUserFieldsData_iconImage))!
              as GPartialUserFieldsData_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GPartialUserFieldsData_iconImageSerializer
    implements StructuredSerializer<GPartialUserFieldsData_iconImage> {
  @override
  final Iterable<Type> types = const [
    GPartialUserFieldsData_iconImage,
    _$GPartialUserFieldsData_iconImage
  ];
  @override
  final String wireName = 'GPartialUserFieldsData_iconImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialUserFieldsData_iconImage object,
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
  GPartialUserFieldsData_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialUserFieldsData_iconImageBuilder();

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

class _$GPartialUserFieldsData extends GPartialUserFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GPartialUserFieldsData_iconImage? iconImage;

  factory _$GPartialUserFieldsData(
          [void Function(GPartialUserFieldsDataBuilder)? updates]) =>
      (new GPartialUserFieldsDataBuilder()..update(updates))._build();

  _$GPartialUserFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialUserFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GPartialUserFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GPartialUserFieldsData', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GPartialUserFieldsData', 'name');
  }

  @override
  GPartialUserFieldsData rebuild(
          void Function(GPartialUserFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialUserFieldsDataBuilder toBuilder() =>
      new GPartialUserFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialUserFieldsData &&
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
    return (newBuiltValueToStringHelper(r'GPartialUserFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GPartialUserFieldsDataBuilder
    implements Builder<GPartialUserFieldsData, GPartialUserFieldsDataBuilder> {
  _$GPartialUserFieldsData? _$v;

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

  GPartialUserFieldsData_iconImageBuilder? _iconImage;
  GPartialUserFieldsData_iconImageBuilder get iconImage =>
      _$this._iconImage ??= new GPartialUserFieldsData_iconImageBuilder();
  set iconImage(GPartialUserFieldsData_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GPartialUserFieldsDataBuilder() {
    GPartialUserFieldsData._initializeBuilder(this);
  }

  GPartialUserFieldsDataBuilder get _$this {
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
  void replace(GPartialUserFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialUserFieldsData;
  }

  @override
  void update(void Function(GPartialUserFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialUserFieldsData build() => _build();

  _$GPartialUserFieldsData _build() {
    _$GPartialUserFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GPartialUserFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPartialUserFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPartialUserFieldsData', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GPartialUserFieldsData', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GPartialUserFieldsData', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPartialUserFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPartialUserFieldsData_iconImage
    extends GPartialUserFieldsData_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GPartialUserFieldsData_iconImage(
          [void Function(GPartialUserFieldsData_iconImageBuilder)? updates]) =>
      (new GPartialUserFieldsData_iconImageBuilder()..update(updates))._build();

  _$GPartialUserFieldsData_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialUserFieldsData_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialUserFieldsData_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GPartialUserFieldsData_iconImage', 'downloadURL');
  }

  @override
  GPartialUserFieldsData_iconImage rebuild(
          void Function(GPartialUserFieldsData_iconImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialUserFieldsData_iconImageBuilder toBuilder() =>
      new GPartialUserFieldsData_iconImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialUserFieldsData_iconImage &&
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
    return (newBuiltValueToStringHelper(r'GPartialUserFieldsData_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GPartialUserFieldsData_iconImageBuilder
    implements
        Builder<GPartialUserFieldsData_iconImage,
            GPartialUserFieldsData_iconImageBuilder> {
  _$GPartialUserFieldsData_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GPartialUserFieldsData_iconImageBuilder() {
    GPartialUserFieldsData_iconImage._initializeBuilder(this);
  }

  GPartialUserFieldsData_iconImageBuilder get _$this {
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
  void replace(GPartialUserFieldsData_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialUserFieldsData_iconImage;
  }

  @override
  void update(void Function(GPartialUserFieldsData_iconImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialUserFieldsData_iconImage build() => _build();

  _$GPartialUserFieldsData_iconImage _build() {
    final _$result = _$v ??
        new _$GPartialUserFieldsData_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPartialUserFieldsData_iconImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialUserFieldsData_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GPartialUserFieldsData_iconImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
