// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_works.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTagWorksData> _$gTagWorksDataSerializer =
    new _$GTagWorksDataSerializer();
Serializer<GTagWorksData_tag> _$gTagWorksDataTagSerializer =
    new _$GTagWorksData_tagSerializer();
Serializer<GTagWorksData_tag_works> _$gTagWorksDataTagWorksSerializer =
    new _$GTagWorksData_tag_worksSerializer();
Serializer<GTagWorksData_tag_works_thumbnailImage>
    _$gTagWorksDataTagWorksThumbnailImageSerializer =
    new _$GTagWorksData_tag_works_thumbnailImageSerializer();

class _$GTagWorksDataSerializer implements StructuredSerializer<GTagWorksData> {
  @override
  final Iterable<Type> types = const [GTagWorksData, _$GTagWorksData];
  @override
  final String wireName = 'GTagWorksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTagWorksData object,
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
            specifiedType: const FullType(GTagWorksData_tag)));
    }
    return result;
  }

  @override
  GTagWorksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagWorksDataBuilder();

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
                  specifiedType: const FullType(GTagWorksData_tag))!
              as GTagWorksData_tag);
          break;
      }
    }

    return result.build();
  }
}

class _$GTagWorksData_tagSerializer
    implements StructuredSerializer<GTagWorksData_tag> {
  @override
  final Iterable<Type> types = const [GTagWorksData_tag, _$GTagWorksData_tag];
  @override
  final String wireName = 'GTagWorksData_tag';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTagWorksData_tag object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'works',
      serializers.serialize(object.works,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GTagWorksData_tag_works)])),
    ];

    return result;
  }

  @override
  GTagWorksData_tag deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagWorksData_tagBuilder();

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
        case 'works':
          result.works.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GTagWorksData_tag_works)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GTagWorksData_tag_worksSerializer
    implements StructuredSerializer<GTagWorksData_tag_works> {
  @override
  final Iterable<Type> types = const [
    GTagWorksData_tag_works,
    _$GTagWorksData_tag_works
  ];
  @override
  final String wireName = 'GTagWorksData_tag_works';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTagWorksData_tag_works object,
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
                const FullType(GTagWorksData_tag_works_thumbnailImage)));
    }
    return result;
  }

  @override
  GTagWorksData_tag_works deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagWorksData_tag_worksBuilder();

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
                      const FullType(GTagWorksData_tag_works_thumbnailImage))!
              as GTagWorksData_tag_works_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GTagWorksData_tag_works_thumbnailImageSerializer
    implements StructuredSerializer<GTagWorksData_tag_works_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GTagWorksData_tag_works_thumbnailImage,
    _$GTagWorksData_tag_works_thumbnailImage
  ];
  @override
  final String wireName = 'GTagWorksData_tag_works_thumbnailImage';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GTagWorksData_tag_works_thumbnailImage object,
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
  GTagWorksData_tag_works_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagWorksData_tag_works_thumbnailImageBuilder();

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

class _$GTagWorksData extends GTagWorksData {
  @override
  final String G__typename;
  @override
  final GTagWorksData_tag? tag;

  factory _$GTagWorksData([void Function(GTagWorksDataBuilder)? updates]) =>
      (new GTagWorksDataBuilder()..update(updates))._build();

  _$GTagWorksData._({required this.G__typename, this.tag}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTagWorksData', 'G__typename');
  }

  @override
  GTagWorksData rebuild(void Function(GTagWorksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagWorksDataBuilder toBuilder() => new GTagWorksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagWorksData &&
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
    return (newBuiltValueToStringHelper(r'GTagWorksData')
          ..add('G__typename', G__typename)
          ..add('tag', tag))
        .toString();
  }
}

class GTagWorksDataBuilder
    implements Builder<GTagWorksData, GTagWorksDataBuilder> {
  _$GTagWorksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GTagWorksData_tagBuilder? _tag;
  GTagWorksData_tagBuilder get tag =>
      _$this._tag ??= new GTagWorksData_tagBuilder();
  set tag(GTagWorksData_tagBuilder? tag) => _$this._tag = tag;

  GTagWorksDataBuilder() {
    GTagWorksData._initializeBuilder(this);
  }

  GTagWorksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _tag = $v.tag?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTagWorksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagWorksData;
  }

