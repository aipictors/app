// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPopularWorksData> _$gPopularWorksDataSerializer =
    new _$GPopularWorksDataSerializer();
Serializer<GPopularWorksData_popularWorks>
    _$gPopularWorksDataPopularWorksSerializer =
    new _$GPopularWorksData_popularWorksSerializer();
Serializer<GPopularWorksData_popularWorks_thumbnailImage>
    _$gPopularWorksDataPopularWorksThumbnailImageSerializer =
    new _$GPopularWorksData_popularWorks_thumbnailImageSerializer();

class _$GPopularWorksDataSerializer
    implements StructuredSerializer<GPopularWorksData> {
  @override
  final Iterable<Type> types = const [GPopularWorksData, _$GPopularWorksData];
  @override
  final String wireName = 'GPopularWorksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPopularWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'popularWorks',
      serializers.serialize(object.popularWorks,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GPopularWorksData_popularWorks)])),
    ];

    return result;
  }

  @override
  GPopularWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPopularWorksDataBuilder();

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
        case 'popularWorks':
          result.popularWorks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPopularWorksData_popularWorks)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPopularWorksData_popularWorksSerializer
    implements StructuredSerializer<GPopularWorksData_popularWorks> {
  @override
  final Iterable<Type> types = const [
    GPopularWorksData_popularWorks,
    _$GPopularWorksData_popularWorks
  ];
  @override
  final String wireName = 'GPopularWorksData_popularWorks';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPopularWorksData_popularWorks object,
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
    ];
    Object? value;
    value = object.thumbnailImage;
    if (value != null) {
      result
        ..add('thumbnailImage')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPopularWorksData_popularWorks_thumbnailImage)));
    }
    return result;
  }

  @override
  GPopularWorksData_popularWorks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPopularWorksData_popularWorksBuilder();

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
        case 'thumbnailImage':
          result.thumbnailImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPopularWorksData_popularWorks_thumbnailImage))!
              as GPopularWorksData_popularWorks_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GPopularWorksData_popularWorks_thumbnailImageSerializer
    implements
        StructuredSerializer<GPopularWorksData_popularWorks_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GPopularWorksData_popularWorks_thumbnailImage,
    _$GPopularWorksData_popularWorks_thumbnailImage
  ];
  @override
  final String wireName = 'GPopularWorksData_popularWorks_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPopularWorksData_popularWorks_thumbnailImage object,
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
  GPopularWorksData_popularWorks_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPopularWorksData_popularWorks_thumbnailImageBuilder();

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

class _$GPopularWorksData extends GPopularWorksData {
  @override
  final String G__typename;
  @override
  final BuiltList<GPopularWorksData_popularWorks> popularWorks;

  factory _$GPopularWorksData(
          [void Function(GPopularWorksDataBuilder)? updates]) =>
      (new GPopularWorksDataBuilder()..update(updates))._build();

  _$GPopularWorksData._({required this.G__typename, required this.popularWorks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPopularWorksData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        popularWorks, r'GPopularWorksData', 'popularWorks');
  }

  @override
  GPopularWorksData rebuild(void Function(GPopularWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPopularWorksDataBuilder toBuilder() =>
      new GPopularWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPopularWorksData &&
        G__typename == other.G__typename &&
        popularWorks == other.popularWorks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, popularWorks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPopularWorksData')
          ..add('G__typename', G__typename)
          ..add('popularWorks', popularWorks))
        .toString();
  }
}

