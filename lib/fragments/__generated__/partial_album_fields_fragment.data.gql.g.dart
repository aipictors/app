// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_album_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialAlbumFieldsData> _$gPartialAlbumFieldsDataSerializer =
    new _$GPartialAlbumFieldsDataSerializer();

class _$GPartialAlbumFieldsDataSerializer
    implements StructuredSerializer<GPartialAlbumFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialAlbumFieldsData,
    _$GPartialAlbumFieldsData
  ];
  @override
  final String wireName = 'GPartialAlbumFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialAlbumFieldsData object,
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
  GPartialAlbumFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialAlbumFieldsDataBuilder();

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

class _$GPartialAlbumFieldsData extends GPartialAlbumFieldsData {
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

  factory _$GPartialAlbumFieldsData(
          [void Function(GPartialAlbumFieldsDataBuilder)? updates]) =>
      (new GPartialAlbumFieldsDataBuilder()..update(updates))._build();

  _$GPartialAlbumFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.isSensitive,
      required this.likesCount,
      required this.viewsCount,
      this.thumbnailImageURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialAlbumFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GPartialAlbumFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPartialAlbumFieldsData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        isSensitive, r'GPartialAlbumFieldsData', 'isSensitive');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GPartialAlbumFieldsData', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GPartialAlbumFieldsData', 'viewsCount');
  }

  @override
  GPartialAlbumFieldsData rebuild(
          void Function(GPartialAlbumFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialAlbumFieldsDataBuilder toBuilder() =>
      new GPartialAlbumFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialAlbumFieldsData &&
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
    return (newBuiltValueToStringHelper(r'GPartialAlbumFieldsData')
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

class GPartialAlbumFieldsDataBuilder
    implements
        Builder<GPartialAlbumFieldsData, GPartialAlbumFieldsDataBuilder> {
  _$GPartialAlbumFieldsData? _$v;

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

  GPartialAlbumFieldsDataBuilder() {
    GPartialAlbumFieldsData._initializeBuilder(this);
  }

  GPartialAlbumFieldsDataBuilder get _$this {
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
  void replace(GPartialAlbumFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialAlbumFieldsData;
  }

  @override
  void update(void Function(GPartialAlbumFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialAlbumFieldsData build() => _build();

  _$GPartialAlbumFieldsData _build() {
    final _$result = _$v ??
        new _$GPartialAlbumFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPartialAlbumFieldsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialAlbumFieldsData', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GPartialAlbumFieldsData', 'title'),
            isSensitive: BuiltValueNullFieldError.checkNotNull(
                isSensitive, r'GPartialAlbumFieldsData', 'isSensitive'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GPartialAlbumFieldsData', 'likesCount'),
            viewsCount: BuiltValueNullFieldError.checkNotNull(
                viewsCount, r'GPartialAlbumFieldsData', 'viewsCount'),
            thumbnailImageURL: thumbnailImageURL);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
