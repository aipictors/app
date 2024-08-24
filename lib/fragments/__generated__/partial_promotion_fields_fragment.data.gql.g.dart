// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_promotion_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialPromotionFieldsData>
    _$gPartialPromotionFieldsDataSerializer =
    new _$GPartialPromotionFieldsDataSerializer();

class _$GPartialPromotionFieldsDataSerializer
    implements StructuredSerializer<GPartialPromotionFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialPromotionFieldsData,
    _$GPartialPromotionFieldsData
  ];
  @override
  final String wireName = 'GPartialPromotionFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialPromotionFieldsData object,
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
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'startDateTime',
      serializers.serialize(object.startDateTime,
          specifiedType: const FullType(int)),
      'endDateTime',
      serializers.serialize(object.endDateTime,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.imageURL;
    if (value != null) {
      result
        ..add('imageURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pageURL;
    if (value != null) {
      result
        ..add('pageURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPartialPromotionFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialPromotionFieldsDataBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'imageURL':
          result.imageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pageURL':
          result.pageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'startDateTime':
          result.startDateTime = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'endDateTime':
          result.endDateTime = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GPartialPromotionFieldsData extends GPartialPromotionFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String? imageURL;
  @override
  final String? pageURL;
  @override
  final int startDateTime;
  @override
  final int endDateTime;

  factory _$GPartialPromotionFieldsData(
          [void Function(GPartialPromotionFieldsDataBuilder)? updates]) =>
      (new GPartialPromotionFieldsDataBuilder()..update(updates))._build();

  _$GPartialPromotionFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description,
      this.imageURL,
      this.pageURL,
      required this.startDateTime,
      required this.endDateTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialPromotionFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialPromotionFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPartialPromotionFieldsData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GPartialPromotionFieldsData', 'description');
    BuiltValueNullFieldError.checkNotNull(
        startDateTime, r'GPartialPromotionFieldsData', 'startDateTime');
    BuiltValueNullFieldError.checkNotNull(
        endDateTime, r'GPartialPromotionFieldsData', 'endDateTime');
  }

  @override
  GPartialPromotionFieldsData rebuild(
          void Function(GPartialPromotionFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialPromotionFieldsDataBuilder toBuilder() =>
      new GPartialPromotionFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialPromotionFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        imageURL == other.imageURL &&
        pageURL == other.pageURL &&
        startDateTime == other.startDateTime &&
        endDateTime == other.endDateTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, imageURL.hashCode);
    _$hash = $jc(_$hash, pageURL.hashCode);
    _$hash = $jc(_$hash, startDateTime.hashCode);
    _$hash = $jc(_$hash, endDateTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPartialPromotionFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('imageURL', imageURL)
          ..add('pageURL', pageURL)
          ..add('startDateTime', startDateTime)
          ..add('endDateTime', endDateTime))
        .toString();
  }
}

class GPartialPromotionFieldsDataBuilder
    implements
        Builder<GPartialPromotionFieldsData,
            GPartialPromotionFieldsDataBuilder> {
  _$GPartialPromotionFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _imageURL;
  String? get imageURL => _$this._imageURL;
  set imageURL(String? imageURL) => _$this._imageURL = imageURL;

  String? _pageURL;
  String? get pageURL => _$this._pageURL;
  set pageURL(String? pageURL) => _$this._pageURL = pageURL;

  int? _startDateTime;
  int? get startDateTime => _$this._startDateTime;
  set startDateTime(int? startDateTime) =>
      _$this._startDateTime = startDateTime;

  int? _endDateTime;
  int? get endDateTime => _$this._endDateTime;
  set endDateTime(int? endDateTime) => _$this._endDateTime = endDateTime;

  GPartialPromotionFieldsDataBuilder() {
    GPartialPromotionFieldsData._initializeBuilder(this);
  }

  GPartialPromotionFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _imageURL = $v.imageURL;
      _pageURL = $v.pageURL;
      _startDateTime = $v.startDateTime;
      _endDateTime = $v.endDateTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPartialPromotionFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialPromotionFieldsData;
  }

  @override
  void update(void Function(GPartialPromotionFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialPromotionFieldsData build() => _build();

  _$GPartialPromotionFieldsData _build() {
    final _$result = _$v ??
        new _$GPartialPromotionFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPartialPromotionFieldsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialPromotionFieldsData', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GPartialPromotionFieldsData', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GPartialPromotionFieldsData', 'description'),
            imageURL: imageURL,
            pageURL: pageURL,
            startDateTime: BuiltValueNullFieldError.checkNotNull(
                startDateTime, r'GPartialPromotionFieldsData', 'startDateTime'),
            endDateTime: BuiltValueNullFieldError.checkNotNull(
                endDateTime, r'GPartialPromotionFieldsData', 'endDateTime'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
