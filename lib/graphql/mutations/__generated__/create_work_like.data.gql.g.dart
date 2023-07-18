// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_work_like.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateWorkLikeData> _$gCreateWorkLikeDataSerializer =
    new _$GCreateWorkLikeDataSerializer();
Serializer<GCreateWorkLikeData_createWorkLike>
    _$gCreateWorkLikeDataCreateWorkLikeSerializer =
    new _$GCreateWorkLikeData_createWorkLikeSerializer();
Serializer<GCreateWorkLikeData_createWorkLike_viewer>
    _$gCreateWorkLikeDataCreateWorkLikeViewerSerializer =
    new _$GCreateWorkLikeData_createWorkLike_viewerSerializer();

class _$GCreateWorkLikeDataSerializer
    implements StructuredSerializer<GCreateWorkLikeData> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkLikeData,
    _$GCreateWorkLikeData
  ];
  @override
  final String wireName = 'GCreateWorkLikeData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkLikeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createWorkLike',
      serializers.serialize(object.createWorkLike,
          specifiedType: const FullType(GCreateWorkLikeData_createWorkLike)),
    ];

    return result;
  }

  @override
  GCreateWorkLikeData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkLikeDataBuilder();

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
        case 'createWorkLike':
          result.createWorkLike.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GCreateWorkLikeData_createWorkLike))!
              as GCreateWorkLikeData_createWorkLike);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkLikeData_createWorkLikeSerializer
    implements StructuredSerializer<GCreateWorkLikeData_createWorkLike> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkLikeData_createWorkLike,
    _$GCreateWorkLikeData_createWorkLike
  ];
  @override
  final String wireName = 'GCreateWorkLikeData_createWorkLike';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkLikeData_createWorkLike object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'likesCount',
      serializers.serialize(object.likesCount,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GCreateWorkLikeData_createWorkLike_viewer)));
    }
    return result;
  }

  @override
  GCreateWorkLikeData_createWorkLike deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkLikeData_createWorkLikeBuilder();

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
        case 'likesCount':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GCreateWorkLikeData_createWorkLike_viewer))!
              as GCreateWorkLikeData_createWorkLike_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkLikeData_createWorkLike_viewerSerializer
    implements StructuredSerializer<GCreateWorkLikeData_createWorkLike_viewer> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkLikeData_createWorkLike_viewer,
    _$GCreateWorkLikeData_createWorkLike_viewer
  ];
  @override
  final String wireName = 'GCreateWorkLikeData_createWorkLike_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkLikeData_createWorkLike_viewer object,
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
    ];

    return result;
  }

  @override
  GCreateWorkLikeData_createWorkLike_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkLikeData_createWorkLike_viewerBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GCreateWorkLikeData extends GCreateWorkLikeData {
  @override
  final String G__typename;
  @override
  final GCreateWorkLikeData_createWorkLike createWorkLike;

  factory _$GCreateWorkLikeData(
          [void Function(GCreateWorkLikeDataBuilder)? updates]) =>
      (new GCreateWorkLikeDataBuilder()..update(updates))._build();

  _$GCreateWorkLikeData._(
      {required this.G__typename, required this.createWorkLike})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateWorkLikeData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createWorkLike, r'GCreateWorkLikeData', 'createWorkLike');
  }

  @override
  GCreateWorkLikeData rebuild(
          void Function(GCreateWorkLikeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkLikeDataBuilder toBuilder() =>
      new GCreateWorkLikeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkLikeData &&
        G__typename == other.G__typename &&
        createWorkLike == other.createWorkLike;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createWorkLike.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateWorkLikeData')
          ..add('G__typename', G__typename)
          ..add('createWorkLike', createWorkLike))
        .toString();
  }
}

