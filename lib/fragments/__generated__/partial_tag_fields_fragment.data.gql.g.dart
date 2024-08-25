// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_tag_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialTagFieldsData> _$gPartialTagFieldsDataSerializer =
    new _$GPartialTagFieldsDataSerializer();

class _$GPartialTagFieldsDataSerializer
    implements StructuredSerializer<GPartialTagFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialTagFieldsData,
    _$GPartialTagFieldsData
  ];
  @override
  final String wireName = 'GPartialTagFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialTagFieldsData object,
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
  GPartialTagFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialTagFieldsDataBuilder();

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

class _$GPartialTagFieldsData extends GPartialTagFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GPartialTagFieldsData(
          [void Function(GPartialTagFieldsDataBuilder)? updates]) =>
      (new GPartialTagFieldsDataBuilder()..update(updates))._build();

  _$GPartialTagFieldsData._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialTagFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GPartialTagFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GPartialTagFieldsData', 'name');
  }

  @override
  GPartialTagFieldsData rebuild(
          void Function(GPartialTagFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialTagFieldsDataBuilder toBuilder() =>
      new GPartialTagFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialTagFieldsData &&
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
    return (newBuiltValueToStringHelper(r'GPartialTagFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GPartialTagFieldsDataBuilder
    implements Builder<GPartialTagFieldsData, GPartialTagFieldsDataBuilder> {
  _$GPartialTagFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPartialTagFieldsDataBuilder() {
    GPartialTagFieldsData._initializeBuilder(this);
  }

  GPartialTagFieldsDataBuilder get _$this {
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
  void replace(GPartialTagFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialTagFieldsData;
  }

  @override
  void update(void Function(GPartialTagFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialTagFieldsData build() => _build();

  _$GPartialTagFieldsData _build() {
    final _$result = _$v ??
        new _$GPartialTagFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPartialTagFieldsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialTagFieldsData', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GPartialTagFieldsData', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
