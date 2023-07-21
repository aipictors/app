// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_works_summary_notification_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GLikedWorksSummaryNotificationFieldsData>
    _$gLikedWorksSummaryNotificationFieldsDataSerializer =
    new _$GLikedWorksSummaryNotificationFieldsDataSerializer();

class _$GLikedWorksSummaryNotificationFieldsDataSerializer
    implements StructuredSerializer<GLikedWorksSummaryNotificationFieldsData> {
  @override
  final Iterable<Type> types = const [
    GLikedWorksSummaryNotificationFieldsData,
    _$GLikedWorksSummaryNotificationFieldsData
  ];
  @override
  final String wireName = 'GLikedWorksSummaryNotificationFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLikedWorksSummaryNotificationFieldsData object,
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
    return result;
  }

  @override
  GLikedWorksSummaryNotificationFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GLikedWorksSummaryNotificationFieldsDataBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GLikedWorksSummaryNotificationFieldsData
    extends GLikedWorksSummaryNotificationFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String? message;

  factory _$GLikedWorksSummaryNotificationFieldsData(
          [void Function(GLikedWorksSummaryNotificationFieldsDataBuilder)?
              updates]) =>
      (new GLikedWorksSummaryNotificationFieldsDataBuilder()..update(updates))
          ._build();

  _$GLikedWorksSummaryNotificationFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GLikedWorksSummaryNotificationFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GLikedWorksSummaryNotificationFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GLikedWorksSummaryNotificationFieldsData', 'createdAt');
  }

  @override
  GLikedWorksSummaryNotificationFieldsData rebuild(
          void Function(GLikedWorksSummaryNotificationFieldsDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLikedWorksSummaryNotificationFieldsDataBuilder toBuilder() =>
      new GLikedWorksSummaryNotificationFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLikedWorksSummaryNotificationFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GLikedWorksSummaryNotificationFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('message', message))
        .toString();
  }
}

class GLikedWorksSummaryNotificationFieldsDataBuilder
    implements
        Builder<GLikedWorksSummaryNotificationFieldsData,
            GLikedWorksSummaryNotificationFieldsDataBuilder> {
  _$GLikedWorksSummaryNotificationFieldsData? _$v;

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

  GLikedWorksSummaryNotificationFieldsDataBuilder() {
    GLikedWorksSummaryNotificationFieldsData._initializeBuilder(this);
  }

  GLikedWorksSummaryNotificationFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GLikedWorksSummaryNotificationFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLikedWorksSummaryNotificationFieldsData;
  }

  @override
  void update(
      void Function(GLikedWorksSummaryNotificationFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GLikedWorksSummaryNotificationFieldsData build() => _build();

  _$GLikedWorksSummaryNotificationFieldsData _build() {
    final _$result = _$v ??
        new _$GLikedWorksSummaryNotificationFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GLikedWorksSummaryNotificationFieldsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GLikedWorksSummaryNotificationFieldsData', 'id'),
            createdAt: BuiltValueNullFieldError.checkNotNull(createdAt,
                r'GLikedWorksSummaryNotificationFieldsData', 'createdAt'),
            message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
