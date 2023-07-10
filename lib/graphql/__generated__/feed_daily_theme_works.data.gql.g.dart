// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_daily_theme_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDailyThemeData> _$gDailyThemeDataSerializer =
    new _$GDailyThemeDataSerializer();
Serializer<GDailyThemeData_dailyTheme> _$gDailyThemeDataDailyThemeSerializer =
    new _$GDailyThemeData_dailyThemeSerializer();
Serializer<GDailyThemeData_dailyTheme_works>
    _$gDailyThemeDataDailyThemeWorksSerializer =
    new _$GDailyThemeData_dailyTheme_worksSerializer();
Serializer<GDailyThemeData_dailyTheme_works_thumbnailImage>
    _$gDailyThemeDataDailyThemeWorksThumbnailImageSerializer =
    new _$GDailyThemeData_dailyTheme_works_thumbnailImageSerializer();
Serializer<GDailyThemeData_dailyTheme_works_user>
    _$gDailyThemeDataDailyThemeWorksUserSerializer =
    new _$GDailyThemeData_dailyTheme_works_userSerializer();
Serializer<GDailyThemeData_dailyTheme_works_user_iconImage>
    _$gDailyThemeDataDailyThemeWorksUserIconImageSerializer =
    new _$GDailyThemeData_dailyTheme_works_user_iconImageSerializer();
Serializer<GDailyThemeData_dailyTheme_works_viewer>
    _$gDailyThemeDataDailyThemeWorksViewerSerializer =
    new _$GDailyThemeData_dailyTheme_works_viewerSerializer();

class _$GDailyThemeDataSerializer
    implements StructuredSerializer<GDailyThemeData> {
  @override
  final Iterable<Type> types = const [GDailyThemeData, _$GDailyThemeData];
  @override
  final String wireName = 'GDailyThemeData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDailyThemeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.dailyTheme;
    if (value != null) {
      result
        ..add('dailyTheme')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDailyThemeData_dailyTheme)));
    }
    return result;
  }

  @override
  GDailyThemeData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeDataBuilder();

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
        case 'dailyTheme':
          result.dailyTheme.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GDailyThemeData_dailyTheme))!
              as GDailyThemeData_dailyTheme);
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemeData_dailyThemeSerializer
    implements StructuredSerializer<GDailyThemeData_dailyTheme> {
  @override
  final Iterable<Type> types = const [
    GDailyThemeData_dailyTheme,
    _$GDailyThemeData_dailyTheme
  ];
  @override
  final String wireName = 'GDailyThemeData_dailyTheme';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDailyThemeData_dailyTheme object,
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
      'works',
      serializers.serialize(object.works,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GDailyThemeData_dailyTheme_works)])),
    ];

    return result;
  }

  @override
  GDailyThemeData_dailyTheme deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeData_dailyThemeBuilder();

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
        case 'works':
          result.works.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GDailyThemeData_dailyTheme_works)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemeData_dailyTheme_worksSerializer
    implements StructuredSerializer<GDailyThemeData_dailyTheme_works> {
  @override
  final Iterable<Type> types = const [
    GDailyThemeData_dailyTheme_works,
    _$GDailyThemeData_dailyTheme_works
  ];
  @override
  final String wireName = 'GDailyThemeData_dailyTheme_works';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDailyThemeData_dailyTheme_works object,
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
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(GDailyThemeData_dailyTheme_works_user)),
      'viewer',
      serializers.serialize(object.viewer,
          specifiedType:
              const FullType(GDailyThemeData_dailyTheme_works_viewer)),
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GDailyThemeData_dailyTheme_works_thumbnailImage)));
    }
    return result;
  }

  @override
  GDailyThemeData_dailyTheme_works deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeData_dailyTheme_worksBuilder();

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
                  specifiedType: const FullType(
                      GDailyThemeData_dailyTheme_works_thumbnailImage))!
              as GDailyThemeData_dailyTheme_works_thumbnailImage);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GDailyThemeData_dailyTheme_works_user))!
              as GDailyThemeData_dailyTheme_works_user);
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GDailyThemeData_dailyTheme_works_viewer))!
              as GDailyThemeData_dailyTheme_works_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemeData_dailyTheme_works_thumbnailImageSerializer
    implements
        StructuredSerializer<GDailyThemeData_dailyTheme_works_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GDailyThemeData_dailyTheme_works_thumbnailImage,
    _$GDailyThemeData_dailyTheme_works_thumbnailImage
  ];
  @override
  final String wireName = 'GDailyThemeData_dailyTheme_works_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GDailyThemeData_dailyTheme_works_thumbnailImage object,
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
  GDailyThemeData_dailyTheme_works_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeData_dailyTheme_works_thumbnailImageBuilder();

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

