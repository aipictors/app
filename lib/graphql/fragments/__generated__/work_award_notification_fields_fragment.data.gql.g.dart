// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_award_notification_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkAwardNotificationFieldsData>
    _$gWorkAwardNotificationFieldsDataSerializer =
    new _$GWorkAwardNotificationFieldsDataSerializer();
Serializer<GWorkAwardNotificationFieldsData_work>
    _$gWorkAwardNotificationFieldsDataWorkSerializer =
    new _$GWorkAwardNotificationFieldsData_workSerializer();
Serializer<GWorkAwardNotificationFieldsData_work_thumbnailImage>
    _$gWorkAwardNotificationFieldsDataWorkThumbnailImageSerializer =
    new _$GWorkAwardNotificationFieldsData_work_thumbnailImageSerializer();

class _$GWorkAwardNotificationFieldsDataSerializer
    implements StructuredSerializer<GWorkAwardNotificationFieldsData> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardNotificationFieldsData,
    _$GWorkAwardNotificationFieldsData
  ];
  @override
  final String wireName = 'GWorkAwardNotificationFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkAwardNotificationFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.work;
    if (value != null) {
      result
        ..add('work')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GWorkAwardNotificationFieldsData_work)));
    }
    return result;
  }

  @override
  GWorkAwardNotificationFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardNotificationFieldsDataBuilder();

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
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'work':
          result.work.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GWorkAwardNotificationFieldsData_work))!
              as GWorkAwardNotificationFieldsData_work);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkAwardNotificationFieldsData_workSerializer
    implements StructuredSerializer<GWorkAwardNotificationFieldsData_work> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardNotificationFieldsData_work,
    _$GWorkAwardNotificationFieldsData_work
  ];
  @override
  final String wireName = 'GWorkAwardNotificationFieldsData_work';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkAwardNotificationFieldsData_work object,
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
            specifiedType: const FullType(
                GWorkAwardNotificationFieldsData_work_thumbnailImage)));
    }
    return result;
  }

  @override
  GWorkAwardNotificationFieldsData_work deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardNotificationFieldsData_workBuilder();

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
                      GWorkAwardNotificationFieldsData_work_thumbnailImage))!
              as GWorkAwardNotificationFieldsData_work_thumbnailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkAwardNotificationFieldsData_work_thumbnailImageSerializer
    implements
        StructuredSerializer<
            GWorkAwardNotificationFieldsData_work_thumbnailImage> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardNotificationFieldsData_work_thumbnailImage,
    _$GWorkAwardNotificationFieldsData_work_thumbnailImage
  ];
  @override
  final String wireName =
      'GWorkAwardNotificationFieldsData_work_thumbnailImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkAwardNotificationFieldsData_work_thumbnailImage object,
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
  GWorkAwardNotificationFieldsData_work_thumbnailImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder();

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

class _$GWorkAwardNotificationFieldsData
    extends GWorkAwardNotificationFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String? message;
  @override
  final GWorkAwardNotificationFieldsData_work? work;

  factory _$GWorkAwardNotificationFieldsData(
          [void Function(GWorkAwardNotificationFieldsDataBuilder)? updates]) =>
      (new GWorkAwardNotificationFieldsDataBuilder()..update(updates))._build();

  _$GWorkAwardNotificationFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      this.message,
      this.work})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkAwardNotificationFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkAwardNotificationFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkAwardNotificationFieldsData', 'createdAt');
  }

  @override
  GWorkAwardNotificationFieldsData rebuild(
          void Function(GWorkAwardNotificationFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardNotificationFieldsDataBuilder toBuilder() =>
      new GWorkAwardNotificationFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardNotificationFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        message == other.message &&
        work == other.work;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, work.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkAwardNotificationFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('message', message)
          ..add('work', work))
        .toString();
  }
}

