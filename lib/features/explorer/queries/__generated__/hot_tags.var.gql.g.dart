// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_tags.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHotTagsVars> _$gHotTagsVarsSerializer =
    new _$GHotTagsVarsSerializer();

class _$GHotTagsVarsSerializer implements StructuredSerializer<GHotTagsVars> {
  @override
  final Iterable<Type> types = const [GHotTagsVars, _$GHotTagsVars];
  @override
  final String wireName = 'GHotTagsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHotTagsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GHotTagsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GHotTagsVarsBuilder().build();
  }
}

class _$GHotTagsVars extends GHotTagsVars {
  factory _$GHotTagsVars([void Function(GHotTagsVarsBuilder)? updates]) =>
      (new GHotTagsVarsBuilder()..update(updates))._build();

  _$GHotTagsVars._() : super._();

  @override
  GHotTagsVars rebuild(void Function(GHotTagsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHotTagsVarsBuilder toBuilder() => new GHotTagsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHotTagsVars;
  }

  @override
  int get hashCode {
    return 374448239;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GHotTagsVars').toString();
  }
}

class GHotTagsVarsBuilder
    implements Builder<GHotTagsVars, GHotTagsVarsBuilder> {
  _$GHotTagsVars? _$v;

  GHotTagsVarsBuilder();

  @override
  void replace(GHotTagsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHotTagsVars;
  }

  @override
  void update(void Function(GHotTagsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHotTagsVars build() => _build();

  _$GHotTagsVars _build() {
    final _$result = _$v ?? new _$GHotTagsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
