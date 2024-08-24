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
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
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
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
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
      'imageURL',
      serializers.serialize(object.imageURL,
          specifiedType: const FullType(String)),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
    ];

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
        case 'imageURL':
          result.imageURL = serializers.deserialize(value,
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
  final bool isLiked;

  factory _$GAlbumWorksData_album(
          [void Function(GAlbumWorksData_albumBuilder)? updates]) =>
      (new GAlbumWorksData_albumBuilder()..update(updates))._build();

  _$GAlbumWorksData_album._(
      {required this.G__typename,
      required this.id,
      required this.works,
      required this.isLiked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAlbumWorksData_album', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GAlbumWorksData_album', 'id');
    BuiltValueNullFieldError.checkNotNull(
        works, r'GAlbumWorksData_album', 'works');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GAlbumWorksData_album', 'isLiked');
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
        isLiked == other.isLiked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, works.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAlbumWorksData_album')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('works', works)
          ..add('isLiked', isLiked))
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

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  GAlbumWorksData_albumBuilder() {
    GAlbumWorksData_album._initializeBuilder(this);
  }

  GAlbumWorksData_albumBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _works = $v.works.toBuilder();
      _isLiked = $v.isLiked;
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
              isLiked: BuiltValueNullFieldError.checkNotNull(
                  isLiked, r'GAlbumWorksData_album', 'isLiked'));
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
  final double imageAspectRatio;
  @override
  final String imageURL;
  @override
  final bool isLiked;

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
      required this.imageURL,
      required this.isLiked})
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
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GAlbumWorksData_album_works', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GAlbumWorksData_album_works', 'isLiked');
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
        imageURL == other.imageURL &&
        isLiked == other.isLiked;
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
    _$hash = $jc(_$hash, imageURL.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
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
          ..add('imageURL', imageURL)
          ..add('isLiked', isLiked))
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

  String? _imageURL;
  String? get imageURL => _$this._imageURL;
  set imageURL(String? imageURL) => _$this._imageURL = imageURL;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

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
      _imageURL = $v.imageURL;
      _isLiked = $v.isLiked;
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
    final _$result = _$v ??
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
                imageAspectRatio, r'GAlbumWorksData_album_works', 'imageAspectRatio'),
            imageURL: BuiltValueNullFieldError.checkNotNull(
                imageURL, r'GAlbumWorksData_album_works', 'imageURL'),
            isLiked: BuiltValueNullFieldError.checkNotNull(isLiked, r'GAlbumWorksData_album_works', 'isLiked'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
