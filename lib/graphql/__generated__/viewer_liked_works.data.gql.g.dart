// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_liked_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerLikedWorksData> _$gViewerLikedWorksDataSerializer =
    new _$GViewerLikedWorksDataSerializer();
Serializer<GViewerLikedWorksData_viewer>
    _$gViewerLikedWorksDataViewerSerializer =
    new _$GViewerLikedWorksData_viewerSerializer();
Serializer<GViewerLikedWorksData_viewer_likedWorks>
    _$gViewerLikedWorksDataViewerLikedWorksSerializer =
    new _$GViewerLikedWorksData_viewer_likedWorksSerializer();
Serializer<GViewerLikedWorksData_viewer_likedWorks_thumbnailImage>
    _$gViewerLikedWorksDataViewerLikedWorksThumbnailImageSerializer =
    new _$GViewerLikedWorksData_viewer_likedWorks_thumbnailImageSerializer();

class _$GViewerLikedWorksDataSerializer
    implements StructuredSerializer<GViewerLikedWorksData> {
  @override
  final Iterable<Type> types = const [
    GViewerLikedWorksData,
    _$GViewerLikedWorksData
  ];
  @override
  final String wireName = 'GViewerLikedWorksData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerLikedWorksData object,
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
            specifiedType: const FullType(GViewerLikedWorksData_viewer)));
    }
    return result;
  }

  @override
  GViewerLikedWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerLikedWorksDataBuilder();

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
                  specifiedType: const FullType(GViewerLikedWorksData_viewer))!
              as GViewerLikedWorksData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerLikedWorksData_viewerSerializer
    implements StructuredSerializer<GViewerLikedWorksData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerLikedWorksData_viewer,
    _$GViewerLikedWorksData_viewer
  ];
  @override
  final String wireName = 'GViewerLikedWorksData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerLikedWorksData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'likedWorks',
      serializers.serialize(object.likedWorks,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GViewerLikedWorksData_viewer_likedWorks)])),
    ];

    return result;
  }

  @override
  GViewerLikedWorksData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerLikedWorksData_viewerBuilder();

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
        case 'likedWorks':
          result.likedWorks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GViewerLikedWorksData_viewer_likedWorks)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerLikedWorksData_viewer_likedWorksSerializer
    implements StructuredSerializer<GViewerLikedWorksData_viewer_likedWorks> {
  @override
  final Iterable<Type> types = const [
    GViewerLikedWorksData_viewer_likedWorks,
    _$GViewerLikedWorksData_viewer_likedWorks
  ];
  @override
  final String wireName = 'GViewerLikedWorksData_viewer_likedWorks';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerLikedWorksData_viewer_likedWorks object,
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
                GViewerLikedWorksData_viewer_likedWorks_thumbnailImage)));
    }
    return result;
  }

  @override
  GViewerLikedWorksData_viewer_likedWorks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerLikedWorksData_viewer_likedWorksBuilder();

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
                      GViewerLikedWorksData_viewer_likedWorks_thumbnailImage))!
              as GViewerLikedWorksData_viewer_likedWorks_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerLikedWorksData_viewer_likedWorks_thumbnailImageSerializer
    implements
        StructuredSerializer<
            GViewerLikedWorksData_viewer_likedWorks_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GViewerLikedWorksData_viewer_likedWorks_thumbnailImage,
    _$GViewerLikedWorksData_viewer_likedWorks_thumbnailImage
  ];
  @override
  final String wireName =
      'GViewerLikedWorksData_viewer_likedWorks_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerLikedWorksData_viewer_likedWorks_thumbnailImage object,
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
  GViewerLikedWorksData_viewer_likedWorks_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder();

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

class _$GViewerLikedWorksData extends GViewerLikedWorksData {
  @override
  final String G__typename;
  @override
  final GViewerLikedWorksData_viewer? viewer;

  factory _$GViewerLikedWorksData(
          [void Function(GViewerLikedWorksDataBuilder)? updates]) =>
      (new GViewerLikedWorksDataBuilder()..update(updates))._build();

