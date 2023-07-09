// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_folder_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialFolderFieldsData> _$gPartialFolderFieldsDataSerializer =
    new _$GPartialFolderFieldsDataSerializer();
Serializer<GPartialFolderFieldsData_user>
    _$gPartialFolderFieldsDataUserSerializer =
    new _$GPartialFolderFieldsData_userSerializer();

class _$GPartialFolderFieldsDataSerializer
    implements StructuredSerializer<GPartialFolderFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialFolderFieldsData,
    _$GPartialFolderFieldsData
  ];
  @override
  final String wireName = 'GPartialFolderFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialFolderFieldsData object,
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
      'rating',
      serializers.serialize(object.rating, specifiedType: const FullType(int)),
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
      'viewsCount',
      serializers.serialize(object.viewsCount,
          specifiedType: const FullType(int)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GPartialFolderFieldsData_user)),
    ];

    return result;
  }

  @override
  GPartialFolderFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialFolderFieldsDataBuilder();

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
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'viewsCount':
          result.viewsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GPartialFolderFieldsData_user))!
              as GPartialFolderFieldsData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GPartialFolderFieldsData_userSerializer
    implements StructuredSerializer<GPartialFolderFieldsData_user> {
  @override
  final Iterable<Type> types = const [
    GPartialFolderFieldsData_user,
    _$GPartialFolderFieldsData_user
  ];
  @override
  final String wireName = 'GPartialFolderFieldsData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialFolderFieldsData_user object,
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
  GPartialFolderFieldsData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialFolderFieldsData_userBuilder();

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

class _$GPartialFolderFieldsData extends GPartialFolderFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final int rating;
  @override
  final int likesCount;
  @override
  final int viewsCount;
  @override
  final GPartialFolderFieldsData_user user;

  factory _$GPartialFolderFieldsData(
          [void Function(GPartialFolderFieldsDataBuilder)? updates]) =>
      (new GPartialFolderFieldsDataBuilder()..update(updates))._build();

  _$GPartialFolderFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.rating,
      required this.likesCount,
      required this.viewsCount,
      required this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialFolderFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialFolderFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPartialFolderFieldsData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        rating, r'GPartialFolderFieldsData', 'rating');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GPartialFolderFieldsData', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        viewsCount, r'GPartialFolderFieldsData', 'viewsCount');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GPartialFolderFieldsData', 'user');
  }

  @override
  GPartialFolderFieldsData rebuild(
          void Function(GPartialFolderFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialFolderFieldsDataBuilder toBuilder() =>
      new GPartialFolderFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialFolderFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        rating == other.rating &&
        likesCount == other.likesCount &&
        viewsCount == other.viewsCount &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, viewsCount.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPartialFolderFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('rating', rating)
          ..add('likesCount', likesCount)
          ..add('viewsCount', viewsCount)
          ..add('user', user))
        .toString();
  }
}

class GPartialFolderFieldsDataBuilder
    implements
        Builder<GPartialFolderFieldsData, GPartialFolderFieldsDataBuilder> {
  _$GPartialFolderFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _viewsCount;
  int? get viewsCount => _$this._viewsCount;
  set viewsCount(int? viewsCount) => _$this._viewsCount = viewsCount;

  GPartialFolderFieldsData_userBuilder? _user;
  GPartialFolderFieldsData_userBuilder get user =>
      _$this._user ??= new GPartialFolderFieldsData_userBuilder();
  set user(GPartialFolderFieldsData_userBuilder? user) => _$this._user = user;

  GPartialFolderFieldsDataBuilder() {
    GPartialFolderFieldsData._initializeBuilder(this);
  }

  GPartialFolderFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _rating = $v.rating;
      _likesCount = $v.likesCount;
      _viewsCount = $v.viewsCount;
      _user = $v.user.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPartialFolderFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialFolderFieldsData;
  }

  @override
  void update(void Function(GPartialFolderFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialFolderFieldsData build() => _build();

  _$GPartialFolderFieldsData _build() {
    _$GPartialFolderFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GPartialFolderFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPartialFolderFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPartialFolderFieldsData', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GPartialFolderFieldsData', 'title'),
              rating: BuiltValueNullFieldError.checkNotNull(
                  rating, r'GPartialFolderFieldsData', 'rating'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GPartialFolderFieldsData', 'likesCount'),
              viewsCount: BuiltValueNullFieldError.checkNotNull(
                  viewsCount, r'GPartialFolderFieldsData', 'viewsCount'),
              user: user.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPartialFolderFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPartialFolderFieldsData_user extends GPartialFolderFieldsData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GPartialFolderFieldsData_user(
          [void Function(GPartialFolderFieldsData_userBuilder)? updates]) =>
      (new GPartialFolderFieldsData_userBuilder()..update(updates))._build();

  _$GPartialFolderFieldsData_user._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialFolderFieldsData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialFolderFieldsData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GPartialFolderFieldsData_user', 'name');
  }

  @override
  GPartialFolderFieldsData_user rebuild(
          void Function(GPartialFolderFieldsData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialFolderFieldsData_userBuilder toBuilder() =>
      new GPartialFolderFieldsData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialFolderFieldsData_user &&
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
    return (newBuiltValueToStringHelper(r'GPartialFolderFieldsData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GPartialFolderFieldsData_userBuilder
    implements
        Builder<GPartialFolderFieldsData_user,
            GPartialFolderFieldsData_userBuilder> {
  _$GPartialFolderFieldsData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPartialFolderFieldsData_userBuilder() {
    GPartialFolderFieldsData_user._initializeBuilder(this);
  }

  GPartialFolderFieldsData_userBuilder get _$this {
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
  void replace(GPartialFolderFieldsData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialFolderFieldsData_user;
  }

  @override
  void update(void Function(GPartialFolderFieldsData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialFolderFieldsData_user build() => _build();

  _$GPartialFolderFieldsData_user _build() {
    final _$result = _$v ??
        new _$GPartialFolderFieldsData_user._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPartialFolderFieldsData_user', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialFolderFieldsData_user', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GPartialFolderFieldsData_user', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