class GWorkAwardNotificationFieldsDataBuilder
    implements
        Builder<GWorkAwardNotificationFieldsData,
            GWorkAwardNotificationFieldsDataBuilder> {
  _$GWorkAwardNotificationFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  GWorkAwardNotificationFieldsData_workBuilder? _work;
  GWorkAwardNotificationFieldsData_workBuilder get work =>
      _$this._work ??= new GWorkAwardNotificationFieldsData_workBuilder();
  set work(GWorkAwardNotificationFieldsData_workBuilder? work) =>
      _$this._work = work;

  GWorkAwardNotificationFieldsDataBuilder() {
    GWorkAwardNotificationFieldsData._initializeBuilder(this);
  }

  GWorkAwardNotificationFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _message = $v.message;
      _work = $v.work?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkAwardNotificationFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardNotificationFieldsData;
  }

  @override
  void update(void Function(GWorkAwardNotificationFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardNotificationFieldsData build() => _build();

  _$GWorkAwardNotificationFieldsData _build() {
    _$GWorkAwardNotificationFieldsData _$result;
    try {
      _$result = _$v ??
          new _$GWorkAwardNotificationFieldsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkAwardNotificationFieldsData', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkAwardNotificationFieldsData', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GWorkAwardNotificationFieldsData', 'createdAt'),
              message: message,
              work: _work?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'work';
        _work?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkAwardNotificationFieldsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkAwardNotificationFieldsData_work
    extends GWorkAwardNotificationFieldsData_work {
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
  final GWorkAwardNotificationFieldsData_work_thumbnailImage? thumbnailImage;

  factory _$GWorkAwardNotificationFieldsData_work(
          [void Function(GWorkAwardNotificationFieldsData_workBuilder)?
              updates]) =>
      (new GWorkAwardNotificationFieldsData_workBuilder()..update(updates))
          ._build();

  _$GWorkAwardNotificationFieldsData_work._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      this.thumbnailImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkAwardNotificationFieldsData_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkAwardNotificationFieldsData_work', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GWorkAwardNotificationFieldsData_work', 'title');
    BuiltValueNullFieldError.checkNotNull(
        likesCount, r'GWorkAwardNotificationFieldsData_work', 'likesCount');
    BuiltValueNullFieldError.checkNotNull(commentsCount,
        r'GWorkAwardNotificationFieldsData_work', 'commentsCount');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkAwardNotificationFieldsData_work', 'createdAt');
  }

  @override
  GWorkAwardNotificationFieldsData_work rebuild(
          void Function(GWorkAwardNotificationFieldsData_workBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardNotificationFieldsData_workBuilder toBuilder() =>
      new GWorkAwardNotificationFieldsData_workBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardNotificationFieldsData_work &&
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
    return (newBuiltValueToStringHelper(
            r'GWorkAwardNotificationFieldsData_work')
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

class GWorkAwardNotificationFieldsData_workBuilder
    implements
        Builder<GWorkAwardNotificationFieldsData_work,
            GWorkAwardNotificationFieldsData_workBuilder> {
  _$GWorkAwardNotificationFieldsData_work? _$v;

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

  GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder? _thumbnailImage;
  GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder
      get thumbnailImage => _$this._thumbnailImage ??=
          new GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder();
  set thumbnailImage(
          GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder?
              thumbnailImage) =>
      _$this._thumbnailImage = thumbnailImage;

  GWorkAwardNotificationFieldsData_workBuilder() {
    GWorkAwardNotificationFieldsData_work._initializeBuilder(this);
  }

  GWorkAwardNotificationFieldsData_workBuilder get _$this {
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
  void replace(GWorkAwardNotificationFieldsData_work other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardNotificationFieldsData_work;
  }

  @override
  void update(
      void Function(GWorkAwardNotificationFieldsData_workBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardNotificationFieldsData_work build() => _build();

  _$GWorkAwardNotificationFieldsData_work _build() {
    _$GWorkAwardNotificationFieldsData_work _$result;
    try {
      _$result = _$v ??
          new _$GWorkAwardNotificationFieldsData_work._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkAwardNotificationFieldsData_work', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkAwardNotificationFieldsData_work', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GWorkAwardNotificationFieldsData_work', 'title'),
              likesCount: BuiltValueNullFieldError.checkNotNull(
                  likesCount, r'GWorkAwardNotificationFieldsData_work', 'likesCount'),
              commentsCount: BuiltValueNullFieldError.checkNotNull(
                  commentsCount,
                  r'GWorkAwardNotificationFieldsData_work',
                  'commentsCount'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GWorkAwardNotificationFieldsData_work', 'createdAt'),
              thumbnailImage: _thumbnailImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'thumbnailImage';
        _thumbnailImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkAwardNotificationFieldsData_work',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkAwardNotificationFieldsData_work_thumbnailImage
    extends GWorkAwardNotificationFieldsData_work_thumbnailImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkAwardNotificationFieldsData_work_thumbnailImage(
          [void Function(
                  GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder)?
              updates]) =>
      (new GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder()
            ..update(updates))
          ._build();

  _$GWorkAwardNotificationFieldsData_work_thumbnailImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkAwardNotificationFieldsData_work_thumbnailImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkAwardNotificationFieldsData_work_thumbnailImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GWorkAwardNotificationFieldsData_work_thumbnailImage', 'downloadURL');
  }

  @override
  GWorkAwardNotificationFieldsData_work_thumbnailImage rebuild(
          void Function(
                  GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder toBuilder() =>
      new GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardNotificationFieldsData_work_thumbnailImage &&
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
            r'GWorkAwardNotificationFieldsData_work_thumbnailImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder
    implements
        Builder<GWorkAwardNotificationFieldsData_work_thumbnailImage,
            GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder> {
  _$GWorkAwardNotificationFieldsData_work_thumbnailImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder() {
    GWorkAwardNotificationFieldsData_work_thumbnailImage._initializeBuilder(
        this);
  }

  GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder get _$this {
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
  void replace(GWorkAwardNotificationFieldsData_work_thumbnailImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardNotificationFieldsData_work_thumbnailImage;
  }

  @override
  void update(
      void Function(
              GWorkAwardNotificationFieldsData_work_thumbnailImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardNotificationFieldsData_work_thumbnailImage build() => _build();

  _$GWorkAwardNotificationFieldsData_work_thumbnailImage _build() {
    final _$result = _$v ??
        new _$GWorkAwardNotificationFieldsData_work_thumbnailImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkAwardNotificationFieldsData_work_thumbnailImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GWorkAwardNotificationFieldsData_work_thumbnailImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkAwardNotificationFieldsData_work_thumbnailImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
