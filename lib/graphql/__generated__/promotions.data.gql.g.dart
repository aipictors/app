// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotions.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPromotionsData> _$gPromotionsDataSerializer =
    new _$GPromotionsDataSerializer();
Serializer<GPromotionsData_promotions> _$gPromotionsDataPromotionsSerializer =
    new _$GPromotionsData_promotionsSerializer();

class _$GPromotionsDataSerializer
    implements StructuredSerializer<GPromotionsData> {
  @override
  final Iterable<Type> types = const [GPromotionsData, _$GPromotionsData];
  @override
  final String wireName = 'GPromotionsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPromotionsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'promotions',
      serializers.serialize(object.promotions,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GPromotionsData_promotions)])),
    ];

    return result;
  }

  @override
  GPromotionsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPromotionsDataBuilder();

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
        case 'promotions':
          result.promotions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPromotionsData_promotions)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPromotionsData_promotionsSerializer
    implements StructuredSerializer<GPromotionsData_promotions> {
  @override
  final Iterable<Type> types = const [
    GPromotionsData_promotions,
    _$GPromotionsData_promotions
  ];
  @override
  final String wireName = 'GPromotionsData_promotions';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPromotionsData_promotions object,
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
  GPromotionsData_promotions deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPromotionsData_promotionsBuilder();

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

class _$GPromotionsData extends GPromotionsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GPromotionsData_promotions> promotions;

  factory _$GPromotionsData([void Function(GPromotionsDataBuilder)? updates]) =>
      (new GPromotionsDataBuilder()..update(updates))._build();

  _$GPromotionsData._({required this.G__typename, required this.promotions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPromotionsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        promotions, r'GPromotionsData', 'promotions');
  }

  @override
  GPromotionsData rebuild(void Function(GPromotionsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPromotionsDataBuilder toBuilder() =>
      new GPromotionsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPromotionsData &&
        G__typename == other.G__typename &&
        promotions == other.promotions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, promotions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPromotionsData')
          ..add('G__typename', G__typename)
          ..add('promotions', promotions))
        .toString();
  }
}

class GPromotionsDataBuilder
    implements Builder<GPromotionsData, GPromotionsDataBuilder> {
  _$GPromotionsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GPromotionsData_promotions>? _promotions;
  ListBuilder<GPromotionsData_promotions> get promotions =>
      _$this._promotions ??= new ListBuilder<GPromotionsData_promotions>();
  set promotions(ListBuilder<GPromotionsData_promotions>? promotions) =>
      _$this._promotions = promotions;

  GPromotionsDataBuilder() {
    GPromotionsData._initializeBuilder(this);
  }

  GPromotionsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _promotions = $v.promotions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPromotionsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPromotionsData;
  }

  @override
  void update(void Function(GPromotionsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPromotionsData build() => _build();

  _$GPromotionsData _build() {
    _$GPromotionsData _$result;
    try {
      _$result = _$v ??
          new _$GPromotionsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPromotionsData', 'G__typename'),
              promotions: promotions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'promotions';
        promotions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPromotionsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPromotionsData_promotions extends GPromotionsData_promotions {
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

  factory _$GPromotionsData_promotions(
          [void Function(GPromotionsData_promotionsBuilder)? updates]) =>
      (new GPromotionsData_promotionsBuilder()..update(updates))._build();

  _$GPromotionsData_promotions._(
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
        G__typename, r'GPromotionsData_promotions', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPromotionsData_promotions', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPromotionsData_promotions', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GPromotionsData_promotions', 'description');
    BuiltValueNullFieldError.checkNotNull(
        startDateTime, r'GPromotionsData_promotions', 'startDateTime');
    BuiltValueNullFieldError.checkNotNull(
        endDateTime, r'GPromotionsData_promotions', 'endDateTime');
  }

  @override
  GPromotionsData_promotions rebuild(
          void Function(GPromotionsData_promotionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPromotionsData_promotionsBuilder toBuilder() =>
      new GPromotionsData_promotionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPromotionsData_promotions &&
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
    return (newBuiltValueToStringHelper(r'GPromotionsData_promotions')
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

class GPromotionsData_promotionsBuilder
    implements
        Builder<GPromotionsData_promotions, GPromotionsData_promotionsBuilder> {
  _$GPromotionsData_promotions? _$v;

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

  GPromotionsData_promotionsBuilder() {
    GPromotionsData_promotions._initializeBuilder(this);
  }

  GPromotionsData_promotionsBuilder get _$this {
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
  void replace(GPromotionsData_promotions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPromotionsData_promotions;
  }

  @override
  void update(void Function(GPromotionsData_promotionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPromotionsData_promotions build() => _build();

  _$GPromotionsData_promotions _build() {
    final _$result = _$v ??
        new _$GPromotionsData_promotions._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPromotionsData_promotions', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPromotionsData_promotions', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GPromotionsData_promotions', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GPromotionsData_promotions', 'description'),
            imageURL: imageURL,
            pageURL: pageURL,
            startDateTime: BuiltValueNullFieldError.checkNotNull(
                startDateTime, r'GPromotionsData_promotions', 'startDateTime'),
            endDateTime: BuiltValueNullFieldError.checkNotNull(
                endDateTime, r'GPromotionsData_promotions', 'endDateTime'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
