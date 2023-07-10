// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_tags.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHotTagsData> _$gHotTagsDataSerializer =
    new _$GHotTagsDataSerializer();
Serializer<GHotTagsData_hotTags> _$gHotTagsDataHotTagsSerializer =
    new _$GHotTagsData_hotTagsSerializer();
Serializer<GHotTagsData_hotTags_firstWork>
    _$gHotTagsDataHotTagsFirstWorkSerializer =
    new _$GHotTagsData_hotTags_firstWorkSerializer();
Serializer<GHotTagsData_hotTags_firstWork_thumbnailImage>
    _$gHotTagsDataHotTagsFirstWorkThumbnailImageSerializer =
    new _$GHotTagsData_hotTags_firstWork_thumbnailImageSerializer();

class _$GHotTagsDataSerializer implements StructuredSerializer<GHotTagsData> {
  @override
  final Iterable<Type> types = const [GHotTagsData, _$GHotTagsData];
  @override
  final String wireName = 'GHotTagsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHotTagsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'hotTags',
      serializers.serialize(object.hotTags,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GHotTagsData_hotTags)])),
    ];

    return result;
  }

  @override
  GHotTagsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotTagsDataBuilder();

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
        case 'hotTags':
          result.hotTags.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GHotTagsData_hotTags)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHotTagsData_hotTagsSerializer
    implements StructuredSerializer<GHotTagsData_hotTags> {
  @override
  final Iterable<Type> types = const [
    GHotTagsData_hotTags,
    _$GHotTagsData_hotTags
  ];
  @override
  final String wireName = 'GHotTagsData_hotTags';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHotTagsData_hotTags object,
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
    value = object.firstWork;
    if (value != null) {
      result
        ..add('firstWork')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GHotTagsData_hotTags_firstWork)));
    }
    return result;
  }

  @override
  GHotTagsData_hotTags deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotTagsData_hotTagsBuilder();

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
        case 'firstWork':
          result.firstWork.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GHotTagsData_hotTags_firstWork))!
              as GHotTagsData_hotTags_firstWork);
          break;
      }
    }

    return result.build();
  }
}

class _$GHotTagsData_hotTags_firstWorkSerializer
    implements StructuredSerializer<GHotTagsData_hotTags_firstWork> {
  @override
  final Iterable<Type> types = const [
    GHotTagsData_hotTags_firstWork,
    _$GHotTagsData_hotTags_firstWork
  ];
  @override
  final String wireName = 'GHotTagsData_hotTags_firstWork';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHotTagsData_hotTags_firstWork object,
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
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GHotTagsData_hotTags_firstWork_thumbnailImage)));
    }
    return result;
  }

  @override
  GHotTagsData_hotTags_firstWork deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotTagsData_hotTags_firstWorkBuilder();

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
                      GHotTagsData_hotTags_firstWork_thumbnailImage))!
              as GHotTagsData_hotTags_firstWork_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GHotTagsData_hotTags_firstWork_thumbnailImageSerializer
    implements
        StructuredSerializer<GHotTagsData_hotTags_firstWork_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GHotTagsData_hotTags_firstWork_thumbnailImage,
    _$GHotTagsData_hotTags_firstWork_thumbnailImage
  ];
  @override
  final String wireName = 'GHotTagsData_hotTags_firstWork_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHotTagsData_hotTags_firstWork_thumbnailImage object,
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
  GHotTagsData_hotTags_firstWork_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotTagsData_hotTags_firstWork_thumbnailImageBuilder();

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

class _$GHotTagsData extends GHotTagsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GHotTagsData_hotTags> hotTags;

  factory _$GHotTagsData([void Function(GHotTagsDataBuilder)? updates]) =>
      (new GHotTagsDataBuilder()..update(updates))._build();

  _$GHotTagsData._({required this.G__typename, required this.hotTags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHotTagsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(hotTags, r'GHotTagsData', 'hotTags');
  }

  @override
  GHotTagsData rebuild(void Function(GHotTagsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotTagsDataBuilder toBuilder() => new GHotTagsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotTagsData &&
        G__typename == other.G__typename &&
        hotTags == other.hotTags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, hotTags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHotTagsData')
          ..add('G__typename', G__typename)
          ..add('hotTags', hotTags))
        .toString();
  }
}

