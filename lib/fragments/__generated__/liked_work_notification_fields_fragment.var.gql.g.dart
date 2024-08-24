// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_work_notification_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GLikedWorkNotificationFieldsVars>
    _$gLikedWorkNotificationFieldsVarsSerializer =
    new _$GLikedWorkNotificationFieldsVarsSerializer();

class _$GLikedWorkNotificationFieldsVarsSerializer
    implements StructuredSerializer<GLikedWorkNotificationFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GLikedWorkNotificationFieldsVars,
    _$GLikedWorkNotificationFieldsVars
  ];
  @override
  final String wireName = 'GLikedWorkNotificationFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GLikedWorkNotificationFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GLikedWorkNotificationFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GLikedWorkNotificationFieldsVarsBuilder().build();
  }
}

class _$GLikedWorkNotificationFieldsVars
    extends GLikedWorkNotificationFieldsVars {
  factory _$GLikedWorkNotificationFieldsVars(
          [void Function(GLikedWorkNotificationFieldsVarsBuilder)? updates]) =>
      (new GLikedWorkNotificationFieldsVarsBuilder()..update(updates))._build();

  _$GLikedWorkNotificationFieldsVars._() : super._();

  @override
  GLikedWorkNotificationFieldsVars rebuild(
          void Function(GLikedWorkNotificationFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GLikedWorkNotificationFieldsVarsBuilder toBuilder() =>
      new GLikedWorkNotificationFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GLikedWorkNotificationFieldsVars;
  }

  @override
  int get hashCode {
    return 986623503;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GLikedWorkNotificationFieldsVars')
        .toString();
  }
}

class GLikedWorkNotificationFieldsVarsBuilder
    implements
        Builder<GLikedWorkNotificationFieldsVars,
            GLikedWorkNotificationFieldsVarsBuilder> {
  _$GLikedWorkNotificationFieldsVars? _$v;

  GLikedWorkNotificationFieldsVarsBuilder();

  @override
  void replace(GLikedWorkNotificationFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GLikedWorkNotificationFieldsVars;
  }

  @override
  void update(void Function(GLikedWorkNotificationFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GLikedWorkNotificationFieldsVars build() => _build();

  _$GLikedWorkNotificationFieldsVars _build() {
    final _$result = _$v ?? new _$GLikedWorkNotificationFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
