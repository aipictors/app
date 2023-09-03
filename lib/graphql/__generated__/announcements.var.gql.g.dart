// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcements.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAnnouncementsVars> _$gAnnouncementsVarsSerializer =
    new _$GAnnouncementsVarsSerializer();

class _$GAnnouncementsVarsSerializer
    implements StructuredSerializer<GAnnouncementsVars> {
  @override
  final Iterable<Type> types = const [GAnnouncementsVars, _$GAnnouncementsVars];
  @override
  final String wireName = 'GAnnouncementsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAnnouncementsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GAnnouncementsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GAnnouncementsVarsBuilder().build();
  }
}

class _$GAnnouncementsVars extends GAnnouncementsVars {
  factory _$GAnnouncementsVars(
          [void Function(GAnnouncementsVarsBuilder)? updates]) =>
      (new GAnnouncementsVarsBuilder()..update(updates))._build();

  _$GAnnouncementsVars._() : super._();

  @override
  GAnnouncementsVars rebuild(
          void Function(GAnnouncementsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAnnouncementsVarsBuilder toBuilder() =>
      new GAnnouncementsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAnnouncementsVars;
  }

  @override
  int get hashCode {
    return 167792592;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GAnnouncementsVars').toString();
  }
}

class GAnnouncementsVarsBuilder
    implements Builder<GAnnouncementsVars, GAnnouncementsVarsBuilder> {
  _$GAnnouncementsVars? _$v;

  GAnnouncementsVarsBuilder();

  @override
  void replace(GAnnouncementsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAnnouncementsVars;
  }

  @override
  void update(void Function(GAnnouncementsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAnnouncementsVars build() => _build();

  _$GAnnouncementsVars _build() {
    final _$result = _$v ?? new _$GAnnouncementsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
