// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_daily_theme_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFeedDailyThemeWorksData> _$gFeedDailyThemeWorksDataSerializer =
    new _$GFeedDailyThemeWorksDataSerializer();
Serializer<GFeedDailyThemeWorksData_dailyTheme>
    _$gFeedDailyThemeWorksDataDailyThemeSerializer =
    new _$GFeedDailyThemeWorksData_dailyThemeSerializer();
Serializer<GFeedDailyThemeWorksData_dailyTheme_works>
    _$gFeedDailyThemeWorksDataDailyThemeWorksSerializer =
    new _$GFeedDailyThemeWorksData_dailyTheme_worksSerializer();
Serializer<GFeedDailyThemeWorksData_dailyTheme_works_image>
    _$gFeedDailyThemeWorksDataDailyThemeWorksImageSerializer =
    new _$GFeedDailyThemeWorksData_dailyTheme_works_imageSerializer();
Serializer<GFeedDailyThemeWorksData_dailyTheme_works_user>
    _$gFeedDailyThemeWorksDataDailyThemeWorksUserSerializer =
    new _$GFeedDailyThemeWorksData_dailyTheme_works_userSerializer();
Serializer<GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage>
    _$gFeedDailyThemeWorksDataDailyThemeWorksUserIconImageSerializer =
    new _$GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageSerializer();
Serializer<GFeedDailyThemeWorksData_dailyTheme_works_viewer>
    _$gFeedDailyThemeWorksDataDailyThemeWorksViewerSerializer =
    new _$GFeedDailyThemeWorksData_dailyTheme_works_viewerSerializer();

class _$GFeedDailyThemeWorksDataSerializer
    implements StructuredSerializer<GFeedDailyThemeWorksData> {
  @override
  final Iterable<Type> types = const [
    GFeedDailyThemeWorksData,
    _$GFeedDailyThemeWorksData
  ];
  @override
  final String wireName = 'GFeedDailyThemeWorksData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedDailyThemeWorksData object,
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
            specifiedType:
                const FullType(GFeedDailyThemeWorksData_dailyTheme)));
    }
    return result;
  }

  @override
  GFeedDailyThemeWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedDailyThemeWorksDataBuilder();

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
                  specifiedType:
                      const FullType(GFeedDailyThemeWorksData_dailyTheme))!
              as GFeedDailyThemeWorksData_dailyTheme);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedDailyThemeWorksData_dailyThemeSerializer
    implements StructuredSerializer<GFeedDailyThemeWorksData_dailyTheme> {
  @override
  final Iterable<Type> types = const [
    GFeedDailyThemeWorksData_dailyTheme,
    _$GFeedDailyThemeWorksData_dailyTheme
  ];
  @override
  final String wireName = 'GFeedDailyThemeWorksData_dailyTheme';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedDailyThemeWorksData_dailyTheme object,
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
          specifiedType: const FullType(BuiltList, const [
            const FullType(GFeedDailyThemeWorksData_dailyTheme_works)
          ])),
    ];

    return result;
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedDailyThemeWorksData_dailyThemeBuilder();

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
                const FullType(GFeedDailyThemeWorksData_dailyTheme_works)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedDailyThemeWorksData_dailyTheme_worksSerializer
    implements StructuredSerializer<GFeedDailyThemeWorksData_dailyTheme_works> {
  @override
  final Iterable<Type> types = const [
    GFeedDailyThemeWorksData_dailyTheme_works,
    _$GFeedDailyThemeWorksData_dailyTheme_works
  ];
  @override
  final String wireName = 'GFeedDailyThemeWorksData_dailyTheme_works';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFeedDailyThemeWorksData_dailyTheme_works object,
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
      'user',
      serializers.serialize(object.user,
          specifiedType:
              const FullType(GFeedDailyThemeWorksData_dailyTheme_works_user)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GFeedDailyThemeWorksData_dailyTheme_works_image)));
    }
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GFeedDailyThemeWorksData_dailyTheme_works_viewer)));
    }
    return result;
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedDailyThemeWorksData_dailyTheme_worksBuilder();

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
        case 'imageAspectRatio':
          result.imageAspectRatio = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GFeedDailyThemeWorksData_dailyTheme_works_image))!
              as GFeedDailyThemeWorksData_dailyTheme_works_image);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GFeedDailyThemeWorksData_dailyTheme_works_user))!
              as GFeedDailyThemeWorksData_dailyTheme_works_user);
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GFeedDailyThemeWorksData_dailyTheme_works_viewer))!
              as GFeedDailyThemeWorksData_dailyTheme_works_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedDailyThemeWorksData_dailyTheme_works_imageSerializer
    implements
        StructuredSerializer<GFeedDailyThemeWorksData_dailyTheme_works_image> {
  @override
  final Iterable<Type> types = const [
    GFeedDailyThemeWorksData_dailyTheme_works_image,
    _$GFeedDailyThemeWorksData_dailyTheme_works_image
  ];
  @override
  final String wireName = 'GFeedDailyThemeWorksData_dailyTheme_works_image';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFeedDailyThemeWorksData_dailyTheme_works_image object,
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
  GFeedDailyThemeWorksData_dailyTheme_works_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder();

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

class _$GFeedDailyThemeWorksData_dailyTheme_works_userSerializer
    implements
        StructuredSerializer<GFeedDailyThemeWorksData_dailyTheme_works_user> {
  @override
  final Iterable<Type> types = const [
    GFeedDailyThemeWorksData_dailyTheme_works_user,
    _$GFeedDailyThemeWorksData_dailyTheme_works_user
  ];
  @override
  final String wireName = 'GFeedDailyThemeWorksData_dailyTheme_works_user';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFeedDailyThemeWorksData_dailyTheme_works_user object,
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
                GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage)));
    }
    return result;
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedDailyThemeWorksData_dailyTheme_works_userBuilder();

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
                      GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage))!
              as GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageSerializer
    implements
        StructuredSerializer<
            GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage,
    _$GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage
  ];
  @override
  final String wireName =
      'GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage object,
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
  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder();

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