  _$GViewerLikedWorksData._({required this.G__typename, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerLikedWorksData', 'G__typename');
  }

  @override
  GViewerLikedWorksData rebuild(
          void Function(GViewerLikedWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerLikedWorksDataBuilder toBuilder() =>
      new GViewerLikedWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerLikedWorksData &&
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
    return (newBuiltValueToStringHelper(r'GViewerLikedWorksData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerLikedWorksDataBuilder
    implements Builder<GViewerLikedWorksData, GViewerLikedWorksDataBuilder> {
  _$GViewerLikedWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerLikedWorksData_viewerBuilder? _viewer;
  GViewerLikedWorksData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerLikedWorksData_viewerBuilder();
  set viewer(GViewerLikedWorksData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerLikedWorksDataBuilder() {
    GViewerLikedWorksData._initializeBuilder(this);
  }

  GViewerLikedWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerLikedWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerLikedWorksData;
  }

  @override
  void update(void Function(GViewerLikedWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerLikedWorksData build() => _build();

  _$GViewerLikedWorksData _build() {
    _$GViewerLikedWorksData _$result;
    try {
      _$result = _$v ??
          new _$GViewerLikedWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerLikedWorksData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerLikedWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerLikedWorksData_viewer extends GViewerLikedWorksData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<GViewerLikedWorksData_viewer_likedWorks> likedWorks;

  factory _$GViewerLikedWorksData_viewer(
          [void Function(GViewerLikedWorksData_viewerBuilder)? updates]) =>
      (new GViewerLikedWorksData_viewerBuilder()..update(updates))._build();

  _$GViewerLikedWorksData_viewer._(
      {required this.G__typename, required this.likedWorks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerLikedWorksData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        likedWorks, r'GViewerLikedWorksData_viewer', 'likedWorks');
  }

  @override
  GViewerLikedWorksData_viewer rebuild(
          void Function(GViewerLikedWorksData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerLikedWorksData_viewerBuilder toBuilder() =>
      new GViewerLikedWorksData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerLikedWorksData_viewer &&
        G__typename == other.G__typename &&
        likedWorks == other.likedWorks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, likedWorks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerLikedWorksData_viewer')
          ..add('G__typename', G__typename)
          ..add('likedWorks', likedWorks))
        .toString();
  }
}

class GViewerLikedWorksData_viewerBuilder
    implements
        Builder<GViewerLikedWorksData_viewer,
            GViewerLikedWorksData_viewerBuilder> {
  _$GViewerLikedWorksData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GViewerLikedWorksData_viewer_likedWorks>? _likedWorks;
  ListBuilder<GViewerLikedWorksData_viewer_likedWorks> get likedWorks =>
      _$this._likedWorks ??=
          new ListBuilder<GViewerLikedWorksData_viewer_likedWorks>();
  set likedWorks(
          ListBuilder<GViewerLikedWorksData_viewer_likedWorks>? likedWorks) =>
      _$this._likedWorks = likedWorks;

  GViewerLikedWorksData_viewerBuilder() {
    GViewerLikedWorksData_viewer._initializeBuilder(this);
  }

  GViewerLikedWorksData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _likedWorks = $v.likedWorks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerLikedWorksData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerLikedWorksData_viewer;
  }

  @override
  void update(void Function(GViewerLikedWorksData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerLikedWorksData_viewer build() => _build();

  _$GViewerLikedWorksData_viewer _build() {
    _$GViewerLikedWorksData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerLikedWorksData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerLikedWorksData_viewer', 'G__typename'),
              likedWorks: likedWorks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likedWorks';
        likedWorks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerLikedWorksData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerLikedWorksData_viewer_likedWorks
    extends GViewerLikedWorksData_viewer_likedWorks {
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
  final GViewerLikedWorksData_viewer_likedWorks_thumbnailImage? thumbnailImage;

  factory _$GViewerLikedWorksData_viewer_likedWorks(
          [void Function(GViewerLikedWorksData_viewer_likedWorksBuilder)?
              updates]) =>
      (new GViewerLikedWorksData_viewer_likedWorksBuilder()..update(updates))
          ._build();

  _$GViewerLikedWorksData_viewer_likedWorks._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerLikedWorksData_viewer_likedWorks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerLikedWorksData_viewer_likedWorks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GViewerLikedWorksData_viewer_likedWorks', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GViewerLikedWorksData_viewer_likedWorks', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(commentsCount,
        r'GViewerLikedWorksData_viewer_likedWorks', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GViewerLikedWorksData_viewer_likedWorks', 'createdAt');
  }

  @override
  GViewerLikedWorksData_viewer_likedWorks rebuild(
          void Function(GViewerLikedWorksData_viewer_likedWorksBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerLikedWorksData_viewer_likedWorksBuilder toBuilder() =>
      new GViewerLikedWorksData_viewer_likedWorksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerLikedWorksData_viewer_likedWorks &&
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
            r'GViewerLikedWorksData_viewer_likedWorks')
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

class GViewerLikedWorksData_viewer_likedWorksBuilder
    implements
        Builder<GViewerLikedWorksData_viewer_likedWorks,
            GViewerLikedWorksData_viewer_likedWorksBuilder> {
  _$GViewerLikedWorksData_viewer_likedWorks? _$v;

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

  GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder?
      _thumbnailImage;
  GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder
      get thumbnailImage => _$this._thumbnailImage ??=
          new GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder();
  set thumbnailImage(
          GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GViewerLikedWorksData_viewer_likedWorksBuilder() {
    GViewerLikedWorksData_viewer_likedWorks._initializeBuilder(this);
  }

  GViewerLikedWorksData_viewer_likedWorksBuilder get _$this {
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
  void replace(GViewerLikedWorksData_viewer_likedWorks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerLikedWorksData_viewer_likedWorks;
  }

  @override
  void update(
      void Function(GViewerLikedWorksData_viewer_likedWorksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerLikedWorksData_viewer_likedWorks build() => _build();

  _$GViewerLikedWorksData_viewer_likedWorks _build() {
    _$GViewerLikedWorksData_viewer_likedWorks _$result;
    try {
      _$result = _$v ??
          new _$GViewerLikedWorksData_viewer_likedWorks._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GViewerLikedWorksData_viewer_likedWorks', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GViewerLikedWorksData_viewer_likedWorks', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GViewerLikedWorksData_viewer_likedWorks', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GViewerLikedWorksData_viewer_likedWorks', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount,
                  r'GViewerLikedWorksData_viewer_likedWorks',
                  'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GViewerLikedWorksData_viewer_likedWorks', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerLikedWorksData_viewer_likedWorks',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerLikedWorksData_viewer_likedWorks_thumbnailImage
    extends GViewerLikedWorksData_viewer_likedWorks_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GViewerLikedWorksData_viewer_likedWorks_thumbnailImage(
          [void Function(
                  GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder)?
              updates]) =>
      (new GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GViewerLikedWorksData_viewer_likedWorks_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GViewerLikedWorksData_viewer_likedWorks_thumbnailImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerLikedWorksData_viewer_likedWorks_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GViewerLikedWorksData_viewer_likedWorks_thumbnailImage',
        'downloadURL');
  }

  @override
  GViewerLikedWorksData_viewer_likedWorks_thumbnailImage rebuild(
          void Function(
                  GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder toBuilder() =>
      new GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerLikedWorksData_viewer_likedWorks_thumbnailImage &&
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
            r'GViewerLikedWorksData_viewer_likedWorks_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder
    implements
        Builder<GViewerLikedWorksData_viewer_likedWorks_thumbnailImage,
            GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder> {
  _$GViewerLikedWorksData_viewer_likedWorks_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder() {
    GViewerLikedWorksData_viewer_likedWorks_thumbnailImage._initializeBuilder(
        this);
  }

  GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder get _$this {
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
  void replace(GViewerLikedWorksData_viewer_likedWorks_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerLikedWorksData_viewer_likedWorks_thumbnailImage;
  }

  @override
  void update(
      void Function(
              GViewerLikedWorksData_viewer_likedWorks_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerLikedWorksData_viewer_likedWorks_thumbnailImage build() => _build();

  _$GViewerLikedWorksData_viewer_likedWorks_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GViewerLikedWorksData_viewer_likedWorks_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerLikedWorksData_viewer_likedWorks_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GViewerLikedWorksData_viewer_likedWorks_thumbnailImage',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GViewerLikedWorksData_viewer_likedWorks_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
