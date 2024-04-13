// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GUserWorksData> _$gUserWorksDataSerializer =
    new _$GUserWorksDataSerializer();
Serializer<GUserWorksData_user> _$gUserWorksDataUserSerializer =
    new _$GUserWorksData_userSerializer();
Serializer<GUserWorksData_user_works> _$gUserWorksDataUserWorksSerializer =
    new _$GUserWorksData_user_worksSerializer();
Serializer<GUserWorksData_user_works_thumbnailImage>
    _$gUserWorksDataUserWorksThumbnailImageSerializer =
    new _$GUserWorksData_user_works_thumbnailImageSerializer();

class _$GUserWorksDataSerializer
    implements StructuredSerializer<GUserWorksData> {
  @override
  final Iterable<Type> types = const [GUserWorksData, _$GUserWorksData];
  @override
  final String wireName = 'GUserWorksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUserWorksData object,
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
            specifiedType: const FullType(GUserWorksData_user)));
    }
    return result;
  }

  @override
  GUserWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserWorksDataBuilder();

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
                  specifiedType: const FullType(GUserWorksData_user))!
              as GUserWorksData_user);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserWorksData_userSerializer
    implements StructuredSerializer<GUserWorksData_user> {
  @override
  final Iterable<Type> types = const [
    GUserWorksData_user,
    _$GUserWorksData_user
  ];
  @override
  final String wireName = 'GUserWorksData_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserWorksData_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'works',
      serializers.serialize(object.works,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GUserWorksData_user_works)])),
    ];

    return result;
  }

  @override
  GUserWorksData_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserWorksData_userBuilder();

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
        case 'works':
          result.works.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GUserWorksData_user_works)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GUserWorksData_user_worksSerializer
    implements StructuredSerializer<GUserWorksData_user_works> {
  @override
  final Iterable<Type> types = const [
    GUserWorksData_user_works,
    _$GUserWorksData_user_works
  ];
  @override
  final String wireName = 'GUserWorksData_user_works';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserWorksData_user_works object,
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
      'commentsCount',
      serializers.serialize(object.commentsCount,
          specifiedType: const FullType(int)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'imageAspectRatio',
      serializers.serialize(object.imageAspectRatio,
          specifiedType: const FullType(double)),
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GUserWorksData_user_works_thumbnailImage)));
    }
    value = object.thumbnailImagePosition;
    if (value != null) {
      result
        ..add('thumbnailImagePosition')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GUserWorksData_user_works deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserWorksData_user_worksBuilder();

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
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'commentsCount':
          result.commentsCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GUserWorksData_user_works_thumbnailImage))!
              as GUserWorksData_user_works_thumbnailImage);
          break;
        case 'thumbnailImagePosition':
          result.thumbnailImagePosition = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'imageAspectRatio':
          result.imageAspectRatio = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserWorksData_user_works_thumbnailImageSerializer
    implements StructuredSerializer<GUserWorksData_user_works_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GUserWorksData_user_works_thumbnailImage,
    _$GUserWorksData_user_works_thumbnailImage
  ];
  @override
  final String wireName = 'GUserWorksData_user_works_thumbnailImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUserWorksData_user_works_thumbnailImage object,
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
  GUserWorksData_user_works_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserWorksData_user_works_thumbnailImageBuilder();

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

class _$GUserWorksData extends GUserWorksData {
  @override
  final String G__typename;
  @override
  final GUserWorksData_user? user;

  factory _$GUserWorksData([void Function(GUserWorksDataBuilder)? updates]) =>
      (new GUserWorksDataBuilder()..update(updates))._build();

