// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_sticker_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialStickerFieldsData> _$gPartialStickerFieldsDataSerializer =
    new _$GPartialStickerFieldsDataSerializer();
Serializer<GPartialStickerFieldsData_image>
    _$gPartialStickerFieldsDataImageSerializer =
    new _$GPartialStickerFieldsData_imageSerializer();

class _$GPartialStickerFieldsDataSerializer
    implements StructuredSerializer<GPartialStickerFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialStickerFieldsData,
    _$GPartialStickerFieldsData
  ];
  @override
  final String wireName = 'GPartialStickerFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialStickerFieldsData object,
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
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
      'downloadsCount',
      serializers.serialize(object.downloadsCount,
          specifiedType: const FullType(int)),
      'usesCount',
      serializers.serialize(object.usesCount,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPartialStickerFieldsData_image)));
    }
    return result;
  }

  @override
  GPartialStickerFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialStickerFieldsDataBuilder();

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
                  specifiedType:
                      const FullType(GPartialStickerFieldsData_image))!
              as GPartialStickerFieldsData_image);
          break;
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'downloadsCount':
          result.downloadsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'usesCount':
          result.usesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GPartialStickerFieldsData_imageSerializer
    implements StructuredSerializer<GPartialStickerFieldsData_image> {
  @override
  final Iterable<Type> types = const [
    GPartialStickerFieldsData_image,
    _$GPartialStickerFieldsData_image
  ];
  @override
  final String wireName = 'GPartialStickerFieldsData_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialStickerFieldsData_image object,
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
  GPartialStickerFieldsData_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialStickerFieldsData_imageBuilder();

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

class _$GPartialStickerFieldsData extends GPartialStickerFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GPartialStickerFieldsData_image? image;
  @override
  final int likesCount;
  @override
  final int downloadsCount;
  @override
  final int usesCount;

  factory _$GPartialStickerFieldsData(
          [void Function(GPartialStickerFieldsDataBuilder)? updates]) =>
      (new GPartialStickerFieldsDataBuilder()..update(updates))._build();

  _$GPartialStickerFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.image,
      required this.likesCount,
      required this.downloadsCount,
      required this.usesCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialStickerFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialStickerFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPartialStickerFieldsData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GPartialStickerFieldsData', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        downloadsCount, r'GPartialStickerFieldsData', 'downloadsCount');
    BuiltValueNullFieldError.checkNotNull(
        usesCount, r'GPartialStickerFieldsData', 'usesCount');
  }

  @override
  GPartialStickerFieldsData rebuild(
          void Function(GPartialStickerFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialStickerFieldsDataBuilder toBuilder() =>
      new GPartialStickerFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialStickerFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        image == other.image &&
        likesCount == other.likesCount &&
        downloadsCount == other.downloadsCount &&
        usesCount == other.usesCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, downloadsCount.hashCode);
    _$hash = $jc(_$hash, usesCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPartialStickerFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('image', image)
          ..add('likesCount', likesCount)
          ..add('downloadsCount', downloadsCount)
          ..add('usesCount', usesCount))
        .toString();
  }
}

class GPartialStickerFieldsDataBuilder
    implements
        Builder<GPartialStickerFieldsData, GPartialStickerFieldsDataBuilder> {
  _$GPartialStickerFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GPartialStickerFieldsData_imageBuilder? _image;
  GPartialStickerFieldsData_imageBuilder get image =>
      _$this._image ??= new GPartialStickerFieldsData_imageBuilder();
  set image(GPartialStickerFieldsData_imageBuilder? image) =>
      _$this._image = image;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _downloadsCount;
  int? get downloadsCount => _$this._downloadsCount;
  set downloadsCount(int? downloadsCount) =>
      _$this._downloadsCount = downloadsCount;

  int? _usesCount;
  int? get usesCount => _$this._usesCount;
  set usesCount(int? usesCount) => _$this._usesCount = usesCount;

  GPartialStickerFieldsDataBuilder() {
    GPartialStickerFieldsData._initializeBuilder(this);
  }

  GPartialStickerFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _image = $v.image?.toBuilder();
      _likesCount = $v.likesCount;
      _downloadsCount = $v.downloadsCount;
      _usesCount = $v.usesCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPartialStickerFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialStickerFieldsData;
  }

  @override
  void update(void Function(GPartialStickerFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialStickerFieldsData build() => _build();

  _$GPartialStickerFieldsData _build() {
    _$GPartialStickerFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GPartialStickerFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPartialStickerFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPartialStickerFieldsData', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GPartialStickerFieldsData', 'title'),
              image: _image?.build(),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GPartialStickerFieldsData', 'likesCount'),
              downloadsCount: BuiltValueNullFieldError.checkNotNull(
                  downloadsCount,
                  r'GPartialStickerFieldsData',
                  'downloadsCount'),
              usesCount: BuiltValueNullFieldError.checkNotNull(
                  usesCount, r'GPartialStickerFieldsData', 'usesCount'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPartialStickerFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPartialStickerFieldsData_image
    extends GPartialStickerFieldsData_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GPartialStickerFieldsData_image(
          [void Function(GPartialStickerFieldsData_imageBuilder)? updates]) =>
      (new GPartialStickerFieldsData_imageBuilder()..update(updates))._build();

  _$GPartialStickerFieldsData_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialStickerFieldsData_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialStickerFieldsData_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GPartialStickerFieldsData_image', 'downloadURL');
  }

  @override
  GPartialStickerFieldsData_image rebuild(
          void Function(GPartialStickerFieldsData_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialStickerFieldsData_imageBuilder toBuilder() =>
      new GPartialStickerFieldsData_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialStickerFieldsData_image &&
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
    return (newBuiltValueToStringHelper(r'GPartialStickerFieldsData_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GPartialStickerFieldsData_imageBuilder
    implements
        Builder<GPartialStickerFieldsData_image,
            GPartialStickerFieldsData_imageBuilder> {
  _$GPartialStickerFieldsData_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GPartialStickerFieldsData_imageBuilder() {
    GPartialStickerFieldsData_image._initializeBuilder(this);
  }

  GPartialStickerFieldsData_imageBuilder get _$this {
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
  void replace(GPartialStickerFieldsData_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialStickerFieldsData_image;
  }

  @override
  void update(void Function(GPartialStickerFieldsData_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialStickerFieldsData_image build() => _build();

  _$GPartialStickerFieldsData_image _build() {
    final _$result = _$v ??
        new _$GPartialStickerFieldsData_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPartialStickerFieldsData_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialStickerFieldsData_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GPartialStickerFieldsData_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
