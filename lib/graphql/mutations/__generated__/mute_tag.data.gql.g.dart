// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_tag.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMuteTagData> _$gMuteTagDataSerializer =
    new _$GMuteTagDataSerializer();
Serializer<GMuteTagData_muteTag> _$gMuteTagDataMuteTagSerializer =
    new _$GMuteTagData_muteTagSerializer();
Serializer<GMuteTagData_muteTag_viewer> _$gMuteTagDataMuteTagViewerSerializer =
    new _$GMuteTagData_muteTag_viewerSerializer();

class _$GMuteTagDataSerializer implements StructuredSerializer<GMuteTagData> {
  @override
  final Iterable<Type> types = const [GMuteTagData, _$GMuteTagData];
  @override
  final String wireName = 'GMuteTagData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GMuteTagData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.muteTag;
    if (value != null) {
      result
        ..add('muteTag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GMuteTagData_muteTag)));
    }
    return result;
  }

  @override
  GMuteTagData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMuteTagDataBuilder();

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
        case 'muteTag':
          result.muteTag.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GMuteTagData_muteTag))!
              as GMuteTagData_muteTag);
          break;
      }
    }

    return result.build();
  }
}

class _$GMuteTagData_muteTagSerializer
    implements StructuredSerializer<GMuteTagData_muteTag> {
  @override
  final Iterable<Type> types = const [
    GMuteTagData_muteTag,
    _$GMuteTagData_muteTag
  ];
  @override
  final String wireName = 'GMuteTagData_muteTag';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMuteTagData_muteTag object,
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
            specifiedType: const FullType(GMuteTagData_muteTag_viewer)));
    }
    return result;
  }

  @override
  GMuteTagData_muteTag deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMuteTagData_muteTagBuilder();

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
                  specifiedType: const FullType(GMuteTagData_muteTag_viewer))!
              as GMuteTagData_muteTag_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GMuteTagData_muteTag_viewerSerializer
    implements StructuredSerializer<GMuteTagData_muteTag_viewer> {
  @override
  final Iterable<Type> types = const [
    GMuteTagData_muteTag_viewer,
    _$GMuteTagData_muteTag_viewer
  ];
  @override
  final String wireName = 'GMuteTagData_muteTag_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMuteTagData_muteTag_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'isMuted',
      serializers.serialize(object.isMuted,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GMuteTagData_muteTag_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMuteTagData_muteTag_viewerBuilder();

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
        case 'isMuted':
          result.isMuted = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GMuteTagData extends GMuteTagData {
  @override
  final String G__typename;
  @override
  final GMuteTagData_muteTag? muteTag;

  factory _$GMuteTagData([void Function(GMuteTagDataBuilder)? updates]) =>
      (new GMuteTagDataBuilder()..update(updates))._build();

  _$GMuteTagData._({required this.G__typename, this.muteTag}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMuteTagData', 'G__typename');
  }

  @override
  GMuteTagData rebuild(void Function(GMuteTagDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMuteTagDataBuilder toBuilder() => new GMuteTagDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMuteTagData &&
        G__typename == other.G__typename &&
        muteTag == other.muteTag;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, muteTag.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMuteTagData')
          ..add('G__typename', G__typename)
          ..add('muteTag', muteTag))
        .toString();
  }
}

class GMuteTagDataBuilder
    implements Builder<GMuteTagData, GMuteTagDataBuilder> {
  _$GMuteTagData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GMuteTagData_muteTagBuilder? _muteTag;
  GMuteTagData_muteTagBuilder get muteTag =>
      _$this._muteTag ??= new GMuteTagData_muteTagBuilder();
  set muteTag(GMuteTagData_muteTagBuilder? muteTag) =>
      _$this._muteTag = muteTag;

  GMuteTagDataBuilder() {
    GMuteTagData._initializeBuilder(this);
  }

  GMuteTagDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _muteTag = $v.muteTag?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMuteTagData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMuteTagData;
  }

  @override
  void update(void Function(GMuteTagDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMuteTagData build() => _build();

  _$GMuteTagData _build() {
    _$GMuteTagData _$result;
    try {
      _$result = _$v ??
          new _$GMuteTagData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GMuteTagData', 'G__typename'),
              muteTag: _muteTag?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'muteTag';
        _muteTag?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GMuteTagData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GMuteTagData_muteTag extends GMuteTagData_muteTag {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GMuteTagData_muteTag_viewer? viewer;

  factory _$GMuteTagData_muteTag(
          [void Function(GMuteTagData_muteTagBuilder)? updates]) =>
      (new GMuteTagData_muteTagBuilder()..update(updates))._build();

  _$GMuteTagData_muteTag._(
      {required this.G__typename, required this.id, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMuteTagData_muteTag', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GMuteTagData_muteTag', 'id');
  }

  @override
  GMuteTagData_muteTag rebuild(
          void Function(GMuteTagData_muteTagBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMuteTagData_muteTagBuilder toBuilder() =>
      new GMuteTagData_muteTagBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMuteTagData_muteTag &&
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
    return (newBuiltValueToStringHelper(r'GMuteTagData_muteTag')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('viewer', viewer))
        .toString();
  }
}

class GMuteTagData_muteTagBuilder
    implements Builder<GMuteTagData_muteTag, GMuteTagData_muteTagBuilder> {
  _$GMuteTagData_muteTag? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GMuteTagData_muteTag_viewerBuilder? _viewer;
  GMuteTagData_muteTag_viewerBuilder get viewer =>
      _$this._viewer ??= new GMuteTagData_muteTag_viewerBuilder();
  set viewer(GMuteTagData_muteTag_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GMuteTagData_muteTagBuilder() {
    GMuteTagData_muteTag._initializeBuilder(this);
  }

  GMuteTagData_muteTagBuilder get _$this {
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
  void replace(GMuteTagData_muteTag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMuteTagData_muteTag;
  }

  @override
  void update(void Function(GMuteTagData_muteTagBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMuteTagData_muteTag build() => _build();

  _$GMuteTagData_muteTag _build() {
    _$GMuteTagData_muteTag _$result;
    try {
      _$result = _$v ??
          new _$GMuteTagData_muteTag._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GMuteTagData_muteTag', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GMuteTagData_muteTag', 'id'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GMuteTagData_muteTag', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GMuteTagData_muteTag_viewer extends GMuteTagData_muteTag_viewer {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final bool isMuted;

  factory _$GMuteTagData_muteTag_viewer(
          [void Function(GMuteTagData_muteTag_viewerBuilder)? updates]) =>
      (new GMuteTagData_muteTag_viewerBuilder()..update(updates))._build();

  _$GMuteTagData_muteTag_viewer._(
      {required this.G__typename, required this.id, required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMuteTagData_muteTag_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GMuteTagData_muteTag_viewer', 'id');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GMuteTagData_muteTag_viewer', 'isMuted');
  }

  @override
  GMuteTagData_muteTag_viewer rebuild(
          void Function(GMuteTagData_muteTag_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMuteTagData_muteTag_viewerBuilder toBuilder() =>
      new GMuteTagData_muteTag_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMuteTagData_muteTag_viewer &&
        G__typename == other.G__typename &&
        id == other.id &&
        isMuted == other.isMuted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMuteTagData_muteTag_viewer')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GMuteTagData_muteTag_viewerBuilder
    implements
        Builder<GMuteTagData_muteTag_viewer,
            GMuteTagData_muteTag_viewerBuilder> {
  _$GMuteTagData_muteTag_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GMuteTagData_muteTag_viewerBuilder() {
    GMuteTagData_muteTag_viewer._initializeBuilder(this);
  }

  GMuteTagData_muteTag_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMuteTagData_muteTag_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMuteTagData_muteTag_viewer;
  }

  @override
  void update(void Function(GMuteTagData_muteTag_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMuteTagData_muteTag_viewer build() => _build();

  _$GMuteTagData_muteTag_viewer _build() {
    final _$result = _$v ??
        new _$GMuteTagData_muteTag_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GMuteTagData_muteTag_viewer', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GMuteTagData_muteTag_viewer', 'id'),
            isMuted: BuiltValueNullFieldError.checkNotNull(
                isMuted, r'GMuteTagData_muteTag_viewer', 'isMuted'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
