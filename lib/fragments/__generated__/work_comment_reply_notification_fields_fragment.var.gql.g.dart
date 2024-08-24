// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_comment_reply_notification_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkCommentReplyNotificationFieldsVars>
    _$gWorkCommentReplyNotificationFieldsVarsSerializer =
    new _$GWorkCommentReplyNotificationFieldsVarsSerializer();

class _$GWorkCommentReplyNotificationFieldsVarsSerializer
    implements StructuredSerializer<GWorkCommentReplyNotificationFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentReplyNotificationFieldsVars,
    _$GWorkCommentReplyNotificationFieldsVars
  ];
  @override
  final String wireName = 'GWorkCommentReplyNotificationFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentReplyNotificationFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GWorkCommentReplyNotificationFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GWorkCommentReplyNotificationFieldsVarsBuilder().build();
  }
}

class _$GWorkCommentReplyNotificationFieldsVars
    extends GWorkCommentReplyNotificationFieldsVars {
  factory _$GWorkCommentReplyNotificationFieldsVars(
          [void Function(GWorkCommentReplyNotificationFieldsVarsBuilder)?
              updates]) =>
      (new GWorkCommentReplyNotificationFieldsVarsBuilder()..update(updates))
          ._build();

  _$GWorkCommentReplyNotificationFieldsVars._() : super._();

  @override
  GWorkCommentReplyNotificationFieldsVars rebuild(
          void Function(GWorkCommentReplyNotificationFieldsVarsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentReplyNotificationFieldsVarsBuilder toBuilder() =>
      new GWorkCommentReplyNotificationFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentReplyNotificationFieldsVars;
  }

  @override
  int get hashCode {
    return 145486766;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(
            r'GWorkCommentReplyNotificationFieldsVars')
        .toString();
  }
}

class GWorkCommentReplyNotificationFieldsVarsBuilder
    implements
        Builder<GWorkCommentReplyNotificationFieldsVars,
            GWorkCommentReplyNotificationFieldsVarsBuilder> {
  _$GWorkCommentReplyNotificationFieldsVars? _$v;

  GWorkCommentReplyNotificationFieldsVarsBuilder();

  @override
  void replace(GWorkCommentReplyNotificationFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentReplyNotificationFieldsVars;
  }

  @override
  void update(
      void Function(GWorkCommentReplyNotificationFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentReplyNotificationFieldsVars build() => _build();

  _$GWorkCommentReplyNotificationFieldsVars _build() {
    final _$result = _$v ?? new _$GWorkCommentReplyNotificationFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