  _$GUserWorksData._({required this.G__typename, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserWorksData', 'G__typename');
  }

  @override
  GUserWorksData rebuild(void Function(GUserWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserWorksDataBuilder toBuilder() =>
      new GUserWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserWorksData &&
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
    return (newBuiltValueToStringHelper(r'GUserWorksData')
          ..add('G__typename', G__typename)
          ..add('user', user))
        .toString();
  }
}

class GUserWorksDataBuilder
    implements Builder<GUserWorksData, GUserWorksDataBuilder> {
  _$GUserWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GUserWorksData_userBuilder? _user;
  GUserWorksData_userBuilder get user =>
      _$this._user ??= new GUserWorksData_userBuilder();
  set user(GUserWorksData_userBuilder? user) => _$this._user = user;

  GUserWorksDataBuilder() {
    GUserWorksData._initializeBuilder(this);
  }

  GUserWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserWorksData;
  }

  @override
  void update(void Function(GUserWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserWorksData build() => _build();

  _$GUserWorksData _build() {
    _$GUserWorksData _$result;
    try {
      _$result = _$v ??
          new _$GUserWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserWorksData', 'G__typename'),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserWorksData_user extends GUserWorksData_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GUserWorksData_user_works> works;

  factory _$GUserWorksData_user(
          [void Function(GUserWorksData_userBuilder)? updates]) =>
      (new GUserWorksData_userBuilder()..update(updates))._build();

  _$GUserWorksData_user._(
      {required this.G__typename, required this.id, required this.works})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserWorksData_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GUserWorksData_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        works, r'GUserWorksData_user', 'works');
  }

  @override
  GUserWorksData_user rebuild(
          void Function(GUserWorksData_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserWorksData_userBuilder toBuilder() =>
      new GUserWorksData_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserWorksData_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        works == other.works;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, works.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserWorksData_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('works', works))
        .toString();
  }
}

class GUserWorksData_userBuilder
    implements Builder<GUserWorksData_user, GUserWorksData_userBuilder> {
  _$GUserWorksData_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GUserWorksData_user_works>? _works;
  ListBuilder<GUserWorksData_user_works> get works =>
      _$this._works ??= new ListBuilder<GUserWorksData_user_works>();
  set works(ListBuilder<GUserWorksData_user_works>? works) =>
      _$this._works = works;

  GUserWorksData_userBuilder() {
    GUserWorksData_user._initializeBuilder(this);
  }

  GUserWorksData_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _works = $v.works.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserWorksData_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserWorksData_user;
  }

  @override
  void update(void Function(GUserWorksData_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserWorksData_user build() => _build();

  _$GUserWorksData_user _build() {
    _$GUserWorksData_user _$result;
    try {
      _$result = _$v ??
          new _$GUserWorksData_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserWorksData_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserWorksData_user', 'id'),
              works: works.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        works.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserWorksData_user', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserWorksData_user_works extends GUserWorksData_user_works {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final int likesCount;
  @override
  final int commentsCount;
  @override
  final int createdAt;
  @override
  final GUserWorksData_user_works_thumbnailImage? thumbnailImage;
  @override
  final double? thumbnailImagePosition;
  @override
  final double imageAspectRatio;

  factory _$GUserWorksData_user_works(
          [void Function(GUserWorksData_user_worksBuilder)? updates]) =>
      (new GUserWorksData_user_worksBuilder()..update(updates))._build();

  _$GUserWorksData_user_works._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage,
      this.thumbnailImagePosition,
      required this.imageAspectRatio})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GUserWorksData_user_works', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserWorksData_user_works', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GUserWorksData_user_works', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GUserWorksData_user_works', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GUserWorksData_user_works', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GUserWorksData_user_works', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        imageAspectRatio, r'GUserWorksData_user_works', 'imageAspectRatio');
  }

  @override
  GUserWorksData_user_works rebuild(
          void Function(GUserWorksData_user_worksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserWorksData_user_worksBuilder toBuilder() =>
      new GUserWorksData_user_worksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserWorksData_user_works &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        thumbnailImage == other.thumbnailImage &&
        thumbnailImagePosition == other.thumbnailImagePosition &&
        imageAspectRatio == other.imageAspectRatio;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, commentsCount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jc(_$hash, thumbnailImagePosition.hashCode);
    _$hash = $jc(_$hash, imageAspectRatio.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUserWorksData_user_works')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('thumbnailImage', thumbnailImage)
          ..add('thumbnailImagePosition', thumbnailImagePosition)
          ..add('imageAspectRatio', imageAspectRatio))
        .toString();
  }
}

class GUserWorksData_user_worksBuilder
    implements
        Builder<GUserWorksData_user_works, GUserWorksData_user_worksBuilder> {
  _$GUserWorksData_user_works? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  int? _commentsCount;
  int? get commentsCount => _$this._commentsCount;
  set commentsCount(int? commentsCount) =>
      _$this._commentsCount = commentsCount;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  GUserWorksData_user_works_thumbnailImageBuilder? _thumbnailImage;
  GUserWorksData_user_works_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GUserWorksData_user_works_thumbnailImageBuilder();
  set thumbnailImage(
          GUserWorksData_user_works_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  double? _thumbnailImagePosition;
  double? get thumbnailImagePosition => _$this._thumbnailImagePosition;
  set thumbnailImagePosition(double? thumbnailImagePosition) =>
      _$this._thumbnailImagePosition = thumbnailImagePosition;

  double? _imageAspectRatio;
  double? get imageAspectRatio => _$this._imageAspectRatio;
  set imageAspectRatio(double? imageAspectRatio) =>
      _$this._imageAspectRatio = imageAspectRatio;

  GUserWorksData_user_worksBuilder() {
    GUserWorksData_user_works._initializeBuilder(this);
  }

  GUserWorksData_user_worksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _thumbnailImagePosition = $v.thumbnailImagePosition;
      _imageAspectRatio = $v.imageAspectRatio;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserWorksData_user_works other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserWorksData_user_works;
  }

  @override
  void update(void Function(GUserWorksData_user_worksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserWorksData_user_works build() => _build();

  _$GUserWorksData_user_works _build() {
    _$GUserWorksData_user_works _$result;
    try {
      _$result = _$v ??
          new _$GUserWorksData_user_works._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GUserWorksData_user_works', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GUserWorksData_user_works', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GUserWorksData_user_works', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GUserWorksData_user_works', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount, r'GUserWorksData_user_works', 'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GUserWorksData_user_works', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build(),
              thumbnailImagePosition: thumbnailImagePosition,
              imageAspectRatio: BuiltValueNullFieldError.checkNotNull(
                  imageAspectRatio,
                  r'GUserWorksData_user_works',
                  'imageAspectRatio'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUserWorksData_user_works', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUserWorksData_user_works_thumbnailImage
    extends GUserWorksData_user_works_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GUserWorksData_user_works_thumbnailImage(
          [void Function(GUserWorksData_user_works_thumbnailImageBuilder)?
              updates]) =>
      (new GUserWorksData_user_works_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GUserWorksData_user_works_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GUserWorksData_user_works_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GUserWorksData_user_works_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GUserWorksData_user_works_thumbnailImage', 'downloadURL');
  }

  @override
  GUserWorksData_user_works_thumbnailImage rebuild(
          void Function(GUserWorksData_user_works_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserWorksData_user_works_thumbnailImageBuilder toBuilder() =>
      new GUserWorksData_user_works_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserWorksData_user_works_thumbnailImage &&
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
            r'GUserWorksData_user_works_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GUserWorksData_user_works_thumbnailImageBuilder
    implements
        Builder<GUserWorksData_user_works_thumbnailImage,
            GUserWorksData_user_works_thumbnailImageBuilder> {
  _$GUserWorksData_user_works_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GUserWorksData_user_works_thumbnailImageBuilder() {
    GUserWorksData_user_works_thumbnailImage._initializeBuilder(this);
  }

  GUserWorksData_user_works_thumbnailImageBuilder get _$this {
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
  void replace(GUserWorksData_user_works_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUserWorksData_user_works_thumbnailImage;
  }

  @override
  void update(
      void Function(GUserWorksData_user_works_thumbnailImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUserWorksData_user_works_thumbnailImage build() => _build();

  _$GUserWorksData_user_works_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GUserWorksData_user_works_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GUserWorksData_user_works_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GUserWorksData_user_works_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GUserWorksData_user_works_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
