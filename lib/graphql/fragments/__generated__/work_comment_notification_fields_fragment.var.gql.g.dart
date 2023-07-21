// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_comment_notification_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkCommentNotificationFieldsVars>
    _$gWorkCommentNotificationFieldsVarsSerializer =
    new _$GWorkCommentNotificationFieldsVarsSerializer();

class _$GWorkCommentNotificationFieldsVarsSerializer
    implements StructuredSerializer<GWorkCommentNotificationFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentNotificationFieldsVars,
    _$GWorkCommentNotificationFieldsVars
  ];
  @override
  final String wireName = 'GWorkCommentNotificationFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentNotificationFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GWorkCommentNotificationFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GWorkCommentNotificationFieldsVarsBuilder().build();
  }
}

class _$GWorkCommentNotificationFieldsVars
    extends GWorkCommentNotificationFieldsVars {
  factory _$GWorkCommentNotificationFieldsVars(
          [void Function(GWorkCommentNotificationFieldsVarsBuilder)?
              updates]) =>
      (new GWorkCommentNotificationFieldsVarsBuilder()..update(updates))
          ._build();

  _$GWorkCommentNotificationFieldsVars._() : super._();

  @override
  GWorkCommentNotificationFieldsVars rebuild(
          void Function(GWorkCommentNotificationFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentNotificationFieldsVarsBuilder toBuilder() =>
      new GWorkCommentNotificationFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentNotificationFieldsVars;
  }

  @override
  int get hashCode {
    return 582713736;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GWorkCommentNotificationFieldsVars')
        .toString();
  }
}

class GWorkCommentNotificationFieldsVarsBuilder
    implements
        Builder<GWorkCommentNotificationFieldsVars,
            GWorkCommentNotificationFieldsVarsBuilder> {
  _$GWorkCommentNotificationFieldsVars? _$v;

  GWorkCommentNotificationFieldsVarsBuilder();

  @override
  void replace(GWorkCommentNotificationFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentNotificationFieldsVars;
  }

  @override
  void update(
      void Function(GWorkCommentNotificationFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentNotificationFieldsVars build() => _build();

  _$GWorkCommentNotificationFieldsVars _build() {
    final _$result = _$v ?? new _$GWorkCommentNotificationFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
