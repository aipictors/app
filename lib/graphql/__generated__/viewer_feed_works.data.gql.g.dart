// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_feed_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerFeedWorksData> _$gViewerFeedWorksDataSerializer =
    new _$GViewerFeedWorksDataSerializer();
Serializer<GViewerFeedWorksData_viewer> _$gViewerFeedWorksDataViewerSerializer =
    new _$GViewerFeedWorksData_viewerSerializer();
Serializer<GViewerFeedWorksData_viewer_feedWorks>
    _$gViewerFeedWorksDataViewerFeedWorksSerializer =
    new _$GViewerFeedWorksData_viewer_feedWorksSerializer();
Serializer<GViewerFeedWorksData_viewer_feedWorks_image>
    _$gViewerFeedWorksDataViewerFeedWorksImageSerializer =
    new _$GViewerFeedWorksData_viewer_feedWorks_imageSerializer();
Serializer<GViewerFeedWorksData_viewer_feedWorks_user>
    _$gViewerFeedWorksDataViewerFeedWorksUserSerializer =
    new _$GViewerFeedWorksData_viewer_feedWorks_userSerializer();
Serializer<GViewerFeedWorksData_viewer_feedWorks_user_iconImage>
    _$gViewerFeedWorksDataViewerFeedWorksUserIconImageSerializer =
    new _$GViewerFeedWorksData_viewer_feedWorks_user_iconImageSerializer();
Serializer<GViewerFeedWorksData_viewer_feedWorks_viewer>
    _$gViewerFeedWorksDataViewerFeedWorksViewerSerializer =
    new _$GViewerFeedWorksData_viewer_feedWorks_viewerSerializer();

class _$GViewerFeedWorksDataSerializer
    implements StructuredSerializer<GViewerFeedWorksData> {
  @override
  final Iterable<Type> types = const [
    GViewerFeedWorksData,
    _$GViewerFeedWorksData
  ];
  @override
  final String wireName = 'GViewerFeedWorksData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerFeedWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GViewerFeedWorksData_viewer)));
    }
    return result;
  }

  @override
  GViewerFeedWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFeedWorksDataBuilder();

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
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GViewerFeedWorksData_viewer))!
              as GViewerFeedWorksData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerFeedWorksData_viewerSerializer
    implements StructuredSerializer<GViewerFeedWorksData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerFeedWorksData_viewer,
    _$GViewerFeedWorksData_viewer
  ];
  @override
  final String wireName = 'GViewerFeedWorksData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerFeedWorksData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'feedWorks',
      serializers.serialize(object.feedWorks,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GViewerFeedWorksData_viewer_feedWorks)])),
    ];

    return result;
  }

  @override
  GViewerFeedWorksData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFeedWorksData_viewerBuilder();

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
        case 'feedWorks':
          result.feedWorks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GViewerFeedWorksData_viewer_feedWorks)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerFeedWorksData_viewer_feedWorksSerializer
    implements StructuredSerializer<GViewerFeedWorksData_viewer_feedWorks> {
  @override
  final Iterable<Type> types = const [
    GViewerFeedWorksData_viewer_feedWorks,
    _$GViewerFeedWorksData_viewer_feedWorks
  ];
  @override
  final String wireName = 'GViewerFeedWorksData_viewer_feedWorks';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerFeedWorksData_viewer_feedWorks object,
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
              const FullType(GViewerFeedWorksData_viewer_feedWorks_user)),
      'viewer',
      serializers.serialize(object.viewer,
          specifiedType:
              const FullType(GViewerFeedWorksData_viewer_feedWorks_viewer)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GViewerFeedWorksData_viewer_feedWorks_image)));
    }
    return result;
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFeedWorksData_viewer_feedWorksBuilder();

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
                      GViewerFeedWorksData_viewer_feedWorks_image))!
              as GViewerFeedWorksData_viewer_feedWorks_image);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GViewerFeedWorksData_viewer_feedWorks_user))!
              as GViewerFeedWorksData_viewer_feedWorks_user);
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GViewerFeedWorksData_viewer_feedWorks_viewer))!
              as GViewerFeedWorksData_viewer_feedWorks_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerFeedWorksData_viewer_feedWorks_imageSerializer
    implements
        StructuredSerializer<GViewerFeedWorksData_viewer_feedWorks_image> {
  @override
  final Iterable<Type> types = const [
    GViewerFeedWorksData_viewer_feedWorks_image,
    _$GViewerFeedWorksData_viewer_feedWorks_image
  ];
  @override
  final String wireName = 'GViewerFeedWorksData_viewer_feedWorks_image';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerFeedWorksData_viewer_feedWorks_image object,
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
  GViewerFeedWorksData_viewer_feedWorks_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFeedWorksData_viewer_feedWorks_imageBuilder();

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

class _$GViewerFeedWorksData_viewer_feedWorks_userSerializer
    implements
        StructuredSerializer<GViewerFeedWorksData_viewer_feedWorks_user> {
  @override
  final Iterable<Type> types = const [
    GViewerFeedWorksData_viewer_feedWorks_user,
    _$GViewerFeedWorksData_viewer_feedWorks_user
  ];
  @override
  final String wireName = 'GViewerFeedWorksData_viewer_feedWorks_user';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerFeedWorksData_viewer_feedWorks_user object,
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
                GViewerFeedWorksData_viewer_feedWorks_user_iconImage)));
    }
    return result;
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFeedWorksData_viewer_feedWorks_userBuilder();

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
                      GViewerFeedWorksData_viewer_feedWorks_user_iconImage))!
              as GViewerFeedWorksData_viewer_feedWorks_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerFeedWorksData_viewer_feedWorks_user_iconImageSerializer
    implements
        StructuredSerializer<
            GViewerFeedWorksData_viewer_feedWorks_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GViewerFeedWorksData_viewer_feedWorks_user_iconImage,
    _$GViewerFeedWorksData_viewer_feedWorks_user_iconImage
  ];
  @override
  final String wireName =
      'GViewerFeedWorksData_viewer_feedWorks_user_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerFeedWorksData_viewer_feedWorks_user_iconImage object,
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
  GViewerFeedWorksData_viewer_feedWorks_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder();

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

