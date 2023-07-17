// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_bookmarked_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerBookmarkedWorksData> _$gViewerBookmarkedWorksDataSerializer =
    new _$GViewerBookmarkedWorksDataSerializer();
Serializer<GViewerBookmarkedWorksData_viewer>
    _$gViewerBookmarkedWorksDataViewerSerializer =
    new _$GViewerBookmarkedWorksData_viewerSerializer();
Serializer<GViewerBookmarkedWorksData_viewer_bookmarkedWorks>
    _$gViewerBookmarkedWorksDataViewerBookmarkedWorksSerializer =
    new _$GViewerBookmarkedWorksData_viewer_bookmarkedWorksSerializer();
Serializer<GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage>
    _$gViewerBookmarkedWorksDataViewerBookmarkedWorksThumbnailImageSerializer =
    new _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageSerializer();

class _$GViewerBookmarkedWorksDataSerializer
    implements StructuredSerializer<GViewerBookmarkedWorksData> {
  @override
  final Iterable<Type> types = const [
    GViewerBookmarkedWorksData,
    _$GViewerBookmarkedWorksData
  ];
  @override
  final String wireName = 'GViewerBookmarkedWorksData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerBookmarkedWorksData object,
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
            specifiedType: const FullType(GViewerBookmarkedWorksData_viewer)));
    }
    return result;
  }

  @override
  GViewerBookmarkedWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerBookmarkedWorksDataBuilder();

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
                  specifiedType:
                      const FullType(GViewerBookmarkedWorksData_viewer))!
              as GViewerBookmarkedWorksData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerBookmarkedWorksData_viewerSerializer
    implements StructuredSerializer<GViewerBookmarkedWorksData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerBookmarkedWorksData_viewer,
    _$GViewerBookmarkedWorksData_viewer
  ];
  @override
  final String wireName = 'GViewerBookmarkedWorksData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerBookmarkedWorksData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'bookmarkedWorks',
      serializers.serialize(object.bookmarkedWorks,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GViewerBookmarkedWorksData_viewer_bookmarkedWorks)
          ])),
    ];

    return result;
  }

  @override
  GViewerBookmarkedWorksData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerBookmarkedWorksData_viewerBuilder();

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
        case 'bookmarkedWorks':
          result.bookmarkedWorks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GViewerBookmarkedWorksData_viewer_bookmarkedWorks)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerBookmarkedWorksData_viewer_bookmarkedWorksSerializer
    implements
        StructuredSerializer<
            GViewerBookmarkedWorksData_viewer_bookmarkedWorks> {
  @override
  final Iterable<Type> types = const [
    GViewerBookmarkedWorksData_viewer_bookmarkedWorks,
    _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks
  ];
  @override
  final String wireName = 'GViewerBookmarkedWorksData_viewer_bookmarkedWorks';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerBookmarkedWorksData_viewer_bookmarkedWorks object,
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
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage)));
    }
    return result;
  }

  @override
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder();

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
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage))!
              as GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageSerializer
    implements
        StructuredSerializer<
            GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage,
    _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage
  ];
  @override
  final String wireName =
      'GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage object,
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
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder();

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

class _$GViewerBookmarkedWorksData extends GViewerBookmarkedWorksData {
  @override
  final String G__typename;
  @override
  final GViewerBookmarkedWorksData_viewer? viewer;

  factory _$GViewerBookmarkedWorksData(
          [void Function(GViewerBookmarkedWorksDataBuilder)? updates]) =>
      (new GViewerBookmarkedWorksDataBuilder()..update(updates))._build();

