// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStickerData> _$gStickerDataSerializer =
    new _$GStickerDataSerializer();
Serializer<GStickerData_sticker> _$gStickerDataStickerSerializer =
    new _$GStickerData_stickerSerializer();
Serializer<GStickerData_sticker_image> _$gStickerDataStickerImageSerializer =
    new _$GStickerData_sticker_imageSerializer();

class _$GStickerDataSerializer implements StructuredSerializer<GStickerData> {
  @override
  final Iterable<Type> types = const [GStickerData, _$GStickerData];
  @override
  final String wireName = 'GStickerData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GStickerData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.sticker;
    if (value != null) {
      result
        ..add('sticker')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GStickerData_sticker)));
    }
    return result;
  }

  @override
  GStickerData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickerDataBuilder();

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
        case 'sticker':
          result.sticker.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GStickerData_sticker))!
              as GStickerData_sticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GStickerData_stickerSerializer
    implements StructuredSerializer<GStickerData_sticker> {
  @override
  final Iterable<Type> types = const [
    GStickerData_sticker,
    _$GStickerData_sticker
  ];
  @override
  final String wireName = 'GStickerData_sticker';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GStickerData_sticker object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(GStickerData_sticker_image)),
      'downloadsCount',
      serializers.serialize(object.downloadsCount,
          specifiedType: const FullType(int)),
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
      'usesCount',
      serializers.serialize(object.usesCount,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GStickerData_sticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickerData_stickerBuilder();

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
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GStickerData_sticker_image))!
              as GStickerData_sticker_image);
          break;
        case 'downloadsCount':
          result.downloadsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
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

