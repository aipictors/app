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
Serializer<GViewerFeedWorksData_viewer_feedWorks_user>
    _$gViewerFeedWorksDataViewerFeedWorksUserSerializer =
    new _$GViewerFeedWorksData_viewer_feedWorks_userSerializer();
Serializer<GViewerFeedWorksData_viewer_feedWorks_user_viewer>
    _$gViewerFeedWorksDataViewerFeedWorksUserViewerSerializer =
    new _$GViewerFeedWorksData_viewer_feedWorks_user_viewerSerializer();
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
      'imageURL',
      serializers.serialize(object.imageURL,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType:
              const FullType(GViewerFeedWorksData_viewer_feedWorks_user)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GViewerFeedWorksData_viewer_feedWorks_viewer)));
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
        case 'imageURL':
          result.imageURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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
    value = object.iconUrl;
    if (value != null) {
      result
        ..add('iconUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GViewerFeedWorksData_viewer_feedWorks_user_viewer)));
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
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GViewerFeedWorksData_viewer_feedWorks_user_viewer))!
              as GViewerFeedWorksData_viewer_feedWorks_user_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerFeedWorksData_viewer_feedWorks_user_viewerSerializer
    implements
        StructuredSerializer<
            GViewerFeedWorksData_viewer_feedWorks_user_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerFeedWorksData_viewer_feedWorks_user_viewer,
    _$GViewerFeedWorksData_viewer_feedWorks_user_viewer
  ];
  @override
  final String wireName = 'GViewerFeedWorksData_viewer_feedWorks_user_viewer';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerFeedWorksData_viewer_feedWorks_user_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'isFollower',
      serializers.serialize(object.isFollower,
          specifiedType: const FullType(bool)),
      'isFollowee',
      serializers.serialize(object.isFollowee,
          specifiedType: const FullType(bool)),
      'isMuted',
      serializers.serialize(object.isMuted,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_user_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder();

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
        case 'isFollower':
          result.isFollower = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isFollowee':
          result.isFollowee = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
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
  final String imageURL;
  @override
  final GViewerFeedWorksData_viewer_feedWorks_user user;
  @override
  final GViewerFeedWorksData_viewer_feedWorks_viewer? viewer;

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
      required this.imageURL,
      required this.user,
      this.viewer})
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
        imageURL, r'GViewerFeedWorksData_viewer_feedWorks', 'imageURL');
    BuiltValueNullFieldError.checkNotNull(
        user, r'GViewerFeedWorksData_viewer_feedWorks', 'user');
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
        imageURL == other.imageURL &&
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
    _$hash = $jc(_$hash, imageURL.hashCode);
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
          ..add('imageURL', imageURL)
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

  String? _imageURL;
  String? get imageURL => _$this._imageURL;
  set imageURL(String? imageURL) => _$this._imageURL = imageURL;

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
      _imageURL = $v.imageURL;
      _user = $v.user.toBuilder();
      _viewer = $v.viewer?.toBuilder();
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
              imageURL: BuiltValueNullFieldError.checkNotNull(imageURL, r'GViewerFeedWorksData_viewer_feedWorks', 'imageURL'),
              user: user.build(),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'viewer';
        _viewer?.build();
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
  final String? iconUrl;
  @override
  final GViewerFeedWorksData_viewer_feedWorks_user_viewer? viewer;

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
      this.iconUrl,
      this.viewer})
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
        iconUrl == other.iconUrl &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
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
          ..add('iconUrl', iconUrl)
          ..add('viewer', viewer))
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

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder? _viewer;
  GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder get viewer =>
      _$this._viewer ??=
          new GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder();
  set viewer(
          GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

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
      _iconUrl = $v.iconUrl;
      _viewer = $v.viewer?.toBuilder();
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
              iconUrl: iconUrl,
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
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

class _$GViewerFeedWorksData_viewer_feedWorks_user_viewer
    extends GViewerFeedWorksData_viewer_feedWorks_user_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isFollower;
  @override
  final bool isFollowee;
  @override
  final bool isMuted;

  factory _$GViewerFeedWorksData_viewer_feedWorks_user_viewer(
          [void Function(
                  GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder)?
              updates]) =>
      (new GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder()
            ..update(updates))
          ._build();

  _$GViewerFeedWorksData_viewer_feedWorks_user_viewer._(
      {required this.G__typename,
      required this.id,
      required this.isFollower,
      required this.isFollowee,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerFeedWorksData_viewer_feedWorks_user_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerFeedWorksData_viewer_feedWorks_user_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(isFollower,
        r'GViewerFeedWorksData_viewer_feedWorks_user_viewer', 'isFollower');
    BuiltValueNullFieldError.checkNotNull(isFollowee,
        r'GViewerFeedWorksData_viewer_feedWorks_user_viewer', 'isFollowee');
    BuiltValueNullFieldError.checkNotNull(isMuted,
        r'GViewerFeedWorksData_viewer_feedWorks_user_viewer', 'isMuted');
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_user_viewer rebuild(
          void Function(
                  GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder toBuilder() =>
      new GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFeedWorksData_viewer_feedWorks_user_viewer &&
        G__typename == other.G__typename &&
        id == other.id &&
        isFollower == other.isFollower &&
        isFollowee == other.isFollowee &&
        isMuted == other.isMuted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isFollower.hashCode);
    _$hash = $jc(_$hash, isFollowee.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerFeedWorksData_viewer_feedWorks_user_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isFollower', isFollower)
          ..add('isFollowee', isFollowee)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder
    implements
        Builder<GViewerFeedWorksData_viewer_feedWorks_user_viewer,
            GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder> {
  _$GViewerFeedWorksData_viewer_feedWorks_user_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isFollower;
  bool? get isFollower => _$this._isFollower;
  set isFollower(bool? isFollower) => _$this._isFollower = isFollower;

  bool? _isFollowee;
  bool? get isFollowee => _$this._isFollowee;
  set isFollowee(bool? isFollowee) => _$this._isFollowee = isFollowee;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder() {
    GViewerFeedWorksData_viewer_feedWorks_user_viewer._initializeBuilder(this);
  }

  GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isFollower = $v.isFollower;
      _isFollowee = $v.isFollowee;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerFeedWorksData_viewer_feedWorks_user_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFeedWorksData_viewer_feedWorks_user_viewer;
  }

  @override
  void update(
      void Function(GViewerFeedWorksData_viewer_feedWorks_user_viewerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFeedWorksData_viewer_feedWorks_user_viewer build() => _build();

  _$GViewerFeedWorksData_viewer_feedWorks_user_viewer _build() {
    final _$result = _$v ??
        new _$GViewerFeedWorksData_viewer_feedWorks_user_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerFeedWorksData_viewer_feedWorks_user_viewer',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerFeedWorksData_viewer_feedWorks_user_viewer', 'id'),
            isFollower: BuiltValueNullFieldError.checkNotNull(
                isFollower,
                r'GViewerFeedWorksData_viewer_feedWorks_user_viewer',
                'isFollower'),
            isFollowee: BuiltValueNullFieldError.checkNotNull(
                isFollowee,
                r'GViewerFeedWorksData_viewer_feedWorks_user_viewer',
                'isFollowee'),
            isMuted: BuiltValueNullFieldError.checkNotNull(
                isMuted,
                r'GViewerFeedWorksData_viewer_feedWorks_user_viewer',
                'isMuted'));
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
