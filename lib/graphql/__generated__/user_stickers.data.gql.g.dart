// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stickers.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserStickersData> _$gUserStickersDataSerializer =
    new _$GUserStickersDataSerializer();
Serializer<GUserStickersData_viewer> _$gUserStickersDataViewerSerializer =
    new _$GUserStickersData_viewerSerializer();
Serializer<GUserStickersData_viewer_userStickers>
    _$gUserStickersDataViewerUserStickersSerializer =
    new _$GUserStickersData_viewer_userStickersSerializer();
Serializer<GUserStickersData_viewer_userStickers_image>
    _$gUserStickersDataViewerUserStickersImageSerializer =
    new _$GUserStickersData_viewer_userStickers_imageSerializer();

class _$GUserStickersDataSerializer
    implements StructuredSerializer<GUserStickersData> {
  @override
  final Iterable<Type> types = const [GUserStickersData, _$GUserStickersData];
  @override
  final String wireName = 'GUserStickersData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserStickersData object,
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
            specifiedType: const FullType(GUserStickersData_viewer)));
    }
    return result;
  }

  @override
  GUserStickersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserStickersDataBuilder();

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
                  specifiedType: const FullType(GUserStickersData_viewer))!
              as GUserStickersData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserStickersData_viewerSerializer
    implements StructuredSerializer<GUserStickersData_viewer> {
  @override
  final Iterable<Type> types = const [
    GUserStickersData_viewer,
    _$GUserStickersData_viewer
  ];
  @override
  final String wireName = 'GUserStickersData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserStickersData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'userStickers',
      serializers.serialize(object.userStickers,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GUserStickersData_viewer_userStickers)])),
    ];

    return result;
  }

  @override
  GUserStickersData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserStickersData_viewerBuilder();

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
        case 'userStickers':
          result.userStickers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserStickersData_viewer_userStickers)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserStickersData_viewer_userStickersSerializer
    implements StructuredSerializer<GUserStickersData_viewer_userStickers> {
  @override
  final Iterable<Type> types = const [
    GUserStickersData_viewer_userStickers,
    _$GUserStickersData_viewer_userStickers
  ];
  @override
  final String wireName = 'GUserStickersData_viewer_userStickers';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserStickersData_viewer_userStickers object,
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
      'downloadsCount',
      serializers.serialize(object.downloadsCount,
          specifiedType: const FullType(int)),
      'usesCount',
      serializers.serialize(object.usesCount,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GUserStickersData_viewer_userStickers_image)));
    }
    return result;
  }

  @override
  GUserStickersData_viewer_userStickers deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserStickersData_viewer_userStickersBuilder();

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
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GUserStickersData_viewer_userStickers_image))!
              as GUserStickersData_viewer_userStickers_image);
          break;
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'downloadsCount':
          result.downloadsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'usesCount':
          result.usesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserStickersData_viewer_userStickers_imageSerializer
    implements
        StructuredSerializer<GUserStickersData_viewer_userStickers_image> {
  @override
  final Iterable<Type> types = const [
    GUserStickersData_viewer_userStickers_image,
    _$GUserStickersData_viewer_userStickers_image
  ];
  @override
  final String wireName = 'GUserStickersData_viewer_userStickers_image';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GUserStickersData_viewer_userStickers_image object,
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
  GUserStickersData_viewer_userStickers_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserStickersData_viewer_userStickers_imageBuilder();

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

class _$GUserStickersData extends GUserStickersData {
  @override
  final String G__typename;
  @override
  final GUserStickersData_viewer? viewer;

  factory _$GUserStickersData(
          [void Function(GUserStickersDataBuilder)? updates]) =>
      (new GUserStickersDataBuilder()..update(updates))._build();

  _$GUserStickersData._({required this.G__typename, this.viewer}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserStickersData', 'G__typename');
  }

  @override
  GUserStickersData rebuild(void Function(GUserStickersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserStickersDataBuilder toBuilder() =>
      new GUserStickersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserStickersData &&
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
    return (newBuiltValueToStringHelper(r'GUserStickersData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GUserStickersDataBuilder
    implements Builder<GUserStickersData, GUserStickersDataBuilder> {
  _$GUserStickersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserStickersData_viewerBuilder? _viewer;
  GUserStickersData_viewerBuilder get viewer =>
      _$this._viewer ??= new GUserStickersData_viewerBuilder();
  set viewer(GUserStickersData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GUserStickersDataBuilder() {
    GUserStickersData._initializeBuilder(this);
  }

  GUserStickersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserStickersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserStickersData;
  }

  @override
  void update(void Function(GUserStickersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserStickersData build() => _build();

  _$GUserStickersData _build() {
    _$GUserStickersData _$result;
    try {
      _$result = _$v ??
          new _$GUserStickersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserStickersData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserStickersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserStickersData_viewer extends GUserStickersData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<GUserStickersData_viewer_userStickers> userStickers;

  factory _$GUserStickersData_viewer(
          [void Function(GUserStickersData_viewerBuilder)? updates]) =>
      (new GUserStickersData_viewerBuilder()..update(updates))._build();

  _$GUserStickersData_viewer._(
      {required this.G__typename, required this.userStickers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserStickersData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        userStickers, r'GUserStickersData_viewer', 'userStickers');
  }

  @override
  GUserStickersData_viewer rebuild(
          void Function(GUserStickersData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserStickersData_viewerBuilder toBuilder() =>
      new GUserStickersData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserStickersData_viewer &&
        G__typename == other.G__typename &&
        userStickers == other.userStickers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, userStickers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserStickersData_viewer')
          ..add('G__typename', G__typename)
          ..add('userStickers', userStickers))
        .toString();
  }
}

class GUserStickersData_viewerBuilder
    implements
        Builder<GUserStickersData_viewer, GUserStickersData_viewerBuilder> {
  _$GUserStickersData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GUserStickersData_viewer_userStickers>? _userStickers;
  ListBuilder<GUserStickersData_viewer_userStickers> get userStickers =>
      _$this._userStickers ??=
          new ListBuilder<GUserStickersData_viewer_userStickers>();
  set userStickers(
          ListBuilder<GUserStickersData_viewer_userStickers>? userStickers) =>
      _$this._userStickers = userStickers;

  GUserStickersData_viewerBuilder() {
    GUserStickersData_viewer._initializeBuilder(this);
  }

  GUserStickersData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _userStickers = $v.userStickers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserStickersData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserStickersData_viewer;
  }

  @override
  void update(void Function(GUserStickersData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserStickersData_viewer build() => _build();

  _$GUserStickersData_viewer _build() {
    _$GUserStickersData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GUserStickersData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserStickersData_viewer', 'G__typename'),
              userStickers: userStickers.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userStickers';
        userStickers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserStickersData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserStickersData_viewer_userStickers
    extends GUserStickersData_viewer_userStickers {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GUserStickersData_viewer_userStickers_image? image;
  @override
  final int likesCount;
  @override
  final int downloadsCount;
  @override
  final int usesCount;

  factory _$GUserStickersData_viewer_userStickers(
          [void Function(GUserStickersData_viewer_userStickersBuilder)?
              updates]) =>
      (new GUserStickersData_viewer_userStickersBuilder()..update(updates))
          ._build();

  _$GUserStickersData_viewer_userStickers._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.image,
      required this.likesCount,
      required this.downloadsCount,
      required this.usesCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserStickersData_viewer_userStickers', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserStickersData_viewer_userStickers', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUserStickersData_viewer_userStickers', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GUserStickersData_viewer_userStickers', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(downloadsCount,
        r'GUserStickersData_viewer_userStickers', 'downloadsCount');
    BuiltValueNullFieldError.checkNotNull(
        usesCount, r'GUserStickersData_viewer_userStickers', 'usesCount');
  }

  @override
  GUserStickersData_viewer_userStickers rebuild(
          void Function(GUserStickersData_viewer_userStickersBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserStickersData_viewer_userStickersBuilder toBuilder() =>
      new GUserStickersData_viewer_userStickersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserStickersData_viewer_userStickers &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        image == other.image &&
        likesCount == other.likesCount &&
        downloadsCount == other.downloadsCount &&
        usesCount == other.usesCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, downloadsCount.hashCode);
    _$hash = $jc(_$hash, usesCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GUserStickersData_viewer_userStickers')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('image', image)
          ..add('likesCount', likesCount)
          ..add('downloadsCount', downloadsCount)
          ..add('usesCount', usesCount))
        .toString();
  }
}

class GUserStickersData_viewer_userStickersBuilder
    implements
        Builder<GUserStickersData_viewer_userStickers,
            GUserStickersData_viewer_userStickersBuilder> {
  _$GUserStickersData_viewer_userStickers? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GUserStickersData_viewer_userStickers_imageBuilder? _image;
  GUserStickersData_viewer_userStickers_imageBuilder get image =>
      _$this._image ??=
          new GUserStickersData_viewer_userStickers_imageBuilder();
  set image(GUserStickersData_viewer_userStickers_imageBuilder? image) =>
      _$this._image = image;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _downloadsCount;
  int? get downloadsCount => _$this._downloadsCount;
  set downloadsCount(int? downloadsCount) =>
      _$this._downloadsCount = downloadsCount;

  int? _usesCount;
  int? get usesCount => _$this._usesCount;
  set usesCount(int? usesCount) => _$this._usesCount = usesCount;

  GUserStickersData_viewer_userStickersBuilder() {
    GUserStickersData_viewer_userStickers._initializeBuilder(this);
  }

  GUserStickersData_viewer_userStickersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _image = $v.image?.toBuilder();
      _likesCount = $v.likesCount;
      _downloadsCount = $v.downloadsCount;
      _usesCount = $v.usesCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserStickersData_viewer_userStickers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserStickersData_viewer_userStickers;
  }

  @override
  void update(
      void Function(GUserStickersData_viewer_userStickersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserStickersData_viewer_userStickers build() => _build();

  _$GUserStickersData_viewer_userStickers _build() {
    _$GUserStickersData_viewer_userStickers _$result;
    try {
      _$result = _$v ??
          new _$GUserStickersData_viewer_userStickers._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GUserStickersData_viewer_userStickers', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserStickersData_viewer_userStickers', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GUserStickersData_viewer_userStickers', 'title'),
              image: _image?.build(),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GUserStickersData_viewer_userStickers', 'likesCount'),
              downloadsCount: BuiltValueNullFieldError.checkNotNull(
                  downloadsCount,
                  r'GUserStickersData_viewer_userStickers',
                  'downloadsCount'),
              usesCount: BuiltValueNullFieldError.checkNotNull(
                  usesCount, r'GUserStickersData_viewer_userStickers', 'usesCount'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserStickersData_viewer_userStickers',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserStickersData_viewer_userStickers_image
    extends GUserStickersData_viewer_userStickers_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserStickersData_viewer_userStickers_image(
          [void Function(GUserStickersData_viewer_userStickers_imageBuilder)?
              updates]) =>
      (new GUserStickersData_viewer_userStickers_imageBuilder()
            ..update(updates))
          ._build();

  _$GUserStickersData_viewer_userStickers_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUserStickersData_viewer_userStickers_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserStickersData_viewer_userStickers_image', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GUserStickersData_viewer_userStickers_image', 'downloadURL');
  }

  @override
  GUserStickersData_viewer_userStickers_image rebuild(
          void Function(GUserStickersData_viewer_userStickers_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserStickersData_viewer_userStickers_imageBuilder toBuilder() =>
      new GUserStickersData_viewer_userStickers_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserStickersData_viewer_userStickers_image &&
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
            r'GUserStickersData_viewer_userStickers_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserStickersData_viewer_userStickers_imageBuilder
    implements
        Builder<GUserStickersData_viewer_userStickers_image,
            GUserStickersData_viewer_userStickers_imageBuilder> {
  _$GUserStickersData_viewer_userStickers_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserStickersData_viewer_userStickers_imageBuilder() {
    GUserStickersData_viewer_userStickers_image._initializeBuilder(this);
  }

  GUserStickersData_viewer_userStickers_imageBuilder get _$this {
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
  void replace(GUserStickersData_viewer_userStickers_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserStickersData_viewer_userStickers_image;
  }

  @override
  void update(
      void Function(GUserStickersData_viewer_userStickers_imageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserStickersData_viewer_userStickers_image build() => _build();

  _$GUserStickersData_viewer_userStickers_image _build() {
    final _$result = _$v ??
        new _$GUserStickersData_viewer_userStickers_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUserStickersData_viewer_userStickers_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserStickersData_viewer_userStickers_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GUserStickersData_viewer_userStickers_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
