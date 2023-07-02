// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_work_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialWorkFieldsData> _$gPartialWorkFieldsDataSerializer =
    new _$GPartialWorkFieldsDataSerializer();
Serializer<GPartialWorkFieldsData_image>
    _$gPartialWorkFieldsDataImageSerializer =
    new _$GPartialWorkFieldsData_imageSerializer();
Serializer<GPartialWorkFieldsData_thumbnailImage>
    _$gPartialWorkFieldsDataThumbnailImageSerializer =
    new _$GPartialWorkFieldsData_thumbnailImageSerializer();

class _$GPartialWorkFieldsDataSerializer
    implements StructuredSerializer<GPartialWorkFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialWorkFieldsData,
    _$GPartialWorkFieldsData
  ];
  @override
  final String wireName = 'GPartialWorkFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialWorkFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPartialWorkFieldsData_image)));
    }
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPartialWorkFieldsData_thumbnailImage)));
    }
    return result;
  }

  @override
  GPartialWorkFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialWorkFieldsDataBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPartialWorkFieldsData_image))!
              as GPartialWorkFieldsData_image);
          break;
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPartialWorkFieldsData_thumbnailImage))!
              as GPartialWorkFieldsData_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GPartialWorkFieldsData_imageSerializer
    implements StructuredSerializer<GPartialWorkFieldsData_image> {
  @override
  final Iterable<Type> types = const [
    GPartialWorkFieldsData_image,
    _$GPartialWorkFieldsData_image
  ];
  @override
  final String wireName = 'GPartialWorkFieldsData_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialWorkFieldsData_image object,
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
  GPartialWorkFieldsData_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialWorkFieldsData_imageBuilder();

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

class _$GPartialWorkFieldsData_thumbnailImageSerializer
    implements StructuredSerializer<GPartialWorkFieldsData_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GPartialWorkFieldsData_thumbnailImage,
    _$GPartialWorkFieldsData_thumbnailImage
  ];
  @override
  final String wireName = 'GPartialWorkFieldsData_thumbnailImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialWorkFieldsData_thumbnailImage object,
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
  GPartialWorkFieldsData_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialWorkFieldsData_thumbnailImageBuilder();

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

class _$GPartialWorkFieldsData extends GPartialWorkFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GPartialWorkFieldsData_image? image;
  @override
  final GPartialWorkFieldsData_thumbnailImage? thumbnailImage;

  factory _$GPartialWorkFieldsData(
          [void Function(GPartialWorkFieldsDataBuilder)? updates]) =>
      (new GPartialWorkFieldsDataBuilder()..update(updates))._build();

  _$GPartialWorkFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.image,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialWorkFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GPartialWorkFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPartialWorkFieldsData', 'title');
  }

  @override
  GPartialWorkFieldsData rebuild(
          void Function(GPartialWorkFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialWorkFieldsDataBuilder toBuilder() =>
      new GPartialWorkFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialWorkFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        image == other.image &&
        thumbnailImage == other.thumbnailImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPartialWorkFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('image', image)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GPartialWorkFieldsDataBuilder
    implements Builder<GPartialWorkFieldsData, GPartialWorkFieldsDataBuilder> {
  _$GPartialWorkFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GPartialWorkFieldsData_imageBuilder? _image;
  GPartialWorkFieldsData_imageBuilder get image =>
      _$this._image ??= new GPartialWorkFieldsData_imageBuilder();
  set image(GPartialWorkFieldsData_imageBuilder? image) =>
      _$this._image = image;

  GPartialWorkFieldsData_thumbnailImageBuilder? _thumbnailImage;
  GPartialWorkFieldsData_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GPartialWorkFieldsData_thumbnailImageBuilder();
  set thumbnailImage(
          GPartialWorkFieldsData_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GPartialWorkFieldsDataBuilder() {
    GPartialWorkFieldsData._initializeBuilder(this);
  }

  GPartialWorkFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _image = $v.image?.toBuilder();
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPartialWorkFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialWorkFieldsData;
  }

  @override
  void update(void Function(GPartialWorkFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialWorkFieldsData build() => _build();

  _$GPartialWorkFieldsData _build() {
    _$GPartialWorkFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GPartialWorkFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPartialWorkFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPartialWorkFieldsData', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GPartialWorkFieldsData', 'title'),
              image: _image?.build(),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPartialWorkFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPartialWorkFieldsData_image extends GPartialWorkFieldsData_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GPartialWorkFieldsData_image(
          [void Function(GPartialWorkFieldsData_imageBuilder)? updates]) =>
      (new GPartialWorkFieldsData_imageBuilder()..update(updates))._build();

  _$GPartialWorkFieldsData_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialWorkFieldsData_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialWorkFieldsData_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GPartialWorkFieldsData_image', 'downloadURL');
  }

  @override
  GPartialWorkFieldsData_image rebuild(
          void Function(GPartialWorkFieldsData_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialWorkFieldsData_imageBuilder toBuilder() =>
      new GPartialWorkFieldsData_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialWorkFieldsData_image &&
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
    return (newBuiltValueToStringHelper(r'GPartialWorkFieldsData_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GPartialWorkFieldsData_imageBuilder
    implements
        Builder<GPartialWorkFieldsData_image,
            GPartialWorkFieldsData_imageBuilder> {
  _$GPartialWorkFieldsData_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GPartialWorkFieldsData_imageBuilder() {
    GPartialWorkFieldsData_image._initializeBuilder(this);
  }

  GPartialWorkFieldsData_imageBuilder get _$this {
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
  void replace(GPartialWorkFieldsData_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialWorkFieldsData_image;
  }

  @override
  void update(void Function(GPartialWorkFieldsData_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialWorkFieldsData_image build() => _build();

  _$GPartialWorkFieldsData_image _build() {
    final _$result = _$v ??
        new _$GPartialWorkFieldsData_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPartialWorkFieldsData_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialWorkFieldsData_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GPartialWorkFieldsData_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GPartialWorkFieldsData_thumbnailImage
    extends GPartialWorkFieldsData_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GPartialWorkFieldsData_thumbnailImage(
          [void Function(GPartialWorkFieldsData_thumbnailImageBuilder)?
              updates]) =>
      (new GPartialWorkFieldsData_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GPartialWorkFieldsData_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialWorkFieldsData_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialWorkFieldsData_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GPartialWorkFieldsData_thumbnailImage', 'downloadURL');
  }

  @override
  GPartialWorkFieldsData_thumbnailImage rebuild(
          void Function(GPartialWorkFieldsData_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialWorkFieldsData_thumbnailImageBuilder toBuilder() =>
      new GPartialWorkFieldsData_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialWorkFieldsData_thumbnailImage &&
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
            r'GPartialWorkFieldsData_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GPartialWorkFieldsData_thumbnailImageBuilder
    implements
        Builder<GPartialWorkFieldsData_thumbnailImage,
            GPartialWorkFieldsData_thumbnailImageBuilder> {
  _$GPartialWorkFieldsData_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GPartialWorkFieldsData_thumbnailImageBuilder() {
    GPartialWorkFieldsData_thumbnailImage._initializeBuilder(this);
  }

  GPartialWorkFieldsData_thumbnailImageBuilder get _$this {
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
  void replace(GPartialWorkFieldsData_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialWorkFieldsData_thumbnailImage;
  }

  @override
  void update(
      void Function(GPartialWorkFieldsData_thumbnailImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialWorkFieldsData_thumbnailImage build() => _build();

  _$GPartialWorkFieldsData_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GPartialWorkFieldsData_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPartialWorkFieldsData_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialWorkFieldsData_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GPartialWorkFieldsData_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
