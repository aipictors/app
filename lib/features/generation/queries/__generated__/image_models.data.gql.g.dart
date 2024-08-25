// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_models.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GImageModelsData> _$gImageModelsDataSerializer =
    new _$GImageModelsDataSerializer();
Serializer<GImageModelsData_imageModels>
    _$gImageModelsDataImageModelsSerializer =
    new _$GImageModelsData_imageModelsSerializer();

class _$GImageModelsDataSerializer
    implements StructuredSerializer<GImageModelsData> {
  @override
  final Iterable<Type> types = const [GImageModelsData, _$GImageModelsData];
  @override
  final String wireName = 'GImageModelsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GImageModelsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'imageModels',
      serializers.serialize(object.imageModels,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GImageModelsData_imageModels)])),
    ];

    return result;
  }

  @override
  GImageModelsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GImageModelsDataBuilder();

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
        case 'imageModels':
          result.imageModels.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GImageModelsData_imageModels)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GImageModelsData_imageModelsSerializer
    implements StructuredSerializer<GImageModelsData_imageModels> {
  @override
  final Iterable<Type> types = const [
    GImageModelsData_imageModels,
    _$GImageModelsData_imageModels
  ];
  @override
  final String wireName = 'GImageModelsData_imageModels';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GImageModelsData_imageModels object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(_i2.GImageModelCategory)),
      'prompts',
      serializers.serialize(object.prompts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'slug',
      serializers.serialize(object.slug, specifiedType: const FullType(String)),
      'style',
      serializers.serialize(object.style,
          specifiedType: const FullType(_i2.GImageStyle)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.license;
    if (value != null) {
      result
        ..add('license')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
  GImageModelsData_imageModels deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GImageModelsData_imageModelsBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GImageModelCategory))!
              as _i2.GImageModelCategory;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'license':
          result.license = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prompts':
          result.prompts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'slug':
          result.slug = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'style':
          result.style = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GImageStyle))!
              as _i2.GImageStyle;
          break;
        case 'thumbnailImageURL':
          result.thumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GImageModelsData extends GImageModelsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GImageModelsData_imageModels> imageModels;

  factory _$GImageModelsData(
          [void Function(GImageModelsDataBuilder)? updates]) =>
      (new GImageModelsDataBuilder()..update(updates))._build();

  _$GImageModelsData._({required this.G__typename, required this.imageModels})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GImageModelsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        imageModels, r'GImageModelsData', 'imageModels');
  }

  @override
  GImageModelsData rebuild(void Function(GImageModelsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GImageModelsDataBuilder toBuilder() =>
      new GImageModelsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GImageModelsData &&
        G__typename == other.G__typename &&
        imageModels == other.imageModels;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, imageModels.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GImageModelsData')
          ..add('G__typename', G__typename)
          ..add('imageModels', imageModels))
        .toString();
  }
}