class GPopularWorksDataBuilder
    implements Builder<GPopularWorksData, GPopularWorksDataBuilder> {
  _$GPopularWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GPopularWorksData_popularWorks>? _popularWorks;
  ListBuilder<GPopularWorksData_popularWorks> get popularWorks =>
      _$this._popularWorks ??=
          new ListBuilder<GPopularWorksData_popularWorks>();
  set popularWorks(ListBuilder<GPopularWorksData_popularWorks>? popularWorks) =>
      _$this._popularWorks = popularWorks;

  GPopularWorksDataBuilder() {
    GPopularWorksData._initializeBuilder(this);
  }

  GPopularWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _popularWorks = $v.popularWorks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPopularWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPopularWorksData;
  }

  @override
  void update(void Function(GPopularWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPopularWorksData build() => _build();

  _$GPopularWorksData _build() {
    _$GPopularWorksData _$result;
    try {
      _$result = _$v ??
          new _$GPopularWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GPopularWorksData', 'G__typename'),
              popularWorks: popularWorks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'popularWorks';
        popularWorks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPopularWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPopularWorksData_popularWorks extends GPopularWorksData_popularWorks {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GPopularWorksData_popularWorks_thumbnailImage? thumbnailImage;

  factory _$GPopularWorksData_popularWorks(
          [void Function(GPopularWorksData_popularWorksBuilder)? updates]) =>
      (new GPopularWorksData_popularWorksBuilder()..update(updates))._build();

  _$GPopularWorksData_popularWorks._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPopularWorksData_popularWorks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPopularWorksData_popularWorks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPopularWorksData_popularWorks', 'title');
  }

  @override
  GPopularWorksData_popularWorks rebuild(
          void Function(GPopularWorksData_popularWorksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPopularWorksData_popularWorksBuilder toBuilder() =>
      new GPopularWorksData_popularWorksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPopularWorksData_popularWorks &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        thumbnailImage == other.thumbnailImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, thumbnailImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPopularWorksData_popularWorks')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GPopularWorksData_popularWorksBuilder
    implements
        Builder<GPopularWorksData_popularWorks,
            GPopularWorksData_popularWorksBuilder> {
  _$GPopularWorksData_popularWorks? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GPopularWorksData_popularWorks_thumbnailImageBuilder? _thumbnailImage;
  GPopularWorksData_popularWorks_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GPopularWorksData_popularWorks_thumbnailImageBuilder();
  set thumbnailImage(
          GPopularWorksData_popularWorks_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GPopularWorksData_popularWorksBuilder() {
    GPopularWorksData_popularWorks._initializeBuilder(this);
  }

  GPopularWorksData_popularWorksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _thumbnailImage = $v.thumbnailImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPopularWorksData_popularWorks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPopularWorksData_popularWorks;
  }

  @override
  void update(void Function(GPopularWorksData_popularWorksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPopularWorksData_popularWorks build() => _build();

  _$GPopularWorksData_popularWorks _build() {
    _$GPopularWorksData_popularWorks _$result;
    try {
      _$result = _$v ??
          new _$GPopularWorksData_popularWorks._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GPopularWorksData_popularWorks', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GPopularWorksData_popularWorks', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GPopularWorksData_popularWorks', 'title'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPopularWorksData_popularWorks', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPopularWorksData_popularWorks_thumbnailImage
    extends GPopularWorksData_popularWorks_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GPopularWorksData_popularWorks_thumbnailImage(
          [void Function(GPopularWorksData_popularWorks_thumbnailImageBuilder)?
              updates]) =>
      (new GPopularWorksData_popularWorks_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GPopularWorksData_popularWorks_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GPopularWorksData_popularWorks_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPopularWorksData_popularWorks_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GPopularWorksData_popularWorks_thumbnailImage', 'downloadURL');
  }

  @override
  GPopularWorksData_popularWorks_thumbnailImage rebuild(
          void Function(GPopularWorksData_popularWorks_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPopularWorksData_popularWorks_thumbnailImageBuilder toBuilder() =>
      new GPopularWorksData_popularWorks_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPopularWorksData_popularWorks_thumbnailImage &&
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
            r'GPopularWorksData_popularWorks_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GPopularWorksData_popularWorks_thumbnailImageBuilder
    implements
        Builder<GPopularWorksData_popularWorks_thumbnailImage,
            GPopularWorksData_popularWorks_thumbnailImageBuilder> {
  _$GPopularWorksData_popularWorks_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GPopularWorksData_popularWorks_thumbnailImageBuilder() {
    GPopularWorksData_popularWorks_thumbnailImage._initializeBuilder(this);
  }

  GPopularWorksData_popularWorks_thumbnailImageBuilder get _$this {
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
  void replace(GPopularWorksData_popularWorks_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPopularWorksData_popularWorks_thumbnailImage;
  }

  @override
  void update(
      void Function(GPopularWorksData_popularWorks_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPopularWorksData_popularWorks_thumbnailImage build() => _build();

  _$GPopularWorksData_popularWorks_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GPopularWorksData_popularWorks_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPopularWorksData_popularWorks_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPopularWorksData_popularWorks_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GPopularWorksData_popularWorks_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
