// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateFolderData> _$gCreateFolderDataSerializer =
    new _$GCreateFolderDataSerializer();
Serializer<GCreateFolderData_createFolder>
    _$gCreateFolderDataCreateFolderSerializer =
    new _$GCreateFolderData_createFolderSerializer();

class _$GCreateFolderDataSerializer
    implements StructuredSerializer<GCreateFolderData> {
  @override
  final Iterable<Type> types = const [GCreateFolderData, _$GCreateFolderData];
  @override
  final String wireName = 'GCreateFolderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateFolderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createFolder',
      serializers.serialize(object.createFolder,
          specifiedType: const FullType(GCreateFolderData_createFolder)),
    ];

    return result;
  }

  @override
  GCreateFolderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateFolderDataBuilder();

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
                  specifiedType:
                      const FullType(GCreateFolderData_createFolder))!
              as GCreateFolderData_createFolder);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateFolderData_createFolderSerializer
    implements StructuredSerializer<GCreateFolderData_createFolder> {
  @override
  final Iterable<Type> types = const [
    GCreateFolderData_createFolder,
    _$GCreateFolderData_createFolder
  ];
  @override
  final String wireName = 'GCreateFolderData_createFolder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateFolderData_createFolder object,
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
  GCreateFolderData_createFolder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateFolderData_createFolderBuilder();

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

class _$GCreateFolderData extends GCreateFolderData {
  @override
  final String G__typename;
  @override
  final GCreateFolderData_createFolder createFolder;

  factory _$GCreateFolderData(
          [void Function(GCreateFolderDataBuilder)? updates]) =>
      (new GCreateFolderDataBuilder()..update(updates))._build();

  _$GCreateFolderData._({required this.G__typename, required this.createFolder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateFolderData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createFolder, r'GCreateFolderData', 'createFolder');
  }

  @override
  GCreateFolderData rebuild(void Function(GCreateFolderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateFolderDataBuilder toBuilder() =>
      new GCreateFolderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateFolderData &&
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
    return (newBuiltValueToStringHelper(r'GCreateFolderData')
          ..add('G__typename', G__typename)
          ..add('createFolder', createFolder))
        .toString();
  }
}

class GCreateFolderDataBuilder
    implements Builder<GCreateFolderData, GCreateFolderDataBuilder> {
  _$GCreateFolderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateFolderData_createFolderBuilder? _createFolder;
  GCreateFolderData_createFolderBuilder get createFolder =>
      _$this._createFolder ??= new GCreateFolderData_createFolderBuilder();
  set createFolder(GCreateFolderData_createFolderBuilder? createFolder) =>
      _$this._createFolder = createFolder;

  GCreateFolderDataBuilder() {
    GCreateFolderData._initializeBuilder(this);
  }

  GCreateFolderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createFolder = $v.createFolder.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateFolderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateFolderData;
  }

  @override
  void update(void Function(GCreateFolderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateFolderData build() => _build();

  _$GCreateFolderData _build() {
    _$GCreateFolderData _$result;
    try {
      _$result = _$v ??
          new _$GCreateFolderData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateFolderData', 'G__typename'),
              createFolder: createFolder.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createFolder';
        createFolder.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateFolderData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateFolderData_createFolder extends GCreateFolderData_createFolder {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GCreateFolderData_createFolder(
          [void Function(GCreateFolderData_createFolderBuilder)? updates]) =>
      (new GCreateFolderData_createFolderBuilder()..update(updates))._build();

  _$GCreateFolderData_createFolder._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateFolderData_createFolder', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateFolderData_createFolder', 'id');
  }

  @override
  GCreateFolderData_createFolder rebuild(
          void Function(GCreateFolderData_createFolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateFolderData_createFolderBuilder toBuilder() =>
      new GCreateFolderData_createFolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateFolderData_createFolder &&
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
    return (newBuiltValueToStringHelper(r'GCreateFolderData_createFolder')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GCreateFolderData_createFolderBuilder
    implements
        Builder<GCreateFolderData_createFolder,
            GCreateFolderData_createFolderBuilder> {
  _$GCreateFolderData_createFolder? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCreateFolderData_createFolderBuilder() {
    GCreateFolderData_createFolder._initializeBuilder(this);
  }

  GCreateFolderData_createFolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateFolderData_createFolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateFolderData_createFolder;
  }

  @override
  void update(void Function(GCreateFolderData_createFolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateFolderData_createFolder build() => _build();

  _$GCreateFolderData_createFolder _build() {
    final _$result = _$v ??
        new _$GCreateFolderData_createFolder._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCreateFolderData_createFolder', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateFolderData_createFolder', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
