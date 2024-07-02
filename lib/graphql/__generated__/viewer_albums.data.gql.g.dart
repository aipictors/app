// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_albums.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerAlbumsData> _$gViewerAlbumsDataSerializer =
    new _$GViewerAlbumsDataSerializer();
Serializer<GViewerAlbumsData_viewer> _$gViewerAlbumsDataViewerSerializer =
    new _$GViewerAlbumsData_viewerSerializer();
Serializer<GViewerAlbumsData_viewer_albums>
    _$gViewerAlbumsDataViewerAlbumsSerializer =
    new _$GViewerAlbumsData_viewer_albumsSerializer();

class _$GViewerAlbumsDataSerializer
    implements StructuredSerializer<GViewerAlbumsData> {
  @override
  final Iterable<Type> types = const [GViewerAlbumsData, _$GViewerAlbumsData];
  @override
  final String wireName = 'GViewerAlbumsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GViewerAlbumsData object,
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
            specifiedType: const FullType(GViewerAlbumsData_viewer)));
    }
    return result;
  }

  @override
  GViewerAlbumsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerAlbumsDataBuilder();

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
                  specifiedType: const FullType(GViewerAlbumsData_viewer))!
              as GViewerAlbumsData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerAlbumsData_viewerSerializer
    implements StructuredSerializer<GViewerAlbumsData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerAlbumsData_viewer,
    _$GViewerAlbumsData_viewer
  ];
  @override
  final String wireName = 'GViewerAlbumsData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerAlbumsData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'albums',
      serializers.serialize(object.albums,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GViewerAlbumsData_viewer_albums)])),
    ];

    return result;
  }

  @override
  GViewerAlbumsData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerAlbumsData_viewerBuilder();

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
        case 'albums':
          result.albums.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GViewerAlbumsData_viewer_albums)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerAlbumsData_viewer_albumsSerializer
    implements StructuredSerializer<GViewerAlbumsData_viewer_albums> {
  @override
  final Iterable<Type> types = const [
    GViewerAlbumsData_viewer_albums,
    _$GViewerAlbumsData_viewer_albums
  ];
  @override
  final String wireName = 'GViewerAlbumsData_viewer_albums';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerAlbumsData_viewer_albums object,
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
    value = object.thumbnailImageURL;
    if (value != null) {
      result
        ..add('thumbnailImageURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GViewerAlbumsData_viewer_albums deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerAlbumsData_viewer_albumsBuilder();

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
        case 'thumbnailImageURL':
          result.thumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerAlbumsData extends GViewerAlbumsData {
  @override
  final String G__typename;
  @override
  final GViewerAlbumsData_viewer? viewer;

  factory _$GViewerAlbumsData(
          [void Function(GViewerAlbumsDataBuilder)? updates]) =>
      (new GViewerAlbumsDataBuilder()..update(updates))._build();

  _$GViewerAlbumsData._({required this.G__typename, this.viewer}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerAlbumsData', 'G__typename');
  }

  @override
  GViewerAlbumsData rebuild(void Function(GViewerAlbumsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerAlbumsDataBuilder toBuilder() =>
      new GViewerAlbumsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerAlbumsData &&
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
    return (newBuiltValueToStringHelper(r'GViewerAlbumsData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerAlbumsDataBuilder
    implements Builder<GViewerAlbumsData, GViewerAlbumsDataBuilder> {
  _$GViewerAlbumsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerAlbumsData_viewerBuilder? _viewer;
  GViewerAlbumsData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerAlbumsData_viewerBuilder();
  set viewer(GViewerAlbumsData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerAlbumsDataBuilder() {
    GViewerAlbumsData._initializeBuilder(this);
  }

  GViewerAlbumsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerAlbumsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerAlbumsData;
  }

  @override
  void update(void Function(GViewerAlbumsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerAlbumsData build() => _build();

  _$GViewerAlbumsData _build() {
    _$GViewerAlbumsData _$result;
    try {
      _$result = _$v ??
          new _$GViewerAlbumsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerAlbumsData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerAlbumsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerAlbumsData_viewer extends GViewerAlbumsData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<GViewerAlbumsData_viewer_albums> albums;

  factory _$GViewerAlbumsData_viewer(
          [void Function(GViewerAlbumsData_viewerBuilder)? updates]) =>
      (new GViewerAlbumsData_viewerBuilder()..update(updates))._build();

  _$GViewerAlbumsData_viewer._(
      {required this.G__typename, required this.albums})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerAlbumsData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        albums, r'GViewerAlbumsData_viewer', 'albums');
  }

  @override
  GViewerAlbumsData_viewer rebuild(
          void Function(GViewerAlbumsData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerAlbumsData_viewerBuilder toBuilder() =>
      new GViewerAlbumsData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerAlbumsData_viewer &&
        G__typename == other.G__typename &&
        albums == other.albums;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, albums.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerAlbumsData_viewer')
          ..add('G__typename', G__typename)
          ..add('albums', albums))
        .toString();
  }
}

class GViewerAlbumsData_viewerBuilder
    implements
        Builder<GViewerAlbumsData_viewer, GViewerAlbumsData_viewerBuilder> {
  _$GViewerAlbumsData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GViewerAlbumsData_viewer_albums>? _albums;
  ListBuilder<GViewerAlbumsData_viewer_albums> get albums =>
      _$this._albums ??= new ListBuilder<GViewerAlbumsData_viewer_albums>();
  set albums(ListBuilder<GViewerAlbumsData_viewer_albums>? albums) =>
      _$this._albums = albums;

  GViewerAlbumsData_viewerBuilder() {
    GViewerAlbumsData_viewer._initializeBuilder(this);
  }

  GViewerAlbumsData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _albums = $v.albums.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerAlbumsData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerAlbumsData_viewer;
  }

  @override
  void update(void Function(GViewerAlbumsData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerAlbumsData_viewer build() => _build();

  _$GViewerAlbumsData_viewer _build() {
    _$GViewerAlbumsData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerAlbumsData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerAlbumsData_viewer', 'G__typename'),
              albums: albums.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'albums';
        albums.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerAlbumsData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerAlbumsData_viewer_albums
    extends GViewerAlbumsData_viewer_albums {
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
  final String? thumbnailImageURL;

  factory _$GViewerAlbumsData_viewer_albums(
          [void Function(GViewerAlbumsData_viewer_albumsBuilder)? updates]) =>
      (new GViewerAlbumsData_viewer_albumsBuilder()..update(updates))._build();

  _$GViewerAlbumsData_viewer_albums._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.isSensitive,
      required this.likesCount,
      required this.viewsCount,
      this.thumbnailImageURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerAlbumsData_viewer_albums', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerAlbumsData_viewer_albums', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GViewerAlbumsData_viewer_albums', 'title');
    BuiltValueNullFieldError.checkNotNull(
        isSensitive, r'GViewerAlbumsData_viewer_albums', 'isSensitive');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GViewerAlbumsData_viewer_albums', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GViewerAlbumsData_viewer_albums', 'viewsCount');
  }

  @override
  GViewerAlbumsData_viewer_albums rebuild(
          void Function(GViewerAlbumsData_viewer_albumsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerAlbumsData_viewer_albumsBuilder toBuilder() =>
      new GViewerAlbumsData_viewer_albumsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerAlbumsData_viewer_albums &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        isSensitive == other.isSensitive &&
        likesCount == other.likesCount &&
        viewsCount == other.viewsCount &&
        thumbnailImageURL == other.thumbnailImageURL;
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
    _$hash = $jc(_$hash, thumbnailImageURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerAlbumsData_viewer_albums')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('isSensitive', isSensitive)
          ..add('likesCount', likesCount)
          ..add('viewsCount', viewsCount)
          ..add('thumbnailImageURL', thumbnailImageURL))
        .toString();
  }
}

class GViewerAlbumsData_viewer_albumsBuilder
    implements
        Builder<GViewerAlbumsData_viewer_albums,
            GViewerAlbumsData_viewer_albumsBuilder> {
  _$GViewerAlbumsData_viewer_albums? _$v;

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

  String? _thumbnailImageURL;
  String? get thumbnailImageURL => _$this._thumbnailImageURL;
  set thumbnailImageURL(String? thumbnailImageURL) =>
      _$this._thumbnailImageURL = thumbnailImageURL;

  GViewerAlbumsData_viewer_albumsBuilder() {
    GViewerAlbumsData_viewer_albums._initializeBuilder(this);
  }

  GViewerAlbumsData_viewer_albumsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _isSensitive = $v.isSensitive;
      _likesCount = $v.likesCount;
      _viewsCount = $v.viewsCount;
      _thumbnailImageURL = $v.thumbnailImageURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerAlbumsData_viewer_albums other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerAlbumsData_viewer_albums;
  }

  @override
  void update(void Function(GViewerAlbumsData_viewer_albumsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerAlbumsData_viewer_albums build() => _build();

  _$GViewerAlbumsData_viewer_albums _build() {
    final _$result = _$v ??
        new _$GViewerAlbumsData_viewer_albums._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GViewerAlbumsData_viewer_albums', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerAlbumsData_viewer_albums', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GViewerAlbumsData_viewer_albums', 'title'),
            isSensitive: BuiltValueNullFieldError.checkNotNull(
                isSensitive, r'GViewerAlbumsData_viewer_albums', 'isSensitive'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GViewerAlbumsData_viewer_albums', 'likesCount'),
            viewsCount: BuiltValueNullFieldError.checkNotNull(
                viewsCount, r'GViewerAlbumsData_viewer_albums', 'viewsCount'),
            thumbnailImageURL: thumbnailImageURL);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
