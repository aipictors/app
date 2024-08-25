// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFolderWorksData> _$gFolderWorksDataSerializer =
    new _$GFolderWorksDataSerializer();
Serializer<GFolderWorksData_folder> _$gFolderWorksDataFolderSerializer =
    new _$GFolderWorksData_folderSerializer();
Serializer<GFolderWorksData_folder_works>
    _$gFolderWorksDataFolderWorksSerializer =
    new _$GFolderWorksData_folder_worksSerializer();

class _$GFolderWorksDataSerializer
    implements StructuredSerializer<GFolderWorksData> {
  @override
  final Iterable<Type> types = const [GFolderWorksData, _$GFolderWorksData];
  @override
  final String wireName = 'GFolderWorksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFolderWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.folder;
    if (value != null) {
      result
        ..add('folder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GFolderWorksData_folder)));
    }
    return result;
  }

  @override
  GFolderWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderWorksDataBuilder();

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
        case 'folder':
          result.folder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GFolderWorksData_folder))!
              as GFolderWorksData_folder);
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderWorksData_folderSerializer
    implements StructuredSerializer<GFolderWorksData_folder> {
  @override
  final Iterable<Type> types = const [
    GFolderWorksData_folder,
    _$GFolderWorksData_folder
  ];
  @override
  final String wireName = 'GFolderWorksData_folder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderWorksData_folder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'works',
      serializers.serialize(object.works,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GFolderWorksData_folder_works)])),
    ];

    return result;
  }

  @override
  GFolderWorksData_folder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderWorksData_folderBuilder();

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
        case 'works':
          result.works.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GFolderWorksData_folder_works)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderWorksData_folder_worksSerializer
    implements StructuredSerializer<GFolderWorksData_folder_works> {
  @override
  final Iterable<Type> types = const [
    GFolderWorksData_folder_works,
    _$GFolderWorksData_folder_works
  ];
  @override
  final String wireName = 'GFolderWorksData_folder_works';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFolderWorksData_folder_works object,
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
      'commentsCount',
      serializers.serialize(object.commentsCount,
          specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'imageURL',
      serializers.serialize(object.imageURL,
          specifiedType: const FullType(String)),
      'imageWidth',
      serializers.serialize(object.imageWidth,
          specifiedType: const FullType(int)),
      'imageHeight',
      serializers.serialize(object.imageHeight,
          specifiedType: const FullType(int)),
      'largeThumbnailImageURL',
      serializers.serialize(object.largeThumbnailImageURL,
          specifiedType: const FullType(String)),
      'largeThumbnailImageWidth',
      serializers.serialize(object.largeThumbnailImageWidth,
          specifiedType: const FullType(int)),
      'largeThumbnailImageHeight',
      serializers.serialize(object.largeThumbnailImageHeight,
          specifiedType: const FullType(int)),
      'smallThumbnailImageURL',
      serializers.serialize(object.smallThumbnailImageURL,
          specifiedType: const FullType(String)),
      'smallThumbnailImageWidth',
      serializers.serialize(object.smallThumbnailImageWidth,
          specifiedType: const FullType(int)),
      'smallThumbnailImageHeight',
      serializers.serialize(object.smallThumbnailImageHeight,
          specifiedType: const FullType(int)),
      'imageAspectRatio',
      serializers.serialize(object.imageAspectRatio,
          specifiedType: const FullType(double)),
    ];
    Object? value;
    value = object.thumbnailImagePosition;
    if (value != null) {
      result
        ..add('thumbnailImagePosition')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GFolderWorksData_folder_works deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderWorksData_folder_worksBuilder();

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
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'commentsCount':
          result.commentsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'imageURL':
          result.imageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'imageWidth':
          result.imageWidth = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'imageHeight':
          result.imageHeight = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'largeThumbnailImageURL':
          result.largeThumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'largeThumbnailImageWidth':
          result.largeThumbnailImageWidth = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'largeThumbnailImageHeight':
          result.largeThumbnailImageHeight = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'smallThumbnailImageURL':
          result.smallThumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'smallThumbnailImageWidth':
          result.smallThumbnailImageWidth = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'smallThumbnailImageHeight':
          result.smallThumbnailImageHeight = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'thumbnailImagePosition':
          result.thumbnailImagePosition = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'imageAspectRatio':
          result.imageAspectRatio = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GFolderWorksData extends GFolderWorksData {
  @override
  final String G__typename;
  @override
  final GFolderWorksData_folder? folder;

  factory _$GFolderWorksData(
          [void Function(GFolderWorksDataBuilder)? updates]) =>
      (new GFolderWorksDataBuilder()..update(updates))._build();

  _$GFolderWorksData._({required this.G__typename, this.folder}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderWorksData', 'G__typename');
  }

  @override
  GFolderWorksData rebuild(void Function(GFolderWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderWorksDataBuilder toBuilder() =>
      new GFolderWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderWorksData &&
        G__typename == other.G__typename &&
        folder == other.folder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, folder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderWorksData')
          ..add('G__typename', G__typename)
          ..add('folder', folder))
        .toString();
  }
}

class GFolderWorksDataBuilder
    implements Builder<GFolderWorksData, GFolderWorksDataBuilder> {
  _$GFolderWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFolderWorksData_folderBuilder? _folder;
  GFolderWorksData_folderBuilder get folder =>
      _$this._folder ??= new GFolderWorksData_folderBuilder();
  set folder(GFolderWorksData_folderBuilder? folder) => _$this._folder = folder;

  GFolderWorksDataBuilder() {
    GFolderWorksData._initializeBuilder(this);
  }

  GFolderWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _folder = $v.folder?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderWorksData;
  }

  @override
  void update(void Function(GFolderWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderWorksData build() => _build();

  _$GFolderWorksData _build() {
    _$GFolderWorksData _$result;
    try {
      _$result = _$v ??
          new _$GFolderWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFolderWorksData', 'G__typename'),
              folder: _folder?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'folder';
        _folder?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFolderWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFolderWorksData_folder extends GFolderWorksData_folder {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GFolderWorksData_folder_works> works;

  factory _$GFolderWorksData_folder(
          [void Function(GFolderWorksData_folderBuilder)? updates]) =>
      (new GFolderWorksData_folderBuilder()..update(updates))._build();

  _$GFolderWorksData_folder._(
      {required this.G__typename, required this.id, required this.works})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderWorksData_folder', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GFolderWorksData_folder', 'id');
    BuiltValueNullFieldError.checkNotNull(
        works, r'GFolderWorksData_folder', 'works');
  }

  @override
  GFolderWorksData_folder rebuild(
          void Function(GFolderWorksData_folderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderWorksData_folderBuilder toBuilder() =>
      new GFolderWorksData_folderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderWorksData_folder &&
        G__typename == other.G__typename &&
        id == other.id &&
        works == other.works;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, works.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderWorksData_folder')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('works', works))
        .toString();
  }
}

class GFolderWorksData_folderBuilder
    implements
        Builder<GFolderWorksData_folder, GFolderWorksData_folderBuilder> {
  _$GFolderWorksData_folder? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GFolderWorksData_folder_works>? _works;
  ListBuilder<GFolderWorksData_folder_works> get works =>
      _$this._works ??= new ListBuilder<GFolderWorksData_folder_works>();
  set works(ListBuilder<GFolderWorksData_folder_works>? works) =>
      _$this._works = works;

  GFolderWorksData_folderBuilder() {
    GFolderWorksData_folder._initializeBuilder(this);
  }

  GFolderWorksData_folderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _works = $v.works.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderWorksData_folder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderWorksData_folder;
  }

  @override
  void update(void Function(GFolderWorksData_folderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderWorksData_folder build() => _build();

  _$GFolderWorksData_folder _build() {
    _$GFolderWorksData_folder _$result;
    try {
      _$result = _$v ??
          new _$GFolderWorksData_folder._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFolderWorksData_folder', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFolderWorksData_folder', 'id'),
              works: works.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        works.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFolderWorksData_folder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFolderWorksData_folder_works extends GFolderWorksData_folder_works {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final int likesCount;
  @override
  final int commentsCount;
  @override
  final int createdAt;
  @override
  final String imageURL;
  @override
  final int imageWidth;
  @override
  final int imageHeight;
  @override
  final String largeThumbnailImageURL;
  @override
  final int largeThumbnailImageWidth;
  @override
  final int largeThumbnailImageHeight;
  @override
  final String smallThumbnailImageURL;
  @override
  final int smallThumbnailImageWidth;
  @override
  final int smallThumbnailImageHeight;
  @override
  final double? thumbnailImagePosition;
  @override
  final double imageAspectRatio;

  factory _$GFolderWorksData_folder_works(
          [void Function(GFolderWorksData_folder_worksBuilder)? updates]) =>
      (new GFolderWorksData_folder_worksBuilder()..update(updates))._build();

  _$GFolderWorksData_folder_works._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      required this.imageURL,
      required this.imageWidth,
      required this.imageHeight,
      required this.largeThumbnailImageURL,
      required this.largeThumbnailImageWidth,
      required this.largeThumbnailImageHeight,
      required this.smallThumbnailImageURL,
      required this.smallThumbnailImageWidth,
      required this.smallThumbnailImageHeight,
      this.thumbnailImagePosition,
      required this.imageAspectRatio})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFolderWorksData_folder_works', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFolderWorksData_folder_works', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFolderWorksData_folder_works', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GFolderWorksData_folder_works', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GFolderWorksData_folder_works', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFolderWorksData_folder_works', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GFolderWorksData_folder_works', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(
        imageWidth, r'GFolderWorksData_folder_works', 'imageWidth');
    BuiltValueNullFieldError.checkNotNull(
        imageHeight, r'GFolderWorksData_folder_works', 'imageHeight');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL,
        r'GFolderWorksData_folder_works', 'largeThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth,
        r'GFolderWorksData_folder_works', 'largeThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight,
        r'GFolderWorksData_folder_works', 'largeThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL,
        r'GFolderWorksData_folder_works', 'smallThumbnailImageURL');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth,
        r'GFolderWorksData_folder_works', 'smallThumbnailImageWidth');
    BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight,
        r'GFolderWorksData_folder_works', 'smallThumbnailImageHeight');
    BuiltValueNullFieldError.checkNotNull(
        imageAspectRatio, r'GFolderWorksData_folder_works', 'imageAspectRatio');
  }

  @override
  GFolderWorksData_folder_works rebuild(
          void Function(GFolderWorksData_folder_worksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderWorksData_folder_worksBuilder toBuilder() =>
      new GFolderWorksData_folder_worksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderWorksData_folder_works &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        imageURL == other.imageURL &&
        imageWidth == other.imageWidth &&
        imageHeight == other.imageHeight &&
        largeThumbnailImageURL == other.largeThumbnailImageURL &&
        largeThumbnailImageWidth == other.largeThumbnailImageWidth &&
        largeThumbnailImageHeight == other.largeThumbnailImageHeight &&
        smallThumbnailImageURL == other.smallThumbnailImageURL &&
        smallThumbnailImageWidth == other.smallThumbnailImageWidth &&
        smallThumbnailImageHeight == other.smallThumbnailImageHeight &&
        thumbnailImagePosition == other.thumbnailImagePosition &&
        imageAspectRatio == other.imageAspectRatio;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, commentsCount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, imageURL.hashCode);
    _$hash = $jc(_$hash, imageWidth.hashCode);
    _$hash = $jc(_$hash, imageHeight.hashCode);
    _$hash = $jc(_$hash, largeThumbnailImageURL.hashCode);
    _$hash = $jc(_$hash, largeThumbnailImageWidth.hashCode);
    _$hash = $jc(_$hash, largeThumbnailImageHeight.hashCode);
    _$hash = $jc(_$hash, smallThumbnailImageURL.hashCode);
    _$hash = $jc(_$hash, smallThumbnailImageWidth.hashCode);
    _$hash = $jc(_$hash, smallThumbnailImageHeight.hashCode);
    _$hash = $jc(_$hash, thumbnailImagePosition.hashCode);
    _$hash = $jc(_$hash, imageAspectRatio.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFolderWorksData_folder_works')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('imageURL', imageURL)
          ..add('imageWidth', imageWidth)
          ..add('imageHeight', imageHeight)
          ..add('largeThumbnailImageURL', largeThumbnailImageURL)
          ..add('largeThumbnailImageWidth', largeThumbnailImageWidth)
          ..add('largeThumbnailImageHeight', largeThumbnailImageHeight)
          ..add('smallThumbnailImageURL', smallThumbnailImageURL)
          ..add('smallThumbnailImageWidth', smallThumbnailImageWidth)
          ..add('smallThumbnailImageHeight', smallThumbnailImageHeight)
          ..add('thumbnailImagePosition', thumbnailImagePosition)
          ..add('imageAspectRatio', imageAspectRatio))
        .toString();
  }
}

class GFolderWorksData_folder_worksBuilder
    implements
        Builder<GFolderWorksData_folder_works,
            GFolderWorksData_folder_worksBuilder> {
  _$GFolderWorksData_folder_works? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _commentsCount;
  int? get commentsCount => _$this._commentsCount;
  set commentsCount(int? commentsCount) =>
      _$this._commentsCount = commentsCount;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _imageURL;
  String? get imageURL => _$this._imageURL;
  set imageURL(String? imageURL) => _$this._imageURL = imageURL;

  int? _imageWidth;
  int? get imageWidth => _$this._imageWidth;
  set imageWidth(int? imageWidth) => _$this._imageWidth = imageWidth;

  int? _imageHeight;
  int? get imageHeight => _$this._imageHeight;
  set imageHeight(int? imageHeight) => _$this._imageHeight = imageHeight;

  String? _largeThumbnailImageURL;
  String? get largeThumbnailImageURL => _$this._largeThumbnailImageURL;
  set largeThumbnailImageURL(String? largeThumbnailImageURL) =>
      _$this._largeThumbnailImageURL = largeThumbnailImageURL;

  int? _largeThumbnailImageWidth;
  int? get largeThumbnailImageWidth => _$this._largeThumbnailImageWidth;
  set largeThumbnailImageWidth(int? largeThumbnailImageWidth) =>
      _$this._largeThumbnailImageWidth = largeThumbnailImageWidth;

  int? _largeThumbnailImageHeight;
  int? get largeThumbnailImageHeight => _$this._largeThumbnailImageHeight;
  set largeThumbnailImageHeight(int? largeThumbnailImageHeight) =>
      _$this._largeThumbnailImageHeight = largeThumbnailImageHeight;

  String? _smallThumbnailImageURL;
  String? get smallThumbnailImageURL => _$this._smallThumbnailImageURL;
  set smallThumbnailImageURL(String? smallThumbnailImageURL) =>
      _$this._smallThumbnailImageURL = smallThumbnailImageURL;

  int? _smallThumbnailImageWidth;
  int? get smallThumbnailImageWidth => _$this._smallThumbnailImageWidth;
  set smallThumbnailImageWidth(int? smallThumbnailImageWidth) =>
      _$this._smallThumbnailImageWidth = smallThumbnailImageWidth;

  int? _smallThumbnailImageHeight;
  int? get smallThumbnailImageHeight => _$this._smallThumbnailImageHeight;
  set smallThumbnailImageHeight(int? smallThumbnailImageHeight) =>
      _$this._smallThumbnailImageHeight = smallThumbnailImageHeight;

  double? _thumbnailImagePosition;
  double? get thumbnailImagePosition => _$this._thumbnailImagePosition;
  set thumbnailImagePosition(double? thumbnailImagePosition) =>
      _$this._thumbnailImagePosition = thumbnailImagePosition;

  double? _imageAspectRatio;
  double? get imageAspectRatio => _$this._imageAspectRatio;
  set imageAspectRatio(double? imageAspectRatio) =>
      _$this._imageAspectRatio = imageAspectRatio;

  GFolderWorksData_folder_worksBuilder() {
    GFolderWorksData_folder_works._initializeBuilder(this);
  }

  GFolderWorksData_folder_worksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _imageURL = $v.imageURL;
      _imageWidth = $v.imageWidth;
      _imageHeight = $v.imageHeight;
      _largeThumbnailImageURL = $v.largeThumbnailImageURL;
      _largeThumbnailImageWidth = $v.largeThumbnailImageWidth;
      _largeThumbnailImageHeight = $v.largeThumbnailImageHeight;
      _smallThumbnailImageURL = $v.smallThumbnailImageURL;
      _smallThumbnailImageWidth = $v.smallThumbnailImageWidth;
      _smallThumbnailImageHeight = $v.smallThumbnailImageHeight;
      _thumbnailImagePosition = $v.thumbnailImagePosition;
      _imageAspectRatio = $v.imageAspectRatio;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderWorksData_folder_works other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderWorksData_folder_works;
  }

  @override
  void update(void Function(GFolderWorksData_folder_worksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderWorksData_folder_works build() => _build();

  _$GFolderWorksData_folder_works _build() {
    final _$result = _$v ??
        new _$GFolderWorksData_folder_works._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GFolderWorksData_folder_works', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFolderWorksData_folder_works', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GFolderWorksData_folder_works', 'title'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GFolderWorksData_folder_works', 'likesCount'),
            commentsCount: BuiltValueNullFieldError.checkNotNull(
                commentsCount, r'GFolderWorksData_folder_works', 'commentsCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GFolderWorksData_folder_works', 'createdAt'),
            imageURL: BuiltValueNullFieldError.checkNotNull(
                imageURL, r'GFolderWorksData_folder_works', 'imageURL'),
            imageWidth:
                BuiltValueNullFieldError.checkNotNull(imageWidth, r'GFolderWorksData_folder_works', 'imageWidth'),
            imageHeight: BuiltValueNullFieldError.checkNotNull(imageHeight, r'GFolderWorksData_folder_works', 'imageHeight'),
            largeThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageURL, r'GFolderWorksData_folder_works', 'largeThumbnailImageURL'),
            largeThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageWidth, r'GFolderWorksData_folder_works', 'largeThumbnailImageWidth'),
            largeThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(largeThumbnailImageHeight, r'GFolderWorksData_folder_works', 'largeThumbnailImageHeight'),
            smallThumbnailImageURL: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageURL, r'GFolderWorksData_folder_works', 'smallThumbnailImageURL'),
            smallThumbnailImageWidth: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageWidth, r'GFolderWorksData_folder_works', 'smallThumbnailImageWidth'),
            smallThumbnailImageHeight: BuiltValueNullFieldError.checkNotNull(smallThumbnailImageHeight, r'GFolderWorksData_folder_works', 'smallThumbnailImageHeight'),
            thumbnailImagePosition: thumbnailImagePosition,
            imageAspectRatio: BuiltValueNullFieldError.checkNotNull(imageAspectRatio, r'GFolderWorksData_folder_works', 'imageAspectRatio'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
