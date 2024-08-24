// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_notifications.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerNotificationsVars> _$gViewerNotificationsVarsSerializer =
    new _$GViewerNotificationsVarsSerializer();

class _$GViewerNotificationsVarsSerializer
    implements StructuredSerializer<GViewerNotificationsVars> {
  @override
  final Iterable<Type> types = const [
    GViewerNotificationsVars,
    _$GViewerNotificationsVars
  ];
  @override
  final String wireName = 'GViewerNotificationsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerNotificationsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GViewerNotificationsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerNotificationsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerNotificationsVars extends GViewerNotificationsVars {
  @override
  final int offset;
  @override
  final int limit;

  factory _$GViewerNotificationsVars(
          [void Function(GViewerNotificationsVarsBuilder)? updates]) =>
      (new GViewerNotificationsVarsBuilder()..update(updates))._build();

  _$GViewerNotificationsVars._({required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GViewerNotificationsVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GViewerNotificationsVars', 'limit');
  }

  @override
  GViewerNotificationsVars rebuild(
          void Function(GViewerNotificationsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerNotificationsVarsBuilder toBuilder() =>
      new GViewerNotificationsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerNotificationsVars &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerNotificationsVars')
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GViewerNotificationsVarsBuilder
    implements
        Builder<GViewerNotificationsVars, GViewerNotificationsVarsBuilder> {
  _$GViewerNotificationsVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GViewerNotificationsVarsBuilder();

  GViewerNotificationsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerNotificationsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerNotificationsVars;
  }

  @override
  void update(void Function(GViewerNotificationsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerNotificationsVars build() => _build();

  _$GViewerNotificationsVars _build() {
    final _$result = _$v ??
        new _$GViewerNotificationsVars._(
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GViewerNotificationsVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GViewerNotificationsVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
