// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAlbumWorksData> _$gAlbumWorksDataSerializer =
    new _$GAlbumWorksDataSerializer();
Serializer<GAlbumWorksData_album> _$gAlbumWorksDataAlbumSerializer =
    new _$GAlbumWorksData_albumSerializer();
Serializer<GAlbumWorksData_album_works> _$gAlbumWorksDataAlbumWorksSerializer =
    new _$GAlbumWorksData_album_worksSerializer();
Serializer<GAlbumWorksData_album_works_image>
    _$gAlbumWorksDataAlbumWorksImageSerializer =
    new _$GAlbumWorksData_album_works_imageSerializer();
Serializer<GAlbumWorksData_album_works_viewer>
    _$gAlbumWorksDataAlbumWorksViewerSerializer =
    new _$GAlbumWorksData_album_works_viewerSerializer();
Serializer<GAlbumWorksData_album_viewer>
    _$gAlbumWorksDataAlbumViewerSerializer =
    new _$GAlbumWorksData_album_viewerSerializer();

class _$GAlbumWorksDataSerializer
    implements StructuredSerializer<GAlbumWorksData> {
  @override
  final Iterable<Type> types = const [GAlbumWorksData, _$GAlbumWorksData];
  @override
  final String wireName = 'GAlbumWorksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAlbumWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.album;
    if (value != null) {
      result
        ..add('album')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GAlbumWorksData_album)));
    }
    return result;
  }

  @override
  GAlbumWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumWorksDataBuilder();

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
        case 'album':
          result.album.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAlbumWorksData_album))!
              as GAlbumWorksData_album);
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumWorksData_albumSerializer
    implements StructuredSerializer<GAlbumWorksData_album> {
  @override
  final Iterable<Type> types = const [
    GAlbumWorksData_album,
    _$GAlbumWorksData_album
  ];
  @override
  final String wireName = 'GAlbumWorksData_album';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAlbumWorksData_album object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'works',
      serializers.serialize(object.works,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GAlbumWorksData_album_works)])),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GAlbumWorksData_album_viewer)));
    }
    return result;
  }

  @override
  GAlbumWorksData_album deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumWorksData_albumBuilder();

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
                const FullType(GAlbumWorksData_album_works)
              ]))! as BuiltList<Object?>);
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAlbumWorksData_album_viewer))!
              as GAlbumWorksData_album_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumWorksData_album_worksSerializer
    implements StructuredSerializer<GAlbumWorksData_album_works> {
  @override
  final Iterable<Type> types = const [
    GAlbumWorksData_album_works,
    _$GAlbumWorksData_album_works
  ];
  @override
  final String wireName = 'GAlbumWorksData_album_works';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAlbumWorksData_album_works object,
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
      'imageAspectRatio',
      serializers.serialize(object.imageAspectRatio,
          specifiedType: const FullType(double)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GAlbumWorksData_album_works_image)));
    }
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GAlbumWorksData_album_works_viewer)));
    }
    return result;
  }

  @override
  GAlbumWorksData_album_works deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumWorksData_album_worksBuilder();

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
        case 'imageAspectRatio':
          result.imageAspectRatio = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GAlbumWorksData_album_works_image))!
              as GAlbumWorksData_album_works_image);
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GAlbumWorksData_album_works_viewer))!
              as GAlbumWorksData_album_works_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumWorksData_album_works_imageSerializer
    implements StructuredSerializer<GAlbumWorksData_album_works_image> {
  @override
  final Iterable<Type> types = const [
    GAlbumWorksData_album_works_image,
    _$GAlbumWorksData_album_works_image
  ];
  @override
  final String wireName = 'GAlbumWorksData_album_works_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAlbumWorksData_album_works_image object,
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
  GAlbumWorksData_album_works_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumWorksData_album_works_imageBuilder();

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

class _$GAlbumWorksData_album_works_viewerSerializer
    implements StructuredSerializer<GAlbumWorksData_album_works_viewer> {
  @override
  final Iterable<Type> types = const [
    GAlbumWorksData_album_works_viewer,
    _$GAlbumWorksData_album_works_viewer
  ];
  @override
  final String wireName = 'GAlbumWorksData_album_works_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAlbumWorksData_album_works_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GAlbumWorksData_album_works_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumWorksData_album_works_viewerBuilder();

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
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumWorksData_album_viewerSerializer
    implements StructuredSerializer<GAlbumWorksData_album_viewer> {
  @override
  final Iterable<Type> types = const [
    GAlbumWorksData_album_viewer,
    _$GAlbumWorksData_album_viewer
  ];
  @override
  final String wireName = 'GAlbumWorksData_album_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAlbumWorksData_album_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GAlbumWorksData_album_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumWorksData_album_viewerBuilder();

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
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumWorksData extends GAlbumWorksData {
  @override
  final String G__typename;
  @override
  final GAlbumWorksData_album? album;

  factory _$GAlbumWorksData([void Function(GAlbumWorksDataBuilder)? updates]) =>
      (new GAlbumWorksDataBuilder()..update(updates))._build();

  _$GAlbumWorksData._({required this.G__typename, this.album}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumWorksData', 'G__typename');
  }

  @override
  GAlbumWorksData rebuild(void Function(GAlbumWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumWorksDataBuilder toBuilder() =>
      new GAlbumWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumWorksData &&
        G__typename == other.G__typename &&
        album == other.album;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, album.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumWorksData')
          ..add('G__typename', G__typename)
          ..add('album', album))
        .toString();
  }
}

class GAlbumWorksDataBuilder
    implements Builder<GAlbumWorksData, GAlbumWorksDataBuilder> {
  _$GAlbumWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GAlbumWorksData_albumBuilder? _album;
  GAlbumWorksData_albumBuilder get album =>
      _$this._album ??= new GAlbumWorksData_albumBuilder();
  set album(GAlbumWorksData_albumBuilder? album) => _$this._album = album;

  GAlbumWorksDataBuilder() {
    GAlbumWorksData._initializeBuilder(this);
  }

  GAlbumWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _album = $v.album?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumWorksData;
  }

  @override
  void update(void Function(GAlbumWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumWorksData build() => _build();

  _$GAlbumWorksData _build() {
    _$GAlbumWorksData _$result;
    try {
      _$result = _$v ??
          new _$GAlbumWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAlbumWorksData', 'G__typename'),
              album: _album?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'album';
        _album?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAlbumWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAlbumWorksData_album extends GAlbumWorksData_album {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GAlbumWorksData_album_works> works;
  @override
  final GAlbumWorksData_album_viewer? viewer;

  factory _$GAlbumWorksData_album(
          [void Function(GAlbumWorksData_albumBuilder)? updates]) =>
      (new GAlbumWorksData_albumBuilder()..update(updates))._build();

  _$GAlbumWorksData_album._(
      {required this.G__typename,
      required this.id,
      required this.works,
      this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumWorksData_album', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GAlbumWorksData_album', 'id');
    BuiltValueNullFieldError.checkNotNull(
        works, r'GAlbumWorksData_album', 'works');
  }

  @override
  GAlbumWorksData_album rebuild(
          void Function(GAlbumWorksData_albumBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumWorksData_albumBuilder toBuilder() =>
      new GAlbumWorksData_albumBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumWorksData_album &&
        G__typename == other.G__typename &&
        id == other.id &&
        works == other.works &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, works.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumWorksData_album')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('works', works)
          ..add('viewer', viewer))
        .toString();
  }
}

class GAlbumWorksData_albumBuilder
    implements Builder<GAlbumWorksData_album, GAlbumWorksData_albumBuilder> {
  _$GAlbumWorksData_album? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GAlbumWorksData_album_works>? _works;
  ListBuilder<GAlbumWorksData_album_works> get works =>
      _$this._works ??= new ListBuilder<GAlbumWorksData_album_works>();
  set works(ListBuilder<GAlbumWorksData_album_works>? works) =>
      _$this._works = works;

  GAlbumWorksData_album_viewerBuilder? _viewer;
  GAlbumWorksData_album_viewerBuilder get viewer =>
      _$this._viewer ??= new GAlbumWorksData_album_viewerBuilder();
  set viewer(GAlbumWorksData_album_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GAlbumWorksData_albumBuilder() {
    GAlbumWorksData_album._initializeBuilder(this);
  }

  GAlbumWorksData_albumBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _works = $v.works.toBuilder();
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumWorksData_album other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumWorksData_album;
  }

  @override
  void update(void Function(GAlbumWorksData_albumBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumWorksData_album build() => _build();

  _$GAlbumWorksData_album _build() {
    _$GAlbumWorksData_album _$result;
    try {
      _$result = _$v ??
          new _$GAlbumWorksData_album._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAlbumWorksData_album', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GAlbumWorksData_album', 'id'),
              works: works.build(),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        works.build();
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAlbumWorksData_album', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAlbumWorksData_album_works extends GAlbumWorksData_album_works {
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
  final double imageAspectRatio;
  @override
  final GAlbumWorksData_album_works_image? image;
  @override
  final GAlbumWorksData_album_works_viewer? viewer;

  factory _$GAlbumWorksData_album_works(
          [void Function(GAlbumWorksData_album_worksBuilder)? updates]) =>
      (new GAlbumWorksData_album_worksBuilder()..update(updates))._build();

  _$GAlbumWorksData_album_works._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      required this.imageAspectRatio,
      this.image,
      this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumWorksData_album_works', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAlbumWorksData_album_works', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GAlbumWorksData_album_works', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GAlbumWorksData_album_works', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GAlbumWorksData_album_works', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GAlbumWorksData_album_works', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageAspectRatio, r'GAlbumWorksData_album_works', 'imageAspectRatio');
  }

  @override
  GAlbumWorksData_album_works rebuild(
          void Function(GAlbumWorksData_album_worksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumWorksData_album_worksBuilder toBuilder() =>
      new GAlbumWorksData_album_worksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumWorksData_album_works &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        imageAspectRatio == other.imageAspectRatio &&
        image == other.image &&
        viewer == other.viewer;
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
    _$hash = $jc(_$hash, imageAspectRatio.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumWorksData_album_works')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('imageAspectRatio', imageAspectRatio)
          ..add('image', image)
          ..add('viewer', viewer))
        .toString();
  }
}

class GAlbumWorksData_album_worksBuilder
    implements
        Builder<GAlbumWorksData_album_works,
            GAlbumWorksData_album_worksBuilder> {
  _$GAlbumWorksData_album_works? _$v;

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

  double? _imageAspectRatio;
  double? get imageAspectRatio => _$this._imageAspectRatio;
  set imageAspectRatio(double? imageAspectRatio) =>
      _$this._imageAspectRatio = imageAspectRatio;

  GAlbumWorksData_album_works_imageBuilder? _image;
  GAlbumWorksData_album_works_imageBuilder get image =>
      _$this._image ??= new GAlbumWorksData_album_works_imageBuilder();
  set image(GAlbumWorksData_album_works_imageBuilder? image) =>
      _$this._image = image;

  GAlbumWorksData_album_works_viewerBuilder? _viewer;
  GAlbumWorksData_album_works_viewerBuilder get viewer =>
      _$this._viewer ??= new GAlbumWorksData_album_works_viewerBuilder();
  set viewer(GAlbumWorksData_album_works_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GAlbumWorksData_album_worksBuilder() {
    GAlbumWorksData_album_works._initializeBuilder(this);
  }

  GAlbumWorksData_album_worksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _imageAspectRatio = $v.imageAspectRatio;
      _image = $v.image?.toBuilder();
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumWorksData_album_works other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumWorksData_album_works;
  }

  @override
  void update(void Function(GAlbumWorksData_album_worksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumWorksData_album_works build() => _build();

  _$GAlbumWorksData_album_works _build() {
    _$GAlbumWorksData_album_works _$result;
    try {
      _$result = _$v ??
          new _$GAlbumWorksData_album_works._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAlbumWorksData_album_works', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GAlbumWorksData_album_works', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GAlbumWorksData_album_works', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GAlbumWorksData_album_works', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount, r'GAlbumWorksData_album_works', 'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GAlbumWorksData_album_works', 'createdAt'),
              imageAspectRatio: BuiltValueNullFieldError.checkNotNull(
                  imageAspectRatio,
                  r'GAlbumWorksData_album_works',
                  'imageAspectRatio'),
              image: _image?.build(),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAlbumWorksData_album_works', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAlbumWorksData_album_works_image
    extends GAlbumWorksData_album_works_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GAlbumWorksData_album_works_image(
          [void Function(GAlbumWorksData_album_works_imageBuilder)? updates]) =>
      (new GAlbumWorksData_album_works_imageBuilder()..update(updates))
          ._build();

  _$GAlbumWorksData_album_works_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumWorksData_album_works_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAlbumWorksData_album_works_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GAlbumWorksData_album_works_image', 'downloadURL');
  }

  @override
  GAlbumWorksData_album_works_image rebuild(
          void Function(GAlbumWorksData_album_works_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumWorksData_album_works_imageBuilder toBuilder() =>
      new GAlbumWorksData_album_works_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumWorksData_album_works_image &&
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
    return (newBuiltValueToStringHelper(r'GAlbumWorksData_album_works_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GAlbumWorksData_album_works_imageBuilder
    implements
        Builder<GAlbumWorksData_album_works_image,
            GAlbumWorksData_album_works_imageBuilder> {
  _$GAlbumWorksData_album_works_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GAlbumWorksData_album_works_imageBuilder() {
    GAlbumWorksData_album_works_image._initializeBuilder(this);
  }

  GAlbumWorksData_album_works_imageBuilder get _$this {
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
  void replace(GAlbumWorksData_album_works_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumWorksData_album_works_image;
  }

  @override
  void update(
      void Function(GAlbumWorksData_album_works_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumWorksData_album_works_image build() => _build();

  _$GAlbumWorksData_album_works_image _build() {
    final _$result = _$v ??
        new _$GAlbumWorksData_album_works_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GAlbumWorksData_album_works_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GAlbumWorksData_album_works_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GAlbumWorksData_album_works_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GAlbumWorksData_album_works_viewer
    extends GAlbumWorksData_album_works_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isLiked;

  factory _$GAlbumWorksData_album_works_viewer(
          [void Function(GAlbumWorksData_album_works_viewerBuilder)?
              updates]) =>
      (new GAlbumWorksData_album_works_viewerBuilder()..update(updates))
          ._build();

  _$GAlbumWorksData_album_works_viewer._(
      {required this.G__typename, required this.id, required this.isLiked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumWorksData_album_works_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAlbumWorksData_album_works_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GAlbumWorksData_album_works_viewer', 'isLiked');
  }

  @override
  GAlbumWorksData_album_works_viewer rebuild(
          void Function(GAlbumWorksData_album_works_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumWorksData_album_works_viewerBuilder toBuilder() =>
      new GAlbumWorksData_album_works_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumWorksData_album_works_viewer &&
        G__typename == other.G__typename &&
        id == other.id &&
        isLiked == other.isLiked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumWorksData_album_works_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isLiked', isLiked))
        .toString();
  }
}

class GAlbumWorksData_album_works_viewerBuilder
    implements
        Builder<GAlbumWorksData_album_works_viewer,
            GAlbumWorksData_album_works_viewerBuilder> {
  _$GAlbumWorksData_album_works_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  GAlbumWorksData_album_works_viewerBuilder() {
    GAlbumWorksData_album_works_viewer._initializeBuilder(this);
  }

  GAlbumWorksData_album_works_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isLiked = $v.isLiked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumWorksData_album_works_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumWorksData_album_works_viewer;
  }

  @override
  void update(
      void Function(GAlbumWorksData_album_works_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumWorksData_album_works_viewer build() => _build();

  _$GAlbumWorksData_album_works_viewer _build() {
    final _$result = _$v ??
        new _$GAlbumWorksData_album_works_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GAlbumWorksData_album_works_viewer', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GAlbumWorksData_album_works_viewer', 'id'),
            isLiked: BuiltValueNullFieldError.checkNotNull(
                isLiked, r'GAlbumWorksData_album_works_viewer', 'isLiked'));
    replace(_$result);
    return _$result;
  }
}

class _$GAlbumWorksData_album_viewer extends GAlbumWorksData_album_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isLiked;

  factory _$GAlbumWorksData_album_viewer(
          [void Function(GAlbumWorksData_album_viewerBuilder)? updates]) =>
      (new GAlbumWorksData_album_viewerBuilder()..update(updates))._build();

  _$GAlbumWorksData_album_viewer._(
      {required this.G__typename, required this.id, required this.isLiked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumWorksData_album_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAlbumWorksData_album_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GAlbumWorksData_album_viewer', 'isLiked');
  }

  @override
  GAlbumWorksData_album_viewer rebuild(
          void Function(GAlbumWorksData_album_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumWorksData_album_viewerBuilder toBuilder() =>
      new GAlbumWorksData_album_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumWorksData_album_viewer &&
        G__typename == other.G__typename &&
        id == other.id &&
        isLiked == other.isLiked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumWorksData_album_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isLiked', isLiked))
        .toString();
  }
}

class GAlbumWorksData_album_viewerBuilder
    implements
        Builder<GAlbumWorksData_album_viewer,
            GAlbumWorksData_album_viewerBuilder> {
  _$GAlbumWorksData_album_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  GAlbumWorksData_album_viewerBuilder() {
    GAlbumWorksData_album_viewer._initializeBuilder(this);
  }

  GAlbumWorksData_album_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isLiked = $v.isLiked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAlbumWorksData_album_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumWorksData_album_viewer;
  }

  @override
  void update(void Function(GAlbumWorksData_album_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumWorksData_album_viewer build() => _build();

  _$GAlbumWorksData_album_viewer _build() {
    final _$result = _$v ??
        new _$GAlbumWorksData_album_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAlbumWorksData_album_viewer', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GAlbumWorksData_album_viewer', 'id'),
            isLiked: BuiltValueNullFieldError.checkNotNull(
                isLiked, r'GAlbumWorksData_album_viewer', 'isLiked'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
