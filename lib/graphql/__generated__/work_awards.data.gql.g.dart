// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_awards.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkAwardsData> _$gWorkAwardsDataSerializer =
    new _$GWorkAwardsDataSerializer();
Serializer<GWorkAwardsData_workAwards> _$gWorkAwardsDataWorkAwardsSerializer =
    new _$GWorkAwardsData_workAwardsSerializer();
Serializer<GWorkAwardsData_workAwards_work>
    _$gWorkAwardsDataWorkAwardsWorkSerializer =
    new _$GWorkAwardsData_workAwards_workSerializer();
Serializer<GWorkAwardsData_workAwards_work_thumbnailImage>
    _$gWorkAwardsDataWorkAwardsWorkThumbnailImageSerializer =
    new _$GWorkAwardsData_workAwards_work_thumbnailImageSerializer();

class _$GWorkAwardsDataSerializer
    implements StructuredSerializer<GWorkAwardsData> {
  @override
  final Iterable<Type> types = const [GWorkAwardsData, _$GWorkAwardsData];
  @override
  final String wireName = 'GWorkAwardsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorkAwardsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'workAwards',
      serializers.serialize(object.workAwards,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GWorkAwardsData_workAwards)])),
    ];

    return result;
  }

  @override
  GWorkAwardsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardsDataBuilder();

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
        case 'workAwards':
          result.workAwards.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GWorkAwardsData_workAwards)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkAwardsData_workAwardsSerializer
    implements StructuredSerializer<GWorkAwardsData_workAwards> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardsData_workAwards,
    _$GWorkAwardsData_workAwards
  ];
  @override
  final String wireName = 'GWorkAwardsData_workAwards';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkAwardsData_workAwards object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'index',
      serializers.serialize(object.index, specifiedType: const FullType(int)),
      'dateText',
      serializers.serialize(object.dateText,
          specifiedType: const FullType(String)),
      'work',
      serializers.serialize(object.work,
          specifiedType: const FullType(GWorkAwardsData_workAwards_work)),
    ];

    return result;
  }

  @override
  GWorkAwardsData_workAwards deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardsData_workAwardsBuilder();

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
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'dateText':
          result.dateText = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'work':
          result.work.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GWorkAwardsData_workAwards_work))!
              as GWorkAwardsData_workAwards_work);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkAwardsData_workAwards_workSerializer
    implements StructuredSerializer<GWorkAwardsData_workAwards_work> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardsData_workAwards_work,
    _$GWorkAwardsData_workAwards_work
  ];
  @override
  final String wireName = 'GWorkAwardsData_workAwards_work';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkAwardsData_workAwards_work object,
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
            specifiedType: const FullType(
                GWorkAwardsData_workAwards_work_thumbnailImage)));
    }
    return result;
  }

  @override
  GWorkAwardsData_workAwards_work deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardsData_workAwards_workBuilder();

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
                      GWorkAwardsData_workAwards_work_thumbnailImage))!
              as GWorkAwardsData_workAwards_work_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkAwardsData_workAwards_work_thumbnailImageSerializer
    implements
        StructuredSerializer<GWorkAwardsData_workAwards_work_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardsData_workAwards_work_thumbnailImage,
    _$GWorkAwardsData_workAwards_work_thumbnailImage
  ];
  @override
  final String wireName = 'GWorkAwardsData_workAwards_work_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkAwardsData_workAwards_work_thumbnailImage object,
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
  GWorkAwardsData_workAwards_work_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardsData_workAwards_work_thumbnailImageBuilder();

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

class _$GWorkAwardsData extends GWorkAwardsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GWorkAwardsData_workAwards> workAwards;

  factory _$GWorkAwardsData([void Function(GWorkAwardsDataBuilder)? updates]) =>
      (new GWorkAwardsDataBuilder()..update(updates))._build();

  _$GWorkAwardsData._({required this.G__typename, required this.workAwards})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkAwardsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        workAwards, r'GWorkAwardsData', 'workAwards');
  }

  @override
  GWorkAwardsData rebuild(void Function(GWorkAwardsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardsDataBuilder toBuilder() =>
      new GWorkAwardsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardsData &&
        G__typename == other.G__typename &&
        workAwards == other.workAwards;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, workAwards.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkAwardsData')
          ..add('G__typename', G__typename)
          ..add('workAwards', workAwards))
        .toString();
  }
}

