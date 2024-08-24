// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTagsData> _$gTagsDataSerializer = new _$GTagsDataSerializer();
Serializer<GTagsData_tags> _$gTagsDataTagsSerializer =
    new _$GTagsData_tagsSerializer();

class _$GTagsDataSerializer implements StructuredSerializer<GTagsData> {
  @override
  final Iterable<Type> types = const [GTagsData, _$GTagsData];
  @override
  final String wireName = 'GTagsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTagsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GTagsData_tags)])),
    ];

    return result;
  }

  @override
  GTagsData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagsDataBuilder();

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
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GTagsData_tags)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GTagsData_tagsSerializer
    implements StructuredSerializer<GTagsData_tags> {
  @override
  final Iterable<Type> types = const [GTagsData_tags, _$GTagsData_tags];
  @override
  final String wireName = 'GTagsData_tags';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTagsData_tags object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
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
  GTagsData_tags deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagsData_tagsBuilder();

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

class _$GTagsData extends GTagsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GTagsData_tags> tags;

  factory _$GTagsData([void Function(GTagsDataBuilder)? updates]) =>
      (new GTagsDataBuilder()..update(updates))._build();

  _$GTagsData._({required this.G__typename, required this.tags}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTagsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(tags, r'GTagsData', 'tags');
  }

  @override
  GTagsData rebuild(void Function(GTagsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagsDataBuilder toBuilder() => new GTagsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagsData &&
        G__typename == other.G__typename &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTagsData')
          ..add('G__typename', G__typename)
          ..add('tags', tags))
        .toString();
  }
}

class GTagsDataBuilder implements Builder<GTagsData, GTagsDataBuilder> {
  _$GTagsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GTagsData_tags>? _tags;
  ListBuilder<GTagsData_tags> get tags =>
      _$this._tags ??= new ListBuilder<GTagsData_tags>();
  set tags(ListBuilder<GTagsData_tags>? tags) => _$this._tags = tags;

  GTagsDataBuilder() {
    GTagsData._initializeBuilder(this);
  }

  GTagsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _tags = $v.tags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTagsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagsData;
  }

  @override
  void update(void Function(GTagsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagsData build() => _build();

  _$GTagsData _build() {
    _$GTagsData _$result;
    try {
      _$result = _$v ??
          new _$GTagsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GTagsData', 'G__typename'),
              tags: tags.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTagsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTagsData_tags extends GTagsData_tags {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final bool isLiked;
  @override
  final bool isWatched;
  @override
  final bool isMuted;

  factory _$GTagsData_tags([void Function(GTagsData_tagsBuilder)? updates]) =>
      (new GTagsData_tagsBuilder()..update(updates))._build();

  _$GTagsData_tags._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.isLiked,
      required this.isWatched,
      required this.isMuted})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTagsData_tags', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GTagsData_tags', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'GTagsData_tags', 'name');
    BuiltValueNullFieldError.checkNotNull(
        isLiked, r'GTagsData_tags', 'isLiked');
    BuiltValueNullFieldError.checkNotNull(
        isWatched, r'GTagsData_tags', 'isWatched');
    BuiltValueNullFieldError.checkNotNull(
        isMuted, r'GTagsData_tags', 'isMuted');
  }

  @override
  GTagsData_tags rebuild(void Function(GTagsData_tagsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagsData_tagsBuilder toBuilder() =>
      new GTagsData_tagsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagsData_tags &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        isLiked == other.isLiked &&
        isWatched == other.isWatched &&
        isMuted == other.isMuted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, isLiked.hashCode);
    _$hash = $jc(_$hash, isWatched.hashCode);
    _$hash = $jc(_$hash, isMuted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTagsData_tags')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('isLiked', isLiked)
          ..add('isWatched', isWatched)
          ..add('isMuted', isMuted))
        .toString();
  }
}

class GTagsData_tagsBuilder
    implements Builder<GTagsData_tags, GTagsData_tagsBuilder> {
  _$GTagsData_tags? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isLiked;
  bool? get isLiked => _$this._isLiked;
  set isLiked(bool? isLiked) => _$this._isLiked = isLiked;

  bool? _isWatched;
  bool? get isWatched => _$this._isWatched;
  set isWatched(bool? isWatched) => _$this._isWatched = isWatched;

  bool? _isMuted;
  bool? get isMuted => _$this._isMuted;
  set isMuted(bool? isMuted) => _$this._isMuted = isMuted;

  GTagsData_tagsBuilder() {
    GTagsData_tags._initializeBuilder(this);
  }

  GTagsData_tagsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _isLiked = $v.isLiked;
      _isWatched = $v.isWatched;
      _isMuted = $v.isMuted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTagsData_tags other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagsData_tags;
  }

  @override
  void update(void Function(GTagsData_tagsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagsData_tags build() => _build();

  _$GTagsData_tags _build() {
    final _$result = _$v ??
        new _$GTagsData_tags._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GTagsData_tags', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GTagsData_tags', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GTagsData_tags', 'name'),
            isLiked: BuiltValueNullFieldError.checkNotNull(
                isLiked, r'GTagsData_tags', 'isLiked'),
            isWatched: BuiltValueNullFieldError.checkNotNull(
                isWatched, r'GTagsData_tags', 'isWatched'),
            isMuted: BuiltValueNullFieldError.checkNotNull(
                isMuted, r'GTagsData_tags', 'isMuted'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
