// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTagData> _$gTagDataSerializer = new _$GTagDataSerializer();
Serializer<GTagData_tag> _$gTagDataTagSerializer =
    new _$GTagData_tagSerializer();
Serializer<GTagData_tag_viewer> _$gTagDataTagViewerSerializer =
    new _$GTagData_tag_viewerSerializer();

class _$GTagDataSerializer implements StructuredSerializer<GTagData> {
  @override
  final Iterable<Type> types = const [GTagData, _$GTagData];
  @override
  final String wireName = 'GTagData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTagData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.tag;
    if (value != null) {
      result
        ..add('tag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GTagData_tag)));
    }
    return result;
  }

  @override
  GTagData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagDataBuilder();

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
        case 'tag':
          result.tag.replace(serializers.deserialize(value,
              specifiedType: const FullType(GTagData_tag))! as GTagData_tag);
          break;
      }
    }

    return result.build();
  }
}

class _$GTagData_tagSerializer implements StructuredSerializer<GTagData_tag> {
  @override
  final Iterable<Type> types = const [GTagData_tag, _$GTagData_tag];
  @override
  final String wireName = 'GTagData_tag';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTagData_tag object,
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
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GTagData_tag_viewer)));
    }
    return result;
  }

  @override
  GTagData_tag deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagData_tagBuilder();

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
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GTagData_tag_viewer))!
              as GTagData_tag_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GTagData_tag_viewerSerializer
    implements StructuredSerializer<GTagData_tag_viewer> {
  @override
  final Iterable<Type> types = const [
    GTagData_tag_viewer,
    _$GTagData_tag_viewer
  ];
  @override
  final String wireName = 'GTagData_tag_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTagData_tag_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'isLiked',
      serializers.serialize(object.isLiked,
          specifiedType: const FullType(bool)),
      'isWatched',
      serializers.serialize(object.isWatched,
          specifiedType: const FullType(bool)),
      'isMuted',
      serializers.serialize(object.isMuted,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GTagData_tag_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagData_tag_viewerBuilder();

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
        case 'isLiked':
          result.isLiked = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isWatched':
          result.isWatched = serializers.deserialize(value,
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

class _$GTagData extends GTagData {
  @override
  final String G__typename;
  @override
  final GTagData_tag? tag;

  factory _$GTagData([void Function(GTagDataBuilder)? updates]) =>
      (new GTagDataBuilder()..update(updates))._build();

  _$GTagData._({required this.G__typename, this.tag}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTagData', 'G__typename');
  }

  @override
  GTagData rebuild(void Function(GTagDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagDataBuilder toBuilder() => new GTagDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagData &&
        G__typename == other.G__typename &&
        tag == other.tag;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, tag.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTagData')
          ..add('G__typename', G__typename)
          ..add('tag', tag))
        .toString();
  }
}

class GTagDataBuilder implements Builder<GTagData, GTagDataBuilder> {
  _$GTagData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GTagData_tagBuilder? _tag;
  GTagData_tagBuilder get tag => _$this._tag ??= new GTagData_tagBuilder();
  set tag(GTagData_tagBuilder? tag) => _$this._tag = tag;

  GTagDataBuilder() {
    GTagData._initializeBuilder(this);
  }

  GTagDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _tag = $v.tag?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTagData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagData;
  }

  @override
  void update(void Function(GTagDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagData build() => _build();

  _$GTagData _build() {
    _$GTagData _$result;
    try {
      _$result = _$v ??
          new _$GTagData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GTagData', 'G__typename'),
              tag: _tag?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tag';
        _tag?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTagData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTagData_tag extends GTagData_tag {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final GTagData_tag_viewer? viewer;

  factory _$GTagData_tag([void Function(GTagData_tagBuilder)? updates]) =>
      (new GTagData_tagBuilder()..update(updates))._build();

  _$GTagData_tag._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTagData_tag', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GTagData_tag', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GTagData_tag', 'name');
  }

  @override
  GTagData_tag rebuild(void Function(GTagData_tagBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagData_tagBuilder toBuilder() => new GTagData_tagBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagData_tag &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTagData_tag')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('viewer', viewer))
        .toString();
  }
}

class GTagData_tagBuilder
    implements Builder<GTagData_tag, GTagData_tagBuilder> {
  _$GTagData_tag? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GTagData_tag_viewerBuilder? _viewer;
  GTagData_tag_viewerBuilder get viewer =>
      _$this._viewer ??= new GTagData_tag_viewerBuilder();
  set viewer(GTagData_tag_viewerBuilder? viewer) => _$this._viewer = viewer;

  GTagData_tagBuilder() {
    GTagData_tag._initializeBuilder(this);
  }

  GTagData_tagBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTagData_tag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagData_tag;
  }

  @override
  void update(void Function(GTagData_tagBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagData_tag build() => _build();

  _$GTagData_tag _build() {
    _$GTagData_tag _$result;
    try {
      _$result = _$v ??
          new _$GTagData_tag._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GTagData_tag', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GTagData_tag', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GTagData_tag', 'name'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTagData_tag', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTagData_tag_viewer extends GTagData_tag_viewer {
  @override
  final String G__typename;
  @override
  final bool isLiked;
  @override
  final bool isWatched;
  @override
  final bool isMuted;

  factory _$GTagData_tag_viewer(
          [void Function(GTagData_tag_viewerBuilder)? updates]) =>
      (new GTagData_tag_viewerBuilder()..update(updates))._build();

  _$GTagData_tag_viewer._(
      {required this.G__typename,
      required this.isLiked,
      required this.isWatched,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTagData_tag_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GTagData_tag_viewer', 'isLiked');
    BuiltValueNullFieldError.checkNotNull(
        isWatched, r'GTagData_tag_viewer', 'isWatched');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GTagData_tag_viewer', 'isMuted');
  }

  @override
  GTagData_tag_viewer rebuild(
          void Function(GTagData_tag_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagData_tag_viewerBuilder toBuilder() =>
      new GTagData_tag_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagData_tag_viewer &&
        G__typename == other.G__typename &&
        isLiked == other.isLiked &&
        isWatched == other.isWatched &&
        isMuted == other.isMuted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jc(_$hash, isWatched.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTagData_tag_viewer')
          ..add('G__typename', G__typename)
          ..add('isLiked', isLiked)
          ..add('isWatched', isWatched)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GTagData_tag_viewerBuilder
    implements Builder<GTagData_tag_viewer, GTagData_tag_viewerBuilder> {
  _$GTagData_tag_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  bool? _isWatched;
  bool? get isWatched => _$this._isWatched;
  set isWatched(bool? isWatched) => _$this._isWatched = isWatched;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GTagData_tag_viewerBuilder() {
    GTagData_tag_viewer._initializeBuilder(this);
  }

  GTagData_tag_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _isLiked = $v.isLiked;
      _isWatched = $v.isWatched;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTagData_tag_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagData_tag_viewer;
  }

  @override
  void update(void Function(GTagData_tag_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagData_tag_viewer build() => _build();

  _$GTagData_tag_viewer _build() {
    final _$result = _$v ??
        new _$GTagData_tag_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GTagData_tag_viewer', 'G__typename'),
            isLiked: BuiltValueNullFieldError.checkNotNull(
                isLiked, r'GTagData_tag_viewer', 'isLiked'),
            isWatched: BuiltValueNullFieldError.checkNotNull(
                isWatched, r'GTagData_tag_viewer', 'isWatched'),
            isMuted: BuiltValueNullFieldError.checkNotNull(
                isMuted, r'GTagData_tag_viewer', 'isMuted'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
