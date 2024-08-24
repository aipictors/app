// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_album.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateAlbumData> _$gCreateAlbumDataSerializer =
    new _$GCreateAlbumDataSerializer();
Serializer<GCreateAlbumData_createFolder>
    _$gCreateAlbumDataCreateFolderSerializer =
    new _$GCreateAlbumData_createFolderSerializer();

class _$GCreateAlbumDataSerializer
    implements StructuredSerializer<GCreateAlbumData> {
  @override
  final Iterable<Type> types = const [GCreateAlbumData, _$GCreateAlbumData];
  @override
  final String wireName = 'GCreateAlbumData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateAlbumData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createFolder',
      serializers.serialize(object.createFolder,
          specifiedType: const FullType(GCreateAlbumData_createFolder)),
    ];

    return result;
  }

  @override
  GCreateAlbumData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAlbumDataBuilder();

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
        case 'createFolder':
          result.createFolder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GCreateAlbumData_createFolder))!
              as GCreateAlbumData_createFolder);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateAlbumData_createFolderSerializer
    implements StructuredSerializer<GCreateAlbumData_createFolder> {
  @override
  final Iterable<Type> types = const [
    GCreateAlbumData_createFolder,
    _$GCreateAlbumData_createFolder
  ];
  @override
  final String wireName = 'GCreateAlbumData_createFolder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateAlbumData_createFolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateAlbumData_createFolder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAlbumData_createFolderBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GCreateAlbumData extends GCreateAlbumData {
  @override
  final String G__typename;
  @override
  final GCreateAlbumData_createFolder createFolder;

  factory _$GCreateAlbumData(
          [void Function(GCreateAlbumDataBuilder)? updates]) =>
      (new GCreateAlbumDataBuilder()..update(updates))._build();

  _$GCreateAlbumData._({required this.G__typename, required this.createFolder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateAlbumData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createFolder, r'GCreateAlbumData', 'createFolder');
  }

  @override
  GCreateAlbumData rebuild(void Function(GCreateAlbumDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAlbumDataBuilder toBuilder() =>
      new GCreateAlbumDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAlbumData &&
        G__typename == other.G__typename &&
        createFolder == other.createFolder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createFolder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateAlbumData')
          ..add('G__typename', G__typename)
          ..add('createFolder', createFolder))
        .toString();
  }
}

class GCreateAlbumDataBuilder
    implements Builder<GCreateAlbumData, GCreateAlbumDataBuilder> {
  _$GCreateAlbumData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateAlbumData_createFolderBuilder? _createFolder;
  GCreateAlbumData_createFolderBuilder get createFolder =>
      _$this._createFolder ??= new GCreateAlbumData_createFolderBuilder();
  set createFolder(GCreateAlbumData_createFolderBuilder? createFolder) =>
      _$this._createFolder = createFolder;

  GCreateAlbumDataBuilder() {
    GCreateAlbumData._initializeBuilder(this);
  }

  GCreateAlbumDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createFolder = $v.createFolder.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAlbumData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAlbumData;
  }

  @override
  void update(void Function(GCreateAlbumDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAlbumData build() => _build();

  _$GCreateAlbumData _build() {
    _$GCreateAlbumData _$result;
    try {
      _$result = _$v ??
          new _$GCreateAlbumData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateAlbumData', 'G__typename'),
              createFolder: createFolder.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createFolder';
        createFolder.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateAlbumData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateAlbumData_createFolder extends GCreateAlbumData_createFolder {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GCreateAlbumData_createFolder(
          [void Function(GCreateAlbumData_createFolderBuilder)? updates]) =>
      (new GCreateAlbumData_createFolderBuilder()..update(updates))._build();

  _$GCreateAlbumData_createFolder._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateAlbumData_createFolder', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateAlbumData_createFolder', 'id');
  }

  @override
  GCreateAlbumData_createFolder rebuild(
          void Function(GCreateAlbumData_createFolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAlbumData_createFolderBuilder toBuilder() =>
      new GCreateAlbumData_createFolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAlbumData_createFolder &&
        G__typename == other.G__typename &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateAlbumData_createFolder')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GCreateAlbumData_createFolderBuilder
    implements
        Builder<GCreateAlbumData_createFolder,
            GCreateAlbumData_createFolderBuilder> {
  _$GCreateAlbumData_createFolder? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCreateAlbumData_createFolderBuilder() {
    GCreateAlbumData_createFolder._initializeBuilder(this);
  }

  GCreateAlbumData_createFolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAlbumData_createFolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAlbumData_createFolder;
  }

  @override
  void update(void Function(GCreateAlbumData_createFolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateAlbumData_createFolder build() => _build();

  _$GCreateAlbumData_createFolder _build() {
    final _$result = _$v ??
        new _$GCreateAlbumData_createFolder._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCreateAlbumData_createFolder', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateAlbumData_createFolder', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
