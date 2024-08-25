// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_folder_work.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteFolderWorkData> _$gDeleteFolderWorkDataSerializer =
    new _$GDeleteFolderWorkDataSerializer();
Serializer<GDeleteFolderWorkData_deleteFolderWork>
    _$gDeleteFolderWorkDataDeleteFolderWorkSerializer =
    new _$GDeleteFolderWorkData_deleteFolderWorkSerializer();

class _$GDeleteFolderWorkDataSerializer
    implements StructuredSerializer<GDeleteFolderWorkData> {
  @override
  final Iterable<Type> types = const [
    GDeleteFolderWorkData,
    _$GDeleteFolderWorkData
  ];
  @override
  final String wireName = 'GDeleteFolderWorkData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteFolderWorkData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.deleteFolderWork;
    if (value != null) {
      result
        ..add('deleteFolderWork')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GDeleteFolderWorkData_deleteFolderWork)));
    }
    return result;
  }

  @override
  GDeleteFolderWorkData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteFolderWorkDataBuilder();

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
        case 'deleteFolderWork':
          result.deleteFolderWork.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GDeleteFolderWorkData_deleteFolderWork))!
              as GDeleteFolderWorkData_deleteFolderWork);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteFolderWorkData_deleteFolderWorkSerializer
    implements StructuredSerializer<GDeleteFolderWorkData_deleteFolderWork> {
  @override
  final Iterable<Type> types = const [
    GDeleteFolderWorkData_deleteFolderWork,
    _$GDeleteFolderWorkData_deleteFolderWork
  ];
  @override
  final String wireName = 'GDeleteFolderWorkData_deleteFolderWork';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteFolderWorkData_deleteFolderWork object,
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
  GDeleteFolderWorkData_deleteFolderWork deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteFolderWorkData_deleteFolderWorkBuilder();

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

class _$GDeleteFolderWorkData extends GDeleteFolderWorkData {
  @override
  final String G__typename;
  @override
  final GDeleteFolderWorkData_deleteFolderWork? deleteFolderWork;

  factory _$GDeleteFolderWorkData(
          [void Function(GDeleteFolderWorkDataBuilder)? updates]) =>
      (new GDeleteFolderWorkDataBuilder()..update(updates))._build();

  _$GDeleteFolderWorkData._({required this.G__typename, this.deleteFolderWork})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteFolderWorkData', 'G__typename');
  }

  @override
  GDeleteFolderWorkData rebuild(
          void Function(GDeleteFolderWorkDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteFolderWorkDataBuilder toBuilder() =>
      new GDeleteFolderWorkDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteFolderWorkData &&
        G__typename == other.G__typename &&
        deleteFolderWork == other.deleteFolderWork;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deleteFolderWork.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteFolderWorkData')
          ..add('G__typename', G__typename)
          ..add('deleteFolderWork', deleteFolderWork))
        .toString();
  }
}

class GDeleteFolderWorkDataBuilder
    implements Builder<GDeleteFolderWorkData, GDeleteFolderWorkDataBuilder> {
  _$GDeleteFolderWorkData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDeleteFolderWorkData_deleteFolderWorkBuilder? _deleteFolderWork;
  GDeleteFolderWorkData_deleteFolderWorkBuilder get deleteFolderWork =>
      _$this._deleteFolderWork ??=
          new GDeleteFolderWorkData_deleteFolderWorkBuilder();
  set deleteFolderWork(
          GDeleteFolderWorkData_deleteFolderWorkBuilder? deleteFolderWork) =>
      _$this._deleteFolderWork = deleteFolderWork;

  GDeleteFolderWorkDataBuilder() {
    GDeleteFolderWorkData._initializeBuilder(this);
  }

  GDeleteFolderWorkDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteFolderWork = $v.deleteFolderWork?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteFolderWorkData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteFolderWorkData;
  }

  @override
  void update(void Function(GDeleteFolderWorkDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteFolderWorkData build() => _build();

  _$GDeleteFolderWorkData _build() {
    _$GDeleteFolderWorkData _$result;
    try {
      _$result = _$v ??
          new _$GDeleteFolderWorkData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDeleteFolderWorkData', 'G__typename'),
              deleteFolderWork: _deleteFolderWork?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deleteFolderWork';
        _deleteFolderWork?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteFolderWorkData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteFolderWorkData_deleteFolderWork
    extends GDeleteFolderWorkData_deleteFolderWork {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GDeleteFolderWorkData_deleteFolderWork(
          [void Function(GDeleteFolderWorkData_deleteFolderWorkBuilder)?
              updates]) =>
      (new GDeleteFolderWorkData_deleteFolderWorkBuilder()..update(updates))
          ._build();

  _$GDeleteFolderWorkData_deleteFolderWork._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteFolderWorkData_deleteFolderWork', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDeleteFolderWorkData_deleteFolderWork', 'id');
  }

  @override
  GDeleteFolderWorkData_deleteFolderWork rebuild(
          void Function(GDeleteFolderWorkData_deleteFolderWorkBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteFolderWorkData_deleteFolderWorkBuilder toBuilder() =>
      new GDeleteFolderWorkData_deleteFolderWorkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteFolderWorkData_deleteFolderWork &&
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
    return (newBuiltValueToStringHelper(
            r'GDeleteFolderWorkData_deleteFolderWork')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GDeleteFolderWorkData_deleteFolderWorkBuilder
    implements
        Builder<GDeleteFolderWorkData_deleteFolderWork,
            GDeleteFolderWorkData_deleteFolderWorkBuilder> {
  _$GDeleteFolderWorkData_deleteFolderWork? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GDeleteFolderWorkData_deleteFolderWorkBuilder() {
    GDeleteFolderWorkData_deleteFolderWork._initializeBuilder(this);
  }

  GDeleteFolderWorkData_deleteFolderWorkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteFolderWorkData_deleteFolderWork other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteFolderWorkData_deleteFolderWork;
  }

  @override
  void update(
      void Function(GDeleteFolderWorkData_deleteFolderWorkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteFolderWorkData_deleteFolderWork build() => _build();

  _$GDeleteFolderWorkData_deleteFolderWork _build() {
    final _$result = _$v ??
        new _$GDeleteFolderWorkData_deleteFolderWork._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GDeleteFolderWorkData_deleteFolderWork', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDeleteFolderWorkData_deleteFolderWork', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
