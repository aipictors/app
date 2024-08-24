// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_notification_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFollowNotificationFieldsVars>
    _$gFollowNotificationFieldsVarsSerializer =
    new _$GFollowNotificationFieldsVarsSerializer();

class _$GFollowNotificationFieldsVarsSerializer
    implements StructuredSerializer<GFollowNotificationFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GFollowNotificationFieldsVars,
    _$GFollowNotificationFieldsVars
  ];
  @override
  final String wireName = 'GFollowNotificationFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFollowNotificationFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GFollowNotificationFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GFollowNotificationFieldsVarsBuilder().build();
  }
}

class _$GFollowNotificationFieldsVars extends GFollowNotificationFieldsVars {
  factory _$GFollowNotificationFieldsVars(
          [void Function(GFollowNotificationFieldsVarsBuilder)? updates]) =>
      (new GFollowNotificationFieldsVarsBuilder()..update(updates))._build();

  _$GFollowNotificationFieldsVars._() : super._();

  @override
  GFollowNotificationFieldsVars rebuild(
          void Function(GFollowNotificationFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowNotificationFieldsVarsBuilder toBuilder() =>
      new GFollowNotificationFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowNotificationFieldsVars;
  }

  @override
  int get hashCode {
    return 82147352;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GFollowNotificationFieldsVars')
        .toString();
  }
}

class GFollowNotificationFieldsVarsBuilder
    implements
        Builder<GFollowNotificationFieldsVars,
            GFollowNotificationFieldsVarsBuilder> {
  _$GFollowNotificationFieldsVars? _$v;

  GFollowNotificationFieldsVarsBuilder();

  @override
  void replace(GFollowNotificationFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFollowNotificationFieldsVars;
  }

  @override
  void update(void Function(GFollowNotificationFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFollowNotificationFieldsVars build() => _build();

  _$GFollowNotificationFieldsVars _build() {
    final _$result = _$v ?? new _$GFollowNotificationFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
