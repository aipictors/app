// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_feed_work_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialFeedWorkFieldsVars> _$gPartialFeedWorkFieldsVarsSerializer =
    new _$GPartialFeedWorkFieldsVarsSerializer();

class _$GPartialFeedWorkFieldsVarsSerializer
    implements StructuredSerializer<GPartialFeedWorkFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GPartialFeedWorkFieldsVars,
    _$GPartialFeedWorkFieldsVars
  ];
  @override
  final String wireName = 'GPartialFeedWorkFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialFeedWorkFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GPartialFeedWorkFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPartialFeedWorkFieldsVarsBuilder().build();
  }
}

class _$GPartialFeedWorkFieldsVars extends GPartialFeedWorkFieldsVars {
  factory _$GPartialFeedWorkFieldsVars(
          [void Function(GPartialFeedWorkFieldsVarsBuilder)? updates]) =>
      (new GPartialFeedWorkFieldsVarsBuilder()..update(updates))._build();

  _$GPartialFeedWorkFieldsVars._() : super._();

  @override
  GPartialFeedWorkFieldsVars rebuild(
          void Function(GPartialFeedWorkFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialFeedWorkFieldsVarsBuilder toBuilder() =>
      new GPartialFeedWorkFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialFeedWorkFieldsVars;
  }

  @override
  int get hashCode {
    return 466489739;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GPartialFeedWorkFieldsVars')
        .toString();
  }
}

class GPartialFeedWorkFieldsVarsBuilder
    implements
        Builder<GPartialFeedWorkFieldsVars, GPartialFeedWorkFieldsVarsBuilder> {
  _$GPartialFeedWorkFieldsVars? _$v;

  GPartialFeedWorkFieldsVarsBuilder();

  @override
  void replace(GPartialFeedWorkFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialFeedWorkFieldsVars;
  }

  @override
  void update(void Function(GPartialFeedWorkFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialFeedWorkFieldsVars build() => _build();

  _$GPartialFeedWorkFieldsVars _build() {
    final _$result = _$v ?? new _$GPartialFeedWorkFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
