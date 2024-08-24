// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_feed_work_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialFeedWorkFieldsData> _$gPartialFeedWorkFieldsDataSerializer =
    new _$GPartialFeedWorkFieldsDataSerializer();

class _$GPartialFeedWorkFieldsDataSerializer
    implements StructuredSerializer<GPartialFeedWorkFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialFeedWorkFieldsData,
    _$GPartialFeedWorkFieldsData
  ];
  @override
  final String wireName = 'GPartialFeedWorkFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialFeedWorkFieldsData object,
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
    ];

    return result;
  }

  @override
  GPartialFeedWorkFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialFeedWorkFieldsDataBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GPartialFeedWorkFieldsData extends GPartialFeedWorkFieldsData {
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

  factory _$GPartialFeedWorkFieldsData(
          [void Function(GPartialFeedWorkFieldsDataBuilder)? updates]) =>
      (new GPartialFeedWorkFieldsDataBuilder()..update(updates))._build();

  _$GPartialFeedWorkFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      required this.imageAspectRatio,
      required this.imageURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialFeedWorkFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialFeedWorkFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPartialFeedWorkFieldsData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GPartialFeedWorkFieldsData', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GPartialFeedWorkFieldsData', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GPartialFeedWorkFieldsData', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageAspectRatio, r'GPartialFeedWorkFieldsData', 'imageAspectRatio');
    BuiltValueNullFieldError.checkNotNull(
        imageURL, r'GPartialFeedWorkFieldsData', 'imageURL');
  }

  @override
  GPartialFeedWorkFieldsData rebuild(
          void Function(GPartialFeedWorkFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialFeedWorkFieldsDataBuilder toBuilder() =>
      new GPartialFeedWorkFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialFeedWorkFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        imageAspectRatio == other.imageAspectRatio &&
        imageURL == other.imageURL;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPartialFeedWorkFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('imageAspectRatio', imageAspectRatio)
          ..add('imageURL', imageURL))
        .toString();
  }
}

class GPartialFeedWorkFieldsDataBuilder
    implements
        Builder<GPartialFeedWorkFieldsData, GPartialFeedWorkFieldsDataBuilder> {
  _$GPartialFeedWorkFieldsData? _$v;

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

  GPartialFeedWorkFieldsDataBuilder() {
    GPartialFeedWorkFieldsData._initializeBuilder(this);
  }

  GPartialFeedWorkFieldsDataBuilder get _$this {
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
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPartialFeedWorkFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialFeedWorkFieldsData;
  }

  @override
  void update(void Function(GPartialFeedWorkFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialFeedWorkFieldsData build() => _build();

  _$GPartialFeedWorkFieldsData _build() {
    final _$result = _$v ??
        new _$GPartialFeedWorkFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPartialFeedWorkFieldsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialFeedWorkFieldsData', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GPartialFeedWorkFieldsData', 'title'),
            likesCount: BuiltValueNullFieldError.checkNotNull(
                likesCount, r'GPartialFeedWorkFieldsData', 'likesCount'),
            commentsCount: BuiltValueNullFieldError.checkNotNull(
                commentsCount, r'GPartialFeedWorkFieldsData', 'commentsCount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'GPartialFeedWorkFieldsData', 'createdAt'),
            imageAspectRatio: BuiltValueNullFieldError.checkNotNull(
                imageAspectRatio, r'GPartialFeedWorkFieldsData', 'imageAspectRatio'),
            imageURL: BuiltValueNullFieldError.checkNotNull(
                imageURL, r'GPartialFeedWorkFieldsData', 'imageURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
