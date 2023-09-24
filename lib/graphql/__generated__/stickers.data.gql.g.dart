// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stickers.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStickersData> _$gStickersDataSerializer =
    new _$GStickersDataSerializer();
Serializer<GStickersData_stickers> _$gStickersDataStickersSerializer =
    new _$GStickersData_stickersSerializer();
Serializer<GStickersData_stickers_image>
    _$gStickersDataStickersImageSerializer =
    new _$GStickersData_stickers_imageSerializer();

class _$GStickersDataSerializer implements StructuredSerializer<GStickersData> {
  @override
  final Iterable<Type> types = const [GStickersData, _$GStickersData];
  @override
  final String wireName = 'GStickersData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GStickersData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'stickers',
      serializers.serialize(object.stickers,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GStickersData_stickers)])),
    ];

    return result;
  }

  @override
  GStickersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickersDataBuilder();

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
        case 'stickers':
          result.stickers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GStickersData_stickers)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GStickersData_stickersSerializer
    implements StructuredSerializer<GStickersData_stickers> {
  @override
  final Iterable<Type> types = const [
    GStickersData_stickers,
    _$GStickersData_stickers
  ];
  @override
  final String wireName = 'GStickersData_stickers';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GStickersData_stickers object,
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
            specifiedType: const FullType(GStickersData_stickers_image)));
    }
    return result;
  }

  @override
  GStickersData_stickers deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickersData_stickersBuilder();

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
                  specifiedType: const FullType(GStickersData_stickers_image))!
              as GStickersData_stickers_image);
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

class _$GStickersData_stickers_imageSerializer
    implements StructuredSerializer<GStickersData_stickers_image> {
  @override
  final Iterable<Type> types = const [
    GStickersData_stickers_image,
    _$GStickersData_stickers_image
  ];
  @override
  final String wireName = 'GStickersData_stickers_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GStickersData_stickers_image object,
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
  GStickersData_stickers_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickersData_stickers_imageBuilder();

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

class _$GStickersData extends GStickersData {
  @override
  final String G__typename;
  @override
  final BuiltList<GStickersData_stickers> stickers;

  factory _$GStickersData([void Function(GStickersDataBuilder)? updates]) =>
      (new GStickersDataBuilder()..update(updates))._build();

  _$GStickersData._({required this.G__typename, required this.stickers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickersData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        stickers, r'GStickersData', 'stickers');
  }

  @override
  GStickersData rebuild(void Function(GStickersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickersDataBuilder toBuilder() => new GStickersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickersData &&
        G__typename == other.G__typename &&
        stickers == other.stickers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, stickers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStickersData')
          ..add('G__typename', G__typename)
          ..add('stickers', stickers))
        .toString();
  }
}

class GStickersDataBuilder
    implements Builder<GStickersData, GStickersDataBuilder> {
  _$GStickersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GStickersData_stickers>? _stickers;
  ListBuilder<GStickersData_stickers> get stickers =>
      _$this._stickers ??= new ListBuilder<GStickersData_stickers>();
  set stickers(ListBuilder<GStickersData_stickers>? stickers) =>
      _$this._stickers = stickers;

  GStickersDataBuilder() {
    GStickersData._initializeBuilder(this);
  }

  GStickersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _stickers = $v.stickers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStickersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickersData;
  }

  @override
  void update(void Function(GStickersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickersData build() => _build();

  _$GStickersData _build() {
    _$GStickersData _$result;
    try {
      _$result = _$v ??
          new _$GStickersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GStickersData', 'G__typename'),
              stickers: stickers.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stickers';
        stickers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GStickersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GStickersData_stickers extends GStickersData_stickers {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GStickersData_stickers_image? image;
  @override
  final int likesCount;
  @override
  final int downloadsCount;
  @override
  final int usesCount;

  factory _$GStickersData_stickers(
          [void Function(GStickersData_stickersBuilder)? updates]) =>
      (new GStickersData_stickersBuilder()..update(updates))._build();

  _$GStickersData_stickers._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.image,
      required this.likesCount,
      required this.downloadsCount,
      required this.usesCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickersData_stickers', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GStickersData_stickers', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GStickersData_stickers', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GStickersData_stickers', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        downloadsCount, r'GStickersData_stickers', 'downloadsCount');
    BuiltValueNullFieldError.checkNotNull(
        usesCount, r'GStickersData_stickers', 'usesCount');
  }

  @override
  GStickersData_stickers rebuild(
          void Function(GStickersData_stickersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickersData_stickersBuilder toBuilder() =>
      new GStickersData_stickersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickersData_stickers &&
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
    return (newBuiltValueToStringHelper(r'GStickersData_stickers')
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

class GStickersData_stickersBuilder
    implements Builder<GStickersData_stickers, GStickersData_stickersBuilder> {
  _$GStickersData_stickers? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GStickersData_stickers_imageBuilder? _image;
  GStickersData_stickers_imageBuilder get image =>
      _$this._image ??= new GStickersData_stickers_imageBuilder();
  set image(GStickersData_stickers_imageBuilder? image) =>
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

  GStickersData_stickersBuilder() {
    GStickersData_stickers._initializeBuilder(this);
  }

  GStickersData_stickersBuilder get _$this {
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
  void replace(GStickersData_stickers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickersData_stickers;
  }

  @override
  void update(void Function(GStickersData_stickersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickersData_stickers build() => _build();

  _$GStickersData_stickers _build() {
    _$GStickersData_stickers _$result;
    try {
      _$result = _$v ??
          new _$GStickersData_stickers._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GStickersData_stickers', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GStickersData_stickers', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GStickersData_stickers', 'title'),
              image: _image?.build(),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GStickersData_stickers', 'likesCount'),
              downloadsCount: BuiltValueNullFieldError.checkNotNull(
                  downloadsCount, r'GStickersData_stickers', 'downloadsCount'),
              usesCount: BuiltValueNullFieldError.checkNotNull(
                  usesCount, r'GStickersData_stickers', 'usesCount'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GStickersData_stickers', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GStickersData_stickers_image extends GStickersData_stickers_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GStickersData_stickers_image(
          [void Function(GStickersData_stickers_imageBuilder)? updates]) =>
      (new GStickersData_stickers_imageBuilder()..update(updates))._build();

  _$GStickersData_stickers_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickersData_stickers_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GStickersData_stickers_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GStickersData_stickers_image', 'downloadURL');
  }

  @override
  GStickersData_stickers_image rebuild(
          void Function(GStickersData_stickers_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickersData_stickers_imageBuilder toBuilder() =>
      new GStickersData_stickers_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickersData_stickers_image &&
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
    return (newBuiltValueToStringHelper(r'GStickersData_stickers_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GStickersData_stickers_imageBuilder
    implements
        Builder<GStickersData_stickers_image,
            GStickersData_stickers_imageBuilder> {
  _$GStickersData_stickers_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GStickersData_stickers_imageBuilder() {
    GStickersData_stickers_image._initializeBuilder(this);
  }

  GStickersData_stickers_imageBuilder get _$this {
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
  void replace(GStickersData_stickers_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickersData_stickers_image;
  }

  @override
  void update(void Function(GStickersData_stickers_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickersData_stickers_image build() => _build();

  _$GStickersData_stickers_image _build() {
    final _$result = _$v ??
        new _$GStickersData_stickers_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GStickersData_stickers_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GStickersData_stickers_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GStickersData_stickers_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