class GWorkAwardsDataBuilder
    implements Builder<GWorkAwardsData, GWorkAwardsDataBuilder> {
  _$GWorkAwardsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GWorkAwardsData_workAwards>? _workAwards;
  ListBuilder<GWorkAwardsData_workAwards> get workAwards =>
      _$this._workAwards ??= new ListBuilder<GWorkAwardsData_workAwards>();
  set workAwards(ListBuilder<GWorkAwardsData_workAwards>? workAwards) =>
      _$this._workAwards = workAwards;

  GWorkAwardsDataBuilder() {
    GWorkAwardsData._initializeBuilder(this);
  }

  GWorkAwardsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _workAwards = $v.workAwards.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkAwardsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardsData;
  }

  @override
  void update(void Function(GWorkAwardsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardsData build() => _build();

  _$GWorkAwardsData _build() {
    _$GWorkAwardsData _$result;
    try {
      _$result = _$v ??
          new _$GWorkAwardsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkAwardsData', 'G__typename'),
              workAwards: workAwards.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'workAwards';
        workAwards.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkAwardsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkAwardsData_workAwards extends GWorkAwardsData_workAwards {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int index;
  @override
  final String dateText;
  @override
  final GWorkAwardsData_workAwards_work work;

  factory _$GWorkAwardsData_workAwards(
          [void Function(GWorkAwardsData_workAwardsBuilder)? updates]) =>
      (new GWorkAwardsData_workAwardsBuilder()..update(updates))._build();

  _$GWorkAwardsData_workAwards._(
      {required this.G__typename,
      required this.id,
      required this.index,
      required this.dateText,
      required this.work})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkAwardsData_workAwards', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkAwardsData_workAwards', 'id');
    BuiltValueNullFieldError.checkNotNull(
        index, r'GWorkAwardsData_workAwards', 'index');
    BuiltValueNullFieldError.checkNotNull(
        dateText, r'GWorkAwardsData_workAwards', 'dateText');
    BuiltValueNullFieldError.checkNotNull(
        work, r'GWorkAwardsData_workAwards', 'work');
  }

  @override
  GWorkAwardsData_workAwards rebuild(
          void Function(GWorkAwardsData_workAwardsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardsData_workAwardsBuilder toBuilder() =>
      new GWorkAwardsData_workAwardsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardsData_workAwards &&
        G__typename == other.G__typename &&
        id == other.id &&
        index == other.index &&
        dateText == other.dateText &&
        work == other.work;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, index.hashCode);
    _$hash = $jc(_$hash, dateText.hashCode);
    _$hash = $jc(_$hash, work.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkAwardsData_workAwards')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('index', index)
          ..add('dateText', dateText)
          ..add('work', work))
        .toString();
  }
}

class GWorkAwardsData_workAwardsBuilder
    implements
        Builder<GWorkAwardsData_workAwards, GWorkAwardsData_workAwardsBuilder> {
  _$GWorkAwardsData_workAwards? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  String? _dateText;
  String? get dateText => _$this._dateText;
  set dateText(String? dateText) => _$this._dateText = dateText;

  GWorkAwardsData_workAwards_workBuilder? _work;
  GWorkAwardsData_workAwards_workBuilder get work =>
      _$this._work ??= new GWorkAwardsData_workAwards_workBuilder();
  set work(GWorkAwardsData_workAwards_workBuilder? work) => _$this._work = work;

  GWorkAwardsData_workAwardsBuilder() {
    GWorkAwardsData_workAwards._initializeBuilder(this);
  }

  GWorkAwardsData_workAwardsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _index = $v.index;
      _dateText = $v.dateText;
      _work = $v.work.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkAwardsData_workAwards other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardsData_workAwards;
  }

  @override
  void update(void Function(GWorkAwardsData_workAwardsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardsData_workAwards build() => _build();

  _$GWorkAwardsData_workAwards _build() {
    _$GWorkAwardsData_workAwards _$result;
    try {
      _$result = _$v ??
          new _$GWorkAwardsData_workAwards._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkAwardsData_workAwards', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkAwardsData_workAwards', 'id'),
              index: BuiltValueNullFieldError.checkNotNull(
                  index, r'GWorkAwardsData_workAwards', 'index'),
              dateText: BuiltValueNullFieldError.checkNotNull(
                  dateText, r'GWorkAwardsData_workAwards', 'dateText'),
              work: work.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'work';
        work.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkAwardsData_workAwards', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkAwardsData_workAwards_work
    extends GWorkAwardsData_workAwards_work {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final GWorkAwardsData_workAwards_work_thumbnailImage? thumbnailImage;

  factory _$GWorkAwardsData_workAwards_work(
          [void Function(GWorkAwardsData_workAwards_workBuilder)? updates]) =>
      (new GWorkAwardsData_workAwards_workBuilder()..update(updates))._build();

  _$GWorkAwardsData_workAwards_work._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkAwardsData_workAwards_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkAwardsData_workAwards_work', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GWorkAwardsData_workAwards_work', 'title');
  }

  @override
  GWorkAwardsData_workAwards_work rebuild(
          void Function(GWorkAwardsData_workAwards_workBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardsData_workAwards_workBuilder toBuilder() =>
      new GWorkAwardsData_workAwards_workBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardsData_workAwards_work &&
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
    return (newBuiltValueToStringHelper(r'GWorkAwardsData_workAwards_work')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('thumbnailImage', thumbnailImage))
        .toString();
  }
}

class GWorkAwardsData_workAwards_workBuilder
    implements
        Builder<GWorkAwardsData_workAwards_work,
            GWorkAwardsData_workAwards_workBuilder> {
  _$GWorkAwardsData_workAwards_work? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GWorkAwardsData_workAwards_work_thumbnailImageBuilder? _thumbnailImage;
  GWorkAwardsData_workAwards_work_thumbnailImageBuilder get thumbnailImage =>
      _$this._thumbnailImage ??=
          new GWorkAwardsData_workAwards_work_thumbnailImageBuilder();
  set thumbnailImage(
          GWorkAwardsData_workAwards_work_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GWorkAwardsData_workAwards_workBuilder() {
    GWorkAwardsData_workAwards_work._initializeBuilder(this);
  }

  GWorkAwardsData_workAwards_workBuilder get _$this {
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
  void replace(GWorkAwardsData_workAwards_work other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardsData_workAwards_work;
  }

  @override
  void update(void Function(GWorkAwardsData_workAwards_workBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardsData_workAwards_work build() => _build();

  _$GWorkAwardsData_workAwards_work _build() {
    _$GWorkAwardsData_workAwards_work _$result;
    try {
      _$result = _$v ??
          new _$GWorkAwardsData_workAwards_work._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkAwardsData_workAwards_work', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkAwardsData_workAwards_work', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GWorkAwardsData_workAwards_work', 'title'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkAwardsData_workAwards_work', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkAwardsData_workAwards_work_thumbnailImage
    extends GWorkAwardsData_workAwards_work_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkAwardsData_workAwards_work_thumbnailImage(
          [void Function(GWorkAwardsData_workAwards_work_thumbnailImageBuilder)?
              updates]) =>
      (new GWorkAwardsData_workAwards_work_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GWorkAwardsData_workAwards_work_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkAwardsData_workAwards_work_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkAwardsData_workAwards_work_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GWorkAwardsData_workAwards_work_thumbnailImage', 'downloadURL');
  }

  @override
  GWorkAwardsData_workAwards_work_thumbnailImage rebuild(
          void Function(GWorkAwardsData_workAwards_work_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardsData_workAwards_work_thumbnailImageBuilder toBuilder() =>
      new GWorkAwardsData_workAwards_work_thumbnailImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardsData_workAwards_work_thumbnailImage &&
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
            r'GWorkAwardsData_workAwards_work_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkAwardsData_workAwards_work_thumbnailImageBuilder
    implements
        Builder<GWorkAwardsData_workAwards_work_thumbnailImage,
            GWorkAwardsData_workAwards_work_thumbnailImageBuilder> {
  _$GWorkAwardsData_workAwards_work_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkAwardsData_workAwards_work_thumbnailImageBuilder() {
    GWorkAwardsData_workAwards_work_thumbnailImage._initializeBuilder(this);
  }

  GWorkAwardsData_workAwards_work_thumbnailImageBuilder get _$this {
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
  void replace(GWorkAwardsData_workAwards_work_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardsData_workAwards_work_thumbnailImage;
  }

  @override
  void update(
      void Function(GWorkAwardsData_workAwards_work_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardsData_workAwards_work_thumbnailImage build() => _build();

  _$GWorkAwardsData_workAwards_work_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GWorkAwardsData_workAwards_work_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkAwardsData_workAwards_work_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkAwardsData_workAwards_work_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkAwardsData_workAwards_work_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
