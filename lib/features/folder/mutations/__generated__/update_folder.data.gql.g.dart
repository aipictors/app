// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_folder.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateFolderData> _$gUpdateFolderDataSerializer =
    new _$GUpdateFolderDataSerializer();
Serializer<GUpdateFolderData_updateFolder>
    _$gUpdateFolderDataUpdateFolderSerializer =
    new _$GUpdateFolderData_updateFolderSerializer();

class _$GUpdateFolderDataSerializer
    implements StructuredSerializer<GUpdateFolderData> {
  @override
  final Iterable<Type> types = const [GUpdateFolderData, _$GUpdateFolderData];
  @override
  final String wireName = 'GUpdateFolderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUpdateFolderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'updateFolder',
      serializers.serialize(object.updateFolder,
          specifiedType: const FullType(GUpdateFolderData_updateFolder)),
    ];

    return result;
  }

  @override
  GUpdateFolderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateFolderDataBuilder();

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
        case 'updateFolder':
          result.updateFolder.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GUpdateFolderData_updateFolder))!
              as GUpdateFolderData_updateFolder);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateFolderData_updateFolderSerializer
    implements StructuredSerializer<GUpdateFolderData_updateFolder> {
  @override
  final Iterable<Type> types = const [
    GUpdateFolderData_updateFolder,
    _$GUpdateFolderData_updateFolder
  ];
  @override
  final String wireName = 'GUpdateFolderData_updateFolder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateFolderData_updateFolder object,
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
    ];

    return result;
  }

  @override
  GUpdateFolderData_updateFolder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateFolderData_updateFolderBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GUpdateFolderData extends GUpdateFolderData {
  @override
  final String G__typename;
  @override
  final GUpdateFolderData_updateFolder updateFolder;

  factory _$GUpdateFolderData(
          [void Function(GUpdateFolderDataBuilder)? updates]) =>
      (new GUpdateFolderDataBuilder()..update(updates))._build();

  _$GUpdateFolderData._({required this.G__typename, required this.updateFolder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateFolderData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        updateFolder, r'GUpdateFolderData', 'updateFolder');
  }

  @override
  GUpdateFolderData rebuild(void Function(GUpdateFolderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateFolderDataBuilder toBuilder() =>
      new GUpdateFolderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateFolderData &&
        G__typename == other.G__typename &&
        updateFolder == other.updateFolder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, updateFolder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateFolderData')
          ..add('G__typename', G__typename)
          ..add('updateFolder', updateFolder))
        .toString();
  }
}

class GUpdateFolderDataBuilder
    implements Builder<GUpdateFolderData, GUpdateFolderDataBuilder> {
  _$GUpdateFolderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateFolderData_updateFolderBuilder? _updateFolder;
  GUpdateFolderData_updateFolderBuilder get updateFolder =>
      _$this._updateFolder ??= new GUpdateFolderData_updateFolderBuilder();
  set updateFolder(GUpdateFolderData_updateFolderBuilder? updateFolder) =>
      _$this._updateFolder = updateFolder;

  GUpdateFolderDataBuilder() {
    GUpdateFolderData._initializeBuilder(this);
  }

  GUpdateFolderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateFolder = $v.updateFolder.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateFolderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateFolderData;
  }

  @override
  void update(void Function(GUpdateFolderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateFolderData build() => _build();

  _$GUpdateFolderData _build() {
    _$GUpdateFolderData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateFolderData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUpdateFolderData', 'G__typename'),
              updateFolder: updateFolder.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updateFolder';
        updateFolder.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateFolderData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateFolderData_updateFolder extends GUpdateFolderData_updateFolder {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;

  factory _$GUpdateFolderData_updateFolder(
          [void Function(GUpdateFolderData_updateFolderBuilder)? updates]) =>
      (new GUpdateFolderData_updateFolderBuilder()..update(updates))._build();

  _$GUpdateFolderData_updateFolder._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateFolderData_updateFolder', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUpdateFolderData_updateFolder', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUpdateFolderData_updateFolder', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GUpdateFolderData_updateFolder', 'description');
  }

  @override
  GUpdateFolderData_updateFolder rebuild(
          void Function(GUpdateFolderData_updateFolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateFolderData_updateFolderBuilder toBuilder() =>
      new GUpdateFolderData_updateFolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateFolderData_updateFolder &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateFolderData_updateFolder')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description))
        .toString();
  }
}

class GUpdateFolderData_updateFolderBuilder
    implements
        Builder<GUpdateFolderData_updateFolder,
            GUpdateFolderData_updateFolderBuilder> {
  _$GUpdateFolderData_updateFolder? _$v;

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

  GUpdateFolderData_updateFolderBuilder() {
    GUpdateFolderData_updateFolder._initializeBuilder(this);
  }

  GUpdateFolderData_updateFolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateFolderData_updateFolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateFolderData_updateFolder;
  }

  @override
  void update(void Function(GUpdateFolderData_updateFolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateFolderData_updateFolder build() => _build();

  _$GUpdateFolderData_updateFolder _build() {
    final _$result = _$v ??
        new _$GUpdateFolderData_updateFolder._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUpdateFolderData_updateFolder', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUpdateFolderData_updateFolder', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GUpdateFolderData_updateFolder', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GUpdateFolderData_updateFolder', 'description'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
