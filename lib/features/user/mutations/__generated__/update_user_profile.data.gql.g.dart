// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_profile.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUpdateUserProfileData> _$gUpdateUserProfileDataSerializer =
    new _$GUpdateUserProfileDataSerializer();
Serializer<GUpdateUserProfileData_updateUserProfile>
    _$gUpdateUserProfileDataUpdateUserProfileSerializer =
    new _$GUpdateUserProfileData_updateUserProfileSerializer();

class _$GUpdateUserProfileDataSerializer
    implements StructuredSerializer<GUpdateUserProfileData> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserProfileData,
    _$GUpdateUserProfileData
  ];
  @override
  final String wireName = 'GUpdateUserProfileData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'updateUserProfile',
      serializers.serialize(object.updateUserProfile,
          specifiedType:
              const FullType(GUpdateUserProfileData_updateUserProfile)),
    ];

    return result;
  }

  @override
  GUpdateUserProfileData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserProfileDataBuilder();

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
        case 'updateUserProfile':
          result.updateUserProfile.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GUpdateUserProfileData_updateUserProfile))!
              as GUpdateUserProfileData_updateUserProfile);
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateUserProfileData_updateUserProfileSerializer
    implements StructuredSerializer<GUpdateUserProfileData_updateUserProfile> {
  @override
  final Iterable<Type> types = const [
    GUpdateUserProfileData_updateUserProfile,
    _$GUpdateUserProfileData_updateUserProfile
  ];
  @override
  final String wireName = 'GUpdateUserProfileData_updateUserProfile';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateUserProfileData_updateUserProfile object,
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
  GUpdateUserProfileData_updateUserProfile deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserProfileData_updateUserProfileBuilder();

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

class _$GUpdateUserProfileData extends GUpdateUserProfileData {
  @override
  final String G__typename;
  @override
  final GUpdateUserProfileData_updateUserProfile updateUserProfile;

  factory _$GUpdateUserProfileData(
          [void Function(GUpdateUserProfileDataBuilder)? updates]) =>
      (new GUpdateUserProfileDataBuilder()..update(updates))._build();

  _$GUpdateUserProfileData._(
      {required this.G__typename, required this.updateUserProfile})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUpdateUserProfileData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        updateUserProfile, r'GUpdateUserProfileData', 'updateUserProfile');
  }

  @override
  GUpdateUserProfileData rebuild(
          void Function(GUpdateUserProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserProfileDataBuilder toBuilder() =>
      new GUpdateUserProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserProfileData &&
        G__typename == other.G__typename &&
        updateUserProfile == other.updateUserProfile;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, updateUserProfile.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateUserProfileData')
          ..add('G__typename', G__typename)
          ..add('updateUserProfile', updateUserProfile))
        .toString();
  }
}

class GUpdateUserProfileDataBuilder
    implements Builder<GUpdateUserProfileData, GUpdateUserProfileDataBuilder> {
  _$GUpdateUserProfileData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUpdateUserProfileData_updateUserProfileBuilder? _updateUserProfile;
  GUpdateUserProfileData_updateUserProfileBuilder get updateUserProfile =>
      _$this._updateUserProfile ??=
          new GUpdateUserProfileData_updateUserProfileBuilder();
  set updateUserProfile(
          GUpdateUserProfileData_updateUserProfileBuilder? updateUserProfile) =>
      _$this._updateUserProfile = updateUserProfile;

  GUpdateUserProfileDataBuilder() {
    GUpdateUserProfileData._initializeBuilder(this);
  }

  GUpdateUserProfileDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _updateUserProfile = $v.updateUserProfile.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserProfileData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserProfileData;
  }

  @override
  void update(void Function(GUpdateUserProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateUserProfileData build() => _build();

  _$GUpdateUserProfileData _build() {
    _$GUpdateUserProfileData _$result;
    try {
      _$result = _$v ??
          new _$GUpdateUserProfileData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUpdateUserProfileData', 'G__typename'),
              updateUserProfile: updateUserProfile.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updateUserProfile';
        updateUserProfile.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateUserProfileData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserProfileData_updateUserProfile
    extends GUpdateUserProfileData_updateUserProfile {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GUpdateUserProfileData_updateUserProfile(
          [void Function(GUpdateUserProfileData_updateUserProfileBuilder)?
              updates]) =>
      (new GUpdateUserProfileData_updateUserProfileBuilder()..update(updates))
          ._build();

  _$GUpdateUserProfileData_updateUserProfile._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUpdateUserProfileData_updateUserProfile', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUpdateUserProfileData_updateUserProfile', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GUpdateUserProfileData_updateUserProfile', 'name');
  }

  @override
  GUpdateUserProfileData_updateUserProfile rebuild(
          void Function(GUpdateUserProfileData_updateUserProfileBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserProfileData_updateUserProfileBuilder toBuilder() =>
      new GUpdateUserProfileData_updateUserProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserProfileData_updateUserProfile &&
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
    return (newBuiltValueToStringHelper(
            r'GUpdateUserProfileData_updateUserProfile')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GUpdateUserProfileData_updateUserProfileBuilder
    implements
        Builder<GUpdateUserProfileData_updateUserProfile,
            GUpdateUserProfileData_updateUserProfileBuilder> {
  _$GUpdateUserProfileData_updateUserProfile? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GUpdateUserProfileData_updateUserProfileBuilder() {
    GUpdateUserProfileData_updateUserProfile._initializeBuilder(this);
  }

  GUpdateUserProfileData_updateUserProfileBuilder get _$this {
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
  void replace(GUpdateUserProfileData_updateUserProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserProfileData_updateUserProfile;
  }

  @override
  void update(
      void Function(GUpdateUserProfileData_updateUserProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateUserProfileData_updateUserProfile build() => _build();

  _$GUpdateUserProfileData_updateUserProfile _build() {
    final _$result = _$v ??
        new _$GUpdateUserProfileData_updateUserProfile._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUpdateUserProfileData_updateUserProfile', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUpdateUserProfileData_updateUserProfile', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GUpdateUserProfileData_updateUserProfile', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