class GImageModelsDataBuilder
    implements Builder<GImageModelsData, GImageModelsDataBuilder> {
  _$GImageModelsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GImageModelsData_imageModels>? _imageModels;
  ListBuilder<GImageModelsData_imageModels> get imageModels =>
      _$this._imageModels ??= new ListBuilder<GImageModelsData_imageModels>();
  set imageModels(ListBuilder<GImageModelsData_imageModels>? imageModels) =>
      _$this._imageModels = imageModels;

  GImageModelsDataBuilder() {
    GImageModelsData._initializeBuilder(this);
  }

  GImageModelsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _imageModels = $v.imageModels.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GImageModelsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GImageModelsData;
  }

  @override
  void update(void Function(GImageModelsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GImageModelsData build() => _build();

  _$GImageModelsData _build() {
    _$GImageModelsData _$result;
    try {
      _$result = _$v ??
          new _$GImageModelsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GImageModelsData', 'G__typename'),
              imageModels: imageModels.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'imageModels';
        imageModels.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GImageModelsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GImageModelsData_imageModels extends GImageModelsData_imageModels {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String displayName;
  @override
  final _i2.GImageModelCategory category;
  @override
  final String? description;
  @override
  final String? license;
  @override
  final BuiltList<String> prompts;
  @override
  final String slug;
  @override
  final _i2.GImageStyle style;
  @override
  final String? thumbnailImageURL;
  @override
  final String type;

  factory _$GImageModelsData_imageModels(
          [void Function(GImageModelsData_imageModelsBuilder)? updates]) =>
      (new GImageModelsData_imageModelsBuilder()..update(updates))._build();

  _$GImageModelsData_imageModels._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.displayName,
      required this.category,
      this.description,
      this.license,
      required this.prompts,
      required this.slug,
      required this.style,
      this.thumbnailImageURL,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GImageModelsData_imageModels', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GImageModelsData_imageModels', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GImageModelsData_imageModels', 'name');
    BuiltValueNullFieldError.checkNotNull(
        displayName, r'GImageModelsData_imageModels', 'displayName');
    BuiltValueNullFieldError.checkNotNull(
        category, r'GImageModelsData_imageModels', 'category');
    BuiltValueNullFieldError.checkNotNull(
        prompts, r'GImageModelsData_imageModels', 'prompts');
    BuiltValueNullFieldError.checkNotNull(
        slug, r'GImageModelsData_imageModels', 'slug');
    BuiltValueNullFieldError.checkNotNull(
        style, r'GImageModelsData_imageModels', 'style');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GImageModelsData_imageModels', 'type');
  }

  @override
  GImageModelsData_imageModels rebuild(
          void Function(GImageModelsData_imageModelsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GImageModelsData_imageModelsBuilder toBuilder() =>
      new GImageModelsData_imageModelsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GImageModelsData_imageModels &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        displayName == other.displayName &&
        category == other.category &&
        description == other.description &&
        license == other.license &&
        prompts == other.prompts &&
        slug == other.slug &&
        style == other.style &&
        thumbnailImageURL == other.thumbnailImageURL &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, license.hashCode);
    _$hash = $jc(_$hash, prompts.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, style.hashCode);
    _$hash = $jc(_$hash, thumbnailImageURL.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GImageModelsData_imageModels')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('category', category)
          ..add('description', description)
          ..add('license', license)
          ..add('prompts', prompts)
          ..add('slug', slug)
          ..add('style', style)
          ..add('thumbnailImageURL', thumbnailImageURL)
          ..add('type', type))
        .toString();
  }
}

class GImageModelsData_imageModelsBuilder
    implements
        Builder<GImageModelsData_imageModels,
            GImageModelsData_imageModelsBuilder> {
  _$GImageModelsData_imageModels? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  _i2.GImageModelCategory? _category;
  _i2.GImageModelCategory? get category => _$this._category;
  set category(_i2.GImageModelCategory? category) =>
      _$this._category = category;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _license;
  String? get license => _$this._license;
  set license(String? license) => _$this._license = license;

  ListBuilder<String>? _prompts;
  ListBuilder<String> get prompts =>
      _$this._prompts ??= new ListBuilder<String>();
  set prompts(ListBuilder<String>? prompts) => _$this._prompts = prompts;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  _i2.GImageStyle? _style;
  _i2.GImageStyle? get style => _$this._style;
  set style(_i2.GImageStyle? style) => _$this._style = style;

  String? _thumbnailImageURL;
  String? get thumbnailImageURL => _$this._thumbnailImageURL;
  set thumbnailImageURL(String? thumbnailImageURL) =>
      _$this._thumbnailImageURL = thumbnailImageURL;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GImageModelsData_imageModelsBuilder() {
    GImageModelsData_imageModels._initializeBuilder(this);
  }

  GImageModelsData_imageModelsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _displayName = $v.displayName;
      _category = $v.category;
      _description = $v.description;
      _license = $v.license;
      _prompts = $v.prompts.toBuilder();
      _slug = $v.slug;
      _style = $v.style;
      _thumbnailImageURL = $v.thumbnailImageURL;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GImageModelsData_imageModels other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GImageModelsData_imageModels;
  }

  @override
  void update(void Function(GImageModelsData_imageModelsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GImageModelsData_imageModels build() => _build();

  _$GImageModelsData_imageModels _build() {
    _$GImageModelsData_imageModels _$result;
    try {
      _$result = _$v ??
          new _$GImageModelsData_imageModels._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GImageModelsData_imageModels', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GImageModelsData_imageModels', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GImageModelsData_imageModels', 'name'),
              displayName: BuiltValueNullFieldError.checkNotNull(
                  displayName, r'GImageModelsData_imageModels', 'displayName'),
              category: BuiltValueNullFieldError.checkNotNull(
                  category, r'GImageModelsData_imageModels', 'category'),
              description: description,
              license: license,
              prompts: prompts.build(),
              slug: BuiltValueNullFieldError.checkNotNull(
                  slug, r'GImageModelsData_imageModels', 'slug'),
              style: BuiltValueNullFieldError.checkNotNull(
                  style, r'GImageModelsData_imageModels', 'style'),
              thumbnailImageURL: thumbnailImageURL,
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'GImageModelsData_imageModels', 'type'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'prompts';
        prompts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GImageModelsData_imageModels', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
