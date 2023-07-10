// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHotWorksData> _$gHotWorksDataSerializer =
    new _$GHotWorksDataSerializer();
Serializer<GHotWorksData_hotWorks> _$gHotWorksDataHotWorksSerializer =
    new _$GHotWorksData_hotWorksSerializer();
Serializer<GHotWorksData_hotWorks_thumbnailImage>
    _$gHotWorksDataHotWorksThumbnailImageSerializer =
    new _$GHotWorksData_hotWorks_thumbnailImageSerializer();

class _$GHotWorksDataSerializer implements StructuredSerializer<GHotWorksData> {
  @override
  final Iterable<Type> types = const [GHotWorksData, _$GHotWorksData];
  @override
  final String wireName = 'GHotWorksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHotWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'hotWorks',
      serializers.serialize(object.hotWorks,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GHotWorksData_hotWorks)])),
    ];

    return result;
  }

  @override
  GHotWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotWorksDataBuilder();

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
        case 'hotWorks':
          result.hotWorks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GHotWorksData_hotWorks)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GHotWorksData_hotWorksSerializer
    implements StructuredSerializer<GHotWorksData_hotWorks> {
  @override
  final Iterable<Type> types = const [
    GHotWorksData_hotWorks,
    _$GHotWorksData_hotWorks
  ];
  @override
  final String wireName = 'GHotWorksData_hotWorks';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHotWorksData_hotWorks object,
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
                const FullType(GHotWorksData_hotWorks_thumbnailImage)));
    }
    return result;
  }

  @override
  GHotWorksData_hotWorks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotWorksData_hotWorksBuilder();

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
                  specifiedType:
                      const FullType(GHotWorksData_hotWorks_thumbnailImage))!
              as GHotWorksData_hotWorks_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GHotWorksData_hotWorks_thumbnailImageSerializer
    implements StructuredSerializer<GHotWorksData_hotWorks_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GHotWorksData_hotWorks_thumbnailImage,
    _$GHotWorksData_hotWorks_thumbnailImage
  ];
  @override
  final String wireName = 'GHotWorksData_hotWorks_thumbnailImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHotWorksData_hotWorks_thumbnailImage object,
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
  GHotWorksData_hotWorks_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHotWorksData_hotWorks_thumbnailImageBuilder();

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

class _$GHotWorksData extends GHotWorksData {
  @override
  final String G__typename;
  @override
  final BuiltList<GHotWorksData_hotWorks> hotWorks;

  factory _$GHotWorksData([void Function(GHotWorksDataBuilder)? updates]) =>
      (new GHotWorksDataBuilder()..update(updates))._build();

  _$GHotWorksData._({required this.G__typename, required this.hotWorks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHotWorksData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        hotWorks, r'GHotWorksData', 'hotWorks');
  }

  @override
  GHotWorksData rebuild(void Function(GHotWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotWorksDataBuilder toBuilder() => new GHotWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotWorksData &&
        G__typename == other.G__typename &&
        hotWorks == other.hotWorks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, hotWorks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHotWorksData')
          ..add('G__typename', G__typename)
          ..add('hotWorks', hotWorks))
        .toString();
  }
}

