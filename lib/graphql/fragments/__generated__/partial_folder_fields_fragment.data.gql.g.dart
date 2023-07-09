// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_folder_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialFolderFieldsData> _$gPartialFolderFieldsDataSerializer =
    new _$GPartialFolderFieldsDataSerializer();
Serializer<GPartialFolderFieldsData_thumbnailImage>
    _$gPartialFolderFieldsDataThumbnailImageSerializer =
    new _$GPartialFolderFieldsData_thumbnailImageSerializer();

class _$GPartialFolderFieldsDataSerializer
    implements StructuredSerializer<GPartialFolderFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialFolderFieldsData,
    _$GPartialFolderFieldsData
  ];
  @override
  final String wireName = 'GPartialFolderFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialFolderFieldsData object,
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
      'rating',
      serializers.serialize(object.rating,
          specifiedType: const FullType(_i1.GRating)),
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
                const FullType(GPartialFolderFieldsData_thumbnailImage)));
    }
    return result;
  }

  @override
  GPartialFolderFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialFolderFieldsDataBuilder();

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
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GRating))! as _i1.GRating;
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
                      const FullType(GPartialFolderFieldsData_thumbnailImage))!
              as GPartialFolderFieldsData_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GPartialFolderFieldsData_thumbnailImageSerializer
    implements StructuredSerializer<GPartialFolderFieldsData_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GPartialFolderFieldsData_thumbnailImage,
    _$GPartialFolderFieldsData_thumbnailImage
  ];
  @override
  final String wireName = 'GPartialFolderFieldsData_thumbnailImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialFolderFieldsData_thumbnailImage object,
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
  GPartialFolderFieldsData_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialFolderFieldsData_thumbnailImageBuilder();

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

class _$GPartialFolderFieldsData extends GPartialFolderFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final _i1.GRating rating;
  @override
  final int likesCount;
  @override
  final int viewsCount;
  @override
  final GPartialFolderFieldsData_thumbnailImage? thumbnailImage;

  factory _$GPartialFolderFieldsData(
          [void Function(GPartialFolderFieldsDataBuilder)? updates]) =>
      (new GPartialFolderFieldsDataBuilder()..update(updates))._build();

  _$GPartialFolderFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.rating,
      required this.likesCount,
      required this.viewsCount,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialFolderFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialFolderFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPartialFolderFieldsData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        rating, r'GPartialFolderFieldsData', 'rating');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GPartialFolderFieldsData', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GPartialFolderFieldsData', 'viewsCount');
  }

  @override
  GPartialFolderFieldsData rebuild(
          void Function(GPartialFolderFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialFolderFieldsDataBuilder toBuilder() =>
      new GPartialFolderFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialFolderFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        rating == other.rating &&
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
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, viewsCount.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPartialFolderFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('rating', rating)
          ..add('likesCount', likesCount)
          ..add('viewsCount', viewsCount)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GPartialFolderFieldsDataBuilder
    implements
        Builder<GPartialFolderFieldsData, GPartialFolderFieldsDataBuilder> {
  _$GPartialFolderFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  _i1.GRating? _rating;
  _i1.GRating? get rating => _$this._rating;
  set rating(_i1.GRating? rating) => _$this._rating = rating;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _viewsCount;
  int? get viewsCount => _$this._viewsCount;
  set viewsCount(int? viewsCount) => _$this._viewsCount = viewsCount;

  GPartialFolderFieldsData_thumbnailImageBuilder? _thumbnailImage;
  GPartialFolderFieldsData_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GPartialFolderFieldsData_thumbnailImageBuilder();
  set thumbnailImage(
          GPartialFolderFieldsData_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GPartialFolderFieldsDataBuilder() {
    GPartialFolderFieldsData._initializeBuilder(this);
  }

  GPartialFolderFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _rating = $v.rating;
      _likesCount = $v.likesCount;
      _viewsCount = $v.viewsCount;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPartialFolderFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialFolderFieldsData;
  }

  @override
  void update(void Function(GPartialFolderFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialFolderFieldsData build() => _build();

  _$GPartialFolderFieldsData _build() {
    _$GPartialFolderFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GPartialFolderFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPartialFolderFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPartialFolderFieldsData', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GPartialFolderFieldsData', 'title'),
              rating: BuiltValueNullFieldError.checkNotNull(
                  rating, r'GPartialFolderFieldsData', 'rating'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GPartialFolderFieldsData', 'likesCount'),
              viewsCount: BuiltValueNullFieldError.checkNotNull(
                  viewsCount, r'GPartialFolderFieldsData', 'viewsCount'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPartialFolderFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPartialFolderFieldsData_thumbnailImage
    extends GPartialFolderFieldsData_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GPartialFolderFieldsData_thumbnailImage(
          [void Function(GPartialFolderFieldsData_thumbnailImageBuilder)?
              updates]) =>
      (new GPartialFolderFieldsData_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GPartialFolderFieldsData_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialFolderFieldsData_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialFolderFieldsData_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GPartialFolderFieldsData_thumbnailImage', 'downloadURL');
  }

  @override
  GPartialFolderFieldsData_thumbnailImage rebuild(
          void Function(GPartialFolderFieldsData_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialFolderFieldsData_thumbnailImageBuilder toBuilder() =>
      new GPartialFolderFieldsData_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialFolderFieldsData_thumbnailImage &&
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
            r'GPartialFolderFieldsData_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GPartialFolderFieldsData_thumbnailImageBuilder
    implements
        Builder<GPartialFolderFieldsData_thumbnailImage,
            GPartialFolderFieldsData_thumbnailImageBuilder> {
  _$GPartialFolderFieldsData_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GPartialFolderFieldsData_thumbnailImageBuilder() {
    GPartialFolderFieldsData_thumbnailImage._initializeBuilder(this);
  }

  GPartialFolderFieldsData_thumbnailImageBuilder get _$this {
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
  void replace(GPartialFolderFieldsData_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialFolderFieldsData_thumbnailImage;
  }

  @override
  void update(
      void Function(GPartialFolderFieldsData_thumbnailImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialFolderFieldsData_thumbnailImage build() => _build();

  _$GPartialFolderFieldsData_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GPartialFolderFieldsData_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPartialFolderFieldsData_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialFolderFieldsData_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GPartialFolderFieldsData_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
