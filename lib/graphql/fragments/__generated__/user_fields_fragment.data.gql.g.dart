// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserFieldsData> _$gUserFieldsDataSerializer =
    new _$GUserFieldsDataSerializer();

class _$GUserFieldsDataSerializer
    implements StructuredSerializer<GUserFieldsData> {
  @override
  final Iterable<Type> types = const [GUserFieldsData, _$GUserFieldsData];
  @override
  final String wireName = 'GUserFieldsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserFieldsData object,
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
      'receivedLikesCount',
      serializers.serialize(object.receivedLikesCount,
          specifiedType: const FullType(int)),
      'receivedViewsCount',
      serializers.serialize(object.receivedViewsCount,
          specifiedType: const FullType(int)),
      'awardsCount',
      serializers.serialize(object.awardsCount,
          specifiedType: const FullType(int)),
      'followersCount',
      serializers.serialize(object.followersCount,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.biography;
    if (value != null) {
      result
        ..add('biography')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.iconUrl;
    if (value != null) {
      result
        ..add('iconUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.headerImageUrl;
    if (value != null) {
      result
        ..add('headerImageUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUserFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserFieldsDataBuilder();

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
        case 'biography':
          result.biography = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'receivedLikesCount':
          result.receivedLikesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'receivedViewsCount':
          result.receivedViewsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'awardsCount':
          result.awardsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'followersCount':
          result.followersCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'headerImageUrl':
          result.headerImageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserFieldsData extends GUserFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String? biography;
  @override
  final String login;
  @override
  final String name;
  @override
  final int receivedLikesCount;
  @override
  final int receivedViewsCount;
  @override
  final int awardsCount;
  @override
  final int followersCount;
  @override
  final String? iconUrl;
  @override
  final String? headerImageUrl;

  factory _$GUserFieldsData([void Function(GUserFieldsDataBuilder)? updates]) =>
      (new GUserFieldsDataBuilder()..update(updates))._build();

  _$GUserFieldsData._(
      {required this.G__typename,
      required this.id,
      this.biography,
      required this.login,
      required this.name,
      required this.receivedLikesCount,
      required this.receivedViewsCount,
      required this.awardsCount,
      required this.followersCount,
      this.iconUrl,
      this.headerImageUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUserFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(login, r'GUserFieldsData', 'login');
    BuiltValueNullFieldError.checkNotNull(name, r'GUserFieldsData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        receivedLikesCount, r'GUserFieldsData', 'receivedLikesCount');
    BuiltValueNullFieldError.checkNotNull(
        receivedViewsCount, r'GUserFieldsData', 'receivedViewsCount');
    BuiltValueNullFieldError.checkNotNull(
        awardsCount, r'GUserFieldsData', 'awardsCount');
    BuiltValueNullFieldError.checkNotNull(
        followersCount, r'GUserFieldsData', 'followersCount');
  }

  @override
  GUserFieldsData rebuild(void Function(GUserFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserFieldsDataBuilder toBuilder() =>
      new GUserFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        biography == other.biography &&
        login == other.login &&
        name == other.name &&
        receivedLikesCount == other.receivedLikesCount &&
        receivedViewsCount == other.receivedViewsCount &&
        awardsCount == other.awardsCount &&
        followersCount == other.followersCount &&
        iconUrl == other.iconUrl &&
        headerImageUrl == other.headerImageUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, biography.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, receivedLikesCount.hashCode);
    _$hash = $jc(_$hash, receivedViewsCount.hashCode);
    _$hash = $jc(_$hash, awardsCount.hashCode);
    _$hash = $jc(_$hash, followersCount.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, headerImageUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('biography', biography)
          ..add('login', login)
          ..add('name', name)
          ..add('receivedLikesCount', receivedLikesCount)
          ..add('receivedViewsCount', receivedViewsCount)
          ..add('awardsCount', awardsCount)
          ..add('followersCount', followersCount)
          ..add('iconUrl', iconUrl)
          ..add('headerImageUrl', headerImageUrl))
        .toString();
  }
}

class GUserFieldsDataBuilder
    implements Builder<GUserFieldsData, GUserFieldsDataBuilder> {
  _$GUserFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _biography;
  String? get biography => _$this._biography;
  set biography(String? biography) => _$this._biography = biography;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _receivedLikesCount;
  int? get receivedLikesCount => _$this._receivedLikesCount;
  set receivedLikesCount(int? receivedLikesCount) =>
      _$this._receivedLikesCount = receivedLikesCount;

  int? _receivedViewsCount;
  int? get receivedViewsCount => _$this._receivedViewsCount;
  set receivedViewsCount(int? receivedViewsCount) =>
      _$this._receivedViewsCount = receivedViewsCount;

  int? _awardsCount;
  int? get awardsCount => _$this._awardsCount;
  set awardsCount(int? awardsCount) => _$this._awardsCount = awardsCount;

  int? _followersCount;
  int? get followersCount => _$this._followersCount;
  set followersCount(int? followersCount) =>
      _$this._followersCount = followersCount;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  String? _headerImageUrl;
  String? get headerImageUrl => _$this._headerImageUrl;
  set headerImageUrl(String? headerImageUrl) =>
      _$this._headerImageUrl = headerImageUrl;

  GUserFieldsDataBuilder() {
    GUserFieldsData._initializeBuilder(this);
  }

  GUserFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _biography = $v.biography;
      _login = $v.login;
      _name = $v.name;
      _receivedLikesCount = $v.receivedLikesCount;
      _receivedViewsCount = $v.receivedViewsCount;
      _awardsCount = $v.awardsCount;
      _followersCount = $v.followersCount;
      _iconUrl = $v.iconUrl;
      _headerImageUrl = $v.headerImageUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserFieldsData;
  }

  @override
  void update(void Function(GUserFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserFieldsData build() => _build();

  _$GUserFieldsData _build() {
    final _$result = _$v ??
        new _$GUserFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GUserFieldsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserFieldsData', 'id'),
            biography: biography,
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'GUserFieldsData', 'login'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GUserFieldsData', 'name'),
            receivedLikesCount: BuiltValueNullFieldError.checkNotNull(
                receivedLikesCount, r'GUserFieldsData', 'receivedLikesCount'),
            receivedViewsCount: BuiltValueNullFieldError.checkNotNull(
                receivedViewsCount, r'GUserFieldsData', 'receivedViewsCount'),
            awardsCount: BuiltValueNullFieldError.checkNotNull(
                awardsCount, r'GUserFieldsData', 'awardsCount'),
            followersCount: BuiltValueNullFieldError.checkNotNull(
                followersCount, r'GUserFieldsData', 'followersCount'),
            iconUrl: iconUrl,
            headerImageUrl: headerImageUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
