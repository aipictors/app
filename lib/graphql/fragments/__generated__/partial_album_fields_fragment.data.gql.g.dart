// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_album_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialAlbumFieldsData> _$gPartialAlbumFieldsDataSerializer =
    new _$GPartialAlbumFieldsDataSerializer();
Serializer<GPartialAlbumFieldsData_thumbnailImage>
    _$gPartialAlbumFieldsDataThumbnailImageSerializer =
    new _$GPartialAlbumFieldsData_thumbnailImageSerializer();

class _$GPartialAlbumFieldsDataSerializer
    implements StructuredSerializer<GPartialAlbumFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialAlbumFieldsData,
    _$GPartialAlbumFieldsData
  ];
  @override
  final String wireName = 'GPartialAlbumFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialAlbumFieldsData object,
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
      'isSensitive',
      serializers.serialize(object.isSensitive,
          specifiedType: const FullType(bool)),
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
      'viewsCount',
      serializers.serialize(object.viewsCount,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPartialAlbumFieldsData_thumbnailImage)));
    }
    return result;
  }

  @override
  GPartialAlbumFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialAlbumFieldsDataBuilder();

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
        case 'isSensitive':
          result.isSensitive = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'viewsCount':
          result.viewsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPartialAlbumFieldsData_thumbnailImage))!
              as GPartialAlbumFieldsData_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GPartialAlbumFieldsData_thumbnailImageSerializer
    implements StructuredSerializer<GPartialAlbumFieldsData_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GPartialAlbumFieldsData_thumbnailImage,
    _$GPartialAlbumFieldsData_thumbnailImage
  ];
  @override
  final String wireName = 'GPartialAlbumFieldsData_thumbnailImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialAlbumFieldsData_thumbnailImage object,
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
  GPartialAlbumFieldsData_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialAlbumFieldsData_thumbnailImageBuilder();

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

class _$GPartialAlbumFieldsData extends GPartialAlbumFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final bool isSensitive;
  @override
  final int likesCount;
  @override
  final int viewsCount;
  @override
  final GPartialAlbumFieldsData_thumbnailImage? thumbnailImage;

  factory _$GPartialAlbumFieldsData(
          [void Function(GPartialAlbumFieldsDataBuilder)? updates]) =>
      (new GPartialAlbumFieldsDataBuilder()..update(updates))._build();

  _$GPartialAlbumFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.isSensitive,
      required this.likesCount,
      required this.viewsCount,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialAlbumFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GPartialAlbumFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPartialAlbumFieldsData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        isSensitive, r'GPartialAlbumFieldsData', 'isSensitive');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GPartialAlbumFieldsData', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GPartialAlbumFieldsData', 'viewsCount');
  }

  @override
  GPartialAlbumFieldsData rebuild(
          void Function(GPartialAlbumFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialAlbumFieldsDataBuilder toBuilder() =>
      new GPartialAlbumFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialAlbumFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        isSensitive == other.isSensitive &&
        likesCount == other.likesCount &&
        viewsCount == other.viewsCount &&
        thumbnailImage == other.thumbnailImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, isSensitive.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, viewsCount.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPartialAlbumFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('isSensitive', isSensitive)
          ..add('likesCount', likesCount)
          ..add('viewsCount', viewsCount)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GPartialAlbumFieldsDataBuilder
    implements
        Builder<GPartialAlbumFieldsData, GPartialAlbumFieldsDataBuilder> {
  _$GPartialAlbumFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  bool? _isSensitive;
  bool? get isSensitive => _$this._isSensitive;
  set isSensitive(bool? isSensitive) => _$this._isSensitive = isSensitive;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _viewsCount;
  int? get viewsCount => _$this._viewsCount;
  set viewsCount(int? viewsCount) => _$this._viewsCount = viewsCount;

  GPartialAlbumFieldsData_thumbnailImageBuilder? _thumbnailImage;
  GPartialAlbumFieldsData_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GPartialAlbumFieldsData_thumbnailImageBuilder();
  set thumbnailImage(
          GPartialAlbumFieldsData_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GPartialAlbumFieldsDataBuilder() {
    GPartialAlbumFieldsData._initializeBuilder(this);
  }

  GPartialAlbumFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _isSensitive = $v.isSensitive;
      _likesCount = $v.likesCount;
      _viewsCount = $v.viewsCount;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPartialAlbumFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialAlbumFieldsData;
  }

  @override
  void update(void Function(GPartialAlbumFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialAlbumFieldsData build() => _build();

  _$GPartialAlbumFieldsData _build() {
    _$GPartialAlbumFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GPartialAlbumFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPartialAlbumFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPartialAlbumFieldsData', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GPartialAlbumFieldsData', 'title'),
              isSensitive: BuiltValueNullFieldError.checkNotNull(
                  isSensitive, r'GPartialAlbumFieldsData', 'isSensitive'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GPartialAlbumFieldsData', 'likesCount'),
              viewsCount: BuiltValueNullFieldError.checkNotNull(
                  viewsCount, r'GPartialAlbumFieldsData', 'viewsCount'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPartialAlbumFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPartialAlbumFieldsData_thumbnailImage
    extends GPartialAlbumFieldsData_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GPartialAlbumFieldsData_thumbnailImage(
          [void Function(GPartialAlbumFieldsData_thumbnailImageBuilder)?
              updates]) =>
      (new GPartialAlbumFieldsData_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GPartialAlbumFieldsData_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialAlbumFieldsData_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialAlbumFieldsData_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GPartialAlbumFieldsData_thumbnailImage', 'downloadURL');
  }

  @override
  GPartialAlbumFieldsData_thumbnailImage rebuild(
          void Function(GPartialAlbumFieldsData_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialAlbumFieldsData_thumbnailImageBuilder toBuilder() =>
      new GPartialAlbumFieldsData_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialAlbumFieldsData_thumbnailImage &&
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
            r'GPartialAlbumFieldsData_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GPartialAlbumFieldsData_thumbnailImageBuilder
    implements
        Builder<GPartialAlbumFieldsData_thumbnailImage,
            GPartialAlbumFieldsData_thumbnailImageBuilder> {
  _$GPartialAlbumFieldsData_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GPartialAlbumFieldsData_thumbnailImageBuilder() {
    GPartialAlbumFieldsData_thumbnailImage._initializeBuilder(this);
  }

  GPartialAlbumFieldsData_thumbnailImageBuilder get _$this {
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
  void replace(GPartialAlbumFieldsData_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialAlbumFieldsData_thumbnailImage;
  }

  @override
  void update(
      void Function(GPartialAlbumFieldsData_thumbnailImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialAlbumFieldsData_thumbnailImage build() => _build();

  _$GPartialAlbumFieldsData_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GPartialAlbumFieldsData_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPartialAlbumFieldsData_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialAlbumFieldsData_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GPartialAlbumFieldsData_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
