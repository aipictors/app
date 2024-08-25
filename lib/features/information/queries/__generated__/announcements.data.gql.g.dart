// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcements.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAnnouncementsData> _$gAnnouncementsDataSerializer =
    new _$GAnnouncementsDataSerializer();
Serializer<GAnnouncementsData_announcements>
    _$gAnnouncementsDataAnnouncementsSerializer =
    new _$GAnnouncementsData_announcementsSerializer();

class _$GAnnouncementsDataSerializer
    implements StructuredSerializer<GAnnouncementsData> {
  @override
  final Iterable<Type> types = const [GAnnouncementsData, _$GAnnouncementsData];
  @override
  final String wireName = 'GAnnouncementsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAnnouncementsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'announcements',
      serializers.serialize(object.announcements,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GAnnouncementsData_announcements)])),
    ];

    return result;
  }

  @override
  GAnnouncementsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAnnouncementsDataBuilder();

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
        case 'announcements':
          result.announcements.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GAnnouncementsData_announcements)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAnnouncementsData_announcementsSerializer
    implements StructuredSerializer<GAnnouncementsData_announcements> {
  @override
  final Iterable<Type> types = const [
    GAnnouncementsData_announcements,
    _$GAnnouncementsData_announcements
  ];
  @override
  final String wireName = 'GAnnouncementsData_announcements';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAnnouncementsData_announcements object,
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
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'publishedAt',
      serializers.serialize(object.publishedAt,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GAnnouncementsData_announcements deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAnnouncementsData_announcementsBuilder();

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
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'publishedAt':
          result.publishedAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GAnnouncementsData extends GAnnouncementsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GAnnouncementsData_announcements> announcements;

  factory _$GAnnouncementsData(
          [void Function(GAnnouncementsDataBuilder)? updates]) =>
      (new GAnnouncementsDataBuilder()..update(updates))._build();

  _$GAnnouncementsData._(
      {required this.G__typename, required this.announcements})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAnnouncementsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        announcements, r'GAnnouncementsData', 'announcements');
  }

  @override
  GAnnouncementsData rebuild(
          void Function(GAnnouncementsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAnnouncementsDataBuilder toBuilder() =>
      new GAnnouncementsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAnnouncementsData &&
        G__typename == other.G__typename &&
        announcements == other.announcements;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, announcements.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAnnouncementsData')
          ..add('G__typename', G__typename)
          ..add('announcements', announcements))
        .toString();
  }
}

class GAnnouncementsDataBuilder
    implements Builder<GAnnouncementsData, GAnnouncementsDataBuilder> {
  _$GAnnouncementsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GAnnouncementsData_announcements>? _announcements;
  ListBuilder<GAnnouncementsData_announcements> get announcements =>
      _$this._announcements ??=
          new ListBuilder<GAnnouncementsData_announcements>();
  set announcements(
          ListBuilder<GAnnouncementsData_announcements>? announcements) =>
      _$this._announcements = announcements;

  GAnnouncementsDataBuilder() {
    GAnnouncementsData._initializeBuilder(this);
  }

  GAnnouncementsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _announcements = $v.announcements.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAnnouncementsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAnnouncementsData;
  }

  @override
  void update(void Function(GAnnouncementsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAnnouncementsData build() => _build();

  _$GAnnouncementsData _build() {
    _$GAnnouncementsData _$result;
    try {
      _$result = _$v ??
          new _$GAnnouncementsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAnnouncementsData', 'G__typename'),
              announcements: announcements.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'announcements';
        announcements.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAnnouncementsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAnnouncementsData_announcements
    extends GAnnouncementsData_announcements {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final String body;
  @override
  final int publishedAt;

  factory _$GAnnouncementsData_announcements(
          [void Function(GAnnouncementsData_announcementsBuilder)? updates]) =>
      (new GAnnouncementsData_announcementsBuilder()..update(updates))._build();

  _$GAnnouncementsData_announcements._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.body,
      required this.publishedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAnnouncementsData_announcements', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAnnouncementsData_announcements', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GAnnouncementsData_announcements', 'title');
    BuiltValueNullFieldError.checkNotNull(
        body, r'GAnnouncementsData_announcements', 'body');
    BuiltValueNullFieldError.checkNotNull(
        publishedAt, r'GAnnouncementsData_announcements', 'publishedAt');
  }

  @override
  GAnnouncementsData_announcements rebuild(
          void Function(GAnnouncementsData_announcementsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAnnouncementsData_announcementsBuilder toBuilder() =>
      new GAnnouncementsData_announcementsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAnnouncementsData_announcements &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        body == other.body &&
        publishedAt == other.publishedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, publishedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAnnouncementsData_announcements')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('body', body)
          ..add('publishedAt', publishedAt))
        .toString();
  }
}

class GAnnouncementsData_announcementsBuilder
    implements
        Builder<GAnnouncementsData_announcements,
            GAnnouncementsData_announcementsBuilder> {
  _$GAnnouncementsData_announcements? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  int? _publishedAt;
  int? get publishedAt => _$this._publishedAt;
  set publishedAt(int? publishedAt) => _$this._publishedAt = publishedAt;

  GAnnouncementsData_announcementsBuilder() {
    GAnnouncementsData_announcements._initializeBuilder(this);
  }

  GAnnouncementsData_announcementsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _body = $v.body;
      _publishedAt = $v.publishedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAnnouncementsData_announcements other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAnnouncementsData_announcements;
  }

  @override
  void update(void Function(GAnnouncementsData_announcementsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAnnouncementsData_announcements build() => _build();

  _$GAnnouncementsData_announcements _build() {
    final _$result = _$v ??
        new _$GAnnouncementsData_announcements._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GAnnouncementsData_announcements', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GAnnouncementsData_announcements', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GAnnouncementsData_announcements', 'title'),
            body: BuiltValueNullFieldError.checkNotNull(
                body, r'GAnnouncementsData_announcements', 'body'),
            publishedAt: BuiltValueNullFieldError.checkNotNull(publishedAt,
                r'GAnnouncementsData_announcements', 'publishedAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
