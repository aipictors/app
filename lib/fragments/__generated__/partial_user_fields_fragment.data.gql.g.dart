// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_user_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialUserFieldsData> _$gPartialUserFieldsDataSerializer =
    new _$GPartialUserFieldsDataSerializer();

class _$GPartialUserFieldsDataSerializer
    implements StructuredSerializer<GPartialUserFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialUserFieldsData,
    _$GPartialUserFieldsData
  ];
  @override
  final String wireName = 'GPartialUserFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialUserFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.iconUrl;
    if (value != null) {
      result
        ..add('iconUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPartialUserFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialUserFieldsDataBuilder();

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
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPartialUserFieldsData extends GPartialUserFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final String? iconUrl;

  factory _$GPartialUserFieldsData(
          [void Function(GPartialUserFieldsDataBuilder)? updates]) =>
      (new GPartialUserFieldsDataBuilder()..update(updates))._build();

  _$GPartialUserFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialUserFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GPartialUserFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GPartialUserFieldsData', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GPartialUserFieldsData', 'name');
  }

  @override
  GPartialUserFieldsData rebuild(
          void Function(GPartialUserFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialUserFieldsDataBuilder toBuilder() =>
      new GPartialUserFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialUserFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        login == other.login &&
        name == other.name &&
        iconUrl == other.iconUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPartialUserFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconUrl', iconUrl))
        .toString();
  }
}

class GPartialUserFieldsDataBuilder
    implements Builder<GPartialUserFieldsData, GPartialUserFieldsDataBuilder> {
  _$GPartialUserFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  GPartialUserFieldsDataBuilder() {
    GPartialUserFieldsData._initializeBuilder(this);
  }

  GPartialUserFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _login = $v.login;
      _name = $v.name;
      _iconUrl = $v.iconUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPartialUserFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialUserFieldsData;
  }

  @override
  void update(void Function(GPartialUserFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialUserFieldsData build() => _build();

  _$GPartialUserFieldsData _build() {
    final _$result = _$v ??
        new _$GPartialUserFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPartialUserFieldsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialUserFieldsData', 'id'),
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'GPartialUserFieldsData', 'login'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GPartialUserFieldsData', 'name'),
            iconUrl: iconUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