class _$GFeedDailyThemeWorksData_dailyTheme_works_viewerSerializer
    implements
        StructuredSerializer<GFeedDailyThemeWorksData_dailyTheme_works_viewer> {
  @override
  final Iterable<Type> types = const [
    GFeedDailyThemeWorksData_dailyTheme_works_viewer,
    _$GFeedDailyThemeWorksData_dailyTheme_works_viewer
  ];
  @override
  final String wireName = 'GFeedDailyThemeWorksData_dailyTheme_works_viewer';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GFeedDailyThemeWorksData_dailyTheme_works_viewer object,
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
  GFeedDailyThemeWorksData_dailyTheme_works_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder();

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

class _$GFeedDailyThemeWorksData extends GFeedDailyThemeWorksData {
  @override
  final String G__typename;
  @override
  final GFeedDailyThemeWorksData_dailyTheme? dailyTheme;

  factory _$GFeedDailyThemeWorksData(
          [void Function(GFeedDailyThemeWorksDataBuilder)? updates]) =>
      (new GFeedDailyThemeWorksDataBuilder()..update(updates))._build();

  _$GFeedDailyThemeWorksData._({required this.G__typename, this.dailyTheme})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedDailyThemeWorksData', 'G__typename');
  }

  @override
  GFeedDailyThemeWorksData rebuild(
          void Function(GFeedDailyThemeWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedDailyThemeWorksDataBuilder toBuilder() =>
      new GFeedDailyThemeWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedDailyThemeWorksData &&
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
    return (newBuiltValueToStringHelper(r'GFeedDailyThemeWorksData')
          ..add('G__typename', G__typename)
          ..add('dailyTheme', dailyTheme))
        .toString();
  }
}

class GFeedDailyThemeWorksDataBuilder
    implements
        Builder<GFeedDailyThemeWorksData, GFeedDailyThemeWorksDataBuilder> {
  _$GFeedDailyThemeWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GFeedDailyThemeWorksData_dailyThemeBuilder? _dailyTheme;
  GFeedDailyThemeWorksData_dailyThemeBuilder get dailyTheme =>
      _$this._dailyTheme ??= new GFeedDailyThemeWorksData_dailyThemeBuilder();
  set dailyTheme(GFeedDailyThemeWorksData_dailyThemeBuilder? dailyTheme) =>
      _$this._dailyTheme = dailyTheme;

  GFeedDailyThemeWorksDataBuilder() {
    GFeedDailyThemeWorksData._initializeBuilder(this);
  }

  GFeedDailyThemeWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _dailyTheme = $v.dailyTheme?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedDailyThemeWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedDailyThemeWorksData;
  }

  @override
  void update(void Function(GFeedDailyThemeWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedDailyThemeWorksData build() => _build();

  _$GFeedDailyThemeWorksData _build() {
    _$GFeedDailyThemeWorksData _$result;
    try {
      _$result = _$v ??
          new _$GFeedDailyThemeWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFeedDailyThemeWorksData', 'G__typename'),
              dailyTheme: _dailyTheme?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dailyTheme';
        _dailyTheme?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedDailyThemeWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedDailyThemeWorksData_dailyTheme
    extends GFeedDailyThemeWorksData_dailyTheme {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final BuiltList<GFeedDailyThemeWorksData_dailyTheme_works> works;

  factory _$GFeedDailyThemeWorksData_dailyTheme(
          [void Function(GFeedDailyThemeWorksData_dailyThemeBuilder)?
              updates]) =>
      (new GFeedDailyThemeWorksData_dailyThemeBuilder()..update(updates))
          ._build();

  _$GFeedDailyThemeWorksData_dailyTheme._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.works})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GFeedDailyThemeWorksData_dailyTheme', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedDailyThemeWorksData_dailyTheme', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFeedDailyThemeWorksData_dailyTheme', 'title');
    BuiltValueNullFieldError.checkNotNull(
        works, r'GFeedDailyThemeWorksData_dailyTheme', 'works');
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme rebuild(
          void Function(GFeedDailyThemeWorksData_dailyThemeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedDailyThemeWorksData_dailyThemeBuilder toBuilder() =>
      new GFeedDailyThemeWorksData_dailyThemeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedDailyThemeWorksData_dailyTheme &&
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
    return (newBuiltValueToStringHelper(r'GFeedDailyThemeWorksData_dailyTheme')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('works', works))
        .toString();
  }
}

class GFeedDailyThemeWorksData_dailyThemeBuilder
    implements
        Builder<GFeedDailyThemeWorksData_dailyTheme,
            GFeedDailyThemeWorksData_dailyThemeBuilder> {
  _$GFeedDailyThemeWorksData_dailyTheme? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<GFeedDailyThemeWorksData_dailyTheme_works>? _works;
  ListBuilder<GFeedDailyThemeWorksData_dailyTheme_works> get works =>
      _$this._works ??=
          new ListBuilder<GFeedDailyThemeWorksData_dailyTheme_works>();
  set works(ListBuilder<GFeedDailyThemeWorksData_dailyTheme_works>? works) =>
      _$this._works = works;

  GFeedDailyThemeWorksData_dailyThemeBuilder() {
    GFeedDailyThemeWorksData_dailyTheme._initializeBuilder(this);
  }

  GFeedDailyThemeWorksData_dailyThemeBuilder get _$this {
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
  void replace(GFeedDailyThemeWorksData_dailyTheme other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedDailyThemeWorksData_dailyTheme;
  }

  @override
  void update(
      void Function(GFeedDailyThemeWorksData_dailyThemeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme build() => _build();

  _$GFeedDailyThemeWorksData_dailyTheme _build() {
    _$GFeedDailyThemeWorksData_dailyTheme _$result;
    try {
      _$result = _$v ??
          new _$GFeedDailyThemeWorksData_dailyTheme._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GFeedDailyThemeWorksData_dailyTheme', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFeedDailyThemeWorksData_dailyTheme', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GFeedDailyThemeWorksData_dailyTheme', 'title'),
              works: works.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        works.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedDailyThemeWorksData_dailyTheme',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedDailyThemeWorksData_dailyTheme_works
    extends GFeedDailyThemeWorksData_dailyTheme_works {
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
  final double imageAspectRatio;
  @override
  final GFeedDailyThemeWorksData_dailyTheme_works_image? image;
  @override
  final GFeedDailyThemeWorksData_dailyTheme_works_user user;
  @override
  final GFeedDailyThemeWorksData_dailyTheme_works_viewer? viewer;

  factory _$GFeedDailyThemeWorksData_dailyTheme_works(
          [void Function(GFeedDailyThemeWorksData_dailyTheme_worksBuilder)?
              updates]) =>
      (new GFeedDailyThemeWorksData_dailyTheme_worksBuilder()..update(updates))
          ._build();

  _$GFeedDailyThemeWorksData_dailyTheme_works._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      required this.imageAspectRatio,
      this.image,
      required this.user,
      this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFeedDailyThemeWorksData_dailyTheme_works', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedDailyThemeWorksData_dailyTheme_works', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GFeedDailyThemeWorksData_dailyTheme_works', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GFeedDailyThemeWorksData_dailyTheme_works', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(commentsCount,
        r'GFeedDailyThemeWorksData_dailyTheme_works', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GFeedDailyThemeWorksData_dailyTheme_works', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GFeedDailyThemeWorksData_dailyTheme_works', 'imageAspectRatio');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GFeedDailyThemeWorksData_dailyTheme_works', 'user');
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works rebuild(
          void Function(GFeedDailyThemeWorksData_dailyTheme_worksBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedDailyThemeWorksData_dailyTheme_worksBuilder toBuilder() =>
      new GFeedDailyThemeWorksData_dailyTheme_worksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedDailyThemeWorksData_dailyTheme_works &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        imageAspectRatio == other.imageAspectRatio &&
        image == other.image &&
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
    _$hash = $jc(_$hash, imageAspectRatio.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GFeedDailyThemeWorksData_dailyTheme_works')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('imageAspectRatio', imageAspectRatio)
          ..add('image', image)
          ..add('user', user)
          ..add('viewer', viewer))
        .toString();
  }
}

class GFeedDailyThemeWorksData_dailyTheme_worksBuilder
    implements
        Builder<GFeedDailyThemeWorksData_dailyTheme_works,
            GFeedDailyThemeWorksData_dailyTheme_worksBuilder> {
  _$GFeedDailyThemeWorksData_dailyTheme_works? _$v;

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

  double? _imageAspectRatio;
  double? get imageAspectRatio => _$this._imageAspectRatio;
  set imageAspectRatio(double? imageAspectRatio) =>
      _$this._imageAspectRatio = imageAspectRatio;

  GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder? _image;
  GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder get image =>
      _$this._image ??=
          new GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder();
  set image(GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder? image) =>
      _$this._image = image;

  GFeedDailyThemeWorksData_dailyTheme_works_userBuilder? _user;
  GFeedDailyThemeWorksData_dailyTheme_works_userBuilder get user =>
      _$this._user ??=
          new GFeedDailyThemeWorksData_dailyTheme_works_userBuilder();
  set user(GFeedDailyThemeWorksData_dailyTheme_works_userBuilder? user) =>
      _$this._user = user;

  GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder? _viewer;
  GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder get viewer =>
      _$this._viewer ??=
          new GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder();
  set viewer(GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GFeedDailyThemeWorksData_dailyTheme_worksBuilder() {
    GFeedDailyThemeWorksData_dailyTheme_works._initializeBuilder(this);
  }

  GFeedDailyThemeWorksData_dailyTheme_worksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _imageAspectRatio = $v.imageAspectRatio;
      _image = $v.image?.toBuilder();
      _user = $v.user.toBuilder();
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedDailyThemeWorksData_dailyTheme_works other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedDailyThemeWorksData_dailyTheme_works;
  }

  @override
  void update(
      void Function(GFeedDailyThemeWorksData_dailyTheme_worksBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works build() => _build();

  _$GFeedDailyThemeWorksData_dailyTheme_works _build() {
    _$GFeedDailyThemeWorksData_dailyTheme_works _$result;
    try {
      _$result = _$v ??
          new _$GFeedDailyThemeWorksData_dailyTheme_works._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GFeedDailyThemeWorksData_dailyTheme_works', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFeedDailyThemeWorksData_dailyTheme_works', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GFeedDailyThemeWorksData_dailyTheme_works', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GFeedDailyThemeWorksData_dailyTheme_works', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount, r'GFeedDailyThemeWorksData_dailyTheme_works', 'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GFeedDailyThemeWorksData_dailyTheme_works', 'createdAt'),
              imageAspectRatio: BuiltValueNullFieldError.checkNotNull(
                  imageAspectRatio, r'GFeedDailyThemeWorksData_dailyTheme_works', 'imageAspectRatio'),
              image: _image?.build(),
              user: user.build(),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
        _$failedField = 'user';
        user.build();
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedDailyThemeWorksData_dailyTheme_works',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedDailyThemeWorksData_dailyTheme_works_image
    extends GFeedDailyThemeWorksData_dailyTheme_works_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFeedDailyThemeWorksData_dailyTheme_works_image(
          [void Function(
                  GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder)?
              updates]) =>
      (new GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder()
            ..update(updates))
          ._build();

  _$GFeedDailyThemeWorksData_dailyTheme_works_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFeedDailyThemeWorksData_dailyTheme_works_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedDailyThemeWorksData_dailyTheme_works_image', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GFeedDailyThemeWorksData_dailyTheme_works_image', 'downloadURL');
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_image rebuild(
          void Function(GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder toBuilder() =>
      new GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedDailyThemeWorksData_dailyTheme_works_image &&
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
            r'GFeedDailyThemeWorksData_dailyTheme_works_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder
    implements
        Builder<GFeedDailyThemeWorksData_dailyTheme_works_image,
            GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder> {
  _$GFeedDailyThemeWorksData_dailyTheme_works_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder() {
    GFeedDailyThemeWorksData_dailyTheme_works_image._initializeBuilder(this);
  }

  GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder get _$this {
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
  void replace(GFeedDailyThemeWorksData_dailyTheme_works_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedDailyThemeWorksData_dailyTheme_works_image;
  }

  @override
  void update(
      void Function(GFeedDailyThemeWorksData_dailyTheme_works_imageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_image build() => _build();

  _$GFeedDailyThemeWorksData_dailyTheme_works_image _build() {
    final _$result = _$v ??
        new _$GFeedDailyThemeWorksData_dailyTheme_works_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFeedDailyThemeWorksData_dailyTheme_works_image',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFeedDailyThemeWorksData_dailyTheme_works_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GFeedDailyThemeWorksData_dailyTheme_works_image',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GFeedDailyThemeWorksData_dailyTheme_works_user
    extends GFeedDailyThemeWorksData_dailyTheme_works_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage? iconImage;

  factory _$GFeedDailyThemeWorksData_dailyTheme_works_user(
          [void Function(GFeedDailyThemeWorksData_dailyTheme_works_userBuilder)?
              updates]) =>
      (new GFeedDailyThemeWorksData_dailyTheme_works_userBuilder()
            ..update(updates))
          ._build();

  _$GFeedDailyThemeWorksData_dailyTheme_works_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFeedDailyThemeWorksData_dailyTheme_works_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedDailyThemeWorksData_dailyTheme_works_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GFeedDailyThemeWorksData_dailyTheme_works_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GFeedDailyThemeWorksData_dailyTheme_works_user', 'name');
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_user rebuild(
          void Function(GFeedDailyThemeWorksData_dailyTheme_works_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_userBuilder toBuilder() =>
      new GFeedDailyThemeWorksData_dailyTheme_works_userBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedDailyThemeWorksData_dailyTheme_works_user &&
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
            r'GFeedDailyThemeWorksData_dailyTheme_works_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GFeedDailyThemeWorksData_dailyTheme_works_userBuilder
    implements
        Builder<GFeedDailyThemeWorksData_dailyTheme_works_user,
            GFeedDailyThemeWorksData_dailyTheme_works_userBuilder> {
  _$GFeedDailyThemeWorksData_dailyTheme_works_user? _$v;

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

  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder? _iconImage;
  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder
      get iconImage => _$this._iconImage ??=
          new GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder();
  set iconImage(
          GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder?
              iconImage) =>
      _$this._iconImage = iconImage;

  GFeedDailyThemeWorksData_dailyTheme_works_userBuilder() {
    GFeedDailyThemeWorksData_dailyTheme_works_user._initializeBuilder(this);
  }

  GFeedDailyThemeWorksData_dailyTheme_works_userBuilder get _$this {
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
  void replace(GFeedDailyThemeWorksData_dailyTheme_works_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedDailyThemeWorksData_dailyTheme_works_user;
  }

  @override
  void update(
      void Function(GFeedDailyThemeWorksData_dailyTheme_works_userBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_user build() => _build();

  _$GFeedDailyThemeWorksData_dailyTheme_works_user _build() {
    _$GFeedDailyThemeWorksData_dailyTheme_works_user _$result;
    try {
      _$result = _$v ??
          new _$GFeedDailyThemeWorksData_dailyTheme_works_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GFeedDailyThemeWorksData_dailyTheme_works_user',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GFeedDailyThemeWorksData_dailyTheme_works_user', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(login,
                  r'GFeedDailyThemeWorksData_dailyTheme_works_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(name,
                  r'GFeedDailyThemeWorksData_dailyTheme_works_user', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GFeedDailyThemeWorksData_dailyTheme_works_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage
    extends GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage(
          [void Function(
                  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder)?
              updates]) =>
      (new GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage',
        'downloadURL');
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage rebuild(
          void Function(
                  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder toBuilder() =>
      new GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage &&
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
            r'GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder
    implements
        Builder<GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage,
            GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder> {
  _$GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder() {
    GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage._initializeBuilder(
        this);
  }

  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder get _$this {
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
  void replace(GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage;
  }

  @override
  void update(
      void Function(
              GFeedDailyThemeWorksData_dailyTheme_works_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage build() => _build();

  _$GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage _build() {
    final _$result = _$v ??
        new _$GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GFeedDailyThemeWorksData_dailyTheme_works_viewer
    extends GFeedDailyThemeWorksData_dailyTheme_works_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isLiked;
  @override
  final bool isBookmarked;

  factory _$GFeedDailyThemeWorksData_dailyTheme_works_viewer(
          [void Function(
                  GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder)?
              updates]) =>
      (new GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder()
            ..update(updates))
          ._build();

  _$GFeedDailyThemeWorksData_dailyTheme_works_viewer._(
      {required this.G__typename,
      required this.id,
      required this.isLiked,
      required this.isBookmarked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GFeedDailyThemeWorksData_dailyTheme_works_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GFeedDailyThemeWorksData_dailyTheme_works_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(isLiked,
        r'GFeedDailyThemeWorksData_dailyTheme_works_viewer', 'isLiked');
    BuiltValueNullFieldError.checkNotNull(isBookmarked,
        r'GFeedDailyThemeWorksData_dailyTheme_works_viewer', 'isBookmarked');
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_viewer rebuild(
          void Function(GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder toBuilder() =>
      new GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedDailyThemeWorksData_dailyTheme_works_viewer &&
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
            r'GFeedDailyThemeWorksData_dailyTheme_works_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isLiked', isLiked)
          ..add('isBookmarked', isBookmarked))
        .toString();
  }
}

class GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder
    implements
        Builder<GFeedDailyThemeWorksData_dailyTheme_works_viewer,
            GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder> {
  _$GFeedDailyThemeWorksData_dailyTheme_works_viewer? _$v;

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

  GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder() {
    GFeedDailyThemeWorksData_dailyTheme_works_viewer._initializeBuilder(this);
  }

  GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder get _$this {
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
  void replace(GFeedDailyThemeWorksData_dailyTheme_works_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedDailyThemeWorksData_dailyTheme_works_viewer;
  }

  @override
  void update(
      void Function(GFeedDailyThemeWorksData_dailyTheme_works_viewerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedDailyThemeWorksData_dailyTheme_works_viewer build() => _build();

  _$GFeedDailyThemeWorksData_dailyTheme_works_viewer _build() {
    final _$result = _$v ??
        new _$GFeedDailyThemeWorksData_dailyTheme_works_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GFeedDailyThemeWorksData_dailyTheme_works_viewer',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFeedDailyThemeWorksData_dailyTheme_works_viewer', 'id'),
            isLiked: BuiltValueNullFieldError.checkNotNull(isLiked,
                r'GFeedDailyThemeWorksData_dailyTheme_works_viewer', 'isLiked'),
            isBookmarked: BuiltValueNullFieldError.checkNotNull(
                isBookmarked,
                r'GFeedDailyThemeWorksData_dailyTheme_works_viewer',
                'isBookmarked'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
