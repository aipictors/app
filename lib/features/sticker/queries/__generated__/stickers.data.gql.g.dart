// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stickers.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStickersData> _$gStickersDataSerializer =
    new _$GStickersDataSerializer();
Serializer<GStickersData_stickers> _$gStickersDataStickersSerializer =
    new _$GStickersData_stickersSerializer();

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
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('imageUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
  final String? imageUrl;
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
      this.imageUrl,
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
        imageUrl == other.imageUrl &&
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
    _$hash = $jc(_$hash, imageUrl.hashCode);
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
          ..add('imageUrl', imageUrl)
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

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

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
      _imageUrl = $v.imageUrl;
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
    final _$result = _$v ??
        new _$GStickersData_stickers._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GStickersData_stickers', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GStickersData_stickers', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GStickersData_stickers', 'title'),
            imageUrl: imageUrl,
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GStickersData_stickers', 'likesCount'),
            downloadsCount: BuiltValueNullFieldError.checkNotNull(
                downloadsCount, r'GStickersData_stickers', 'downloadsCount'),
            usesCount: BuiltValueNullFieldError.checkNotNull(
                usesCount, r'GStickersData_stickers', 'usesCount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
