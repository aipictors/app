// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorksData> _$gWorksDataSerializer = new _$GWorksDataSerializer();
Serializer<GWorksData_works> _$gWorksDataWorksSerializer =
    new _$GWorksData_worksSerializer();
Serializer<GWorksData_works_thumbnailImage>
    _$gWorksDataWorksThumbnailImageSerializer =
    new _$GWorksData_works_thumbnailImageSerializer();

class _$GWorksDataSerializer implements StructuredSerializer<GWorksData> {
  @override
  final Iterable<Type> types = const [GWorksData, _$GWorksData];
  @override
  final String wireName = 'GWorksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.works;
    if (value != null) {
      result
        ..add('works')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GWorksData_works)])));
    }
    return result;
  }

  @override
  GWorksData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorksDataBuilder();

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
        case 'works':
          result.works.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GWorksData_works)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorksData_worksSerializer
    implements StructuredSerializer<GWorksData_works> {
  @override
  final Iterable<Type> types = const [GWorksData_works, _$GWorksData_works];
  @override
  final String wireName = 'GWorksData_works';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorksData_works object,
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
            specifiedType: const FullType(GWorksData_works_thumbnailImage)));
    }
    return result;
  }

  @override
  GWorksData_works deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorksData_worksBuilder();

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
                  specifiedType:
                      const FullType(GWorksData_works_thumbnailImage))!
              as GWorksData_works_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorksData_works_thumbnailImageSerializer
    implements StructuredSerializer<GWorksData_works_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GWorksData_works_thumbnailImage,
    _$GWorksData_works_thumbnailImage
  ];
  @override
  final String wireName = 'GWorksData_works_thumbnailImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorksData_works_thumbnailImage object,
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
  GWorksData_works_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorksData_works_thumbnailImageBuilder();

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

class _$GWorksData extends GWorksData {
  @override
  final String G__typename;
  @override
  final BuiltList<GWorksData_works>? works;

  factory _$GWorksData([void Function(GWorksDataBuilder)? updates]) =>
      (new GWorksDataBuilder()..update(updates))._build();

  _$GWorksData._({required this.G__typename, this.works}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorksData', 'G__typename');
  }

  @override
  GWorksData rebuild(void Function(GWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorksDataBuilder toBuilder() => new GWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorksData &&
        G__typename == other.G__typename &&
        works == other.works;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, works.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorksData')
          ..add('G__typename', G__typename)
          ..add('works', works))
        .toString();
  }
}

class GWorksDataBuilder implements Builder<GWorksData, GWorksDataBuilder> {
  _$GWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GWorksData_works>? _works;
  ListBuilder<GWorksData_works> get works =>
      _$this._works ??= new ListBuilder<GWorksData_works>();
  set works(ListBuilder<GWorksData_works>? works) => _$this._works = works;

  GWorksDataBuilder() {
    GWorksData._initializeBuilder(this);
  }

  GWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _works = $v.works?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorksData;
  }

  @override
  void update(void Function(GWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorksData build() => _build();

  _$GWorksData _build() {
    _$GWorksData _$result;
    try {
      _$result = _$v ??
          new _$GWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorksData', 'G__typename'),
              works: _works?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        _works?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorksData_works extends GWorksData_works {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GWorksData_works_thumbnailImage? thumbnailImage;

  factory _$GWorksData_works(
          [void Function(GWorksData_worksBuilder)? updates]) =>
      (new GWorksData_worksBuilder()..update(updates))._build();

  _$GWorksData_works._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorksData_works', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GWorksData_works', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'GWorksData_works', 'title');
  }

  @override
  GWorksData_works rebuild(void Function(GWorksData_worksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorksData_worksBuilder toBuilder() =>
      new GWorksData_worksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorksData_works &&
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
    return (newBuiltValueToStringHelper(r'GWorksData_works')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GWorksData_worksBuilder
    implements Builder<GWorksData_works, GWorksData_worksBuilder> {
  _$GWorksData_works? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GWorksData_works_thumbnailImageBuilder? _thumbnailImage;
  GWorksData_works_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??= new GWorksData_works_thumbnailImageBuilder();
  set thumbnailImage(GWorksData_works_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GWorksData_worksBuilder() {
    GWorksData_works._initializeBuilder(this);
  }

  GWorksData_worksBuilder get _$this {
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
  void replace(GWorksData_works other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorksData_works;
  }

  @override
  void update(void Function(GWorksData_worksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorksData_works build() => _build();

  _$GWorksData_works _build() {
    _$GWorksData_works _$result;
    try {
      _$result = _$v ??
          new _$GWorksData_works._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorksData_works', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorksData_works', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GWorksData_works', 'title'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorksData_works', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorksData_works_thumbnailImage
    extends GWorksData_works_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorksData_works_thumbnailImage(
          [void Function(GWorksData_works_thumbnailImageBuilder)? updates]) =>
      (new GWorksData_works_thumbnailImageBuilder()..update(updates))._build();

  _$GWorksData_works_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorksData_works_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorksData_works_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GWorksData_works_thumbnailImage', 'downloadURL');
  }

  @override
  GWorksData_works_thumbnailImage rebuild(
          void Function(GWorksData_works_thumbnailImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorksData_works_thumbnailImageBuilder toBuilder() =>
      new GWorksData_works_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorksData_works_thumbnailImage &&
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
    return (newBuiltValueToStringHelper(r'GWorksData_works_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorksData_works_thumbnailImageBuilder
    implements
        Builder<GWorksData_works_thumbnailImage,
            GWorksData_works_thumbnailImageBuilder> {
  _$GWorksData_works_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorksData_works_thumbnailImageBuilder() {
    GWorksData_works_thumbnailImage._initializeBuilder(this);
  }

  GWorksData_works_thumbnailImageBuilder get _$this {
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
  void replace(GWorksData_works_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorksData_works_thumbnailImage;
  }

  @override
  void update(void Function(GWorksData_works_thumbnailImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorksData_works_thumbnailImage build() => _build();

  _$GWorksData_works_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GWorksData_works_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GWorksData_works_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorksData_works_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GWorksData_works_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
