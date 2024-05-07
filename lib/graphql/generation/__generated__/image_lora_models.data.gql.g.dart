// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_lora_models.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GImageLoraModelsData> _$gImageLoraModelsDataSerializer =
    new _$GImageLoraModelsDataSerializer();
Serializer<GImageLoraModelsData_imageLoraModels>
    _$gImageLoraModelsDataImageLoraModelsSerializer =
    new _$GImageLoraModelsData_imageLoraModelsSerializer();

class _$GImageLoraModelsDataSerializer
    implements StructuredSerializer<GImageLoraModelsData> {
  @override
  final Iterable<Type> types = const [
    GImageLoraModelsData,
    _$GImageLoraModelsData
  ];
  @override
  final String wireName = 'GImageLoraModelsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GImageLoraModelsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'imageLoraModels',
      serializers.serialize(object.imageLoraModels,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GImageLoraModelsData_imageLoraModels)])),
    ];

    return result;
  }

  @override
  GImageLoraModelsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GImageLoraModelsDataBuilder();

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
        case 'imageLoraModels':
          result.imageLoraModels.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GImageLoraModelsData_imageLoraModels)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GImageLoraModelsData_imageLoraModelsSerializer
    implements StructuredSerializer<GImageLoraModelsData_imageLoraModels> {
  @override
  final Iterable<Type> types = const [
    GImageLoraModelsData_imageLoraModels,
    _$GImageLoraModelsData_imageLoraModels
  ];
  @override
  final String wireName = 'GImageLoraModelsData_imageLoraModels';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GImageLoraModelsData_imageLoraModels object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'prompts',
      serializers.serialize(object.prompts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'slug',
      serializers.serialize(object.slug, specifiedType: const FullType(String)),
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
    value = object.genre;
    if (value != null) {
      result
        ..add('genre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GImageLoraModelsData_imageLoraModels deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GImageLoraModelsData_imageLoraModelsBuilder();

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
        case 'thumbnailImageURL':
          result.thumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'genre':
          result.genre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GImageLoraModelsData extends GImageLoraModelsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GImageLoraModelsData_imageLoraModels> imageLoraModels;

  factory _$GImageLoraModelsData(
          [void Function(GImageLoraModelsDataBuilder)? updates]) =>
      (new GImageLoraModelsDataBuilder()..update(updates))._build();

  _$GImageLoraModelsData._(
      {required this.G__typename, required this.imageLoraModels})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GImageLoraModelsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        imageLoraModels, r'GImageLoraModelsData', 'imageLoraModels');
  }

  @override
  GImageLoraModelsData rebuild(
          void Function(GImageLoraModelsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GImageLoraModelsDataBuilder toBuilder() =>
      new GImageLoraModelsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GImageLoraModelsData &&
        G__typename == other.G__typename &&
        imageLoraModels == other.imageLoraModels;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, imageLoraModels.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GImageLoraModelsData')
          ..add('G__typename', G__typename)
          ..add('imageLoraModels', imageLoraModels))
        .toString();
  }
}

class GImageLoraModelsDataBuilder
    implements Builder<GImageLoraModelsData, GImageLoraModelsDataBuilder> {
  _$GImageLoraModelsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GImageLoraModelsData_imageLoraModels>? _imageLoraModels;
  ListBuilder<GImageLoraModelsData_imageLoraModels> get imageLoraModels =>
      _$this._imageLoraModels ??=
          new ListBuilder<GImageLoraModelsData_imageLoraModels>();
  set imageLoraModels(
          ListBuilder<GImageLoraModelsData_imageLoraModels>? imageLoraModels) =>
      _$this._imageLoraModels = imageLoraModels;

  GImageLoraModelsDataBuilder() {
    GImageLoraModelsData._initializeBuilder(this);
  }

  GImageLoraModelsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _imageLoraModels = $v.imageLoraModels.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GImageLoraModelsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GImageLoraModelsData;
  }

  @override
  void update(void Function(GImageLoraModelsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GImageLoraModelsData build() => _build();

  _$GImageLoraModelsData _build() {
    _$GImageLoraModelsData _$result;
    try {
      _$result = _$v ??
          new _$GImageLoraModelsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GImageLoraModelsData', 'G__typename'),
              imageLoraModels: imageLoraModels.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'imageLoraModels';
        imageLoraModels.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GImageLoraModelsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GImageLoraModelsData_imageLoraModels
    extends GImageLoraModelsData_imageLoraModels {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? license;
  @override
  final BuiltList<String> prompts;
  @override
  final String slug;
  @override
  final String? thumbnailImageURL;
  @override
  final String? genre;

  factory _$GImageLoraModelsData_imageLoraModels(
          [void Function(GImageLoraModelsData_imageLoraModelsBuilder)?
              updates]) =>
      (new GImageLoraModelsData_imageLoraModelsBuilder()..update(updates))
          ._build();

  _$GImageLoraModelsData_imageLoraModels._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.description,
      this.license,
      required this.prompts,
      required this.slug,
      this.thumbnailImageURL,
      this.genre})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GImageLoraModelsData_imageLoraModels', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GImageLoraModelsData_imageLoraModels', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GImageLoraModelsData_imageLoraModels', 'name');
    BuiltValueNullFieldError.checkNotNull(
        prompts, r'GImageLoraModelsData_imageLoraModels', 'prompts');
    BuiltValueNullFieldError.checkNotNull(
        slug, r'GImageLoraModelsData_imageLoraModels', 'slug');
  }

  @override
  GImageLoraModelsData_imageLoraModels rebuild(
          void Function(GImageLoraModelsData_imageLoraModelsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GImageLoraModelsData_imageLoraModelsBuilder toBuilder() =>
      new GImageLoraModelsData_imageLoraModelsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GImageLoraModelsData_imageLoraModels &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        license == other.license &&
        prompts == other.prompts &&
        slug == other.slug &&
        thumbnailImageURL == other.thumbnailImageURL &&
        genre == other.genre;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, license.hashCode);
    _$hash = $jc(_$hash, prompts.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, thumbnailImageURL.hashCode);
    _$hash = $jc(_$hash, genre.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GImageLoraModelsData_imageLoraModels')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('license', license)
          ..add('prompts', prompts)
          ..add('slug', slug)
          ..add('thumbnailImageURL', thumbnailImageURL)
          ..add('genre', genre))
        .toString();
  }
}

class GImageLoraModelsData_imageLoraModelsBuilder
    implements
        Builder<GImageLoraModelsData_imageLoraModels,
            GImageLoraModelsData_imageLoraModelsBuilder> {
  _$GImageLoraModelsData_imageLoraModels? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

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

  String? _thumbnailImageURL;
  String? get thumbnailImageURL => _$this._thumbnailImageURL;
  set thumbnailImageURL(String? thumbnailImageURL) =>
      _$this._thumbnailImageURL = thumbnailImageURL;

  String? _genre;
  String? get genre => _$this._genre;
  set genre(String? genre) => _$this._genre = genre;

  GImageLoraModelsData_imageLoraModelsBuilder() {
    GImageLoraModelsData_imageLoraModels._initializeBuilder(this);
  }

  GImageLoraModelsData_imageLoraModelsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _license = $v.license;
      _prompts = $v.prompts.toBuilder();
      _slug = $v.slug;
      _thumbnailImageURL = $v.thumbnailImageURL;
      _genre = $v.genre;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GImageLoraModelsData_imageLoraModels other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GImageLoraModelsData_imageLoraModels;
  }

  @override
  void update(
      void Function(GImageLoraModelsData_imageLoraModelsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GImageLoraModelsData_imageLoraModels build() => _build();

  _$GImageLoraModelsData_imageLoraModels _build() {
    _$GImageLoraModelsData_imageLoraModels _$result;
    try {
      _$result = _$v ??
          new _$GImageLoraModelsData_imageLoraModels._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GImageLoraModelsData_imageLoraModels', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GImageLoraModelsData_imageLoraModels', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GImageLoraModelsData_imageLoraModels', 'name'),
              description: description,
              license: license,
              prompts: prompts.build(),
              slug: BuiltValueNullFieldError.checkNotNull(
                  slug, r'GImageLoraModelsData_imageLoraModels', 'slug'),
              thumbnailImageURL: thumbnailImageURL,
              genre: genre);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'prompts';
        prompts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GImageLoraModelsData_imageLoraModels',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
