// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_sticker_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialStickerFieldsVars> _$gPartialStickerFieldsVarsSerializer =
    new _$GPartialStickerFieldsVarsSerializer();

class _$GPartialStickerFieldsVarsSerializer
    implements StructuredSerializer<GPartialStickerFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GPartialStickerFieldsVars,
    _$GPartialStickerFieldsVars
  ];
  @override
  final String wireName = 'GPartialStickerFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialStickerFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GPartialStickerFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPartialStickerFieldsVarsBuilder().build();
  }
}

class _$GPartialStickerFieldsVars extends GPartialStickerFieldsVars {
  factory _$GPartialStickerFieldsVars(
          [void Function(GPartialStickerFieldsVarsBuilder)? updates]) =>
      (new GPartialStickerFieldsVarsBuilder()..update(updates))._build();

  _$GPartialStickerFieldsVars._() : super._();

  @override
  GPartialStickerFieldsVars rebuild(
          void Function(GPartialStickerFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialStickerFieldsVarsBuilder toBuilder() =>
      new GPartialStickerFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialStickerFieldsVars;
  }

  @override
  int get hashCode {
    return 802970414;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GPartialStickerFieldsVars').toString();
  }
}

class GPartialStickerFieldsVarsBuilder
    implements
        Builder<GPartialStickerFieldsVars, GPartialStickerFieldsVarsBuilder> {
  _$GPartialStickerFieldsVars? _$v;

  GPartialStickerFieldsVarsBuilder();

  @override
  void replace(GPartialStickerFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialStickerFieldsVars;
  }

  @override
  void update(void Function(GPartialStickerFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialStickerFieldsVars build() => _build();

  _$GPartialStickerFieldsVars _build() {
    final _$result = _$v ?? new _$GPartialStickerFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
