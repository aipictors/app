// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_tags.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHotTagsData> _$gHotTagsDataSerializer =
    new _$GHotTagsDataSerializer();
Serializer<GHotTagsData_hotTags> _$gHotTagsDataHotTagsSerializer =
    new _$GHotTagsData_hotTagsSerializer();

class _$GHotTagsDataSerializer implements StructuredSerializer<GHotTagsData> {
  @override
  final Iterable<Type> types = const [GHotTagsData, _$GHotTagsData];
  @override
  final String wireName = 'GHotTagsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHotTagsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'hotTags',
      serializers.serialize(object.hotTags,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GHotTagsData_hotTags)])),
    ];

    return result;
  }

  @override
  GHotTagsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotTagsDataBuilder();

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
        case 'hotTags':
          result.hotTags.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GHotTagsData_hotTags)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHotTagsData_hotTagsSerializer
    implements StructuredSerializer<GHotTagsData_hotTags> {
  @override
  final Iterable<Type> types = const [
    GHotTagsData_hotTags,
    _$GHotTagsData_hotTags
  ];
  @override
  final String wireName = 'GHotTagsData_hotTags';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHotTagsData_hotTags object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GHotTagsData_hotTags deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotTagsData_hotTagsBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GHotTagsData extends GHotTagsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GHotTagsData_hotTags> hotTags;

  factory _$GHotTagsData([void Function(GHotTagsDataBuilder)? updates]) =>
      (new GHotTagsDataBuilder()..update(updates))._build();

  _$GHotTagsData._({required this.G__typename, required this.hotTags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHotTagsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(hotTags, r'GHotTagsData', 'hotTags');
  }

  @override
  GHotTagsData rebuild(void Function(GHotTagsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotTagsDataBuilder toBuilder() => new GHotTagsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotTagsData &&
        G__typename == other.G__typename &&
        hotTags == other.hotTags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, hotTags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHotTagsData')
          ..add('G__typename', G__typename)
          ..add('hotTags', hotTags))
        .toString();
  }
}

class GHotTagsDataBuilder
    implements Builder<GHotTagsData, GHotTagsDataBuilder> {
  _$GHotTagsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GHotTagsData_hotTags>? _hotTags;
  ListBuilder<GHotTagsData_hotTags> get hotTags =>
      _$this._hotTags ??= new ListBuilder<GHotTagsData_hotTags>();
  set hotTags(ListBuilder<GHotTagsData_hotTags>? hotTags) =>
      _$this._hotTags = hotTags;

  GHotTagsDataBuilder() {
    GHotTagsData._initializeBuilder(this);
  }

  GHotTagsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hotTags = $v.hotTags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHotTagsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotTagsData;
  }

  @override
  void update(void Function(GHotTagsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotTagsData build() => _build();

  _$GHotTagsData _build() {
    _$GHotTagsData _$result;
    try {
      _$result = _$v ??
          new _$GHotTagsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHotTagsData', 'G__typename'),
              hotTags: hotTags.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hotTags';
        hotTags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHotTagsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHotTagsData_hotTags extends GHotTagsData_hotTags {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHotTagsData_hotTags(
          [void Function(GHotTagsData_hotTagsBuilder)? updates]) =>
      (new GHotTagsData_hotTagsBuilder()..update(updates))._build();

  _$GHotTagsData_hotTags._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHotTagsData_hotTags', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHotTagsData_hotTags', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHotTagsData_hotTags', 'name');
  }

  @override
  GHotTagsData_hotTags rebuild(
          void Function(GHotTagsData_hotTagsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotTagsData_hotTagsBuilder toBuilder() =>
      new GHotTagsData_hotTagsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotTagsData_hotTags &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHotTagsData_hotTags')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHotTagsData_hotTagsBuilder
    implements Builder<GHotTagsData_hotTags, GHotTagsData_hotTagsBuilder> {
  _$GHotTagsData_hotTags? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHotTagsData_hotTagsBuilder() {
    GHotTagsData_hotTags._initializeBuilder(this);
  }

  GHotTagsData_hotTagsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHotTagsData_hotTags other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotTagsData_hotTags;
  }

  @override
  void update(void Function(GHotTagsData_hotTagsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotTagsData_hotTags build() => _build();

  _$GHotTagsData_hotTags _build() {
    final _$result = _$v ??
        new _$GHotTagsData_hotTags._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHotTagsData_hotTags', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHotTagsData_hotTags', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHotTagsData_hotTags', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
