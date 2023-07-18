// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_work_bookmark.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateWorkBookmarkData> _$gCreateWorkBookmarkDataSerializer =
    new _$GCreateWorkBookmarkDataSerializer();
Serializer<GCreateWorkBookmarkData_createWorkBookmark>
    _$gCreateWorkBookmarkDataCreateWorkBookmarkSerializer =
    new _$GCreateWorkBookmarkData_createWorkBookmarkSerializer();
Serializer<GCreateWorkBookmarkData_createWorkBookmark_viewer>
    _$gCreateWorkBookmarkDataCreateWorkBookmarkViewerSerializer =
    new _$GCreateWorkBookmarkData_createWorkBookmark_viewerSerializer();

class _$GCreateWorkBookmarkDataSerializer
    implements StructuredSerializer<GCreateWorkBookmarkData> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkBookmarkData,
    _$GCreateWorkBookmarkData
  ];
  @override
  final String wireName = 'GCreateWorkBookmarkData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkBookmarkData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createWorkBookmark',
      serializers.serialize(object.createWorkBookmark,
          specifiedType:
              const FullType(GCreateWorkBookmarkData_createWorkBookmark)),
    ];

    return result;
  }

  @override
  GCreateWorkBookmarkData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkBookmarkDataBuilder();

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
        case 'createWorkBookmark':
          result.createWorkBookmark.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GCreateWorkBookmarkData_createWorkBookmark))!
              as GCreateWorkBookmarkData_createWorkBookmark);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkBookmarkData_createWorkBookmarkSerializer
    implements
        StructuredSerializer<GCreateWorkBookmarkData_createWorkBookmark> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkBookmarkData_createWorkBookmark,
    _$GCreateWorkBookmarkData_createWorkBookmark
  ];
  @override
  final String wireName = 'GCreateWorkBookmarkData_createWorkBookmark';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GCreateWorkBookmarkData_createWorkBookmark object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GCreateWorkBookmarkData_createWorkBookmark_viewer)));
    }
    return result;
  }

  @override
  GCreateWorkBookmarkData_createWorkBookmark deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkBookmarkData_createWorkBookmarkBuilder();

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
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GCreateWorkBookmarkData_createWorkBookmark_viewer))!
              as GCreateWorkBookmarkData_createWorkBookmark_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkBookmarkData_createWorkBookmark_viewerSerializer
    implements
        StructuredSerializer<
            GCreateWorkBookmarkData_createWorkBookmark_viewer> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkBookmarkData_createWorkBookmark_viewer,
    _$GCreateWorkBookmarkData_createWorkBookmark_viewer
  ];
  @override
  final String wireName = 'GCreateWorkBookmarkData_createWorkBookmark_viewer';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GCreateWorkBookmarkData_createWorkBookmark_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'isBookmarked',
      serializers.serialize(object.isBookmarked,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GCreateWorkBookmarkData_createWorkBookmark_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder();

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
        case 'isBookmarked':
          result.isBookmarked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkBookmarkData extends GCreateWorkBookmarkData {
  @override
  final String G__typename;
  @override
  final GCreateWorkBookmarkData_createWorkBookmark createWorkBookmark;

  factory _$GCreateWorkBookmarkData(
          [void Function(GCreateWorkBookmarkDataBuilder)? updates]) =>
      (new GCreateWorkBookmarkDataBuilder()..update(updates))._build();

  _$GCreateWorkBookmarkData._(
      {required this.G__typename, required this.createWorkBookmark})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateWorkBookmarkData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createWorkBookmark, r'GCreateWorkBookmarkData', 'createWorkBookmark');
  }

  @override
  GCreateWorkBookmarkData rebuild(
          void Function(GCreateWorkBookmarkDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkBookmarkDataBuilder toBuilder() =>
      new GCreateWorkBookmarkDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkBookmarkData &&
        G__typename == other.G__typename &&
        createWorkBookmark == other.createWorkBookmark;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createWorkBookmark.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateWorkBookmarkData')
          ..add('G__typename', G__typename)
          ..add('createWorkBookmark', createWorkBookmark))
        .toString();
  }
}

