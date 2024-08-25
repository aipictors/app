// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_user.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMuteUserData> _$gMuteUserDataSerializer =
    new _$GMuteUserDataSerializer();
Serializer<GMuteUserData_muteUser> _$gMuteUserDataMuteUserSerializer =
    new _$GMuteUserData_muteUserSerializer();

class _$GMuteUserDataSerializer implements StructuredSerializer<GMuteUserData> {
  @override
  final Iterable<Type> types = const [GMuteUserData, _$GMuteUserData];
  @override
  final String wireName = 'GMuteUserData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GMuteUserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'muteUser',
      serializers.serialize(object.muteUser,
          specifiedType: const FullType(GMuteUserData_muteUser)),
    ];

    return result;
  }

  @override
  GMuteUserData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMuteUserDataBuilder();

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
        case 'muteUser':
          result.muteUser.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GMuteUserData_muteUser))!
              as GMuteUserData_muteUser);
          break;
      }
    }

    return result.build();
  }
}

class _$GMuteUserData_muteUserSerializer
    implements StructuredSerializer<GMuteUserData_muteUser> {
  @override
  final Iterable<Type> types = const [
    GMuteUserData_muteUser,
    _$GMuteUserData_muteUser
  ];
  @override
  final String wireName = 'GMuteUserData_muteUser';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMuteUserData_muteUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'isMuted',
      serializers.serialize(object.isMuted,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GMuteUserData_muteUser deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMuteUserData_muteUserBuilder();

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
        case 'isMuted':
          result.isMuted = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GMuteUserData extends GMuteUserData {
  @override
  final String G__typename;
  @override
  final GMuteUserData_muteUser muteUser;

  factory _$GMuteUserData([void Function(GMuteUserDataBuilder)? updates]) =>
      (new GMuteUserDataBuilder()..update(updates))._build();

  _$GMuteUserData._({required this.G__typename, required this.muteUser})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMuteUserData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        muteUser, r'GMuteUserData', 'muteUser');
  }

  @override
  GMuteUserData rebuild(void Function(GMuteUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMuteUserDataBuilder toBuilder() => new GMuteUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMuteUserData &&
        G__typename == other.G__typename &&
        muteUser == other.muteUser;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, muteUser.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMuteUserData')
          ..add('G__typename', G__typename)
          ..add('muteUser', muteUser))
        .toString();
  }
}

class GMuteUserDataBuilder
    implements Builder<GMuteUserData, GMuteUserDataBuilder> {
  _$GMuteUserData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GMuteUserData_muteUserBuilder? _muteUser;
  GMuteUserData_muteUserBuilder get muteUser =>
      _$this._muteUser ??= new GMuteUserData_muteUserBuilder();
  set muteUser(GMuteUserData_muteUserBuilder? muteUser) =>
      _$this._muteUser = muteUser;

  GMuteUserDataBuilder() {
    GMuteUserData._initializeBuilder(this);
  }

  GMuteUserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _muteUser = $v.muteUser.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMuteUserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMuteUserData;
  }

  @override
  void update(void Function(GMuteUserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMuteUserData build() => _build();

  _$GMuteUserData _build() {
    _$GMuteUserData _$result;
    try {
      _$result = _$v ??
          new _$GMuteUserData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GMuteUserData', 'G__typename'),
              muteUser: muteUser.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'muteUser';
        muteUser.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GMuteUserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GMuteUserData_muteUser extends GMuteUserData_muteUser {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isMuted;

  factory _$GMuteUserData_muteUser(
          [void Function(GMuteUserData_muteUserBuilder)? updates]) =>
      (new GMuteUserData_muteUserBuilder()..update(updates))._build();

  _$GMuteUserData_muteUser._(
      {required this.G__typename, required this.id, required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMuteUserData_muteUser', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GMuteUserData_muteUser', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GMuteUserData_muteUser', 'isMuted');
  }

  @override
  GMuteUserData_muteUser rebuild(
          void Function(GMuteUserData_muteUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMuteUserData_muteUserBuilder toBuilder() =>
      new GMuteUserData_muteUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMuteUserData_muteUser &&
        G__typename == other.G__typename &&
        id == other.id &&
        isMuted == other.isMuted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMuteUserData_muteUser')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GMuteUserData_muteUserBuilder
    implements Builder<GMuteUserData_muteUser, GMuteUserData_muteUserBuilder> {
  _$GMuteUserData_muteUser? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GMuteUserData_muteUserBuilder() {
    GMuteUserData_muteUser._initializeBuilder(this);
  }

  GMuteUserData_muteUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMuteUserData_muteUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMuteUserData_muteUser;
  }

  @override
  void update(void Function(GMuteUserData_muteUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMuteUserData_muteUser build() => _build();

  _$GMuteUserData_muteUser _build() {
    final _$result = _$v ??
        new _$GMuteUserData_muteUser._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GMuteUserData_muteUser', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GMuteUserData_muteUser', 'id'),
            isMuted: BuiltValueNullFieldError.checkNotNull(
                isMuted, r'GMuteUserData_muteUser', 'isMuted'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
