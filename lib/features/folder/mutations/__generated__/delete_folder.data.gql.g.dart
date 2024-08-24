// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_folder.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteFolderData> _$gDeleteFolderDataSerializer =
    new _$GDeleteFolderDataSerializer();
Serializer<GDeleteFolderData_deleteFolder>
    _$gDeleteFolderDataDeleteFolderSerializer =
    new _$GDeleteFolderData_deleteFolderSerializer();

class _$GDeleteFolderDataSerializer
    implements StructuredSerializer<GDeleteFolderData> {
  @override
  final Iterable<Type> types = const [GDeleteFolderData, _$GDeleteFolderData];
  @override
  final String wireName = 'GDeleteFolderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDeleteFolderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deleteFolder',
      serializers.serialize(object.deleteFolder,
          specifiedType: const FullType(GDeleteFolderData_deleteFolder)),
    ];

    return result;
  }

  @override
  GDeleteFolderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteFolderDataBuilder();

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
        case 'deleteFolder':
          result.deleteFolder.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GDeleteFolderData_deleteFolder))!
              as GDeleteFolderData_deleteFolder);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteFolderData_deleteFolderSerializer
    implements StructuredSerializer<GDeleteFolderData_deleteFolder> {
  @override
  final Iterable<Type> types = const [
    GDeleteFolderData_deleteFolder,
    _$GDeleteFolderData_deleteFolder
  ];
  @override
  final String wireName = 'GDeleteFolderData_deleteFolder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteFolderData_deleteFolder object,
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
  GDeleteFolderData_deleteFolder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteFolderData_deleteFolderBuilder();

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

class _$GDeleteFolderData extends GDeleteFolderData {
  @override
  final String G__typename;
  @override
  final GDeleteFolderData_deleteFolder deleteFolder;

  factory _$GDeleteFolderData(
          [void Function(GDeleteFolderDataBuilder)? updates]) =>
      (new GDeleteFolderDataBuilder()..update(updates))._build();

  _$GDeleteFolderData._({required this.G__typename, required this.deleteFolder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteFolderData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deleteFolder, r'GDeleteFolderData', 'deleteFolder');
  }

  @override
  GDeleteFolderData rebuild(void Function(GDeleteFolderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteFolderDataBuilder toBuilder() =>
      new GDeleteFolderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteFolderData &&
        G__typename == other.G__typename &&
        deleteFolder == other.deleteFolder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deleteFolder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteFolderData')
          ..add('G__typename', G__typename)
          ..add('deleteFolder', deleteFolder))
        .toString();
  }
}

class GDeleteFolderDataBuilder
    implements Builder<GDeleteFolderData, GDeleteFolderDataBuilder> {
  _$GDeleteFolderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDeleteFolderData_deleteFolderBuilder? _deleteFolder;
  GDeleteFolderData_deleteFolderBuilder get deleteFolder =>
      _$this._deleteFolder ??= new GDeleteFolderData_deleteFolderBuilder();
  set deleteFolder(GDeleteFolderData_deleteFolderBuilder? deleteFolder) =>
      _$this._deleteFolder = deleteFolder;

  GDeleteFolderDataBuilder() {
    GDeleteFolderData._initializeBuilder(this);
  }

  GDeleteFolderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteFolder = $v.deleteFolder.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteFolderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteFolderData;
  }

  @override
  void update(void Function(GDeleteFolderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteFolderData build() => _build();

  _$GDeleteFolderData _build() {
    _$GDeleteFolderData _$result;
    try {
      _$result = _$v ??
          new _$GDeleteFolderData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDeleteFolderData', 'G__typename'),
              deleteFolder: deleteFolder.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deleteFolder';
        deleteFolder.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteFolderData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteFolderData_deleteFolder extends GDeleteFolderData_deleteFolder {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GDeleteFolderData_deleteFolder(
          [void Function(GDeleteFolderData_deleteFolderBuilder)? updates]) =>
      (new GDeleteFolderData_deleteFolderBuilder()..update(updates))._build();

  _$GDeleteFolderData_deleteFolder._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteFolderData_deleteFolder', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDeleteFolderData_deleteFolder', 'id');
  }

  @override
  GDeleteFolderData_deleteFolder rebuild(
          void Function(GDeleteFolderData_deleteFolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteFolderData_deleteFolderBuilder toBuilder() =>
      new GDeleteFolderData_deleteFolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteFolderData_deleteFolder &&
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
    return (newBuiltValueToStringHelper(r'GDeleteFolderData_deleteFolder')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GDeleteFolderData_deleteFolderBuilder
    implements
        Builder<GDeleteFolderData_deleteFolder,
            GDeleteFolderData_deleteFolderBuilder> {
  _$GDeleteFolderData_deleteFolder? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GDeleteFolderData_deleteFolderBuilder() {
    GDeleteFolderData_deleteFolder._initializeBuilder(this);
  }

  GDeleteFolderData_deleteFolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteFolderData_deleteFolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteFolderData_deleteFolder;
  }

  @override
  void update(void Function(GDeleteFolderData_deleteFolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteFolderData_deleteFolder build() => _build();

  _$GDeleteFolderData_deleteFolder _build() {
    final _$result = _$v ??
        new _$GDeleteFolderData_deleteFolder._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GDeleteFolderData_deleteFolder', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDeleteFolderData_deleteFolder', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
