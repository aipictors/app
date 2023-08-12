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
Serializer<GAlbumWorksData_album_works_thumbnailImage>
    _$gAlbumWorksDataAlbumWorksThumbnailImageSerializer =
    new _$GAlbumWorksData_album_works_thumbnailImageSerializer();

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
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GAlbumWorksData_album_works_thumbnailImage)));
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
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GAlbumWorksData_album_works_thumbnailImage))!
              as GAlbumWorksData_album_works_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GAlbumWorksData_album_works_thumbnailImageSerializer
    implements
        StructuredSerializer<GAlbumWorksData_album_works_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GAlbumWorksData_album_works_thumbnailImage,
    _$GAlbumWorksData_album_works_thumbnailImage
  ];
  @override
  final String wireName = 'GAlbumWorksData_album_works_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GAlbumWorksData_album_works_thumbnailImage object,
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
  GAlbumWorksData_album_works_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAlbumWorksData_album_works_thumbnailImageBuilder();

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

  factory _$GAlbumWorksData_album(
          [void Function(GAlbumWorksData_albumBuilder)? updates]) =>
      (new GAlbumWorksData_albumBuilder()..update(updates))._build();

  _$GAlbumWorksData_album._(
      {required this.G__typename, required this.id, required this.works})
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
    return (newBuiltValueToStringHelper(r'GAlbumWorksData_album')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('works', works))
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

  GAlbumWorksData_albumBuilder() {
    GAlbumWorksData_album._initializeBuilder(this);
  }

  GAlbumWorksData_albumBuilder get _$this {
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
              works: works.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        works.build();
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
  final GAlbumWorksData_album_works_thumbnailImage? thumbnailImage;

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
      this.thumbnailImage})
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
    return (newBuiltValueToStringHelper(r'GAlbumWorksData_album_works')
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

  GAlbumWorksData_album_works_thumbnailImageBuilder? _thumbnailImage;
  GAlbumWorksData_album_works_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GAlbumWorksData_album_works_thumbnailImageBuilder();
  set thumbnailImage(
          GAlbumWorksData_album_works_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

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
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
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
                  commentsCount,
                  r'GAlbumWorksData_album_works',
                  'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GAlbumWorksData_album_works', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
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

class _$GAlbumWorksData_album_works_thumbnailImage
    extends GAlbumWorksData_album_works_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GAlbumWorksData_album_works_thumbnailImage(
          [void Function(GAlbumWorksData_album_works_thumbnailImageBuilder)?
              updates]) =>
      (new GAlbumWorksData_album_works_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GAlbumWorksData_album_works_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GAlbumWorksData_album_works_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAlbumWorksData_album_works_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GAlbumWorksData_album_works_thumbnailImage', 'downloadURL');
  }

  @override
  GAlbumWorksData_album_works_thumbnailImage rebuild(
          void Function(GAlbumWorksData_album_works_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAlbumWorksData_album_works_thumbnailImageBuilder toBuilder() =>
      new GAlbumWorksData_album_works_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAlbumWorksData_album_works_thumbnailImage &&
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
            r'GAlbumWorksData_album_works_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GAlbumWorksData_album_works_thumbnailImageBuilder
    implements
        Builder<GAlbumWorksData_album_works_thumbnailImage,
            GAlbumWorksData_album_works_thumbnailImageBuilder> {
  _$GAlbumWorksData_album_works_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GAlbumWorksData_album_works_thumbnailImageBuilder() {
    GAlbumWorksData_album_works_thumbnailImage._initializeBuilder(this);
  }

  GAlbumWorksData_album_works_thumbnailImageBuilder get _$this {
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
  void replace(GAlbumWorksData_album_works_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAlbumWorksData_album_works_thumbnailImage;
  }

  @override
  void update(
      void Function(GAlbumWorksData_album_works_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GAlbumWorksData_album_works_thumbnailImage build() => _build();

  _$GAlbumWorksData_album_works_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GAlbumWorksData_album_works_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GAlbumWorksData_album_works_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GAlbumWorksData_album_works_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GAlbumWorksData_album_works_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