  _$GViewerBookmarkedWorksData._({required this.G__typename, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerBookmarkedWorksData', 'G__typename');
  }

  @override
  GViewerBookmarkedWorksData rebuild(
          void Function(GViewerBookmarkedWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerBookmarkedWorksDataBuilder toBuilder() =>
      new GViewerBookmarkedWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerBookmarkedWorksData &&
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
    return (newBuiltValueToStringHelper(r'GViewerBookmarkedWorksData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerBookmarkedWorksDataBuilder
    implements
        Builder<GViewerBookmarkedWorksData, GViewerBookmarkedWorksDataBuilder> {
  _$GViewerBookmarkedWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerBookmarkedWorksData_viewerBuilder? _viewer;
  GViewerBookmarkedWorksData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerBookmarkedWorksData_viewerBuilder();
  set viewer(GViewerBookmarkedWorksData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerBookmarkedWorksDataBuilder() {
    GViewerBookmarkedWorksData._initializeBuilder(this);
  }

  GViewerBookmarkedWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerBookmarkedWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerBookmarkedWorksData;
  }

  @override
  void update(void Function(GViewerBookmarkedWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerBookmarkedWorksData build() => _build();

  _$GViewerBookmarkedWorksData _build() {
    _$GViewerBookmarkedWorksData _$result;
    try {
      _$result = _$v ??
          new _$GViewerBookmarkedWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerBookmarkedWorksData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerBookmarkedWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerBookmarkedWorksData_viewer
    extends GViewerBookmarkedWorksData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<GViewerBookmarkedWorksData_viewer_bookmarkedWorks>
      bookmarkedWorks;

  factory _$GViewerBookmarkedWorksData_viewer(
          [void Function(GViewerBookmarkedWorksData_viewerBuilder)? updates]) =>
      (new GViewerBookmarkedWorksData_viewerBuilder()..update(updates))
          ._build();

  _$GViewerBookmarkedWorksData_viewer._(
      {required this.G__typename, required this.bookmarkedWorks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerBookmarkedWorksData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(bookmarkedWorks,
        r'GViewerBookmarkedWorksData_viewer', 'bookmarkedWorks');
  }

  @override
  GViewerBookmarkedWorksData_viewer rebuild(
          void Function(GViewerBookmarkedWorksData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerBookmarkedWorksData_viewerBuilder toBuilder() =>
      new GViewerBookmarkedWorksData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerBookmarkedWorksData_viewer &&
        G__typename == other.G__typename &&
        bookmarkedWorks == other.bookmarkedWorks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, bookmarkedWorks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerBookmarkedWorksData_viewer')
          ..add('G__typename', G__typename)
          ..add('bookmarkedWorks', bookmarkedWorks))
        .toString();
  }
}

class GViewerBookmarkedWorksData_viewerBuilder
    implements
        Builder<GViewerBookmarkedWorksData_viewer,
            GViewerBookmarkedWorksData_viewerBuilder> {
  _$GViewerBookmarkedWorksData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GViewerBookmarkedWorksData_viewer_bookmarkedWorks>?
      _bookmarkedWorks;
  ListBuilder<GViewerBookmarkedWorksData_viewer_bookmarkedWorks>
      get bookmarkedWorks => _$this._bookmarkedWorks ??=
          new ListBuilder<GViewerBookmarkedWorksData_viewer_bookmarkedWorks>();
  set bookmarkedWorks(
          ListBuilder<GViewerBookmarkedWorksData_viewer_bookmarkedWorks>?
              bookmarkedWorks) =>
      _$this._bookmarkedWorks = bookmarkedWorks;

  GViewerBookmarkedWorksData_viewerBuilder() {
    GViewerBookmarkedWorksData_viewer._initializeBuilder(this);
  }

  GViewerBookmarkedWorksData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _bookmarkedWorks = $v.bookmarkedWorks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerBookmarkedWorksData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerBookmarkedWorksData_viewer;
  }

  @override
  void update(
      void Function(GViewerBookmarkedWorksData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerBookmarkedWorksData_viewer build() => _build();

  _$GViewerBookmarkedWorksData_viewer _build() {
    _$GViewerBookmarkedWorksData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerBookmarkedWorksData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GViewerBookmarkedWorksData_viewer', 'G__typename'),
              bookmarkedWorks: bookmarkedWorks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'bookmarkedWorks';
        bookmarkedWorks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerBookmarkedWorksData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks
    extends GViewerBookmarkedWorksData_viewer_bookmarkedWorks {
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
  final GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage?
      thumbnailImage;

  factory _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks(
          [void Function(
                  GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder)?
              updates]) =>
      (new GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder()
            ..update(updates))
          ._build();

  _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks', 'title');
    BuiltValueNullFieldError.checkNotNull(likesCount,
        r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(commentsCount,
        r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(createdAt,
        r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks', 'createdAt');
  }

  @override
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks rebuild(
          void Function(
                  GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder toBuilder() =>
      new GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerBookmarkedWorksData_viewer_bookmarkedWorks &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        thumbnailImage == other.thumbnailImage;
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
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder
    implements
        Builder<GViewerBookmarkedWorksData_viewer_bookmarkedWorks,
            GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder> {
  _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks? _$v;

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

  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder?
      _thumbnailImage;
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder
      get thumbnailImage => _$this._thumbnailImage ??=
          new GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder();
  set thumbnailImage(
          GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder() {
    GViewerBookmarkedWorksData_viewer_bookmarkedWorks._initializeBuilder(this);
  }

  GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerBookmarkedWorksData_viewer_bookmarkedWorks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks;
  }

  @override
  void update(
      void Function(GViewerBookmarkedWorksData_viewer_bookmarkedWorksBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks build() => _build();

  _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks _build() {
    _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks _$result;
    try {
      _$result = _$v ??
          new _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount,
                  r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks',
                  'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage
    extends GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage(
          [void Function(
                  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder)?
              updates]) =>
      (new GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage',
        'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage',
        'downloadURL');
  }

  @override
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage rebuild(
          void Function(
                  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder
      toBuilder() =>
          new GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage &&
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
            r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder
    implements
        Builder<
            GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage,
            GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder> {
  _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder() {
    GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage
        ._initializeBuilder(this);
  }

  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder
      get _$this {
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
  void replace(
      GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage;
  }

  @override
  void update(
      void Function(
              GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage build() =>
      _build();

  _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage
            ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
