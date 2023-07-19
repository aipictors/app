// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_folders.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerFoldersData> _$gViewerFoldersDataSerializer =
    new _$GViewerFoldersDataSerializer();
Serializer<GViewerFoldersData_viewer> _$gViewerFoldersDataViewerSerializer =
    new _$GViewerFoldersData_viewerSerializer();
Serializer<GViewerFoldersData_viewer_folders>
    _$gViewerFoldersDataViewerFoldersSerializer =
    new _$GViewerFoldersData_viewer_foldersSerializer();
Serializer<GViewerFoldersData_viewer_folders_thumbnailImage>
    _$gViewerFoldersDataViewerFoldersThumbnailImageSerializer =
    new _$GViewerFoldersData_viewer_folders_thumbnailImageSerializer();

class _$GViewerFoldersDataSerializer
    implements StructuredSerializer<GViewerFoldersData> {
  @override
  final Iterable<Type> types = const [GViewerFoldersData, _$GViewerFoldersData];
  @override
  final String wireName = 'GViewerFoldersData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerFoldersData object,
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
            specifiedType: const FullType(GViewerFoldersData_viewer)));
    }
    return result;
  }

  @override
  GViewerFoldersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFoldersDataBuilder();

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
                  specifiedType: const FullType(GViewerFoldersData_viewer))!
              as GViewerFoldersData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerFoldersData_viewerSerializer
    implements StructuredSerializer<GViewerFoldersData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerFoldersData_viewer,
    _$GViewerFoldersData_viewer
  ];
  @override
  final String wireName = 'GViewerFoldersData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerFoldersData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'folders',
      serializers.serialize(object.folders,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GViewerFoldersData_viewer_folders)])),
    ];

    return result;
  }

  @override
  GViewerFoldersData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFoldersData_viewerBuilder();

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
        case 'folders':
          result.folders.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GViewerFoldersData_viewer_folders)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerFoldersData_viewer_foldersSerializer
    implements StructuredSerializer<GViewerFoldersData_viewer_folders> {
  @override
  final Iterable<Type> types = const [
    GViewerFoldersData_viewer_folders,
    _$GViewerFoldersData_viewer_folders
  ];
  @override
  final String wireName = 'GViewerFoldersData_viewer_folders';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerFoldersData_viewer_folders object,
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
          specifiedType: const FullType(_i3.GRating)),
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
            specifiedType: const FullType(
                GViewerFoldersData_viewer_folders_thumbnailImage)));
    }
    return result;
  }

  @override
  GViewerFoldersData_viewer_folders deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFoldersData_viewer_foldersBuilder();

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
              specifiedType: const FullType(_i3.GRating))! as _i3.GRating;
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
                  specifiedType: const FullType(
                      GViewerFoldersData_viewer_folders_thumbnailImage))!
              as GViewerFoldersData_viewer_folders_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerFoldersData_viewer_folders_thumbnailImageSerializer
    implements
        StructuredSerializer<GViewerFoldersData_viewer_folders_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GViewerFoldersData_viewer_folders_thumbnailImage,
    _$GViewerFoldersData_viewer_folders_thumbnailImage
  ];
  @override
  final String wireName = 'GViewerFoldersData_viewer_folders_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerFoldersData_viewer_folders_thumbnailImage object,
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
  GViewerFoldersData_viewer_folders_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerFoldersData_viewer_folders_thumbnailImageBuilder();

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

class _$GViewerFoldersData extends GViewerFoldersData {
  @override
  final String G__typename;
  @override
  final GViewerFoldersData_viewer? viewer;

  factory _$GViewerFoldersData(
          [void Function(GViewerFoldersDataBuilder)? updates]) =>
      (new GViewerFoldersDataBuilder()..update(updates))._build();

  _$GViewerFoldersData._({required this.G__typename, this.viewer}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerFoldersData', 'G__typename');
  }

