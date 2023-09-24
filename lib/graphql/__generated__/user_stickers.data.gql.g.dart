// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stickers.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserStickersData> _$gUserStickersDataSerializer =
    new _$GUserStickersDataSerializer();
Serializer<GUserStickersData_user> _$gUserStickersDataUserSerializer =
    new _$GUserStickersData_userSerializer();
Serializer<GUserStickersData_user_stickers>
    _$gUserStickersDataUserStickersSerializer =
    new _$GUserStickersData_user_stickersSerializer();
Serializer<GUserStickersData_user_stickers_image>
    _$gUserStickersDataUserStickersImageSerializer =
    new _$GUserStickersData_user_stickers_imageSerializer();

class _$GUserStickersDataSerializer
    implements StructuredSerializer<GUserStickersData> {
  @override
  final Iterable<Type> types = const [GUserStickersData, _$GUserStickersData];
  @override
  final String wireName = 'GUserStickersData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserStickersData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GUserStickersData_user)));
    }
    return result;
  }

  @override
  GUserStickersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserStickersDataBuilder();

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
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GUserStickersData_user))!
              as GUserStickersData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserStickersData_userSerializer
    implements StructuredSerializer<GUserStickersData_user> {
  @override
  final Iterable<Type> types = const [
    GUserStickersData_user,
    _$GUserStickersData_user
  ];
  @override
  final String wireName = 'GUserStickersData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserStickersData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'stickers',
      serializers.serialize(object.stickers,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GUserStickersData_user_stickers)])),
    ];

    return result;
  }

  @override
  GUserStickersData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserStickersData_userBuilder();

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
        case 'stickers':
          result.stickers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserStickersData_user_stickers)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserStickersData_user_stickersSerializer
    implements StructuredSerializer<GUserStickersData_user_stickers> {
  @override
  final Iterable<Type> types = const [
    GUserStickersData_user_stickers,
    _$GUserStickersData_user_stickers
  ];
  @override
  final String wireName = 'GUserStickersData_user_stickers';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserStickersData_user_stickers object,
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
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
      'downloadsCount',
      serializers.serialize(object.downloadsCount,
          specifiedType: const FullType(int)),
      'usesCount',
      serializers.serialize(object.usesCount,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GUserStickersData_user_stickers_image)));
    }
    return result;
  }

  @override
  GUserStickersData_user_stickers deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserStickersData_user_stickersBuilder();

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
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GUserStickersData_user_stickers_image))!
              as GUserStickersData_user_stickers_image);
          break;
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'downloadsCount':
          result.downloadsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'usesCount':
          result.usesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserStickersData_user_stickers_imageSerializer
    implements StructuredSerializer<GUserStickersData_user_stickers_image> {
  @override
  final Iterable<Type> types = const [
    GUserStickersData_user_stickers_image,
    _$GUserStickersData_user_stickers_image
  ];
  @override
  final String wireName = 'GUserStickersData_user_stickers_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserStickersData_user_stickers_image object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'downloadURL',
      serializers.serialize(object.downloadURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GUserStickersData_user_stickers_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserStickersData_user_stickers_imageBuilder();

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
        case 'downloadURL':
          result.downloadURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserStickersData extends GUserStickersData {
  @override
  final String G__typename;
  @override
  final GUserStickersData_user? user;

  factory _$GUserStickersData(
          [void Function(GUserStickersDataBuilder)? updates]) =>
      (new GUserStickersDataBuilder()..update(updates))._build();

  _$GUserStickersData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserStickersData', 'G__typename');
  }

  @override
  GUserStickersData rebuild(void Function(GUserStickersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserStickersDataBuilder toBuilder() =>
      new GUserStickersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserStickersData &&
        G__typename == other.G__typename &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserStickersData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GUserStickersDataBuilder
    implements Builder<GUserStickersData, GUserStickersDataBuilder> {
  _$GUserStickersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserStickersData_userBuilder? _user;
  GUserStickersData_userBuilder get user =>
      _$this._user ??= new GUserStickersData_userBuilder();
  set user(GUserStickersData_userBuilder? user) => _$this._user = user;

  GUserStickersDataBuilder() {
    GUserStickersData._initializeBuilder(this);
  }

  GUserStickersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserStickersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserStickersData;
  }

  @override
  void update(void Function(GUserStickersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserStickersData build() => _build();

  _$GUserStickersData _build() {
    _$GUserStickersData _$result;
    try {
      _$result = _$v ??
          new _$GUserStickersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserStickersData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserStickersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserStickersData_user extends GUserStickersData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GUserStickersData_user_stickers> stickers;

  factory _$GUserStickersData_user(
          [void Function(GUserStickersData_userBuilder)? updates]) =>
      (new GUserStickersData_userBuilder()..update(updates))._build();

  _$GUserStickersData_user._(
      {required this.G__typename, required this.id, required this.stickers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserStickersData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUserStickersData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        stickers, r'GUserStickersData_user', 'stickers');
  }

  @override
  GUserStickersData_user rebuild(
          void Function(GUserStickersData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserStickersData_userBuilder toBuilder() =>
      new GUserStickersData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserStickersData_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        stickers == other.stickers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, stickers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserStickersData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('stickers', stickers))
        .toString();
  }
}

class GUserStickersData_userBuilder
    implements Builder<GUserStickersData_user, GUserStickersData_userBuilder> {
  _$GUserStickersData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GUserStickersData_user_stickers>? _stickers;
  ListBuilder<GUserStickersData_user_stickers> get stickers =>
      _$this._stickers ??= new ListBuilder<GUserStickersData_user_stickers>();
  set stickers(ListBuilder<GUserStickersData_user_stickers>? stickers) =>
      _$this._stickers = stickers;

  GUserStickersData_userBuilder() {
    GUserStickersData_user._initializeBuilder(this);
  }

  GUserStickersData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _stickers = $v.stickers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserStickersData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserStickersData_user;
  }

  @override
  void update(void Function(GUserStickersData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserStickersData_user build() => _build();

  _$GUserStickersData_user _build() {
    _$GUserStickersData_user _$result;
    try {
      _$result = _$v ??
          new _$GUserStickersData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserStickersData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserStickersData_user', 'id'),
              stickers: stickers.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stickers';
        stickers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserStickersData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserStickersData_user_stickers
    extends GUserStickersData_user_stickers {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GUserStickersData_user_stickers_image? image;
  @override
  final int likesCount;
  @override
  final int downloadsCount;
  @override
  final int usesCount;

  factory _$GUserStickersData_user_stickers(
          [void Function(GUserStickersData_user_stickersBuilder)? updates]) =>
      (new GUserStickersData_user_stickersBuilder()..update(updates))._build();

  _$GUserStickersData_user_stickers._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.image,
      required this.likesCount,
      required this.downloadsCount,
      required this.usesCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserStickersData_user_stickers', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserStickersData_user_stickers', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUserStickersData_user_stickers', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GUserStickersData_user_stickers', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        downloadsCount, r'GUserStickersData_user_stickers', 'downloadsCount');
    BuiltValueNullFieldError.checkNotNull(
        usesCount, r'GUserStickersData_user_stickers', 'usesCount');
  }

  @override
  GUserStickersData_user_stickers rebuild(
          void Function(GUserStickersData_user_stickersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserStickersData_user_stickersBuilder toBuilder() =>
      new GUserStickersData_user_stickersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserStickersData_user_stickers &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        image == other.image &&
        likesCount == other.likesCount &&
        downloadsCount == other.downloadsCount &&
        usesCount == other.usesCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, downloadsCount.hashCode);
    _$hash = $jc(_$hash, usesCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserStickersData_user_stickers')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('image', image)
          ..add('likesCount', likesCount)
          ..add('downloadsCount', downloadsCount)
          ..add('usesCount', usesCount))
        .toString();
  }
}

class GUserStickersData_user_stickersBuilder
    implements
        Builder<GUserStickersData_user_stickers,
            GUserStickersData_user_stickersBuilder> {
  _$GUserStickersData_user_stickers? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GUserStickersData_user_stickers_imageBuilder? _image;
  GUserStickersData_user_stickers_imageBuilder get image =>
      _$this._image ??= new GUserStickersData_user_stickers_imageBuilder();
  set image(GUserStickersData_user_stickers_imageBuilder? image) =>
      _$this._image = image;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _downloadsCount;
  int? get downloadsCount => _$this._downloadsCount;
  set downloadsCount(int? downloadsCount) =>
      _$this._downloadsCount = downloadsCount;

  int? _usesCount;
  int? get usesCount => _$this._usesCount;
  set usesCount(int? usesCount) => _$this._usesCount = usesCount;

  GUserStickersData_user_stickersBuilder() {
    GUserStickersData_user_stickers._initializeBuilder(this);
  }

  GUserStickersData_user_stickersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _image = $v.image?.toBuilder();
      _likesCount = $v.likesCount;
      _downloadsCount = $v.downloadsCount;
      _usesCount = $v.usesCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserStickersData_user_stickers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserStickersData_user_stickers;
  }

  @override
  void update(void Function(GUserStickersData_user_stickersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserStickersData_user_stickers build() => _build();

  _$GUserStickersData_user_stickers _build() {
    _$GUserStickersData_user_stickers _$result;
    try {
      _$result = _$v ??
          new _$GUserStickersData_user_stickers._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GUserStickersData_user_stickers', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserStickersData_user_stickers', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GUserStickersData_user_stickers', 'title'),
              image: _image?.build(),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GUserStickersData_user_stickers', 'likesCount'),
              downloadsCount: BuiltValueNullFieldError.checkNotNull(
                  downloadsCount,
                  r'GUserStickersData_user_stickers',
                  'downloadsCount'),
              usesCount: BuiltValueNullFieldError.checkNotNull(
                  usesCount, r'GUserStickersData_user_stickers', 'usesCount'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserStickersData_user_stickers', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserStickersData_user_stickers_image
    extends GUserStickersData_user_stickers_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserStickersData_user_stickers_image(
          [void Function(GUserStickersData_user_stickers_imageBuilder)?
              updates]) =>
      (new GUserStickersData_user_stickers_imageBuilder()..update(updates))
          ._build();

  _$GUserStickersData_user_stickers_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserStickersData_user_stickers_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserStickersData_user_stickers_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GUserStickersData_user_stickers_image', 'downloadURL');
  }

  @override
  GUserStickersData_user_stickers_image rebuild(
          void Function(GUserStickersData_user_stickers_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserStickersData_user_stickers_imageBuilder toBuilder() =>
      new GUserStickersData_user_stickers_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserStickersData_user_stickers_image &&
        G__typename == other.G__typename &&
        id == other.id &&
        downloadURL == other.downloadURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, downloadURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GUserStickersData_user_stickers_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserStickersData_user_stickers_imageBuilder
    implements
        Builder<GUserStickersData_user_stickers_image,
            GUserStickersData_user_stickers_imageBuilder> {
  _$GUserStickersData_user_stickers_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserStickersData_user_stickers_imageBuilder() {
    GUserStickersData_user_stickers_image._initializeBuilder(this);
  }

  GUserStickersData_user_stickers_imageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _downloadURL = $v.downloadURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserStickersData_user_stickers_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserStickersData_user_stickers_image;
  }

  @override
  void update(
      void Function(GUserStickersData_user_stickers_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserStickersData_user_stickers_image build() => _build();

  _$GUserStickersData_user_stickers_image _build() {
    final _$result = _$v ??
        new _$GUserStickersData_user_stickers_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUserStickersData_user_stickers_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserStickersData_user_stickers_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GUserStickersData_user_stickers_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
