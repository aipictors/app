// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_award_notification_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkAwardNotificationFieldsVars>
    _$gWorkAwardNotificationFieldsVarsSerializer =
    new _$GWorkAwardNotificationFieldsVarsSerializer();

class _$GWorkAwardNotificationFieldsVarsSerializer
    implements StructuredSerializer<GWorkAwardNotificationFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardNotificationFieldsVars,
    _$GWorkAwardNotificationFieldsVars
  ];
  @override
  final String wireName = 'GWorkAwardNotificationFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkAwardNotificationFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GWorkAwardNotificationFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GWorkAwardNotificationFieldsVarsBuilder().build();
  }
}

class _$GWorkAwardNotificationFieldsVars
    extends GWorkAwardNotificationFieldsVars {
  factory _$GWorkAwardNotificationFieldsVars(
          [void Function(GWorkAwardNotificationFieldsVarsBuilder)? updates]) =>
      (new GWorkAwardNotificationFieldsVarsBuilder()..update(updates))._build();

  _$GWorkAwardNotificationFieldsVars._() : super._();

  @override
  GWorkAwardNotificationFieldsVars rebuild(
          void Function(GWorkAwardNotificationFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardNotificationFieldsVarsBuilder toBuilder() =>
      new GWorkAwardNotificationFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardNotificationFieldsVars;
  }

  @override
  int get hashCode {
    return 468170677;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GWorkAwardNotificationFieldsVars')
        .toString();
  }
}

class GWorkAwardNotificationFieldsVarsBuilder
    implements
        Builder<GWorkAwardNotificationFieldsVars,
            GWorkAwardNotificationFieldsVarsBuilder> {
  _$GWorkAwardNotificationFieldsVars? _$v;

  GWorkAwardNotificationFieldsVarsBuilder();

  @override
  void replace(GWorkAwardNotificationFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardNotificationFieldsVars;
  }

  @override
  void update(void Function(GWorkAwardNotificationFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardNotificationFieldsVars build() => _build();

  _$GWorkAwardNotificationFieldsVars _build() {
    final _$result = _$v ?? new _$GWorkAwardNotificationFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