class _$GDailyThemeData_dailyTheme_works_userSerializer
    implements StructuredSerializer<GDailyThemeData_dailyTheme_works_user> {
  @override
  final Iterable<Type> types = const [
    GDailyThemeData_dailyTheme_works_user,
    _$GDailyThemeData_dailyTheme_works_user
  ];
  @override
  final String wireName = 'GDailyThemeData_dailyTheme_works_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDailyThemeData_dailyTheme_works_user object,
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
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GDailyThemeData_dailyTheme_works_user_iconImage)));
    }
    return result;
  }

  @override
  GDailyThemeData_dailyTheme_works_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeData_dailyTheme_works_userBuilder();

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
        case 'iconImage':
          result.iconImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GDailyThemeData_dailyTheme_works_user_iconImage))!
              as GDailyThemeData_dailyTheme_works_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemeData_dailyTheme_works_user_iconImageSerializer
    implements
        StructuredSerializer<GDailyThemeData_dailyTheme_works_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GDailyThemeData_dailyTheme_works_user_iconImage,
    _$GDailyThemeData_dailyTheme_works_user_iconImage
  ];
  @override
  final String wireName = 'GDailyThemeData_dailyTheme_works_user_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GDailyThemeData_dailyTheme_works_user_iconImage object,
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
  GDailyThemeData_dailyTheme_works_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeData_dailyTheme_works_user_iconImageBuilder();

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

