// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_work.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateWorkData> _$gUpdateWorkDataSerializer =
    new _$GUpdateWorkDataSerializer();
Serializer<GUpdateWorkData_updateWork> _$gUpdateWorkDataUpdateWorkSerializer =
    new _$GUpdateWorkData_updateWorkSerializer();

class _$GUpdateWorkDataSerializer
    implements StructuredSerializer<GUpdateWorkData> {
  @override
  final Iterable<Type> types = const [GUpdateWorkData, _$GUpdateWorkData];
  @override
  final String wireName = 'GUpdateWorkData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUpdateWorkData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'updateWork',
      serializers.serialize(object.updateWork,
          specifiedType: const FullType(GUpdateWorkData_updateWork)),
    ];

    return result;
  }

  @override
  GUpdateWorkData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateWorkDataBuilder();

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
        case 'updateWork':
          result.updateWork.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUpdateWorkData_updateWork))!
              as GUpdateWorkData_updateWork);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateWorkData_updateWorkSerializer
    implements StructuredSerializer<GUpdateWorkData_updateWork> {
  @override
  final Iterable<Type> types = const [
    GUpdateWorkData_updateWork,
    _$GUpdateWorkData_updateWork
  ];
  @override
  final String wireName = 'GUpdateWorkData_updateWork';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateWorkData_updateWork object,
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
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUpdateWorkData_updateWork deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateWorkData_updateWorkBuilder();

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
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateWorkData extends GUpdateWorkData {
  @override
  final String G__typename;
  @override
  final GUpdateWorkData_updateWork updateWork;

  factory _$GUpdateWorkData([void Function(GUpdateWorkDataBuilder)? updates]) =>
      (new GUpdateWorkDataBuilder()..update(updates))._build();

  _$GUpdateWorkData._({required this.G__typename, required this.updateWork})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateWorkData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        updateWork, r'GUpdateWorkData', 'updateWork');
  }

  @override
  GUpdateWorkData rebuild(void Function(GUpdateWorkDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateWorkDataBuilder toBuilder() =>
      new GUpdateWorkDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateWorkData &&
        G__typename == other.G__typename &&
        updateWork == other.updateWork;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, updateWork.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateWorkData')
          ..add('G__typename', G__typename)
          ..add('updateWork', updateWork))
        .toString();
  }
}

class GUpdateWorkDataBuilder
    implements Builder<GUpdateWorkData, GUpdateWorkDataBuilder> {
  _$GUpdateWorkData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateWorkData_updateWorkBuilder? _updateWork;
  GUpdateWorkData_updateWorkBuilder get updateWork =>
      _$this._updateWork ??= new GUpdateWorkData_updateWorkBuilder();
  set updateWork(GUpdateWorkData_updateWorkBuilder? updateWork) =>
      _$this._updateWork = updateWork;

  GUpdateWorkDataBuilder() {
    GUpdateWorkData._initializeBuilder(this);
  }

  GUpdateWorkDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateWork = $v.updateWork.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateWorkData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateWorkData;
  }

  @override
  void update(void Function(GUpdateWorkDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateWorkData build() => _build();

  _$GUpdateWorkData _build() {
    _$GUpdateWorkData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateWorkData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUpdateWorkData', 'G__typename'),
              updateWork: updateWork.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updateWork';
        updateWork.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateWorkData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateWorkData_updateWork extends GUpdateWorkData_updateWork {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;

  factory _$GUpdateWorkData_updateWork(
          [void Function(GUpdateWorkData_updateWorkBuilder)? updates]) =>
      (new GUpdateWorkData_updateWorkBuilder()..update(updates))._build();

  _$GUpdateWorkData_updateWork._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateWorkData_updateWork', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUpdateWorkData_updateWork', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUpdateWorkData_updateWork', 'title');
  }

  @override
  GUpdateWorkData_updateWork rebuild(
          void Function(GUpdateWorkData_updateWorkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateWorkData_updateWorkBuilder toBuilder() =>
      new GUpdateWorkData_updateWorkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateWorkData_updateWork &&
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
    return (newBuiltValueToStringHelper(r'GUpdateWorkData_updateWork')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description))
        .toString();
  }
}

class GUpdateWorkData_updateWorkBuilder
    implements
        Builder<GUpdateWorkData_updateWork, GUpdateWorkData_updateWorkBuilder> {
  _$GUpdateWorkData_updateWork? _$v;

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

  GUpdateWorkData_updateWorkBuilder() {
    GUpdateWorkData_updateWork._initializeBuilder(this);
  }

  GUpdateWorkData_updateWorkBuilder get _$this {
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
  void replace(GUpdateWorkData_updateWork other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateWorkData_updateWork;
  }

  @override
  void update(void Function(GUpdateWorkData_updateWorkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateWorkData_updateWork build() => _build();

  _$GUpdateWorkData_updateWork _build() {
    final _$result = _$v ??
        new _$GUpdateWorkData_updateWork._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUpdateWorkData_updateWork', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUpdateWorkData_updateWork', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GUpdateWorkData_updateWork', 'title'),
            description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
