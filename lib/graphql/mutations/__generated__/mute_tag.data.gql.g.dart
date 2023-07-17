// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_tag.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMuteTagData> _$gMuteTagDataSerializer =
    new _$GMuteTagDataSerializer();
Serializer<GMuteTagData_muteTag> _$gMuteTagDataMuteTagSerializer =
    new _$GMuteTagData_muteTagSerializer();

class _$GMuteTagDataSerializer implements StructuredSerializer<GMuteTagData> {
  @override
  final Iterable<Type> types = const [GMuteTagData, _$GMuteTagData];
  @override
  final String wireName = 'GMuteTagData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GMuteTagData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'muteTag',
      serializers.serialize(object.muteTag,
          specifiedType: const FullType(GMuteTagData_muteTag)),
    ];

    return result;
  }

  @override
  GMuteTagData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMuteTagDataBuilder();

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
        case 'muteTag':
          result.muteTag.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GMuteTagData_muteTag))!
              as GMuteTagData_muteTag);
          break;
      }
    }

    return result.build();
  }
}

class _$GMuteTagData_muteTagSerializer
    implements StructuredSerializer<GMuteTagData_muteTag> {
  @override
  final Iterable<Type> types = const [
    GMuteTagData_muteTag,
    _$GMuteTagData_muteTag
  ];
  @override
  final String wireName = 'GMuteTagData_muteTag';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMuteTagData_muteTag object,
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
  GMuteTagData_muteTag deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMuteTagData_muteTagBuilder();

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

class _$GMuteTagData extends GMuteTagData {
  @override
  final String G__typename;
  @override
  final GMuteTagData_muteTag muteTag;

  factory _$GMuteTagData([void Function(GMuteTagDataBuilder)? updates]) =>
      (new GMuteTagDataBuilder()..update(updates))._build();

  _$GMuteTagData._({required this.G__typename, required this.muteTag})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMuteTagData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(muteTag, r'GMuteTagData', 'muteTag');
  }

  @override
  GMuteTagData rebuild(void Function(GMuteTagDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMuteTagDataBuilder toBuilder() => new GMuteTagDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMuteTagData &&
        G__typename == other.G__typename &&
        muteTag == other.muteTag;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, muteTag.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMuteTagData')
          ..add('G__typename', G__typename)
          ..add('muteTag', muteTag))
        .toString();
  }
}

class GMuteTagDataBuilder
    implements Builder<GMuteTagData, GMuteTagDataBuilder> {
  _$GMuteTagData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GMuteTagData_muteTagBuilder? _muteTag;
  GMuteTagData_muteTagBuilder get muteTag =>
      _$this._muteTag ??= new GMuteTagData_muteTagBuilder();
  set muteTag(GMuteTagData_muteTagBuilder? muteTag) =>
      _$this._muteTag = muteTag;

  GMuteTagDataBuilder() {
    GMuteTagData._initializeBuilder(this);
  }

  GMuteTagDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _muteTag = $v.muteTag.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMuteTagData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMuteTagData;
  }

  @override
  void update(void Function(GMuteTagDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMuteTagData build() => _build();

  _$GMuteTagData _build() {
    _$GMuteTagData _$result;
    try {
      _$result = _$v ??
          new _$GMuteTagData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GMuteTagData', 'G__typename'),
              muteTag: muteTag.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'muteTag';
        muteTag.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GMuteTagData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GMuteTagData_muteTag extends GMuteTagData_muteTag {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GMuteTagData_muteTag(
          [void Function(GMuteTagData_muteTagBuilder)? updates]) =>
      (new GMuteTagData_muteTagBuilder()..update(updates))._build();

  _$GMuteTagData_muteTag._({required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMuteTagData_muteTag', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GMuteTagData_muteTag', 'id');
  }

  @override
  GMuteTagData_muteTag rebuild(
          void Function(GMuteTagData_muteTagBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMuteTagData_muteTagBuilder toBuilder() =>
      new GMuteTagData_muteTagBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMuteTagData_muteTag &&
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
    return (newBuiltValueToStringHelper(r'GMuteTagData_muteTag')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GMuteTagData_muteTagBuilder
    implements Builder<GMuteTagData_muteTag, GMuteTagData_muteTagBuilder> {
  _$GMuteTagData_muteTag? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GMuteTagData_muteTagBuilder() {
    GMuteTagData_muteTag._initializeBuilder(this);
  }

  GMuteTagData_muteTagBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMuteTagData_muteTag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMuteTagData_muteTag;
  }

  @override
  void update(void Function(GMuteTagData_muteTagBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMuteTagData_muteTag build() => _build();

  _$GMuteTagData_muteTag _build() {
    final _$result = _$v ??
        new _$GMuteTagData_muteTag._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GMuteTagData_muteTag', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GMuteTagData_muteTag', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