class GHotTagsDataBuilder
    implements Builder<GHotTagsData, GHotTagsDataBuilder> {
  _$GHotTagsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GHotTagsData_hotTags>? _hotTags;
  ListBuilder<GHotTagsData_hotTags> get hotTags =>
      _$this._hotTags ??= new ListBuilder<GHotTagsData_hotTags>();
  set hotTags(ListBuilder<GHotTagsData_hotTags>? hotTags) =>
      _$this._hotTags = hotTags;

  GHotTagsDataBuilder() {
    GHotTagsData._initializeBuilder(this);
  }

  GHotTagsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hotTags = $v.hotTags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHotTagsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotTagsData;
  }

  @override
  void update(void Function(GHotTagsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotTagsData build() => _build();

  _$GHotTagsData _build() {
    _$GHotTagsData _$result;
    try {
      _$result = _$v ??
          new _$GHotTagsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHotTagsData', 'G__typename'),
              hotTags: hotTags.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hotTags';
        hotTags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHotTagsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHotTagsData_hotTags extends GHotTagsData_hotTags {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final GHotTagsData_hotTags_firstWork? firstWork;

  factory _$GHotTagsData_hotTags(
          [void Function(GHotTagsData_hotTagsBuilder)? updates]) =>
      (new GHotTagsData_hotTagsBuilder()..update(updates))._build();

  _$GHotTagsData_hotTags._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.firstWork})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHotTagsData_hotTags', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHotTagsData_hotTags', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHotTagsData_hotTags', 'name');
  }

  @override
  GHotTagsData_hotTags rebuild(
          void Function(GHotTagsData_hotTagsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotTagsData_hotTagsBuilder toBuilder() =>
      new GHotTagsData_hotTagsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotTagsData_hotTags &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        firstWork == other.firstWork;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, firstWork.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHotTagsData_hotTags')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('firstWork', firstWork))
        .toString();
  }
}

class GHotTagsData_hotTagsBuilder
    implements Builder<GHotTagsData_hotTags, GHotTagsData_hotTagsBuilder> {
  _$GHotTagsData_hotTags? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHotTagsData_hotTags_firstWorkBuilder? _firstWork;
  GHotTagsData_hotTags_firstWorkBuilder get firstWork =>
      _$this._firstWork ??= new GHotTagsData_hotTags_firstWorkBuilder();
  set firstWork(GHotTagsData_hotTags_firstWorkBuilder? firstWork) =>
      _$this._firstWork = firstWork;

  GHotTagsData_hotTagsBuilder() {
    GHotTagsData_hotTags._initializeBuilder(this);
  }

  GHotTagsData_hotTagsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _firstWork = $v.firstWork?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHotTagsData_hotTags other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotTagsData_hotTags;
  }

  @override
  void update(void Function(GHotTagsData_hotTagsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotTagsData_hotTags build() => _build();

  _$GHotTagsData_hotTags _build() {
    _$GHotTagsData_hotTags _$result;
    try {
      _$result = _$v ??
          new _$GHotTagsData_hotTags._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHotTagsData_hotTags', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GHotTagsData_hotTags', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GHotTagsData_hotTags', 'name'),
              firstWork: _firstWork?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'firstWork';
        _firstWork?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHotTagsData_hotTags', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHotTagsData_hotTags_firstWork extends GHotTagsData_hotTags_firstWork {
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
  final GHotTagsData_hotTags_firstWork_thumbnailImage? thumbnailImage;

  factory _$GHotTagsData_hotTags_firstWork(
          [void Function(GHotTagsData_hotTags_firstWorkBuilder)? updates]) =>
      (new GHotTagsData_hotTags_firstWorkBuilder()..update(updates))._build();

  _$GHotTagsData_hotTags_firstWork._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHotTagsData_hotTags_firstWork', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHotTagsData_hotTags_firstWork', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GHotTagsData_hotTags_firstWork', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GHotTagsData_hotTags_firstWork', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GHotTagsData_hotTags_firstWork', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GHotTagsData_hotTags_firstWork', 'createdAt');
  }

  @override
  GHotTagsData_hotTags_firstWork rebuild(
          void Function(GHotTagsData_hotTags_firstWorkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotTagsData_hotTags_firstWorkBuilder toBuilder() =>
      new GHotTagsData_hotTags_firstWorkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotTagsData_hotTags_firstWork &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        likesCount == other.likesCount &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        thumbnailImage == other.thumbnailImage;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHotTagsData_hotTags_firstWork')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('likesCount', likesCount)
          ..add('commentsCount', commentsCount)
          ..add('createdAt', createdAt)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GHotTagsData_hotTags_firstWorkBuilder
    implements
        Builder<GHotTagsData_hotTags_firstWork,
            GHotTagsData_hotTags_firstWorkBuilder> {
  _$GHotTagsData_hotTags_firstWork? _$v;

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

  GHotTagsData_hotTags_firstWork_thumbnailImageBuilder? _thumbnailImage;
  GHotTagsData_hotTags_firstWork_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GHotTagsData_hotTags_firstWork_thumbnailImageBuilder();
  set thumbnailImage(
          GHotTagsData_hotTags_firstWork_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GHotTagsData_hotTags_firstWorkBuilder() {
    GHotTagsData_hotTags_firstWork._initializeBuilder(this);
  }

  GHotTagsData_hotTags_firstWorkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _likesCount = $v.likesCount;
      _commentsCount = $v.commentsCount;
      _createdAt = $v.createdAt;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHotTagsData_hotTags_firstWork other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotTagsData_hotTags_firstWork;
  }

  @override
  void update(void Function(GHotTagsData_hotTags_firstWorkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotTagsData_hotTags_firstWork build() => _build();

  _$GHotTagsData_hotTags_firstWork _build() {
    _$GHotTagsData_hotTags_firstWork _$result;
    try {
      _$result = _$v ??
          new _$GHotTagsData_hotTags_firstWork._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GHotTagsData_hotTags_firstWork', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GHotTagsData_hotTags_firstWork', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GHotTagsData_hotTags_firstWork', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GHotTagsData_hotTags_firstWork', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount,
                  r'GHotTagsData_hotTags_firstWork',
                  'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GHotTagsData_hotTags_firstWork', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHotTagsData_hotTags_firstWork', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHotTagsData_hotTags_firstWork_thumbnailImage
    extends GHotTagsData_hotTags_firstWork_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GHotTagsData_hotTags_firstWork_thumbnailImage(
          [void Function(GHotTagsData_hotTags_firstWork_thumbnailImageBuilder)?
              updates]) =>
      (new GHotTagsData_hotTags_firstWork_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GHotTagsData_hotTags_firstWork_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHotTagsData_hotTags_firstWork_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHotTagsData_hotTags_firstWork_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GHotTagsData_hotTags_firstWork_thumbnailImage', 'downloadURL');
  }

  @override
  GHotTagsData_hotTags_firstWork_thumbnailImage rebuild(
          void Function(GHotTagsData_hotTags_firstWork_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotTagsData_hotTags_firstWork_thumbnailImageBuilder toBuilder() =>
      new GHotTagsData_hotTags_firstWork_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotTagsData_hotTags_firstWork_thumbnailImage &&
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
            r'GHotTagsData_hotTags_firstWork_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GHotTagsData_hotTags_firstWork_thumbnailImageBuilder
    implements
        Builder<GHotTagsData_hotTags_firstWork_thumbnailImage,
            GHotTagsData_hotTags_firstWork_thumbnailImageBuilder> {
  _$GHotTagsData_hotTags_firstWork_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GHotTagsData_hotTags_firstWork_thumbnailImageBuilder() {
    GHotTagsData_hotTags_firstWork_thumbnailImage._initializeBuilder(this);
  }

  GHotTagsData_hotTags_firstWork_thumbnailImageBuilder get _$this {
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
  void replace(GHotTagsData_hotTags_firstWork_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotTagsData_hotTags_firstWork_thumbnailImage;
  }

  @override
  void update(
      void Function(GHotTagsData_hotTags_firstWork_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotTagsData_hotTags_firstWork_thumbnailImage build() => _build();

  _$GHotTagsData_hotTags_firstWork_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GHotTagsData_hotTags_firstWork_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GHotTagsData_hotTags_firstWork_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHotTagsData_hotTags_firstWork_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GHotTagsData_hotTags_firstWork_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
