// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_notifications.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerNotificationsData> _$gViewerNotificationsDataSerializer =
    new _$GViewerNotificationsDataSerializer();
Serializer<GViewerNotificationsData_viewer>
    _$gViewerNotificationsDataViewerSerializer =
    new _$GViewerNotificationsData_viewerSerializer();
Serializer<GViewerNotificationsData_viewer_notifications>
    _$gViewerNotificationsDataViewerNotificationsSerializer =
    new _$GViewerNotificationsData_viewer_notificationsSerializer();

class _$GViewerNotificationsDataSerializer
    implements StructuredSerializer<GViewerNotificationsData> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData,
    _$GViewerNotificationsData
  ];
  @override
  final String wireName = 'GViewerNotificationsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerNotificationsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GViewerNotificationsData_viewer)));
    }
    return result;
  }

  @override
  GViewerNotificationsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerNotificationsDataBuilder();

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
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GViewerNotificationsData_viewer))!
              as GViewerNotificationsData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerNotificationsData_viewerSerializer
    implements StructuredSerializer<GViewerNotificationsData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData_viewer,
    _$GViewerNotificationsData_viewer
  ];
  @override
  final String wireName = 'GViewerNotificationsData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerNotificationsData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'notifications',
      serializers.serialize(object.notifications,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GViewerNotificationsData_viewer_notifications)
          ])),
    ];

    return result;
  }

  @override
  GViewerNotificationsData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerNotificationsData_viewerBuilder();

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
        case 'notifications':
          result.notifications.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GViewerNotificationsData_viewer_notifications)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerNotificationsData_viewer_notificationsSerializer
    implements
        StructuredSerializer<GViewerNotificationsData_viewer_notifications> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsData_viewer_notifications,
    _$GViewerNotificationsData_viewer_notifications
  ];
  @override
  final String wireName = 'GViewerNotificationsData_viewer_notifications';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerNotificationsData_viewer_notifications object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(_i2.GNotificationType)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.workId;
    if (value != null) {
      result
        ..add('workId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GViewerNotificationsData_viewer_notifications deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerNotificationsData_viewer_notificationsBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GNotificationType))!
              as _i2.GNotificationType;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'workId':
          result.workId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerNotificationsData extends GViewerNotificationsData {
  @override
  final String G__typename;
  @override
  final GViewerNotificationsData_viewer? viewer;

  factory _$GViewerNotificationsData(
          [void Function(GViewerNotificationsDataBuilder)? updates]) =>
      (new GViewerNotificationsDataBuilder()..update(updates))._build();

  _$GViewerNotificationsData._({required this.G__typename, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerNotificationsData', 'G__typename');
  }

  @override
  GViewerNotificationsData rebuild(
          void Function(GViewerNotificationsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsDataBuilder toBuilder() =>
      new GViewerNotificationsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerNotificationsData &&
        G__typename == other.G__typename &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerNotificationsData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerNotificationsDataBuilder
    implements
        Builder<GViewerNotificationsData, GViewerNotificationsDataBuilder> {
  _$GViewerNotificationsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerNotificationsData_viewerBuilder? _viewer;
  GViewerNotificationsData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerNotificationsData_viewerBuilder();
  set viewer(GViewerNotificationsData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerNotificationsDataBuilder() {
    GViewerNotificationsData._initializeBuilder(this);
  }

  GViewerNotificationsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerNotificationsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerNotificationsData;
  }

  @override
  void update(void Function(GViewerNotificationsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData build() => _build();

  _$GViewerNotificationsData _build() {
    _$GViewerNotificationsData _$result;
    try {
      _$result = _$v ??
          new _$GViewerNotificationsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GViewerNotificationsData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerNotificationsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerNotificationsData_viewer
    extends GViewerNotificationsData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<GViewerNotificationsData_viewer_notifications> notifications;

  factory _$GViewerNotificationsData_viewer(
          [void Function(GViewerNotificationsData_viewerBuilder)? updates]) =>
      (new GViewerNotificationsData_viewerBuilder()..update(updates))._build();

  _$GViewerNotificationsData_viewer._(
      {required this.G__typename, required this.notifications})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerNotificationsData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        notifications, r'GViewerNotificationsData_viewer', 'notifications');
  }

  @override
  GViewerNotificationsData_viewer rebuild(
          void Function(GViewerNotificationsData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsData_viewerBuilder toBuilder() =>
      new GViewerNotificationsData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerNotificationsData_viewer &&
        G__typename == other.G__typename &&
        notifications == other.notifications;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, notifications.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerNotificationsData_viewer')
          ..add('G__typename', G__typename)
          ..add('notifications', notifications))
        .toString();
  }
}

class GViewerNotificationsData_viewerBuilder
    implements
        Builder<GViewerNotificationsData_viewer,
            GViewerNotificationsData_viewerBuilder> {
  _$GViewerNotificationsData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GViewerNotificationsData_viewer_notifications>? _notifications;
  ListBuilder<GViewerNotificationsData_viewer_notifications>
      get notifications => _$this._notifications ??=
          new ListBuilder<GViewerNotificationsData_viewer_notifications>();
  set notifications(
          ListBuilder<GViewerNotificationsData_viewer_notifications>?
              notifications) =>
      _$this._notifications = notifications;

  GViewerNotificationsData_viewerBuilder() {
    GViewerNotificationsData_viewer._initializeBuilder(this);
  }

  GViewerNotificationsData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _notifications = $v.notifications.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerNotificationsData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerNotificationsData_viewer;
  }

  @override
  void update(void Function(GViewerNotificationsData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData_viewer build() => _build();

  _$GViewerNotificationsData_viewer _build() {
    _$GViewerNotificationsData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerNotificationsData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GViewerNotificationsData_viewer', 'G__typename'),
              notifications: notifications.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notifications';
        notifications.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerNotificationsData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerNotificationsData_viewer_notifications
    extends GViewerNotificationsData_viewer_notifications {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final _i2.GNotificationType type;
  @override
  final int? createdAt;
  @override
  final String message;
  @override
  final String? workId;

  factory _$GViewerNotificationsData_viewer_notifications(
          [void Function(GViewerNotificationsData_viewer_notificationsBuilder)?
              updates]) =>
      (new GViewerNotificationsData_viewer_notificationsBuilder()
            ..update(updates))
          ._build();

  _$GViewerNotificationsData_viewer_notifications._(
      {required this.G__typename,
      required this.id,
      required this.type,
      this.createdAt,
      required this.message,
      this.workId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GViewerNotificationsData_viewer_notifications', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerNotificationsData_viewer_notifications', 'id');
    BuiltValueNullFieldError.checkNotNull(
        type, r'GViewerNotificationsData_viewer_notifications', 'type');
    BuiltValueNullFieldError.checkNotNull(
        message, r'GViewerNotificationsData_viewer_notifications', 'message');
  }

  @override
  GViewerNotificationsData_viewer_notifications rebuild(
          void Function(GViewerNotificationsData_viewer_notificationsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsData_viewer_notificationsBuilder toBuilder() =>
      new GViewerNotificationsData_viewer_notificationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerNotificationsData_viewer_notifications &&
        G__typename == other.G__typename &&
        id == other.id &&
        type == other.type &&
        createdAt == other.createdAt &&
        message == other.message &&
        workId == other.workId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, workId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerNotificationsData_viewer_notifications')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('type', type)
          ..add('createdAt', createdAt)
          ..add('message', message)
          ..add('workId', workId))
        .toString();
  }
}

class GViewerNotificationsData_viewer_notificationsBuilder
    implements
        Builder<GViewerNotificationsData_viewer_notifications,
            GViewerNotificationsData_viewer_notificationsBuilder> {
  _$GViewerNotificationsData_viewer_notifications? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  _i2.GNotificationType? _type;
  _i2.GNotificationType? get type => _$this._type;
  set type(_i2.GNotificationType? type) => _$this._type = type;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _workId;
  String? get workId => _$this._workId;
  set workId(String? workId) => _$this._workId = workId;

  GViewerNotificationsData_viewer_notificationsBuilder() {
    GViewerNotificationsData_viewer_notifications._initializeBuilder(this);
  }

  GViewerNotificationsData_viewer_notificationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _type = $v.type;
      _createdAt = $v.createdAt;
      _message = $v.message;
      _workId = $v.workId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerNotificationsData_viewer_notifications other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerNotificationsData_viewer_notifications;
  }

  @override
  void update(
      void Function(GViewerNotificationsData_viewer_notificationsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsData_viewer_notifications build() => _build();

  _$GViewerNotificationsData_viewer_notifications _build() {
    final _$result = _$v ??
        new _$GViewerNotificationsData_viewer_notifications._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerNotificationsData_viewer_notifications',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerNotificationsData_viewer_notifications', 'id'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'GViewerNotificationsData_viewer_notifications', 'type'),
            createdAt: createdAt,
            message: BuiltValueNullFieldError.checkNotNull(message,
                r'GViewerNotificationsData_viewer_notifications', 'message'),
            workId: workId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
