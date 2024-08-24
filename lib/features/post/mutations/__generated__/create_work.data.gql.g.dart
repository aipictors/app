// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_work.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateWorkData> _$gCreateWorkDataSerializer =
    new _$GCreateWorkDataSerializer();
Serializer<GCreateWorkData_createWork> _$gCreateWorkDataCreateWorkSerializer =
    new _$GCreateWorkData_createWorkSerializer();

class _$GCreateWorkDataSerializer
    implements StructuredSerializer<GCreateWorkData> {
  @override
  final Iterable<Type> types = const [GCreateWorkData, _$GCreateWorkData];
  @override
  final String wireName = 'GCreateWorkData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateWorkData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createWork',
      serializers.serialize(object.createWork,
          specifiedType: const FullType(GCreateWorkData_createWork)),
    ];

    return result;
  }

  @override
  GCreateWorkData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkDataBuilder();

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
        case 'createWork':
          result.createWork.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GCreateWorkData_createWork))!
              as GCreateWorkData_createWork);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkData_createWorkSerializer
    implements StructuredSerializer<GCreateWorkData_createWork> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkData_createWork,
    _$GCreateWorkData_createWork
  ];
  @override
  final String wireName = 'GCreateWorkData_createWork';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkData_createWork object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateWorkData_createWork deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkData_createWorkBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkData extends GCreateWorkData {
  @override
  final String G__typename;
  @override
  final GCreateWorkData_createWork createWork;

  factory _$GCreateWorkData([void Function(GCreateWorkDataBuilder)? updates]) =>
      (new GCreateWorkDataBuilder()..update(updates))._build();

  _$GCreateWorkData._({required this.G__typename, required this.createWork})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateWorkData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createWork, r'GCreateWorkData', 'createWork');
  }

  @override
  GCreateWorkData rebuild(void Function(GCreateWorkDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkDataBuilder toBuilder() =>
      new GCreateWorkDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkData &&
        G__typename == other.G__typename &&
        createWork == other.createWork;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createWork.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateWorkData')
          ..add('G__typename', G__typename)
          ..add('createWork', createWork))
        .toString();
  }
}

class GCreateWorkDataBuilder
    implements Builder<GCreateWorkData, GCreateWorkDataBuilder> {
  _$GCreateWorkData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateWorkData_createWorkBuilder? _createWork;
  GCreateWorkData_createWorkBuilder get createWork =>
      _$this._createWork ??= new GCreateWorkData_createWorkBuilder();
  set createWork(GCreateWorkData_createWorkBuilder? createWork) =>
      _$this._createWork = createWork;

  GCreateWorkDataBuilder() {
    GCreateWorkData._initializeBuilder(this);
  }

  GCreateWorkDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createWork = $v.createWork.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkData;
  }

  @override
  void update(void Function(GCreateWorkDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkData build() => _build();

  _$GCreateWorkData _build() {
    _$GCreateWorkData _$result;
    try {
      _$result = _$v ??
          new _$GCreateWorkData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateWorkData', 'G__typename'),
              createWork: createWork.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createWork';
        createWork.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateWorkData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateWorkData_createWork extends GCreateWorkData_createWork {
  @override
  final String G__typename;
  @override
  final String title;

  factory _$GCreateWorkData_createWork(
          [void Function(GCreateWorkData_createWorkBuilder)? updates]) =>
      (new GCreateWorkData_createWorkBuilder()..update(updates))._build();

  _$GCreateWorkData_createWork._(
      {required this.G__typename, required this.title})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateWorkData_createWork', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GCreateWorkData_createWork', 'title');
  }

  @override
  GCreateWorkData_createWork rebuild(
          void Function(GCreateWorkData_createWorkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkData_createWorkBuilder toBuilder() =>
      new GCreateWorkData_createWorkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkData_createWork &&
        G__typename == other.G__typename &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateWorkData_createWork')
          ..add('G__typename', G__typename)
          ..add('title', title))
        .toString();
  }
}

class GCreateWorkData_createWorkBuilder
    implements
        Builder<GCreateWorkData_createWork, GCreateWorkData_createWorkBuilder> {
  _$GCreateWorkData_createWork? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GCreateWorkData_createWorkBuilder() {
    GCreateWorkData_createWork._initializeBuilder(this);
  }

  GCreateWorkData_createWorkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkData_createWork other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkData_createWork;
  }

  @override
  void update(void Function(GCreateWorkData_createWorkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkData_createWork build() => _build();

  _$GCreateWorkData_createWork _build() {
    final _$result = _$v ??
        new _$GCreateWorkData_createWork._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GCreateWorkData_createWork', 'G__typename'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GCreateWorkData_createWork', 'title'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