class GHotWorksDataBuilder
    implements Builder<GHotWorksData, GHotWorksDataBuilder> {
  _$GHotWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GHotWorksData_hotWorks>? _hotWorks;
  ListBuilder<GHotWorksData_hotWorks> get hotWorks =>
      _$this._hotWorks ??= new ListBuilder<GHotWorksData_hotWorks>();
  set hotWorks(ListBuilder<GHotWorksData_hotWorks>? hotWorks) =>
      _$this._hotWorks = hotWorks;

  GHotWorksDataBuilder() {
    GHotWorksData._initializeBuilder(this);
  }

  GHotWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hotWorks = $v.hotWorks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHotWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotWorksData;
  }

  @override
  void update(void Function(GHotWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotWorksData build() => _build();

  _$GHotWorksData _build() {
    _$GHotWorksData _$result;
    try {
      _$result = _$v ??
          new _$GHotWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHotWorksData', 'G__typename'),
              hotWorks: hotWorks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hotWorks';
        hotWorks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHotWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHotWorksData_hotWorks extends GHotWorksData_hotWorks {
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
  final GHotWorksData_hotWorks_thumbnailImage? thumbnailImage;

  factory _$GHotWorksData_hotWorks(
          [void Function(GHotWorksData_hotWorksBuilder)? updates]) =>
      (new GHotWorksData_hotWorksBuilder()..update(updates))._build();

  _$GHotWorksData_hotWorks._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHotWorksData_hotWorks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GHotWorksData_hotWorks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GHotWorksData_hotWorks', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GHotWorksData_hotWorks', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(
        commentsCount, r'GHotWorksData_hotWorks', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GHotWorksData_hotWorks', 'createdAt');
  }

  @override
  GHotWorksData_hotWorks rebuild(
          void Function(GHotWorksData_hotWorksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotWorksData_hotWorksBuilder toBuilder() =>
      new GHotWorksData_hotWorksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotWorksData_hotWorks &&
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
    return (newBuiltValueToStringHelper(r'GHotWorksData_hotWorks')
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

class GHotWorksData_hotWorksBuilder
    implements Builder<GHotWorksData_hotWorks, GHotWorksData_hotWorksBuilder> {
  _$GHotWorksData_hotWorks? _$v;

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

  GHotWorksData_hotWorks_thumbnailImageBuilder? _thumbnailImage;
  GHotWorksData_hotWorks_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GHotWorksData_hotWorks_thumbnailImageBuilder();
  set thumbnailImage(
          GHotWorksData_hotWorks_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GHotWorksData_hotWorksBuilder() {
    GHotWorksData_hotWorks._initializeBuilder(this);
  }

  GHotWorksData_hotWorksBuilder get _$this {
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
  void replace(GHotWorksData_hotWorks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotWorksData_hotWorks;
  }

  @override
  void update(void Function(GHotWorksData_hotWorksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotWorksData_hotWorks build() => _build();

  _$GHotWorksData_hotWorks _build() {
    _$GHotWorksData_hotWorks _$result;
    try {
      _$result = _$v ??
          new _$GHotWorksData_hotWorks._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHotWorksData_hotWorks', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GHotWorksData_hotWorks', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GHotWorksData_hotWorks', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GHotWorksData_hotWorks', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount, r'GHotWorksData_hotWorks', 'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GHotWorksData_hotWorks', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHotWorksData_hotWorks', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHotWorksData_hotWorks_thumbnailImage
    extends GHotWorksData_hotWorks_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GHotWorksData_hotWorks_thumbnailImage(
          [void Function(GHotWorksData_hotWorks_thumbnailImageBuilder)?
              updates]) =>
      (new GHotWorksData_hotWorks_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GHotWorksData_hotWorks_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHotWorksData_hotWorks_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHotWorksData_hotWorks_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GHotWorksData_hotWorks_thumbnailImage', 'downloadURL');
  }

  @override
  GHotWorksData_hotWorks_thumbnailImage rebuild(
          void Function(GHotWorksData_hotWorks_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotWorksData_hotWorks_thumbnailImageBuilder toBuilder() =>
      new GHotWorksData_hotWorks_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotWorksData_hotWorks_thumbnailImage &&
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
            r'GHotWorksData_hotWorks_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GHotWorksData_hotWorks_thumbnailImageBuilder
    implements
        Builder<GHotWorksData_hotWorks_thumbnailImage,
            GHotWorksData_hotWorks_thumbnailImageBuilder> {
  _$GHotWorksData_hotWorks_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GHotWorksData_hotWorks_thumbnailImageBuilder() {
    GHotWorksData_hotWorks_thumbnailImage._initializeBuilder(this);
  }

  GHotWorksData_hotWorks_thumbnailImageBuilder get _$this {
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
  void replace(GHotWorksData_hotWorks_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotWorksData_hotWorks_thumbnailImage;
  }

  @override
  void update(
      void Function(GHotWorksData_hotWorks_thumbnailImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotWorksData_hotWorks_thumbnailImage build() => _build();

  _$GHotWorksData_hotWorks_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GHotWorksData_hotWorks_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GHotWorksData_hotWorks_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHotWorksData_hotWorks_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GHotWorksData_hotWorks_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