class _$GStickerData_sticker_imageSerializer
    implements StructuredSerializer<GStickerData_sticker_image> {
  @override
  final Iterable<Type> types = const [
    GStickerData_sticker_image,
    _$GStickerData_sticker_image
  ];
  @override
  final String wireName = 'GStickerData_sticker_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GStickerData_sticker_image object,
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
  GStickerData_sticker_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickerData_sticker_imageBuilder();

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

class _$GStickerData extends GStickerData {
  @override
  final String G__typename;
  @override
  final GStickerData_sticker? sticker;

  factory _$GStickerData([void Function(GStickerDataBuilder)? updates]) =>
      (new GStickerDataBuilder()..update(updates))._build();

  _$GStickerData._({required this.G__typename, this.sticker}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickerData', 'G__typename');
  }

  @override
  GStickerData rebuild(void Function(GStickerDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickerDataBuilder toBuilder() => new GStickerDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickerData &&
        G__typename == other.G__typename &&
        sticker == other.sticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, sticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStickerData')
          ..add('G__typename', G__typename)
          ..add('sticker', sticker))
        .toString();
  }
}

class GStickerDataBuilder
    implements Builder<GStickerData, GStickerDataBuilder> {
  _$GStickerData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GStickerData_stickerBuilder? _sticker;
  GStickerData_stickerBuilder get sticker =>
      _$this._sticker ??= new GStickerData_stickerBuilder();
  set sticker(GStickerData_stickerBuilder? sticker) =>
      _$this._sticker = sticker;

  GStickerDataBuilder() {
    GStickerData._initializeBuilder(this);
  }

  GStickerDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _sticker = $v.sticker?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStickerData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickerData;
  }

  @override
  void update(void Function(GStickerDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickerData build() => _build();

  _$GStickerData _build() {
    _$GStickerData _$result;
    try {
      _$result = _$v ??
          new _$GStickerData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GStickerData', 'G__typename'),
              sticker: _sticker?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sticker';
        _sticker?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GStickerData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GStickerData_sticker extends GStickerData_sticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String title;
  @override
  final GStickerData_sticker_image image;
  @override
  final int downloadsCount;
  @override
  final int likesCount;
  @override
  final int usesCount;

  factory _$GStickerData_sticker(
          [void Function(GStickerData_stickerBuilder)? updates]) =>
      (new GStickerData_stickerBuilder()..update(updates))._build();

  _$GStickerData_sticker._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      required this.title,
      required this.image,
      required this.downloadsCount,
      required this.likesCount,
      required this.usesCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickerData_sticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GStickerData_sticker', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GStickerData_sticker', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GStickerData_sticker', 'title');
    BuiltValueNullFieldError.checkNotNull(
        image, r'GStickerData_sticker', 'image');
    BuiltValueNullFieldError.checkNotNull(
        downloadsCount, r'GStickerData_sticker', 'downloadsCount');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GStickerData_sticker', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        usesCount, r'GStickerData_sticker', 'usesCount');
  }

  @override
  GStickerData_sticker rebuild(
          void Function(GStickerData_stickerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickerData_stickerBuilder toBuilder() =>
      new GStickerData_stickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickerData_sticker &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        title == other.title &&
        image == other.image &&
        downloadsCount == other.downloadsCount &&
        likesCount == other.likesCount &&
        usesCount == other.usesCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, downloadsCount.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, usesCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStickerData_sticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('title', title)
          ..add('image', image)
          ..add('downloadsCount', downloadsCount)
          ..add('likesCount', likesCount)
          ..add('usesCount', usesCount))
        .toString();
  }
}

class GStickerData_stickerBuilder
    implements Builder<GStickerData_sticker, GStickerData_stickerBuilder> {
  _$GStickerData_sticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GStickerData_sticker_imageBuilder? _image;
  GStickerData_sticker_imageBuilder get image =>
      _$this._image ??= new GStickerData_sticker_imageBuilder();
  set image(GStickerData_sticker_imageBuilder? image) => _$this._image = image;

  int? _downloadsCount;
  int? get downloadsCount => _$this._downloadsCount;
  set downloadsCount(int? downloadsCount) =>
      _$this._downloadsCount = downloadsCount;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _usesCount;
  int? get usesCount => _$this._usesCount;
  set usesCount(int? usesCount) => _$this._usesCount = usesCount;

  GStickerData_stickerBuilder() {
    GStickerData_sticker._initializeBuilder(this);
  }

  GStickerData_stickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _title = $v.title;
      _image = $v.image.toBuilder();
      _downloadsCount = $v.downloadsCount;
      _likesCount = $v.likesCount;
      _usesCount = $v.usesCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStickerData_sticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickerData_sticker;
  }

  @override
  void update(void Function(GStickerData_stickerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickerData_sticker build() => _build();

  _$GStickerData_sticker _build() {
    _$GStickerData_sticker _$result;
    try {
      _$result = _$v ??
          new _$GStickerData_sticker._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GStickerData_sticker', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GStickerData_sticker', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GStickerData_sticker', 'createdAt'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GStickerData_sticker', 'title'),
              image: image.build(),
              downloadsCount: BuiltValueNullFieldError.checkNotNull(
                  downloadsCount, r'GStickerData_sticker', 'downloadsCount'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GStickerData_sticker', 'likesCount'),
              usesCount: BuiltValueNullFieldError.checkNotNull(
                  usesCount, r'GStickerData_sticker', 'usesCount'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        image.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GStickerData_sticker', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GStickerData_sticker_image extends GStickerData_sticker_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GStickerData_sticker_image(
          [void Function(GStickerData_sticker_imageBuilder)? updates]) =>
      (new GStickerData_sticker_imageBuilder()..update(updates))._build();

  _$GStickerData_sticker_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickerData_sticker_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GStickerData_sticker_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GStickerData_sticker_image', 'downloadURL');
  }

  @override
  GStickerData_sticker_image rebuild(
          void Function(GStickerData_sticker_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickerData_sticker_imageBuilder toBuilder() =>
      new GStickerData_sticker_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickerData_sticker_image &&
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
    return (newBuiltValueToStringHelper(r'GStickerData_sticker_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GStickerData_sticker_imageBuilder
    implements
        Builder<GStickerData_sticker_image, GStickerData_sticker_imageBuilder> {
  _$GStickerData_sticker_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GStickerData_sticker_imageBuilder() {
    GStickerData_sticker_image._initializeBuilder(this);
  }

  GStickerData_sticker_imageBuilder get _$this {
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
  void replace(GStickerData_sticker_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickerData_sticker_image;
  }

  @override
  void update(void Function(GStickerData_sticker_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickerData_sticker_image build() => _build();

  _$GStickerData_sticker_image _build() {
    final _$result = _$v ??
        new _$GStickerData_sticker_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GStickerData_sticker_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GStickerData_sticker_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GStickerData_sticker_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