class _$GViewerFeedWorksData_viewer_feedWorks_viewerSerializer
    implements
        StructuredSerializer<GViewerFeedWorksData_viewer_feedWorks_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerFeedWorksData_viewer_feedWorks_viewer,
    _$GViewerFeedWorksData_viewer_feedWorks_viewer
  ];
  @override
  final String wireName = 'GViewerFeedWorksData_viewer_feedWorks_viewer';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerFeedWorksData_viewer_feedWorks_viewer object,
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
  GViewerFeedWorksData_viewer_feedWorks_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFeedWorksData_viewer_feedWorks_viewerBuilder();

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

class _$GViewerFeedWorksData extends GViewerFeedWorksData {
  @override
  final String G__typename;
  @override
  final GViewerFeedWorksData_viewer? viewer;

  factory _$GViewerFeedWorksData(
          [void Function(GViewerFeedWorksDataBuilder)? updates]) =>
      (new GViewerFeedWorksDataBuilder()..update(updates))._build();

  _$GViewerFeedWorksData._({required this.G__typename, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerFeedWorksData', 'G__typename');
  }

  @override
  GViewerFeedWorksData rebuild(
          void Function(GViewerFeedWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFeedWorksDataBuilder toBuilder() =>
      new GViewerFeedWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFeedWorksData &&
        G__typename == other.G__typename &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerFeedWorksData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerFeedWorksDataBuilder
    implements Builder<GViewerFeedWorksData, GViewerFeedWorksDataBuilder> {
  _$GViewerFeedWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerFeedWorksData_viewerBuilder? _viewer;
  GViewerFeedWorksData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerFeedWorksData_viewerBuilder();
  set viewer(GViewerFeedWorksData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerFeedWorksDataBuilder() {
    GViewerFeedWorksData._initializeBuilder(this);
  }

  GViewerFeedWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerFeedWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFeedWorksData;
  }

  @override
  void update(void Function(GViewerFeedWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFeedWorksData build() => _build();

  _$GViewerFeedWorksData _build() {
    _$GViewerFeedWorksData _$result;
    try {
      _$result = _$v ??
          new _$GViewerFeedWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerFeedWorksData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerFeedWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerFeedWorksData_viewer extends GViewerFeedWorksData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<GViewerFeedWorksData_viewer_feedWorks> feedWorks;

  factory _$GViewerFeedWorksData_viewer(
          [void Function(GViewerFeedWorksData_viewerBuilder)? updates]) =>
      (new GViewerFeedWorksData_viewerBuilder()..update(updates))._build();

  _$GViewerFeedWorksData_viewer._(
      {required this.G__typename, required this.feedWorks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerFeedWorksData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        feedWorks, r'GViewerFeedWorksData_viewer', 'feedWorks');
  }

  @override
  GViewerFeedWorksData_viewer rebuild(
          void Function(GViewerFeedWorksData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFeedWorksData_viewerBuilder toBuilder() =>
      new GViewerFeedWorksData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFeedWorksData_viewer &&
        G__typename == other.G__typename &&
        feedWorks == other.feedWorks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, feedWorks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerFeedWorksData_viewer')
          ..add('G__typename', G__typename)
          ..add('feedWorks', feedWorks))
        .toString();
  }
}

class GViewerFeedWorksData_viewerBuilder
    implements
        Builder<GViewerFeedWorksData_viewer,
            GViewerFeedWorksData_viewerBuilder> {
  _$GViewerFeedWorksData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GViewerFeedWorksData_viewer_feedWorks>? _feedWorks;
  ListBuilder<GViewerFeedWorksData_viewer_feedWorks> get feedWorks =>
      _$this._feedWorks ??=
          new ListBuilder<GViewerFeedWorksData_viewer_feedWorks>();
  set feedWorks(
          ListBuilder<GViewerFeedWorksData_viewer_feedWorks>? feedWorks) =>
      _$this._feedWorks = feedWorks;

  GViewerFeedWorksData_viewerBuilder() {
    GViewerFeedWorksData_viewer._initializeBuilder(this);
  }

  GViewerFeedWorksData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _feedWorks = $v.feedWorks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerFeedWorksData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFeedWorksData_viewer;
  }

  @override
  void update(void Function(GViewerFeedWorksData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFeedWorksData_viewer build() => _build();

  _$GViewerFeedWorksData_viewer _build() {
    _$GViewerFeedWorksData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerFeedWorksData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerFeedWorksData_viewer', 'G__typename'),
              feedWorks: feedWorks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'feedWorks';
        feedWorks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerFeedWorksData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerFeedWorksData_viewer_feedWorks
    extends GViewerFeedWorksData_viewer_feedWorks {
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
  final GViewerFeedWorksData_viewer_feedWorks_image? image;
  @override
  final GViewerFeedWorksData_viewer_feedWorks_user user;
  @override
  final GViewerFeedWorksData_viewer_feedWorks_viewer viewer;

  factory _$GViewerFeedWorksData_viewer_feedWorks(
          [void Function(GViewerFeedWorksData_viewer_feedWorksBuilder)?
              updates]) =>
      (new GViewerFeedWorksData_viewer_feedWorksBuilder()..update(updates))
          ._build();

  _$GViewerFeedWorksData_viewer_feedWorks._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      required this.imageAspectRatio,
      this.image,
      required this.user,
      required this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerFeedWorksData_viewer_feedWorks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerFeedWorksData_viewer_feedWorks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GViewerFeedWorksData_viewer_feedWorks', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GViewerFeedWorksData_viewer_feedWorks', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(commentsCount,
        r'GViewerFeedWorksData_viewer_feedWorks', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GViewerFeedWorksData_viewer_feedWorks', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(imageAspectRatio,
        r'GViewerFeedWorksData_viewer_feedWorks', 'imageAspectRatio');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GViewerFeedWorksData_viewer_feedWorks', 'user');
    BuiltValueNullFieldError.checkNotNull(
        viewer, r'GViewerFeedWorksData_viewer_feedWorks', 'viewer');
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks rebuild(
          void Function(GViewerFeedWorksData_viewer_feedWorksBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFeedWorksData_viewer_feedWorksBuilder toBuilder() =>
      new GViewerFeedWorksData_viewer_feedWorksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFeedWorksData_viewer_feedWorks &&
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
            r'GViewerFeedWorksData_viewer_feedWorks')
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

class GViewerFeedWorksData_viewer_feedWorksBuilder
    implements
        Builder<GViewerFeedWorksData_viewer_feedWorks,
            GViewerFeedWorksData_viewer_feedWorksBuilder> {
  _$GViewerFeedWorksData_viewer_feedWorks? _$v;

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

  GViewerFeedWorksData_viewer_feedWorks_imageBuilder? _image;
  GViewerFeedWorksData_viewer_feedWorks_imageBuilder get image =>
      _$this._image ??=
          new GViewerFeedWorksData_viewer_feedWorks_imageBuilder();
  set image(GViewerFeedWorksData_viewer_feedWorks_imageBuilder? image) =>
      _$this._image = image;

  GViewerFeedWorksData_viewer_feedWorks_userBuilder? _user;
  GViewerFeedWorksData_viewer_feedWorks_userBuilder get user =>
      _$this._user ??= new GViewerFeedWorksData_viewer_feedWorks_userBuilder();
  set user(GViewerFeedWorksData_viewer_feedWorks_userBuilder? user) =>
      _$this._user = user;

  GViewerFeedWorksData_viewer_feedWorks_viewerBuilder? _viewer;
  GViewerFeedWorksData_viewer_feedWorks_viewerBuilder get viewer =>
      _$this._viewer ??=
          new GViewerFeedWorksData_viewer_feedWorks_viewerBuilder();
  set viewer(GViewerFeedWorksData_viewer_feedWorks_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerFeedWorksData_viewer_feedWorksBuilder() {
    GViewerFeedWorksData_viewer_feedWorks._initializeBuilder(this);
  }

  GViewerFeedWorksData_viewer_feedWorksBuilder get _$this {
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
      _viewer = $v.viewer.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerFeedWorksData_viewer_feedWorks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFeedWorksData_viewer_feedWorks;
  }

  @override
  void update(
      void Function(GViewerFeedWorksData_viewer_feedWorksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks build() => _build();

  _$GViewerFeedWorksData_viewer_feedWorks _build() {
    _$GViewerFeedWorksData_viewer_feedWorks _$result;
    try {
      _$result = _$v ??
          new _$GViewerFeedWorksData_viewer_feedWorks._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerFeedWorksData_viewer_feedWorks', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GViewerFeedWorksData_viewer_feedWorks', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GViewerFeedWorksData_viewer_feedWorks', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GViewerFeedWorksData_viewer_feedWorks', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount, r'GViewerFeedWorksData_viewer_feedWorks', 'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GViewerFeedWorksData_viewer_feedWorks', 'createdAt'),
              imageAspectRatio: BuiltValueNullFieldError.checkNotNull(
                  imageAspectRatio, r'GViewerFeedWorksData_viewer_feedWorks', 'imageAspectRatio'),
              image: _image?.build(),
              user: user.build(),
              viewer: viewer.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
        _$failedField = 'user';
        user.build();
        _$failedField = 'viewer';
        viewer.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerFeedWorksData_viewer_feedWorks',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerFeedWorksData_viewer_feedWorks_image
    extends GViewerFeedWorksData_viewer_feedWorks_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GViewerFeedWorksData_viewer_feedWorks_image(
          [void Function(GViewerFeedWorksData_viewer_feedWorks_imageBuilder)?
              updates]) =>
      (new GViewerFeedWorksData_viewer_feedWorks_imageBuilder()
            ..update(updates))
          ._build();

  _$GViewerFeedWorksData_viewer_feedWorks_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerFeedWorksData_viewer_feedWorks_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerFeedWorksData_viewer_feedWorks_image', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GViewerFeedWorksData_viewer_feedWorks_image', 'downloadURL');
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_image rebuild(
          void Function(GViewerFeedWorksData_viewer_feedWorks_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFeedWorksData_viewer_feedWorks_imageBuilder toBuilder() =>
      new GViewerFeedWorksData_viewer_feedWorks_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFeedWorksData_viewer_feedWorks_image &&
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
            r'GViewerFeedWorksData_viewer_feedWorks_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GViewerFeedWorksData_viewer_feedWorks_imageBuilder
    implements
        Builder<GViewerFeedWorksData_viewer_feedWorks_image,
            GViewerFeedWorksData_viewer_feedWorks_imageBuilder> {
  _$GViewerFeedWorksData_viewer_feedWorks_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GViewerFeedWorksData_viewer_feedWorks_imageBuilder() {
    GViewerFeedWorksData_viewer_feedWorks_image._initializeBuilder(this);
  }

  GViewerFeedWorksData_viewer_feedWorks_imageBuilder get _$this {
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
  void replace(GViewerFeedWorksData_viewer_feedWorks_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFeedWorksData_viewer_feedWorks_image;
  }

  @override
  void update(
      void Function(GViewerFeedWorksData_viewer_feedWorks_imageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_image build() => _build();

  _$GViewerFeedWorksData_viewer_feedWorks_image _build() {
    final _$result = _$v ??
        new _$GViewerFeedWorksData_viewer_feedWorks_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GViewerFeedWorksData_viewer_feedWorks_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerFeedWorksData_viewer_feedWorks_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GViewerFeedWorksData_viewer_feedWorks_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GViewerFeedWorksData_viewer_feedWorks_user
    extends GViewerFeedWorksData_viewer_feedWorks_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String login;
  @override
  final String name;
  @override
  final GViewerFeedWorksData_viewer_feedWorks_user_iconImage? iconImage;

  factory _$GViewerFeedWorksData_viewer_feedWorks_user(
          [void Function(GViewerFeedWorksData_viewer_feedWorks_userBuilder)?
              updates]) =>
      (new GViewerFeedWorksData_viewer_feedWorks_userBuilder()..update(updates))
          ._build();

  _$GViewerFeedWorksData_viewer_feedWorks_user._(
      {required this.G__typename,
      required this.id,
      required this.login,
      required this.name,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerFeedWorksData_viewer_feedWorks_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerFeedWorksData_viewer_feedWorks_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GViewerFeedWorksData_viewer_feedWorks_user', 'login');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GViewerFeedWorksData_viewer_feedWorks_user', 'name');
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_user rebuild(
          void Function(GViewerFeedWorksData_viewer_feedWorks_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFeedWorksData_viewer_feedWorks_userBuilder toBuilder() =>
      new GViewerFeedWorksData_viewer_feedWorks_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFeedWorksData_viewer_feedWorks_user &&
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
            r'GViewerFeedWorksData_viewer_feedWorks_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GViewerFeedWorksData_viewer_feedWorks_userBuilder
    implements
        Builder<GViewerFeedWorksData_viewer_feedWorks_user,
            GViewerFeedWorksData_viewer_feedWorks_userBuilder> {
  _$GViewerFeedWorksData_viewer_feedWorks_user? _$v;

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

  GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder? _iconImage;
  GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder();
  set iconImage(
          GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder?
              iconImage) =>
      _$this._iconImage = iconImage;

  GViewerFeedWorksData_viewer_feedWorks_userBuilder() {
    GViewerFeedWorksData_viewer_feedWorks_user._initializeBuilder(this);
  }

  GViewerFeedWorksData_viewer_feedWorks_userBuilder get _$this {
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
  void replace(GViewerFeedWorksData_viewer_feedWorks_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFeedWorksData_viewer_feedWorks_user;
  }

  @override
  void update(
      void Function(GViewerFeedWorksData_viewer_feedWorks_userBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_user build() => _build();

  _$GViewerFeedWorksData_viewer_feedWorks_user _build() {
    _$GViewerFeedWorksData_viewer_feedWorks_user _$result;
    try {
      _$result = _$v ??
          new _$GViewerFeedWorksData_viewer_feedWorks_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GViewerFeedWorksData_viewer_feedWorks_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GViewerFeedWorksData_viewer_feedWorks_user', 'id'),
              login: BuiltValueNullFieldError.checkNotNull(login,
                  r'GViewerFeedWorksData_viewer_feedWorks_user', 'login'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GViewerFeedWorksData_viewer_feedWorks_user', 'name'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerFeedWorksData_viewer_feedWorks_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerFeedWorksData_viewer_feedWorks_user_iconImage
    extends GViewerFeedWorksData_viewer_feedWorks_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GViewerFeedWorksData_viewer_feedWorks_user_iconImage(
          [void Function(
                  GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder)?
              updates]) =>
      (new GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GViewerFeedWorksData_viewer_feedWorks_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerFeedWorksData_viewer_feedWorks_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerFeedWorksData_viewer_feedWorks_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GViewerFeedWorksData_viewer_feedWorks_user_iconImage', 'downloadURL');
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_user_iconImage rebuild(
          void Function(
                  GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder toBuilder() =>
      new GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFeedWorksData_viewer_feedWorks_user_iconImage &&
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
            r'GViewerFeedWorksData_viewer_feedWorks_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder
    implements
        Builder<GViewerFeedWorksData_viewer_feedWorks_user_iconImage,
            GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder> {
  _$GViewerFeedWorksData_viewer_feedWorks_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder() {
    GViewerFeedWorksData_viewer_feedWorks_user_iconImage._initializeBuilder(
        this);
  }

  GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder get _$this {
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
  void replace(GViewerFeedWorksData_viewer_feedWorks_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFeedWorksData_viewer_feedWorks_user_iconImage;
  }

  @override
  void update(
      void Function(
              GViewerFeedWorksData_viewer_feedWorks_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_user_iconImage build() => _build();

  _$GViewerFeedWorksData_viewer_feedWorks_user_iconImage _build() {
    final _$result = _$v ??
        new _$GViewerFeedWorksData_viewer_feedWorks_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerFeedWorksData_viewer_feedWorks_user_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GViewerFeedWorksData_viewer_feedWorks_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GViewerFeedWorksData_viewer_feedWorks_user_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GViewerFeedWorksData_viewer_feedWorks_viewer
    extends GViewerFeedWorksData_viewer_feedWorks_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isLiked;
  @override
  final bool isBookmarked;

  factory _$GViewerFeedWorksData_viewer_feedWorks_viewer(
          [void Function(GViewerFeedWorksData_viewer_feedWorks_viewerBuilder)?
              updates]) =>
      (new GViewerFeedWorksData_viewer_feedWorks_viewerBuilder()
            ..update(updates))
          ._build();

  _$GViewerFeedWorksData_viewer_feedWorks_viewer._(
      {required this.G__typename,
      required this.id,
      required this.isLiked,
      required this.isBookmarked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerFeedWorksData_viewer_feedWorks_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerFeedWorksData_viewer_feedWorks_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GViewerFeedWorksData_viewer_feedWorks_viewer', 'isLiked');
    BuiltValueNullFieldError.checkNotNull(isBookmarked,
        r'GViewerFeedWorksData_viewer_feedWorks_viewer', 'isBookmarked');
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_viewer rebuild(
          void Function(GViewerFeedWorksData_viewer_feedWorks_viewerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFeedWorksData_viewer_feedWorks_viewerBuilder toBuilder() =>
      new GViewerFeedWorksData_viewer_feedWorks_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFeedWorksData_viewer_feedWorks_viewer &&
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
            r'GViewerFeedWorksData_viewer_feedWorks_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isLiked', isLiked)
          ..add('isBookmarked', isBookmarked))
        .toString();
  }
}

class GViewerFeedWorksData_viewer_feedWorks_viewerBuilder
    implements
        Builder<GViewerFeedWorksData_viewer_feedWorks_viewer,
            GViewerFeedWorksData_viewer_feedWorks_viewerBuilder> {
  _$GViewerFeedWorksData_viewer_feedWorks_viewer? _$v;

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

  GViewerFeedWorksData_viewer_feedWorks_viewerBuilder() {
    GViewerFeedWorksData_viewer_feedWorks_viewer._initializeBuilder(this);
  }

  GViewerFeedWorksData_viewer_feedWorks_viewerBuilder get _$this {
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
  void replace(GViewerFeedWorksData_viewer_feedWorks_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFeedWorksData_viewer_feedWorks_viewer;
  }

  @override
  void update(
      void Function(GViewerFeedWorksData_viewer_feedWorks_viewerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_viewer build() => _build();

  _$GViewerFeedWorksData_viewer_feedWorks_viewer _build() {
    final _$result = _$v ??
        new _$GViewerFeedWorksData_viewer_feedWorks_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GViewerFeedWorksData_viewer_feedWorks_viewer', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerFeedWorksData_viewer_feedWorks_viewer', 'id'),
            isLiked: BuiltValueNullFieldError.checkNotNull(isLiked,
                r'GViewerFeedWorksData_viewer_feedWorks_viewer', 'isLiked'),
            isBookmarked: BuiltValueNullFieldError.checkNotNull(
                isBookmarked,
                r'GViewerFeedWorksData_viewer_feedWorks_viewer',
                'isBookmarked'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