class GCreateWorkBookmarkDataBuilder
    implements
        Builder<GCreateWorkBookmarkData, GCreateWorkBookmarkDataBuilder> {
  _$GCreateWorkBookmarkData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateWorkBookmarkData_createWorkBookmarkBuilder? _createWorkBookmark;
  GCreateWorkBookmarkData_createWorkBookmarkBuilder get createWorkBookmark =>
      _$this._createWorkBookmark ??=
          new GCreateWorkBookmarkData_createWorkBookmarkBuilder();
  set createWorkBookmark(
          GCreateWorkBookmarkData_createWorkBookmarkBuilder?
              createWorkBookmark) =>
      _$this._createWorkBookmark = createWorkBookmark;

  GCreateWorkBookmarkDataBuilder() {
    GCreateWorkBookmarkData._initializeBuilder(this);
  }

  GCreateWorkBookmarkDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createWorkBookmark = $v.createWorkBookmark.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkBookmarkData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkBookmarkData;
  }

  @override
  void update(void Function(GCreateWorkBookmarkDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkBookmarkData build() => _build();

  _$GCreateWorkBookmarkData _build() {
    _$GCreateWorkBookmarkData _$result;
    try {
      _$result = _$v ??
          new _$GCreateWorkBookmarkData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateWorkBookmarkData', 'G__typename'),
              createWorkBookmark: createWorkBookmark.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createWorkBookmark';
        createWorkBookmark.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateWorkBookmarkData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateWorkBookmarkData_createWorkBookmark
    extends GCreateWorkBookmarkData_createWorkBookmark {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GCreateWorkBookmarkData_createWorkBookmark_viewer? viewer;

  factory _$GCreateWorkBookmarkData_createWorkBookmark(
          [void Function(GCreateWorkBookmarkData_createWorkBookmarkBuilder)?
              updates]) =>
      (new GCreateWorkBookmarkData_createWorkBookmarkBuilder()..update(updates))
          ._build();

  _$GCreateWorkBookmarkData_createWorkBookmark._(
      {required this.G__typename, required this.id, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GCreateWorkBookmarkData_createWorkBookmark', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateWorkBookmarkData_createWorkBookmark', 'id');
  }

  @override
  GCreateWorkBookmarkData_createWorkBookmark rebuild(
          void Function(GCreateWorkBookmarkData_createWorkBookmarkBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkBookmarkData_createWorkBookmarkBuilder toBuilder() =>
      new GCreateWorkBookmarkData_createWorkBookmarkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkBookmarkData_createWorkBookmark &&
        G__typename == other.G__typename &&
        id == other.id &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GCreateWorkBookmarkData_createWorkBookmark')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('viewer', viewer))
        .toString();
  }
}

class GCreateWorkBookmarkData_createWorkBookmarkBuilder
    implements
        Builder<GCreateWorkBookmarkData_createWorkBookmark,
            GCreateWorkBookmarkData_createWorkBookmarkBuilder> {
  _$GCreateWorkBookmarkData_createWorkBookmark? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder? _viewer;
  GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder get viewer =>
      _$this._viewer ??=
          new GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder();
  set viewer(
          GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GCreateWorkBookmarkData_createWorkBookmarkBuilder() {
    GCreateWorkBookmarkData_createWorkBookmark._initializeBuilder(this);
  }

  GCreateWorkBookmarkData_createWorkBookmarkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkBookmarkData_createWorkBookmark other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkBookmarkData_createWorkBookmark;
  }

  @override
  void update(
      void Function(GCreateWorkBookmarkData_createWorkBookmarkBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkBookmarkData_createWorkBookmark build() => _build();

  _$GCreateWorkBookmarkData_createWorkBookmark _build() {
    _$GCreateWorkBookmarkData_createWorkBookmark _$result;
    try {
      _$result = _$v ??
          new _$GCreateWorkBookmarkData_createWorkBookmark._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GCreateWorkBookmarkData_createWorkBookmark', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GCreateWorkBookmarkData_createWorkBookmark', 'id'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateWorkBookmarkData_createWorkBookmark',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateWorkBookmarkData_createWorkBookmark_viewer
    extends GCreateWorkBookmarkData_createWorkBookmark_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isBookmarked;

  factory _$GCreateWorkBookmarkData_createWorkBookmark_viewer(
          [void Function(
                  GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder)?
              updates]) =>
      (new GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder()
            ..update(updates))
          ._build();

  _$GCreateWorkBookmarkData_createWorkBookmark_viewer._(
      {required this.G__typename, required this.id, required this.isBookmarked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GCreateWorkBookmarkData_createWorkBookmark_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateWorkBookmarkData_createWorkBookmark_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(isBookmarked,
        r'GCreateWorkBookmarkData_createWorkBookmark_viewer', 'isBookmarked');
  }

  @override
  GCreateWorkBookmarkData_createWorkBookmark_viewer rebuild(
          void Function(
                  GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder toBuilder() =>
      new GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkBookmarkData_createWorkBookmark_viewer &&
        G__typename == other.G__typename &&
        id == other.id &&
        isBookmarked == other.isBookmarked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isBookmarked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GCreateWorkBookmarkData_createWorkBookmark_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isBookmarked', isBookmarked))
        .toString();
  }
}

class GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder
    implements
        Builder<GCreateWorkBookmarkData_createWorkBookmark_viewer,
            GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder> {
  _$GCreateWorkBookmarkData_createWorkBookmark_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isBookmarked;
  bool? get isBookmarked => _$this._isBookmarked;
  set isBookmarked(bool? isBookmarked) => _$this._isBookmarked = isBookmarked;

  GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder() {
    GCreateWorkBookmarkData_createWorkBookmark_viewer._initializeBuilder(this);
  }

  GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isBookmarked = $v.isBookmarked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkBookmarkData_createWorkBookmark_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkBookmarkData_createWorkBookmark_viewer;
  }

  @override
  void update(
      void Function(GCreateWorkBookmarkData_createWorkBookmark_viewerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkBookmarkData_createWorkBookmark_viewer build() => _build();

  _$GCreateWorkBookmarkData_createWorkBookmark_viewer _build() {
    final _$result = _$v ??
        new _$GCreateWorkBookmarkData_createWorkBookmark_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GCreateWorkBookmarkData_createWorkBookmark_viewer',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateWorkBookmarkData_createWorkBookmark_viewer', 'id'),
            isBookmarked: BuiltValueNullFieldError.checkNotNull(
                isBookmarked,
                r'GCreateWorkBookmarkData_createWorkBookmark_viewer',
                'isBookmarked'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
