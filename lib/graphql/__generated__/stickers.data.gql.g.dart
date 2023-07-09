// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stickers.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStickersData> _$gStickersDataSerializer =
    new _$GStickersDataSerializer();
Serializer<GStickersData_works> _$gStickersDataWorksSerializer =
    new _$GStickersData_worksSerializer();
Serializer<GStickersData_works_image> _$gStickersDataWorksImageSerializer =
    new _$GStickersData_works_imageSerializer();

class _$GStickersDataSerializer implements StructuredSerializer<GStickersData> {
  @override
  final Iterable<Type> types = const [GStickersData, _$GStickersData];
  @override
  final String wireName = 'GStickersData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GStickersData object,
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
                BuiltList, const [const FullType(GStickersData_works)])));
    }
    return result;
  }

  @override
  GStickersData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickersDataBuilder();

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
                      BuiltList, const [const FullType(GStickersData_works)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GStickersData_worksSerializer
    implements StructuredSerializer<GStickersData_works> {
  @override
  final Iterable<Type> types = const [
    GStickersData_works,
    _$GStickersData_works
  ];
  @override
  final String wireName = 'GStickersData_works';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GStickersData_works object,
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GStickersData_works_image)));
    }
    return result;
  }

  @override
  GStickersData_works deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickersData_worksBuilder();

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
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GStickersData_works_image))!
              as GStickersData_works_image);
          break;
      }
    }

    return result.build();
  }
}

class _$GStickersData_works_imageSerializer
    implements StructuredSerializer<GStickersData_works_image> {
  @override
  final Iterable<Type> types = const [
    GStickersData_works_image,
    _$GStickersData_works_image
  ];
  @override
  final String wireName = 'GStickersData_works_image';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GStickersData_works_image object,
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
  GStickersData_works_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickersData_works_imageBuilder();

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

class _$GStickersData extends GStickersData {
  @override
  final String G__typename;
  @override
  final BuiltList<GStickersData_works>? works;

  factory _$GStickersData([void Function(GStickersDataBuilder)? updates]) =>
      (new GStickersDataBuilder()..update(updates))._build();

  _$GStickersData._({required this.G__typename, this.works}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickersData', 'G__typename');
  }

  @override
  GStickersData rebuild(void Function(GStickersDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickersDataBuilder toBuilder() => new GStickersDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickersData &&
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
    return (newBuiltValueToStringHelper(r'GStickersData')
          ..add('G__typename', G__typename)
          ..add('works', works))
        .toString();
  }
}

class GStickersDataBuilder
    implements Builder<GStickersData, GStickersDataBuilder> {
  _$GStickersData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GStickersData_works>? _works;
  ListBuilder<GStickersData_works> get works =>
      _$this._works ??= new ListBuilder<GStickersData_works>();
  set works(ListBuilder<GStickersData_works>? works) => _$this._works = works;

  GStickersDataBuilder() {
    GStickersData._initializeBuilder(this);
  }

  GStickersDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _works = $v.works?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStickersData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickersData;
  }

  @override
  void update(void Function(GStickersDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickersData build() => _build();

  _$GStickersData _build() {
    _$GStickersData _$result;
    try {
      _$result = _$v ??
          new _$GStickersData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GStickersData', 'G__typename'),
              works: _works?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'works';
        _works?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GStickersData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GStickersData_works extends GStickersData_works {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GStickersData_works_image? image;

  factory _$GStickersData_works(
          [void Function(GStickersData_worksBuilder)? updates]) =>
      (new GStickersData_worksBuilder()..update(updates))._build();

  _$GStickersData_works._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickersData_works', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GStickersData_works', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GStickersData_works', 'title');
  }

  @override
  GStickersData_works rebuild(
          void Function(GStickersData_worksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickersData_worksBuilder toBuilder() =>
      new GStickersData_worksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickersData_works &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStickersData_works')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('image', image))
        .toString();
  }
}

class GStickersData_worksBuilder
    implements Builder<GStickersData_works, GStickersData_worksBuilder> {
  _$GStickersData_works? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GStickersData_works_imageBuilder? _image;
  GStickersData_works_imageBuilder get image =>
      _$this._image ??= new GStickersData_works_imageBuilder();
  set image(GStickersData_works_imageBuilder? image) => _$this._image = image;

  GStickersData_worksBuilder() {
    GStickersData_works._initializeBuilder(this);
  }

  GStickersData_worksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _image = $v.image?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStickersData_works other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickersData_works;
  }

  @override
  void update(void Function(GStickersData_worksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickersData_works build() => _build();

  _$GStickersData_works _build() {
    _$GStickersData_works _$result;
    try {
      _$result = _$v ??
          new _$GStickersData_works._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GStickersData_works', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GStickersData_works', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GStickersData_works', 'title'),
              image: _image?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GStickersData_works', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GStickersData_works_image extends GStickersData_works_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GStickersData_works_image(
          [void Function(GStickersData_works_imageBuilder)? updates]) =>
      (new GStickersData_works_imageBuilder()..update(updates))._build();

  _$GStickersData_works_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GStickersData_works_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GStickersData_works_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL, r'GStickersData_works_image', 'downloadURL');
  }

  @override
  GStickersData_works_image rebuild(
          void Function(GStickersData_works_imageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickersData_works_imageBuilder toBuilder() =>
      new GStickersData_works_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickersData_works_image &&
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
    return (newBuiltValueToStringHelper(r'GStickersData_works_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GStickersData_works_imageBuilder
    implements
        Builder<GStickersData_works_image, GStickersData_works_imageBuilder> {
  _$GStickersData_works_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GStickersData_works_imageBuilder() {
    GStickersData_works_image._initializeBuilder(this);
  }

  GStickersData_works_imageBuilder get _$this {
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
  void replace(GStickersData_works_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickersData_works_image;
  }

  @override
  void update(void Function(GStickersData_works_imageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickersData_works_image build() => _build();

  _$GStickersData_works_image _build() {
    final _$result = _$v ??
        new _$GStickersData_works_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GStickersData_works_image', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GStickersData_works_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL, r'GStickersData_works_image', 'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
