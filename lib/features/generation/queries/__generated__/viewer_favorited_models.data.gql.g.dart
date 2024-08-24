// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_favorited_models.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerFavoritedImageGenerationModelsData>
    _$gViewerFavoritedImageGenerationModelsDataSerializer =
    new _$GViewerFavoritedImageGenerationModelsDataSerializer();
Serializer<GViewerFavoritedImageGenerationModelsData_viewer>
    _$gViewerFavoritedImageGenerationModelsDataViewerSerializer =
    new _$GViewerFavoritedImageGenerationModelsData_viewerSerializer();
Serializer<
        GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels>
    _$gViewerFavoritedImageGenerationModelsDataViewerFavoritedImageGenerationModelsSerializer =
    new _$GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsSerializer();

class _$GViewerFavoritedImageGenerationModelsDataSerializer
    implements StructuredSerializer<GViewerFavoritedImageGenerationModelsData> {
  @override
  final Iterable<Type> types = const [
    GViewerFavoritedImageGenerationModelsData,
    _$GViewerFavoritedImageGenerationModelsData
  ];
  @override
  final String wireName = 'GViewerFavoritedImageGenerationModelsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerFavoritedImageGenerationModelsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GViewerFavoritedImageGenerationModelsData_viewer)));
    }
    return result;
  }

  @override
  GViewerFavoritedImageGenerationModelsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFavoritedImageGenerationModelsDataBuilder();

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
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GViewerFavoritedImageGenerationModelsData_viewer))!
              as GViewerFavoritedImageGenerationModelsData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerFavoritedImageGenerationModelsData_viewerSerializer
    implements
        StructuredSerializer<GViewerFavoritedImageGenerationModelsData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerFavoritedImageGenerationModelsData_viewer,
    _$GViewerFavoritedImageGenerationModelsData_viewer
  ];
  @override
  final String wireName = 'GViewerFavoritedImageGenerationModelsData_viewer';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerFavoritedImageGenerationModelsData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'favoritedImageGenerationModels',
      serializers.serialize(object.favoritedImageGenerationModels,
          specifiedType: const FullType(BuiltList, const [
            const FullType(
                GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels)
          ])),
    ];

    return result;
  }

  @override
  GViewerFavoritedImageGenerationModelsData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerFavoritedImageGenerationModelsData_viewerBuilder();

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
        case 'favoritedImageGenerationModels':
          result.favoritedImageGenerationModels
              .replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(
                        GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels)
                  ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsSerializer
    implements
        StructuredSerializer<
            GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels> {
  @override
  final Iterable<Type> types = const [
    GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels,
    _$GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
  ];
  @override
  final String wireName =
      'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
          object,
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
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
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
  GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder();

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

class _$GViewerFavoritedImageGenerationModelsData
    extends GViewerFavoritedImageGenerationModelsData {
  @override
  final String G__typename;
  @override
  final GViewerFavoritedImageGenerationModelsData_viewer? viewer;

  factory _$GViewerFavoritedImageGenerationModelsData(
          [void Function(GViewerFavoritedImageGenerationModelsDataBuilder)?
              updates]) =>
      (new GViewerFavoritedImageGenerationModelsDataBuilder()..update(updates))
          ._build();

  _$GViewerFavoritedImageGenerationModelsData._(
      {required this.G__typename, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerFavoritedImageGenerationModelsData', 'G__typename');
  }

  @override
  GViewerFavoritedImageGenerationModelsData rebuild(
          void Function(GViewerFavoritedImageGenerationModelsDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFavoritedImageGenerationModelsDataBuilder toBuilder() =>
      new GViewerFavoritedImageGenerationModelsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFavoritedImageGenerationModelsData &&
        G__typename == other.G__typename &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerFavoritedImageGenerationModelsData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerFavoritedImageGenerationModelsDataBuilder
    implements
        Builder<GViewerFavoritedImageGenerationModelsData,
            GViewerFavoritedImageGenerationModelsDataBuilder> {
  _$GViewerFavoritedImageGenerationModelsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerFavoritedImageGenerationModelsData_viewerBuilder? _viewer;
  GViewerFavoritedImageGenerationModelsData_viewerBuilder get viewer =>
      _$this._viewer ??=
          new GViewerFavoritedImageGenerationModelsData_viewerBuilder();
  set viewer(GViewerFavoritedImageGenerationModelsData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerFavoritedImageGenerationModelsDataBuilder() {
    GViewerFavoritedImageGenerationModelsData._initializeBuilder(this);
  }

  GViewerFavoritedImageGenerationModelsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerFavoritedImageGenerationModelsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFavoritedImageGenerationModelsData;
  }

  @override
  void update(
      void Function(GViewerFavoritedImageGenerationModelsDataBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFavoritedImageGenerationModelsData build() => _build();

  _$GViewerFavoritedImageGenerationModelsData _build() {
    _$GViewerFavoritedImageGenerationModelsData _$result;
    try {
      _$result = _$v ??
          new _$GViewerFavoritedImageGenerationModelsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GViewerFavoritedImageGenerationModelsData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerFavoritedImageGenerationModelsData',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerFavoritedImageGenerationModelsData_viewer
    extends GViewerFavoritedImageGenerationModelsData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<
          GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels>
      favoritedImageGenerationModels;

  factory _$GViewerFavoritedImageGenerationModelsData_viewer(
          [void Function(
                  GViewerFavoritedImageGenerationModelsData_viewerBuilder)?
              updates]) =>
      (new GViewerFavoritedImageGenerationModelsData_viewerBuilder()
            ..update(updates))
          ._build();

  _$GViewerFavoritedImageGenerationModelsData_viewer._(
      {required this.G__typename, required this.favoritedImageGenerationModels})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerFavoritedImageGenerationModelsData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        favoritedImageGenerationModels,
        r'GViewerFavoritedImageGenerationModelsData_viewer',
        'favoritedImageGenerationModels');
  }

  @override
  GViewerFavoritedImageGenerationModelsData_viewer rebuild(
          void Function(GViewerFavoritedImageGenerationModelsData_viewerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFavoritedImageGenerationModelsData_viewerBuilder toBuilder() =>
      new GViewerFavoritedImageGenerationModelsData_viewerBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFavoritedImageGenerationModelsData_viewer &&
        G__typename == other.G__typename &&
        favoritedImageGenerationModels == other.favoritedImageGenerationModels;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, favoritedImageGenerationModels.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerFavoritedImageGenerationModelsData_viewer')
          ..add('G__typename', G__typename)
          ..add(
              'favoritedImageGenerationModels', favoritedImageGenerationModels))
        .toString();
  }
}

class GViewerFavoritedImageGenerationModelsData_viewerBuilder
    implements
        Builder<GViewerFavoritedImageGenerationModelsData_viewer,
            GViewerFavoritedImageGenerationModelsData_viewerBuilder> {
  _$GViewerFavoritedImageGenerationModelsData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<
          GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels>?
      _favoritedImageGenerationModels;
  ListBuilder<
          GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels>
      get favoritedImageGenerationModels =>
          _$this._favoritedImageGenerationModels ??= new ListBuilder<
              GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels>();
  set favoritedImageGenerationModels(
          ListBuilder<
                  GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels>?
              favoritedImageGenerationModels) =>
      _$this._favoritedImageGenerationModels = favoritedImageGenerationModels;

  GViewerFavoritedImageGenerationModelsData_viewerBuilder() {
    GViewerFavoritedImageGenerationModelsData_viewer._initializeBuilder(this);
  }

  GViewerFavoritedImageGenerationModelsData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _favoritedImageGenerationModels =
          $v.favoritedImageGenerationModels.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerFavoritedImageGenerationModelsData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFavoritedImageGenerationModelsData_viewer;
  }

  @override
  void update(
      void Function(GViewerFavoritedImageGenerationModelsData_viewerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFavoritedImageGenerationModelsData_viewer build() => _build();

  _$GViewerFavoritedImageGenerationModelsData_viewer _build() {
    _$GViewerFavoritedImageGenerationModelsData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerFavoritedImageGenerationModelsData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GViewerFavoritedImageGenerationModelsData_viewer',
                  'G__typename'),
              favoritedImageGenerationModels:
                  favoritedImageGenerationModels.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'favoritedImageGenerationModels';
        favoritedImageGenerationModels.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerFavoritedImageGenerationModelsData_viewer',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
    extends GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels {
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
  final String? thumbnailImageURL;
  @override
  final String type;

  factory _$GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels(
          [void Function(
                  GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder)?
              updates]) =>
      (new GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder()
            ..update(updates))
          ._build();

  _$GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.displayName,
      required this.category,
      this.thumbnailImageURL,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels',
        'id');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels',
        'name');
    BuiltValueNullFieldError.checkNotNull(
        displayName,
        r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels',
        'displayName');
    BuiltValueNullFieldError.checkNotNull(
        category,
        r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels',
        'category');
    BuiltValueNullFieldError.checkNotNull(
        type,
        r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels',
        'type');
  }

  @override
  GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
      rebuild(
              void Function(
                      GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder
      toBuilder() =>
          new GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        displayName == other.displayName &&
        category == other.category &&
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
    _$hash = $jc(_$hash, thumbnailImageURL.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('category', category)
          ..add('thumbnailImageURL', thumbnailImageURL)
          ..add('type', type))
        .toString();
  }
}

class GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder
    implements
        Builder<
            GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels,
            GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder> {
  _$GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels?
      _$v;

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

  String? _thumbnailImageURL;
  String? get thumbnailImageURL => _$this._thumbnailImageURL;
  set thumbnailImageURL(String? thumbnailImageURL) =>
      _$this._thumbnailImageURL = thumbnailImageURL;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder() {
    GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
        ._initializeBuilder(this);
  }

  GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _displayName = $v.displayName;
      _category = $v.category;
      _thumbnailImageURL = $v.thumbnailImageURL;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
          other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels;
  }

  @override
  void update(
      void Function(
              GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModelsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
      build() => _build();

  _$GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels
      _build() {
    final _$result = _$v ??
        new _$GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels', 'name'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName,
                r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels',
                'displayName'),
            category: BuiltValueNullFieldError.checkNotNull(
                category, r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels', 'category'),
            thumbnailImageURL: thumbnailImageURL,
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'GViewerFavoritedImageGenerationModelsData_viewer_favoritedImageGenerationModels', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