class GCreateWorkLikeDataBuilder
    implements Builder<GCreateWorkLikeData, GCreateWorkLikeDataBuilder> {
  _$GCreateWorkLikeData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateWorkLikeData_createWorkLikeBuilder? _createWorkLike;
  GCreateWorkLikeData_createWorkLikeBuilder get createWorkLike =>
      _$this._createWorkLike ??=
          new GCreateWorkLikeData_createWorkLikeBuilder();
  set createWorkLike(
          GCreateWorkLikeData_createWorkLikeBuilder? createWorkLike) =>
      _$this._createWorkLike = createWorkLike;

  GCreateWorkLikeDataBuilder() {
    GCreateWorkLikeData._initializeBuilder(this);
  }

  GCreateWorkLikeDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createWorkLike = $v.createWorkLike.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkLikeData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkLikeData;
  }

  @override
  void update(void Function(GCreateWorkLikeDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkLikeData build() => _build();

  _$GCreateWorkLikeData _build() {
    _$GCreateWorkLikeData _$result;
    try {
      _$result = _$v ??
          new _$GCreateWorkLikeData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateWorkLikeData', 'G__typename'),
              createWorkLike: createWorkLike.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createWorkLike';
        createWorkLike.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateWorkLikeData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateWorkLikeData_createWorkLike
    extends GCreateWorkLikeData_createWorkLike {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int likesCount;
  @override
  final GCreateWorkLikeData_createWorkLike_viewer? viewer;

  factory _$GCreateWorkLikeData_createWorkLike(
          [void Function(GCreateWorkLikeData_createWorkLikeBuilder)?
              updates]) =>
      (new GCreateWorkLikeData_createWorkLikeBuilder()..update(updates))
          ._build();

  _$GCreateWorkLikeData_createWorkLike._(
      {required this.G__typename,
      required this.id,
      required this.likesCount,
      this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateWorkLikeData_createWorkLike', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateWorkLikeData_createWorkLike', 'id');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GCreateWorkLikeData_createWorkLike', 'likesCount');
  }

  @override
  GCreateWorkLikeData_createWorkLike rebuild(
          void Function(GCreateWorkLikeData_createWorkLikeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkLikeData_createWorkLikeBuilder toBuilder() =>
      new GCreateWorkLikeData_createWorkLikeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkLikeData_createWorkLike &&
        G__typename == other.G__typename &&
        id == other.id &&
        likesCount == other.likesCount &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, likesCount.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateWorkLikeData_createWorkLike')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('likesCount', likesCount)
          ..add('viewer', viewer))
        .toString();
  }
}

class GCreateWorkLikeData_createWorkLikeBuilder
    implements
        Builder<GCreateWorkLikeData_createWorkLike,
            GCreateWorkLikeData_createWorkLikeBuilder> {
  _$GCreateWorkLikeData_createWorkLike? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _likesCount;
  int? get likesCount => _$this._likesCount;
  set likesCount(int? likesCount) => _$this._likesCount = likesCount;

  GCreateWorkLikeData_createWorkLike_viewerBuilder? _viewer;
  GCreateWorkLikeData_createWorkLike_viewerBuilder get viewer =>
      _$this._viewer ??= new GCreateWorkLikeData_createWorkLike_viewerBuilder();
  set viewer(GCreateWorkLikeData_createWorkLike_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GCreateWorkLikeData_createWorkLikeBuilder() {
    GCreateWorkLikeData_createWorkLike._initializeBuilder(this);
  }

  GCreateWorkLikeData_createWorkLikeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _likesCount = $v.likesCount;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkLikeData_createWorkLike other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkLikeData_createWorkLike;
  }

  @override
  void update(
      void Function(GCreateWorkLikeData_createWorkLikeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkLikeData_createWorkLike build() => _build();

  _$GCreateWorkLikeData_createWorkLike _build() {
    _$GCreateWorkLikeData_createWorkLike _$result;
    try {
      _$result = _$v ??
          new _$GCreateWorkLikeData_createWorkLike._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GCreateWorkLikeData_createWorkLike', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GCreateWorkLikeData_createWorkLike', 'id'),
              likesCount: BuiltValueNullFieldError.checkNotNull(likesCount,
                  r'GCreateWorkLikeData_createWorkLike', 'likesCount'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateWorkLikeData_createWorkLike', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateWorkLikeData_createWorkLike_viewer
    extends GCreateWorkLikeData_createWorkLike_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isLiked;

  factory _$GCreateWorkLikeData_createWorkLike_viewer(
          [void Function(GCreateWorkLikeData_createWorkLike_viewerBuilder)?
              updates]) =>
      (new GCreateWorkLikeData_createWorkLike_viewerBuilder()..update(updates))
          ._build();

  _$GCreateWorkLikeData_createWorkLike_viewer._(
      {required this.G__typename, required this.id, required this.isLiked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GCreateWorkLikeData_createWorkLike_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateWorkLikeData_createWorkLike_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GCreateWorkLikeData_createWorkLike_viewer', 'isLiked');
  }

  @override
  GCreateWorkLikeData_createWorkLike_viewer rebuild(
          void Function(GCreateWorkLikeData_createWorkLike_viewerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkLikeData_createWorkLike_viewerBuilder toBuilder() =>
      new GCreateWorkLikeData_createWorkLike_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkLikeData_createWorkLike_viewer &&
        G__typename == other.G__typename &&
        id == other.id &&
        isLiked == other.isLiked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GCreateWorkLikeData_createWorkLike_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isLiked', isLiked))
        .toString();
  }
}

class GCreateWorkLikeData_createWorkLike_viewerBuilder
    implements
        Builder<GCreateWorkLikeData_createWorkLike_viewer,
            GCreateWorkLikeData_createWorkLike_viewerBuilder> {
  _$GCreateWorkLikeData_createWorkLike_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  GCreateWorkLikeData_createWorkLike_viewerBuilder() {
    GCreateWorkLikeData_createWorkLike_viewer._initializeBuilder(this);
  }

  GCreateWorkLikeData_createWorkLike_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isLiked = $v.isLiked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkLikeData_createWorkLike_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkLikeData_createWorkLike_viewer;
  }

  @override
  void update(
      void Function(GCreateWorkLikeData_createWorkLike_viewerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkLikeData_createWorkLike_viewer build() => _build();

  _$GCreateWorkLikeData_createWorkLike_viewer _build() {
    final _$result = _$v ??
        new _$GCreateWorkLikeData_createWorkLike_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCreateWorkLikeData_createWorkLike_viewer', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateWorkLikeData_createWorkLike_viewer', 'id'),
            isLiked: BuiltValueNullFieldError.checkNotNull(isLiked,
                r'GCreateWorkLikeData_createWorkLike_viewer', 'isLiked'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
