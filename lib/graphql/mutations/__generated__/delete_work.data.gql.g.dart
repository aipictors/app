// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_work.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteWorkData> _$gDeleteWorkDataSerializer =
    new _$GDeleteWorkDataSerializer();
Serializer<GDeleteWorkData_deleteWork> _$gDeleteWorkDataDeleteWorkSerializer =
    new _$GDeleteWorkData_deleteWorkSerializer();

class _$GDeleteWorkDataSerializer
    implements StructuredSerializer<GDeleteWorkData> {
  @override
  final Iterable<Type> types = const [GDeleteWorkData, _$GDeleteWorkData];
  @override
  final String wireName = 'GDeleteWorkData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDeleteWorkData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deleteWork',
      serializers.serialize(object.deleteWork,
          specifiedType: const FullType(GDeleteWorkData_deleteWork)),
    ];

    return result;
  }

  @override
  GDeleteWorkData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteWorkDataBuilder();

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
        case 'deleteWork':
          result.deleteWork.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GDeleteWorkData_deleteWork))!
              as GDeleteWorkData_deleteWork);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteWorkData_deleteWorkSerializer
    implements StructuredSerializer<GDeleteWorkData_deleteWork> {
  @override
  final Iterable<Type> types = const [
    GDeleteWorkData_deleteWork,
    _$GDeleteWorkData_deleteWork
  ];
  @override
  final String wireName = 'GDeleteWorkData_deleteWork';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteWorkData_deleteWork object,
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
  GDeleteWorkData_deleteWork deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteWorkData_deleteWorkBuilder();

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

class _$GDeleteWorkData extends GDeleteWorkData {
  @override
  final String G__typename;
  @override
  final GDeleteWorkData_deleteWork deleteWork;

  factory _$GDeleteWorkData([void Function(GDeleteWorkDataBuilder)? updates]) =>
      (new GDeleteWorkDataBuilder()..update(updates))._build();

  _$GDeleteWorkData._({required this.G__typename, required this.deleteWork})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteWorkData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deleteWork, r'GDeleteWorkData', 'deleteWork');
  }

  @override
  GDeleteWorkData rebuild(void Function(GDeleteWorkDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteWorkDataBuilder toBuilder() =>
      new GDeleteWorkDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteWorkData &&
        G__typename == other.G__typename &&
        deleteWork == other.deleteWork;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deleteWork.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteWorkData')
          ..add('G__typename', G__typename)
          ..add('deleteWork', deleteWork))
        .toString();
  }
}

class GDeleteWorkDataBuilder
    implements Builder<GDeleteWorkData, GDeleteWorkDataBuilder> {
  _$GDeleteWorkData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDeleteWorkData_deleteWorkBuilder? _deleteWork;
  GDeleteWorkData_deleteWorkBuilder get deleteWork =>
      _$this._deleteWork ??= new GDeleteWorkData_deleteWorkBuilder();
  set deleteWork(GDeleteWorkData_deleteWorkBuilder? deleteWork) =>
      _$this._deleteWork = deleteWork;

  GDeleteWorkDataBuilder() {
    GDeleteWorkData._initializeBuilder(this);
  }

  GDeleteWorkDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteWork = $v.deleteWork.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteWorkData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteWorkData;
  }

  @override
  void update(void Function(GDeleteWorkDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteWorkData build() => _build();

  _$GDeleteWorkData _build() {
    _$GDeleteWorkData _$result;
    try {
      _$result = _$v ??
          new _$GDeleteWorkData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDeleteWorkData', 'G__typename'),
              deleteWork: deleteWork.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deleteWork';
        deleteWork.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteWorkData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteWorkData_deleteWork extends GDeleteWorkData_deleteWork {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GDeleteWorkData_deleteWork(
          [void Function(GDeleteWorkData_deleteWorkBuilder)? updates]) =>
      (new GDeleteWorkData_deleteWorkBuilder()..update(updates))._build();

  _$GDeleteWorkData_deleteWork._({required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteWorkData_deleteWork', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDeleteWorkData_deleteWork', 'id');
  }

  @override
  GDeleteWorkData_deleteWork rebuild(
          void Function(GDeleteWorkData_deleteWorkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteWorkData_deleteWorkBuilder toBuilder() =>
      new GDeleteWorkData_deleteWorkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteWorkData_deleteWork &&
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
    return (newBuiltValueToStringHelper(r'GDeleteWorkData_deleteWork')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GDeleteWorkData_deleteWorkBuilder
    implements
        Builder<GDeleteWorkData_deleteWork, GDeleteWorkData_deleteWorkBuilder> {
  _$GDeleteWorkData_deleteWork? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GDeleteWorkData_deleteWorkBuilder() {
    GDeleteWorkData_deleteWork._initializeBuilder(this);
  }

  GDeleteWorkData_deleteWorkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteWorkData_deleteWork other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteWorkData_deleteWork;
  }

  @override
  void update(void Function(GDeleteWorkData_deleteWorkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteWorkData_deleteWork build() => _build();

  _$GDeleteWorkData_deleteWork _build() {
    final _$result = _$v ??
        new _$GDeleteWorkData_deleteWork._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GDeleteWorkData_deleteWork', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDeleteWorkData_deleteWork', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