  @override
  GViewerFoldersData rebuild(
          void Function(GViewerFoldersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFoldersDataBuilder toBuilder() =>
      new GViewerFoldersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFoldersData &&
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
    return (newBuiltValueToStringHelper(r'GViewerFoldersData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerFoldersDataBuilder
    implements Builder<GViewerFoldersData, GViewerFoldersDataBuilder> {
  _$GViewerFoldersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerFoldersData_viewerBuilder? _viewer;
  GViewerFoldersData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerFoldersData_viewerBuilder();
  set viewer(GViewerFoldersData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerFoldersDataBuilder() {
    GViewerFoldersData._initializeBuilder(this);
  }

  GViewerFoldersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerFoldersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFoldersData;
  }

  @override
  void update(void Function(GViewerFoldersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFoldersData build() => _build();

  _$GViewerFoldersData _build() {
    _$GViewerFoldersData _$result;
    try {
      _$result = _$v ??
          new _$GViewerFoldersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerFoldersData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerFoldersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerFoldersData_viewer extends GViewerFoldersData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<GViewerFoldersData_viewer_folders> folders;

  factory _$GViewerFoldersData_viewer(
          [void Function(GViewerFoldersData_viewerBuilder)? updates]) =>
      (new GViewerFoldersData_viewerBuilder()..update(updates))._build();

  _$GViewerFoldersData_viewer._(
      {required this.G__typename, required this.folders})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerFoldersData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        folders, r'GViewerFoldersData_viewer', 'folders');
  }

  @override
  GViewerFoldersData_viewer rebuild(
          void Function(GViewerFoldersData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFoldersData_viewerBuilder toBuilder() =>
      new GViewerFoldersData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFoldersData_viewer &&
        G__typename == other.G__typename &&
        folders == other.folders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, folders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerFoldersData_viewer')
          ..add('G__typename', G__typename)
          ..add('folders', folders))
        .toString();
  }
}

class GViewerFoldersData_viewerBuilder
    implements
        Builder<GViewerFoldersData_viewer, GViewerFoldersData_viewerBuilder> {
  _$GViewerFoldersData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GViewerFoldersData_viewer_folders>? _folders;
  ListBuilder<GViewerFoldersData_viewer_folders> get folders =>
      _$this._folders ??= new ListBuilder<GViewerFoldersData_viewer_folders>();
  set folders(ListBuilder<GViewerFoldersData_viewer_folders>? folders) =>
      _$this._folders = folders;

  GViewerFoldersData_viewerBuilder() {
    GViewerFoldersData_viewer._initializeBuilder(this);
  }

  GViewerFoldersData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _folders = $v.folders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerFoldersData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFoldersData_viewer;
  }

  @override
  void update(void Function(GViewerFoldersData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFoldersData_viewer build() => _build();

  _$GViewerFoldersData_viewer _build() {
    _$GViewerFoldersData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerFoldersData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerFoldersData_viewer', 'G__typename'),
              folders: folders.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'folders';
        folders.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerFoldersData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerFoldersData_viewer_folders
    extends GViewerFoldersData_viewer_folders {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final _i3.GRating rating;
  @override
  final int likesCount;
  @override
  final int viewsCount;
  @override
  final GViewerFoldersData_viewer_folders_thumbnailImage? thumbnailImage;

  factory _$GViewerFoldersData_viewer_folders(
          [void Function(GViewerFoldersData_viewer_foldersBuilder)? updates]) =>
      (new GViewerFoldersData_viewer_foldersBuilder()..update(updates))
          ._build();

  _$GViewerFoldersData_viewer_folders._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.rating,
      required this.likesCount,
      required this.viewsCount,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerFoldersData_viewer_folders', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerFoldersData_viewer_folders', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GViewerFoldersData_viewer_folders', 'title');
    BuiltValueNullFieldError.checkNotNull(
        rating, r'GViewerFoldersData_viewer_folders', 'rating');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GViewerFoldersData_viewer_folders', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GViewerFoldersData_viewer_folders', 'viewsCount');
  }

  @override
  GViewerFoldersData_viewer_folders rebuild(
          void Function(GViewerFoldersData_viewer_foldersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFoldersData_viewer_foldersBuilder toBuilder() =>
      new GViewerFoldersData_viewer_foldersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFoldersData_viewer_folders &&
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
    return (newBuiltValueToStringHelper(r'GViewerFoldersData_viewer_folders')
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

class GViewerFoldersData_viewer_foldersBuilder
    implements
        Builder<GViewerFoldersData_viewer_folders,
            GViewerFoldersData_viewer_foldersBuilder> {
  _$GViewerFoldersData_viewer_folders? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  _i3.GRating? _rating;
  _i3.GRating? get rating => _$this._rating;
  set rating(_i3.GRating? rating) => _$this._rating = rating;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _viewsCount;
  int? get viewsCount => _$this._viewsCount;
  set viewsCount(int? viewsCount) => _$this._viewsCount = viewsCount;

  GViewerFoldersData_viewer_folders_thumbnailImageBuilder? _thumbnailImage;
  GViewerFoldersData_viewer_folders_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GViewerFoldersData_viewer_folders_thumbnailImageBuilder();
  set thumbnailImage(
          GViewerFoldersData_viewer_folders_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GViewerFoldersData_viewer_foldersBuilder() {
    GViewerFoldersData_viewer_folders._initializeBuilder(this);
  }

  GViewerFoldersData_viewer_foldersBuilder get _$this {
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
  void replace(GViewerFoldersData_viewer_folders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFoldersData_viewer_folders;
  }

  @override
  void update(
      void Function(GViewerFoldersData_viewer_foldersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFoldersData_viewer_folders build() => _build();

  _$GViewerFoldersData_viewer_folders _build() {
    _$GViewerFoldersData_viewer_folders _$result;
    try {
      _$result = _$v ??
          new _$GViewerFoldersData_viewer_folders._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GViewerFoldersData_viewer_folders', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GViewerFoldersData_viewer_folders', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GViewerFoldersData_viewer_folders', 'title'),
              rating: BuiltValueNullFieldError.checkNotNull(
                  rating, r'GViewerFoldersData_viewer_folders', 'rating'),
              likesCount: BuiltValueNullFieldError.checkNotNull(likesCount,
                  r'GViewerFoldersData_viewer_folders', 'likesCount'),
              viewsCount: BuiltValueNullFieldError.checkNotNull(viewsCount,
                  r'GViewerFoldersData_viewer_folders', 'viewsCount'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerFoldersData_viewer_folders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerFoldersData_viewer_folders_thumbnailImage
    extends GViewerFoldersData_viewer_folders_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GViewerFoldersData_viewer_folders_thumbnailImage(
          [void Function(
                  GViewerFoldersData_viewer_folders_thumbnailImageBuilder)?
              updates]) =>
      (new GViewerFoldersData_viewer_folders_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GViewerFoldersData_viewer_folders_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerFoldersData_viewer_folders_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerFoldersData_viewer_folders_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GViewerFoldersData_viewer_folders_thumbnailImage', 'downloadURL');
  }

  @override
  GViewerFoldersData_viewer_folders_thumbnailImage rebuild(
          void Function(GViewerFoldersData_viewer_folders_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFoldersData_viewer_folders_thumbnailImageBuilder toBuilder() =>
      new GViewerFoldersData_viewer_folders_thumbnailImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFoldersData_viewer_folders_thumbnailImage &&
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
            r'GViewerFoldersData_viewer_folders_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GViewerFoldersData_viewer_folders_thumbnailImageBuilder
    implements
        Builder<GViewerFoldersData_viewer_folders_thumbnailImage,
            GViewerFoldersData_viewer_folders_thumbnailImageBuilder> {
  _$GViewerFoldersData_viewer_folders_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GViewerFoldersData_viewer_folders_thumbnailImageBuilder() {
    GViewerFoldersData_viewer_folders_thumbnailImage._initializeBuilder(this);
  }

  GViewerFoldersData_viewer_folders_thumbnailImageBuilder get _$this {
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
  void replace(GViewerFoldersData_viewer_folders_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFoldersData_viewer_folders_thumbnailImage;
  }

  @override
  void update(
      void Function(GViewerFoldersData_viewer_folders_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFoldersData_viewer_folders_thumbnailImage build() => _build();

  _$GViewerFoldersData_viewer_folders_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GViewerFoldersData_viewer_folders_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerFoldersData_viewer_folders_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerFoldersData_viewer_folders_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GViewerFoldersData_viewer_folders_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
