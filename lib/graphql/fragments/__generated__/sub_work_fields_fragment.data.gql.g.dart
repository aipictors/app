// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_work_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSubWorkFieldsData> _$gSubWorkFieldsDataSerializer =
    new _$GSubWorkFieldsDataSerializer();
Serializer<GSubWorkFieldsData_image> _$gSubWorkFieldsDataImageSerializer =
    new _$GSubWorkFieldsData_imageSerializer();
Serializer<GSubWorkFieldsData_thumbnailImage>
    _$gSubWorkFieldsDataThumbnailImageSerializer =
    new _$GSubWorkFieldsData_thumbnailImageSerializer();

class _$GSubWorkFieldsDataSerializer
    implements StructuredSerializer<GSubWorkFieldsData> {
  @override
  final Iterable<Type> types = const [GSubWorkFieldsData, _$GSubWorkFieldsData];
  @override
  final String wireName = 'GSubWorkFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSubWorkFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(GSubWorkFieldsData_image)),
      'thumbnailImage',
      serializers.serialize(object.thumbnailImage,
          specifiedType: const FullType(GSubWorkFieldsData_thumbnailImage)),
    ];

    return result;
  }

  @override
  GSubWorkFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSubWorkFieldsDataBuilder();

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
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GSubWorkFieldsData_image))!
              as GSubWorkFieldsData_image);
          break;
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GSubWorkFieldsData_thumbnailImage))!
              as GSubWorkFieldsData_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GSubWorkFieldsData_imageSerializer
    implements StructuredSerializer<GSubWorkFieldsData_image> {
  @override
  final Iterable<Type> types = const [
    GSubWorkFieldsData_image,
    _$GSubWorkFieldsData_image
  ];
  @override
  final String wireName = 'GSubWorkFieldsData_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSubWorkFieldsData_image object,
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
  GSubWorkFieldsData_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSubWorkFieldsData_imageBuilder();

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

class _$GSubWorkFieldsData_thumbnailImageSerializer
    implements StructuredSerializer<GSubWorkFieldsData_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GSubWorkFieldsData_thumbnailImage,
    _$GSubWorkFieldsData_thumbnailImage
  ];
  @override
  final String wireName = 'GSubWorkFieldsData_thumbnailImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSubWorkFieldsData_thumbnailImage object,
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
  GSubWorkFieldsData_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSubWorkFieldsData_thumbnailImageBuilder();

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