class _$GDailyThemeData_dailyTheme_works_viewerSerializer
    implements StructuredSerializer<GDailyThemeData_dailyTheme_works_viewer> {
  @override
  final Iterable<Type> types = const [
    GDailyThemeData_dailyTheme_works_viewer,
    _$GDailyThemeData_dailyTheme_works_viewer
  ];
  @override
  final String wireName = 'GDailyThemeData_dailyTheme_works_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDailyThemeData_dailyTheme_works_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
      'isBookmarked',
      serializers.serialize(object.isBookmarked,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GDailyThemeData_dailyTheme_works_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDailyThemeData_dailyTheme_works_viewerBuilder();

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
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isBookmarked':
          result.isBookmarked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GDailyThemeData extends GDailyThemeData {
  @override
  final String G__typename;
  @override
  final GDailyThemeData_dailyTheme? dailyTheme;

  factory _$GDailyThemeData([void Function(GDailyThemeDataBuilder)? updates]) =>
      (new GDailyThemeDataBuilder()..update(updates))._build();

  _$GDailyThemeData._({required this.G__typename, this.dailyTheme})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemeData', 'G__typename');
  }

  @override
  GDailyThemeData rebuild(void Function(GDailyThemeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeDataBuilder toBuilder() =>
      new GDailyThemeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeData &&
        G__typename == other.G__typename &&
        dailyTheme == other.dailyTheme;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, dailyTheme.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDailyThemeData')
          ..add('G__typename', G__typename)
          ..add('dailyTheme', dailyTheme))
        .toString();
  }
}

class GDailyThemeDataBuilder
    implements Builder<GDailyThemeData, GDailyThemeDataBuilder> {
  _$GDailyThemeData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDailyThemeData_dailyThemeBuilder? _dailyTheme;
  GDailyThemeData_dailyThemeBuilder get dailyTheme =>
      _$this._dailyTheme ??= new GDailyThemeData_dailyThemeBuilder();
  set dailyTheme(GDailyThemeData_dailyThemeBuilder? dailyTheme) =>
      _$this._dailyTheme = dailyTheme;

  GDailyThemeDataBuilder() {
    GDailyThemeData._initializeBuilder(this);
  }

  GDailyThemeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _dailyTheme = $v.dailyTheme?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeData;
  }

  @override
  void update(void Function(GDailyThemeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeData build() => _build();

  _$GDailyThemeData _build() {
    _$GDailyThemeData _$result;
    try {
      _$result = _$v ??
          new _$GDailyThemeData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDailyThemeData', 'G__typename'),
              dailyTheme: _dailyTheme?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dailyTheme';
        _dailyTheme?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDailyThemeData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemeData_dailyTheme extends GDailyThemeData_dailyTheme {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final BuiltList<GDailyThemeData_dailyTheme_works> works;

  factory _$GDailyThemeData_dailyTheme(
          [void Function(GDailyThemeData_dailyThemeBuilder)? updates]) =>
      (new GDailyThemeData_dailyThemeBuilder()..update(updates))._build();

  _$GDailyThemeData_dailyTheme._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.works})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemeData_dailyTheme', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemeData_dailyTheme', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GDailyThemeData_dailyTheme', 'title');
    BuiltValueNullFieldError.checkNotNull(
        works, r'GDailyThemeData_dailyTheme', 'works');
  }

  @override
  GDailyThemeData_dailyTheme rebuild(
          void Function(GDailyThemeData_dailyThemeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeData_dailyThemeBuilder toBuilder() =>
      new GDailyThemeData_dailyThemeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeData_dailyTheme &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        works == other.works;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, works.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDailyThemeData_dailyTheme')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('works', works))
        .toString();
  }
}

class GDailyThemeData_dailyThemeBuilder
    implements
        Builder<GDailyThemeData_dailyTheme, GDailyThemeData_dailyThemeBuilder> {
  _$GDailyThemeData_dailyTheme? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<GDailyThemeData_dailyTheme_works>? _works;
  ListBuilder<GDailyThemeData_dailyTheme_works> get works =>
      _$this._works ??= new ListBuilder<GDailyThemeData_dailyTheme_works>();
  set works(ListBuilder<GDailyThemeData_dailyTheme_works>? works) =>
      _$this._works = works;

  GDailyThemeData_dailyThemeBuilder() {
    GDailyThemeData_dailyTheme._initializeBuilder(this);
  }

  GDailyThemeData_dailyThemeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _works = $v.works.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemeData_dailyTheme other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeData_dailyTheme;
  }

  @override
  void update(void Function(GDailyThemeData_dailyThemeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeData_dailyTheme build() => _build();

  _$GDailyThemeData_dailyTheme _build() {
    _$GDailyThemeData_dailyTheme _$result;
    try {
      _$result = _$v ??
          new _$GDailyThemeData_dailyTheme._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDailyThemeData_dailyTheme', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GDailyThemeData_dailyTheme', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GDailyThemeData_dailyTheme', 'title'),
              works: works.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        works.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDailyThemeData_dailyTheme', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemeData_dailyTheme_works
    extends GDailyThemeData_dailyTheme_works {
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
  final GDailyThemeData_dailyTheme_works_thumbnailImage? thumbnailImage;
  @override
  final GDailyThemeData_dailyTheme_works_user user;
  @override
  final GDailyThemeData_dailyTheme_works_viewer viewer;

  factory _$GDailyThemeData_dailyTheme_works(
          [void Function(GDailyThemeData_dailyTheme_worksBuilder)? updates]) =>
      (new GDailyThemeData_dailyTheme_worksBuilder()..update(updates))._build();

  _$GDailyThemeData_dailyTheme_works._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage,
      required this.user,
      required this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemeData_dailyTheme_works', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemeData_dailyTheme_works', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GDailyThemeData_dailyTheme_works', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GDailyThemeData_dailyTheme_works', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GDailyThemeData_dailyTheme_works', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GDailyThemeData_dailyTheme_works', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GDailyThemeData_dailyTheme_works', 'user');
    BuiltValueNullFieldError.checkNotNull(
        viewer, r'GDailyThemeData_dailyTheme_works', 'viewer');
  }

  @override
  GDailyThemeData_dailyTheme_works rebuild(
          void Function(GDailyThemeData_dailyTheme_worksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeData_dailyTheme_worksBuilder toBuilder() =>
      new GDailyThemeData_dailyTheme_worksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeData_dailyTheme_works &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        thumbnailImage == other.thumbnailImage &&
        user == other.user &&
        viewer == other.viewer;
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
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDailyThemeData_dailyTheme_works')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('thumbnailImage', thumbnailImage)
          ..add('user', user)
          ..add('viewer', viewer))
        .toString();
  }
}

class GDailyThemeData_dailyTheme_worksBuilder
    implements
        Builder<GDailyThemeData_dailyTheme_works,
            GDailyThemeData_dailyTheme_worksBuilder> {
  _$GDailyThemeData_dailyTheme_works? _$v;

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

  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder? _thumbnailImage;
  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GDailyThemeData_dailyTheme_works_thumbnailImageBuilder();
  set thumbnailImage(
          GDailyThemeData_dailyTheme_works_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GDailyThemeData_dailyTheme_works_userBuilder? _user;
  GDailyThemeData_dailyTheme_works_userBuilder get user =>
      _$this._user ??= new GDailyThemeData_dailyTheme_works_userBuilder();
  set user(GDailyThemeData_dailyTheme_works_userBuilder? user) =>
      _$this._user = user;

  GDailyThemeData_dailyTheme_works_viewerBuilder? _viewer;
  GDailyThemeData_dailyTheme_works_viewerBuilder get viewer =>
      _$this._viewer ??= new GDailyThemeData_dailyTheme_works_viewerBuilder();
  set viewer(GDailyThemeData_dailyTheme_works_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GDailyThemeData_dailyTheme_worksBuilder() {
    GDailyThemeData_dailyTheme_works._initializeBuilder(this);
  }

  GDailyThemeData_dailyTheme_worksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _user = $v.user.toBuilder();
      _viewer = $v.viewer.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemeData_dailyTheme_works other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeData_dailyTheme_works;
  }

  @override
  void update(void Function(GDailyThemeData_dailyTheme_worksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeData_dailyTheme_works build() => _build();

  _$GDailyThemeData_dailyTheme_works _build() {
    _$GDailyThemeData_dailyTheme_works _$result;
    try {
      _$result = _$v ??
          new _$GDailyThemeData_dailyTheme_works._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GDailyThemeData_dailyTheme_works', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GDailyThemeData_dailyTheme_works', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GDailyThemeData_dailyTheme_works', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(likesCount,
                  r'GDailyThemeData_dailyTheme_works', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount,
                  r'GDailyThemeData_dailyTheme_works',
                  'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GDailyThemeData_dailyTheme_works', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build(),
              user: user.build(),
              viewer: viewer.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
        _$failedField = 'user';
        user.build();
        _$failedField = 'viewer';
        viewer.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDailyThemeData_dailyTheme_works', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemeData_dailyTheme_works_thumbnailImage
    extends GDailyThemeData_dailyTheme_works_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GDailyThemeData_dailyTheme_works_thumbnailImage(
          [void Function(
                  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder)?
              updates]) =>
      (new GDailyThemeData_dailyTheme_works_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GDailyThemeData_dailyTheme_works_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GDailyThemeData_dailyTheme_works_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemeData_dailyTheme_works_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GDailyThemeData_dailyTheme_works_thumbnailImage', 'downloadURL');
  }

  @override
  GDailyThemeData_dailyTheme_works_thumbnailImage rebuild(
          void Function(GDailyThemeData_dailyTheme_works_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder toBuilder() =>
      new GDailyThemeData_dailyTheme_works_thumbnailImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeData_dailyTheme_works_thumbnailImage &&
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
            r'GDailyThemeData_dailyTheme_works_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GDailyThemeData_dailyTheme_works_thumbnailImageBuilder
    implements
        Builder<GDailyThemeData_dailyTheme_works_thumbnailImage,
            GDailyThemeData_dailyTheme_works_thumbnailImageBuilder> {
  _$GDailyThemeData_dailyTheme_works_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder() {
    GDailyThemeData_dailyTheme_works_thumbnailImage._initializeBuilder(this);
  }

  GDailyThemeData_dailyTheme_works_thumbnailImageBuilder get _$this {
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
  void replace(GDailyThemeData_dailyTheme_works_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeData_dailyTheme_works_thumbnailImage;
  }

  @override
  void update(
      void Function(GDailyThemeData_dailyTheme_works_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeData_dailyTheme_works_thumbnailImage build() => _build();

  _$GDailyThemeData_dailyTheme_works_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GDailyThemeData_dailyTheme_works_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GDailyThemeData_dailyTheme_works_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDailyThemeData_dailyTheme_works_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GDailyThemeData_dailyTheme_works_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemeData_dailyTheme_works_user
    extends GDailyThemeData_dailyTheme_works_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GDailyThemeData_dailyTheme_works_user_iconImage? iconImage;

  factory _$GDailyThemeData_dailyTheme_works_user(
          [void Function(GDailyThemeData_dailyTheme_works_userBuilder)?
              updates]) =>
      (new GDailyThemeData_dailyTheme_works_userBuilder()..update(updates))
          ._build();

  _$GDailyThemeData_dailyTheme_works_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemeData_dailyTheme_works_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemeData_dailyTheme_works_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GDailyThemeData_dailyTheme_works_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GDailyThemeData_dailyTheme_works_user', 'name');
  }

  @override
  GDailyThemeData_dailyTheme_works_user rebuild(
          void Function(GDailyThemeData_dailyTheme_works_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeData_dailyTheme_works_userBuilder toBuilder() =>
      new GDailyThemeData_dailyTheme_works_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeData_dailyTheme_works_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        login == other.login &&
        name == other.name &&
        iconImage == other.iconImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GDailyThemeData_dailyTheme_works_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GDailyThemeData_dailyTheme_works_userBuilder
    implements
        Builder<GDailyThemeData_dailyTheme_works_user,
            GDailyThemeData_dailyTheme_works_userBuilder> {
  _$GDailyThemeData_dailyTheme_works_user? _$v;

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

  GDailyThemeData_dailyTheme_works_user_iconImageBuilder? _iconImage;
  GDailyThemeData_dailyTheme_works_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GDailyThemeData_dailyTheme_works_user_iconImageBuilder();
  set iconImage(
          GDailyThemeData_dailyTheme_works_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GDailyThemeData_dailyTheme_works_userBuilder() {
    GDailyThemeData_dailyTheme_works_user._initializeBuilder(this);
  }

  GDailyThemeData_dailyTheme_works_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _login = $v.login;
      _name = $v.name;
      _iconImage = $v.iconImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemeData_dailyTheme_works_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeData_dailyTheme_works_user;
  }

  @override
  void update(
      void Function(GDailyThemeData_dailyTheme_works_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeData_dailyTheme_works_user build() => _build();

  _$GDailyThemeData_dailyTheme_works_user _build() {
    _$GDailyThemeData_dailyTheme_works_user _$result;
    try {
      _$result = _$v ??
          new _$GDailyThemeData_dailyTheme_works_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GDailyThemeData_dailyTheme_works_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GDailyThemeData_dailyTheme_works_user', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GDailyThemeData_dailyTheme_works_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GDailyThemeData_dailyTheme_works_user', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDailyThemeData_dailyTheme_works_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemeData_dailyTheme_works_user_iconImage
    extends GDailyThemeData_dailyTheme_works_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GDailyThemeData_dailyTheme_works_user_iconImage(
          [void Function(
                  GDailyThemeData_dailyTheme_works_user_iconImageBuilder)?
              updates]) =>
      (new GDailyThemeData_dailyTheme_works_user_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GDailyThemeData_dailyTheme_works_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GDailyThemeData_dailyTheme_works_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemeData_dailyTheme_works_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GDailyThemeData_dailyTheme_works_user_iconImage', 'downloadURL');
  }

  @override
  GDailyThemeData_dailyTheme_works_user_iconImage rebuild(
          void Function(GDailyThemeData_dailyTheme_works_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeData_dailyTheme_works_user_iconImageBuilder toBuilder() =>
      new GDailyThemeData_dailyTheme_works_user_iconImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeData_dailyTheme_works_user_iconImage &&
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
            r'GDailyThemeData_dailyTheme_works_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GDailyThemeData_dailyTheme_works_user_iconImageBuilder
    implements
        Builder<GDailyThemeData_dailyTheme_works_user_iconImage,
            GDailyThemeData_dailyTheme_works_user_iconImageBuilder> {
  _$GDailyThemeData_dailyTheme_works_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GDailyThemeData_dailyTheme_works_user_iconImageBuilder() {
    GDailyThemeData_dailyTheme_works_user_iconImage._initializeBuilder(this);
  }

  GDailyThemeData_dailyTheme_works_user_iconImageBuilder get _$this {
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
  void replace(GDailyThemeData_dailyTheme_works_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeData_dailyTheme_works_user_iconImage;
  }

  @override
  void update(
      void Function(GDailyThemeData_dailyTheme_works_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeData_dailyTheme_works_user_iconImage build() => _build();

  _$GDailyThemeData_dailyTheme_works_user_iconImage _build() {
    final _$result = _$v ??
        new _$GDailyThemeData_dailyTheme_works_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GDailyThemeData_dailyTheme_works_user_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDailyThemeData_dailyTheme_works_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GDailyThemeData_dailyTheme_works_user_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GDailyThemeData_dailyTheme_works_viewer
    extends GDailyThemeData_dailyTheme_works_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isLiked;
  @override
  final bool isBookmarked;

  factory _$GDailyThemeData_dailyTheme_works_viewer(
          [void Function(GDailyThemeData_dailyTheme_works_viewerBuilder)?
              updates]) =>
      (new GDailyThemeData_dailyTheme_works_viewerBuilder()..update(updates))
          ._build();

  _$GDailyThemeData_dailyTheme_works_viewer._(
      {required this.G__typename,
      required this.id,
      required this.isLiked,
      required this.isBookmarked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDailyThemeData_dailyTheme_works_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDailyThemeData_dailyTheme_works_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GDailyThemeData_dailyTheme_works_viewer', 'isLiked');
    BuiltValueNullFieldError.checkNotNull(isBookmarked,
        r'GDailyThemeData_dailyTheme_works_viewer', 'isBookmarked');
  }

  @override
  GDailyThemeData_dailyTheme_works_viewer rebuild(
          void Function(GDailyThemeData_dailyTheme_works_viewerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDailyThemeData_dailyTheme_works_viewerBuilder toBuilder() =>
      new GDailyThemeData_dailyTheme_works_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDailyThemeData_dailyTheme_works_viewer &&
        G__typename == other.G__typename &&
        id == other.id &&
        isLiked == other.isLiked &&
        isBookmarked == other.isBookmarked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jc(_$hash, isBookmarked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GDailyThemeData_dailyTheme_works_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isLiked', isLiked)
          ..add('isBookmarked', isBookmarked))
        .toString();
  }
}

class GDailyThemeData_dailyTheme_works_viewerBuilder
    implements
        Builder<GDailyThemeData_dailyTheme_works_viewer,
            GDailyThemeData_dailyTheme_works_viewerBuilder> {
  _$GDailyThemeData_dailyTheme_works_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  bool? _isBookmarked;
  bool? get isBookmarked => _$this._isBookmarked;
  set isBookmarked(bool? isBookmarked) => _$this._isBookmarked = isBookmarked;

  GDailyThemeData_dailyTheme_works_viewerBuilder() {
    GDailyThemeData_dailyTheme_works_viewer._initializeBuilder(this);
  }

  GDailyThemeData_dailyTheme_works_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isLiked = $v.isLiked;
      _isBookmarked = $v.isBookmarked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDailyThemeData_dailyTheme_works_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDailyThemeData_dailyTheme_works_viewer;
  }

  @override
  void update(
      void Function(GDailyThemeData_dailyTheme_works_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDailyThemeData_dailyTheme_works_viewer build() => _build();

  _$GDailyThemeData_dailyTheme_works_viewer _build() {
    final _$result = _$v ??
        new _$GDailyThemeData_dailyTheme_works_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GDailyThemeData_dailyTheme_works_viewer', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDailyThemeData_dailyTheme_works_viewer', 'id'),
            isLiked: BuiltValueNullFieldError.checkNotNull(
                isLiked, r'GDailyThemeData_dailyTheme_works_viewer', 'isLiked'),
            isBookmarked: BuiltValueNullFieldError.checkNotNull(isBookmarked,
                r'GDailyThemeData_dailyTheme_works_viewer', 'isBookmarked'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