  @override
  void update(void Function(GTagWorksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagWorksData build() => _build();

  _$GTagWorksData _build() {
    _$GTagWorksData _$result;
    try {
      _$result = _$v ??
          new _$GTagWorksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GTagWorksData', 'G__typename'),
              tag: _tag?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tag';
        _tag?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTagWorksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTagWorksData_tag extends GTagWorksData_tag {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GTagWorksData_tag_works> works;

  factory _$GTagWorksData_tag(
          [void Function(GTagWorksData_tagBuilder)? updates]) =>
      (new GTagWorksData_tagBuilder()..update(updates))._build();

  _$GTagWorksData_tag._(
      {required this.G__typename, required this.id, required this.works})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTagWorksData_tag', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GTagWorksData_tag', 'id');
    BuiltValueNullFieldError.checkNotNull(works, r'GTagWorksData_tag', 'works');
  }

  @override
  GTagWorksData_tag rebuild(void Function(GTagWorksData_tagBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagWorksData_tagBuilder toBuilder() =>
      new GTagWorksData_tagBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagWorksData_tag &&
        G__typename == other.G__typename &&
        id == other.id &&
        works == other.works;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, works.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTagWorksData_tag')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('works', works))
        .toString();
  }
}

class GTagWorksData_tagBuilder
    implements Builder<GTagWorksData_tag, GTagWorksData_tagBuilder> {
  _$GTagWorksData_tag? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GTagWorksData_tag_works>? _works;
  ListBuilder<GTagWorksData_tag_works> get works =>
      _$this._works ??= new ListBuilder<GTagWorksData_tag_works>();
  set works(ListBuilder<GTagWorksData_tag_works>? works) =>
      _$this._works = works;

  GTagWorksData_tagBuilder() {
    GTagWorksData_tag._initializeBuilder(this);
  }

  GTagWorksData_tagBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _works = $v.works.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTagWorksData_tag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagWorksData_tag;
  }

  @override
  void update(void Function(GTagWorksData_tagBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagWorksData_tag build() => _build();

  _$GTagWorksData_tag _build() {
    _$GTagWorksData_tag _$result;
    try {
      _$result = _$v ??
          new _$GTagWorksData_tag._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GTagWorksData_tag', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GTagWorksData_tag', 'id'),
              works: works.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        works.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTagWorksData_tag', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTagWorksData_tag_works extends GTagWorksData_tag_works {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GTagWorksData_tag_works_thumbnailImage? thumbnailImage;

  factory _$GTagWorksData_tag_works(
          [void Function(GTagWorksData_tag_worksBuilder)? updates]) =>
      (new GTagWorksData_tag_worksBuilder()..update(updates))._build();

  _$GTagWorksData_tag_works._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTagWorksData_tag_works', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GTagWorksData_tag_works', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GTagWorksData_tag_works', 'title');
  }

  @override
  GTagWorksData_tag_works rebuild(
          void Function(GTagWorksData_tag_worksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagWorksData_tag_worksBuilder toBuilder() =>
      new GTagWorksData_tag_worksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagWorksData_tag_works &&
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
    return (newBuiltValueToStringHelper(r'GTagWorksData_tag_works')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GTagWorksData_tag_worksBuilder
    implements
        Builder<GTagWorksData_tag_works, GTagWorksData_tag_worksBuilder> {
  _$GTagWorksData_tag_works? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GTagWorksData_tag_works_thumbnailImageBuilder? _thumbnailImage;
  GTagWorksData_tag_works_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GTagWorksData_tag_works_thumbnailImageBuilder();
  set thumbnailImage(
          GTagWorksData_tag_works_thumbnailImageBuilder? thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GTagWorksData_tag_worksBuilder() {
    GTagWorksData_tag_works._initializeBuilder(this);
  }

  GTagWorksData_tag_worksBuilder get _$this {
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
  void replace(GTagWorksData_tag_works other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagWorksData_tag_works;
  }

  @override
  void update(void Function(GTagWorksData_tag_worksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagWorksData_tag_works build() => _build();

  _$GTagWorksData_tag_works _build() {
    _$GTagWorksData_tag_works _$result;
    try {
      _$result = _$v ??
          new _$GTagWorksData_tag_works._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GTagWorksData_tag_works', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GTagWorksData_tag_works', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GTagWorksData_tag_works', 'title'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GTagWorksData_tag_works', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GTagWorksData_tag_works_thumbnailImage
    extends GTagWorksData_tag_works_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GTagWorksData_tag_works_thumbnailImage(
          [void Function(GTagWorksData_tag_works_thumbnailImageBuilder)?
              updates]) =>
      (new GTagWorksData_tag_works_thumbnailImageBuilder()..update(updates))
          ._build();

  _$GTagWorksData_tag_works_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GTagWorksData_tag_works_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GTagWorksData_tag_works_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GTagWorksData_tag_works_thumbnailImage', 'downloadURL');
  }

  @override
  GTagWorksData_tag_works_thumbnailImage rebuild(
          void Function(GTagWorksData_tag_works_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagWorksData_tag_works_thumbnailImageBuilder toBuilder() =>
      new GTagWorksData_tag_works_thumbnailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagWorksData_tag_works_thumbnailImage &&
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
            r'GTagWorksData_tag_works_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GTagWorksData_tag_works_thumbnailImageBuilder
    implements
        Builder<GTagWorksData_tag_works_thumbnailImage,
            GTagWorksData_tag_works_thumbnailImageBuilder> {
  _$GTagWorksData_tag_works_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GTagWorksData_tag_works_thumbnailImageBuilder() {
    GTagWorksData_tag_works_thumbnailImage._initializeBuilder(this);
  }

  GTagWorksData_tag_works_thumbnailImageBuilder get _$this {
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
  void replace(GTagWorksData_tag_works_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagWorksData_tag_works_thumbnailImage;
  }

  @override
  void update(
      void Function(GTagWorksData_tag_works_thumbnailImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagWorksData_tag_works_thumbnailImage build() => _build();

  _$GTagWorksData_tag_works_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GTagWorksData_tag_works_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GTagWorksData_tag_works_thumbnailImage', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GTagWorksData_tag_works_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(downloadURL,
                r'GTagWorksData_tag_works_thumbnailImage', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
