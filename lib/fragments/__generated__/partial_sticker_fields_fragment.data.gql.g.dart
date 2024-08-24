// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_sticker_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialStickerFieldsData> _$gPartialStickerFieldsDataSerializer =
    new _$GPartialStickerFieldsDataSerializer();

class _$GPartialStickerFieldsDataSerializer
    implements StructuredSerializer<GPartialStickerFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialStickerFieldsData,
    _$GPartialStickerFieldsData
  ];
  @override
  final String wireName = 'GPartialStickerFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialStickerFieldsData object,
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
  GPartialStickerFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialStickerFieldsDataBuilder();

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

class _$GPartialStickerFieldsData extends GPartialStickerFieldsData {
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

  factory _$GPartialStickerFieldsData(
          [void Function(GPartialStickerFieldsDataBuilder)? updates]) =>
      (new GPartialStickerFieldsDataBuilder()..update(updates))._build();

  _$GPartialStickerFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.imageUrl,
      required this.likesCount,
      required this.downloadsCount,
      required this.usesCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialStickerFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialStickerFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPartialStickerFieldsData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GPartialStickerFieldsData', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        downloadsCount, r'GPartialStickerFieldsData', 'downloadsCount');
    BuiltValueNullFieldError.checkNotNull(
        usesCount, r'GPartialStickerFieldsData', 'usesCount');
  }

  @override
  GPartialStickerFieldsData rebuild(
          void Function(GPartialStickerFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialStickerFieldsDataBuilder toBuilder() =>
      new GPartialStickerFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialStickerFieldsData &&
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
    return (newBuiltValueToStringHelper(r'GPartialStickerFieldsData')
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

class GPartialStickerFieldsDataBuilder
    implements
        Builder<GPartialStickerFieldsData, GPartialStickerFieldsDataBuilder> {
  _$GPartialStickerFieldsData? _$v;

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

  GPartialStickerFieldsDataBuilder() {
    GPartialStickerFieldsData._initializeBuilder(this);
  }

  GPartialStickerFieldsDataBuilder get _$this {
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
  void replace(GPartialStickerFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialStickerFieldsData;
  }

  @override
  void update(void Function(GPartialStickerFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialStickerFieldsData build() => _build();

  _$GPartialStickerFieldsData _build() {
    final _$result = _$v ??
        new _$GPartialStickerFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPartialStickerFieldsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialStickerFieldsData', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GPartialStickerFieldsData', 'title'),
            imageUrl: imageUrl,
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GPartialStickerFieldsData', 'likesCount'),
            downloadsCount: BuiltValueNullFieldError.checkNotNull(
                downloadsCount, r'GPartialStickerFieldsData', 'downloadsCount'),
            usesCount: BuiltValueNullFieldError.checkNotNull(
                usesCount, r'GPartialStickerFieldsData', 'usesCount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