class _$GSubWorkFieldsData extends GSubWorkFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GSubWorkFieldsData_image image;
  @override
  final GSubWorkFieldsData_thumbnailImage thumbnailImage;

  factory _$GSubWorkFieldsData(
          [void Function(GSubWorkFieldsDataBuilder)? updates]) =>
      (new GSubWorkFieldsDataBuilder()..update(updates))._build();

  _$GSubWorkFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.image,
      required this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSubWorkFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GSubWorkFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        image, r'GSubWorkFieldsData', 'image');
    BuiltValueNullFieldError.checkNotNull(
        thumbnailImage, r'GSubWorkFieldsData', 'thumbnailImage');
  }

  @override
  GSubWorkFieldsData rebuild(
          void Function(GSubWorkFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSubWorkFieldsDataBuilder toBuilder() =>
      new GSubWorkFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSubWorkFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        image == other.image &&
        thumbnailImage == other.thumbnailImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSubWorkFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('image', image)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GSubWorkFieldsDataBuilder
    implements Builder<GSubWorkFieldsData, GSubWorkFieldsDataBuilder> {
  _$GSubWorkFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GSubWorkFieldsData_imageBuilder? _image;
  GSubWorkFieldsData_imageBuilder get image =>
      _$this._image ??= new GSubWorkFieldsData_imageBuilder();
  set image(GSubWorkFieldsData_imageBuilder? image) => _$this._image = image;

  GSubWorkFieldsData_thumbnailImageBuilder? _thumbnailImage;
  GSubWorkFieldsData_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??= new GSubWorkFieldsData_thumbnailImageBuilder();
  set thumbnailImage(
          GSubWorkFieldsData_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GSubWorkFieldsDataBuilder() {
    GSubWorkFieldsData._initializeBuilder(this);
  }

  GSubWorkFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _image = $v.image.toBuilder();
      _thumbnailImage = $v.thumbnailImage.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSubWorkFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSubWorkFieldsData;
  }

  @override
  void update(void Function(GSubWorkFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSubWorkFieldsData build() => _build();

  _$GSubWorkFieldsData _build() {
    _$GSubWorkFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GSubWorkFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GSubWorkFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GSubWorkFieldsData', 'id'),
              image: image.build(),
              thumbnailImage: thumbnailImage.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        image.build();
        _$failedField = 'thumbnailImage';
        thumbnailImage.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GSubWorkFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSubWorkFieldsData_image extends GSubWorkFieldsData_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GSubWorkFieldsData_image(
          [void Function(GSubWorkFieldsData_imageBuilder)? updates]) =>
      (new GSubWorkFieldsData_imageBuilder()..update(updates))._build();

  _$GSubWorkFieldsData_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSubWorkFieldsData_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GSubWorkFieldsData_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GSubWorkFieldsData_image', 'downloadURL');
  }

  @override
  GSubWorkFieldsData_image rebuild(
          void Function(GSubWorkFieldsData_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSubWorkFieldsData_imageBuilder toBuilder() =>
      new GSubWorkFieldsData_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSubWorkFieldsData_image &&
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
    return (newBuiltValueToStringHelper(r'GSubWorkFieldsData_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GSubWorkFieldsData_imageBuilder
    implements
        Builder<GSubWorkFieldsData_image, GSubWorkFieldsData_imageBuilder> {
  _$GSubWorkFieldsData_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GSubWorkFieldsData_imageBuilder() {
    GSubWorkFieldsData_image._initializeBuilder(this);
  }

  GSubWorkFieldsData_imageBuilder get _$this {
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
  void replace(GSubWorkFieldsData_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSubWorkFieldsData_image;
  }

  @override
  void update(void Function(GSubWorkFieldsData_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSubWorkFieldsData_image build() => _build();

  _$GSubWorkFieldsData_image _build() {
    final _$result = _$v ??
        new _$GSubWorkFieldsData_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GSubWorkFieldsData_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GSubWorkFieldsData_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GSubWorkFieldsData_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GSubWorkFieldsData_thumbnailImage
    extends GSubWorkFieldsData_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GSubWorkFieldsData_thumbnailImage(
          [void Function(GSubWorkFieldsData_thumbnailImageBuilder)? updates]) =>
      (new GSubWorkFieldsData_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GSubWorkFieldsData_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSubWorkFieldsData_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GSubWorkFieldsData_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GSubWorkFieldsData_thumbnailImage', 'downloadURL');
  }

  @override
  GSubWorkFieldsData_thumbnailImage rebuild(
          void Function(GSubWorkFieldsData_thumbnailImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSubWorkFieldsData_thumbnailImageBuilder toBuilder() =>
      new GSubWorkFieldsData_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSubWorkFieldsData_thumbnailImage &&
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
    return (newBuiltValueToStringHelper(r'GSubWorkFieldsData_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GSubWorkFieldsData_thumbnailImageBuilder
    implements
        Builder<GSubWorkFieldsData_thumbnailImage,
            GSubWorkFieldsData_thumbnailImageBuilder> {
  _$GSubWorkFieldsData_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GSubWorkFieldsData_thumbnailImageBuilder() {
    GSubWorkFieldsData_thumbnailImage._initializeBuilder(this);
  }

  GSubWorkFieldsData_thumbnailImageBuilder get _$this {
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
  void replace(GSubWorkFieldsData_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSubWorkFieldsData_thumbnailImage;
  }

  @override
  void update(
      void Function(GSubWorkFieldsData_thumbnailImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSubWorkFieldsData_thumbnailImage build() => _build();

  _$GSubWorkFieldsData_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GSubWorkFieldsData_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GSubWorkFieldsData_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GSubWorkFieldsData_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GSubWorkFieldsData_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
