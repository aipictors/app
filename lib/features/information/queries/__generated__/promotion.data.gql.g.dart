// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPromotionData> _$gPromotionDataSerializer =
    new _$GPromotionDataSerializer();
Serializer<GPromotionData_promotion> _$gPromotionDataPromotionSerializer =
    new _$GPromotionData_promotionSerializer();

class _$GPromotionDataSerializer
    implements StructuredSerializer<GPromotionData> {
  @override
  final Iterable<Type> types = const [GPromotionData, _$GPromotionData];
  @override
  final String wireName = 'GPromotionData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPromotionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.promotion;
    if (value != null) {
      result
        ..add('promotion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPromotionData_promotion)));
    }
    return result;
  }

  @override
  GPromotionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPromotionDataBuilder();

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
        case 'promotion':
          result.promotion.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPromotionData_promotion))!
              as GPromotionData_promotion);
          break;
      }
    }

    return result.build();
  }
}

class _$GPromotionData_promotionSerializer
    implements StructuredSerializer<GPromotionData_promotion> {
  @override
  final Iterable<Type> types = const [
    GPromotionData_promotion,
    _$GPromotionData_promotion
  ];
  @override
  final String wireName = 'GPromotionData_promotion';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPromotionData_promotion object,
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
  GPromotionData_promotion deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPromotionData_promotionBuilder();

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

class _$GPromotionData extends GPromotionData {
  @override
  final String G__typename;
  @override
  final GPromotionData_promotion? promotion;

  factory _$GPromotionData([void Function(GPromotionDataBuilder)? updates]) =>
      (new GPromotionDataBuilder()..update(updates))._build();

  _$GPromotionData._({required this.G__typename, this.promotion}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPromotionData', 'G__typename');
  }

  @override
  GPromotionData rebuild(void Function(GPromotionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPromotionDataBuilder toBuilder() =>
      new GPromotionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPromotionData &&
        G__typename == other.G__typename &&
        promotion == other.promotion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, promotion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPromotionData')
          ..add('G__typename', G__typename)
          ..add('promotion', promotion))
        .toString();
  }
}

class GPromotionDataBuilder
    implements Builder<GPromotionData, GPromotionDataBuilder> {
  _$GPromotionData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPromotionData_promotionBuilder? _promotion;
  GPromotionData_promotionBuilder get promotion =>
      _$this._promotion ??= new GPromotionData_promotionBuilder();
  set promotion(GPromotionData_promotionBuilder? promotion) =>
      _$this._promotion = promotion;

  GPromotionDataBuilder() {
    GPromotionData._initializeBuilder(this);
  }

  GPromotionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _promotion = $v.promotion?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPromotionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPromotionData;
  }

  @override
  void update(void Function(GPromotionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPromotionData build() => _build();

  _$GPromotionData _build() {
    _$GPromotionData _$result;
    try {
      _$result = _$v ??
          new _$GPromotionData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPromotionData', 'G__typename'),
              promotion: _promotion?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'promotion';
        _promotion?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPromotionData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPromotionData_promotion extends GPromotionData_promotion {
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

  factory _$GPromotionData_promotion(
          [void Function(GPromotionData_promotionBuilder)? updates]) =>
      (new GPromotionData_promotionBuilder()..update(updates))._build();

  _$GPromotionData_promotion._(
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
        G__typename, r'GPromotionData_promotion', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPromotionData_promotion', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPromotionData_promotion', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GPromotionData_promotion', 'description');
    BuiltValueNullFieldError.checkNotNull(
        startDateTime, r'GPromotionData_promotion', 'startDateTime');
    BuiltValueNullFieldError.checkNotNull(
        endDateTime, r'GPromotionData_promotion', 'endDateTime');
  }

  @override
  GPromotionData_promotion rebuild(
          void Function(GPromotionData_promotionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPromotionData_promotionBuilder toBuilder() =>
      new GPromotionData_promotionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPromotionData_promotion &&
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
    return (newBuiltValueToStringHelper(r'GPromotionData_promotion')
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

class GPromotionData_promotionBuilder
    implements
        Builder<GPromotionData_promotion, GPromotionData_promotionBuilder> {
  _$GPromotionData_promotion? _$v;

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

  GPromotionData_promotionBuilder() {
    GPromotionData_promotion._initializeBuilder(this);
  }

  GPromotionData_promotionBuilder get _$this {
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
  void replace(GPromotionData_promotion other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPromotionData_promotion;
  }

  @override
  void update(void Function(GPromotionData_promotionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPromotionData_promotion build() => _build();

  _$GPromotionData_promotion _build() {
    final _$result = _$v ??
        new _$GPromotionData_promotion._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPromotionData_promotion', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPromotionData_promotion', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GPromotionData_promotion', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GPromotionData_promotion', 'description'),
            imageURL: imageURL,
            pageURL: pageURL,
            startDateTime: BuiltValueNullFieldError.checkNotNull(
                startDateTime, r'GPromotionData_promotion', 'startDateTime'),
            endDateTime: BuiltValueNullFieldError.checkNotNull(
                endDateTime, r'GPromotionData_promotion', 'endDateTime'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
