// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_promotion_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialPromotionFieldsVars>
    _$gPartialPromotionFieldsVarsSerializer =
    new _$GPartialPromotionFieldsVarsSerializer();

class _$GPartialPromotionFieldsVarsSerializer
    implements StructuredSerializer<GPartialPromotionFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GPartialPromotionFieldsVars,
    _$GPartialPromotionFieldsVars
  ];
  @override
  final String wireName = 'GPartialPromotionFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialPromotionFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GPartialPromotionFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPartialPromotionFieldsVarsBuilder().build();
  }
}

class _$GPartialPromotionFieldsVars extends GPartialPromotionFieldsVars {
  factory _$GPartialPromotionFieldsVars(
          [void Function(GPartialPromotionFieldsVarsBuilder)? updates]) =>
      (new GPartialPromotionFieldsVarsBuilder()..update(updates))._build();

  _$GPartialPromotionFieldsVars._() : super._();

  @override
  GPartialPromotionFieldsVars rebuild(
          void Function(GPartialPromotionFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialPromotionFieldsVarsBuilder toBuilder() =>
      new GPartialPromotionFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialPromotionFieldsVars;
  }

  @override
  int get hashCode {
    return 620755857;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GPartialPromotionFieldsVars')
        .toString();
  }
}

class GPartialPromotionFieldsVarsBuilder
    implements
        Builder<GPartialPromotionFieldsVars,
            GPartialPromotionFieldsVarsBuilder> {
  _$GPartialPromotionFieldsVars? _$v;

  GPartialPromotionFieldsVarsBuilder();

  @override
  void replace(GPartialPromotionFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialPromotionFieldsVars;
  }

  @override
  void update(void Function(GPartialPromotionFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialPromotionFieldsVars build() => _build();

  _$GPartialPromotionFieldsVars _build() {
    final _$result = _$v ?? new _$GPartialPromotionFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
