// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contributors.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GContributorsVars> _$gContributorsVarsSerializer =
    new _$GContributorsVarsSerializer();

class _$GContributorsVarsSerializer
    implements StructuredSerializer<GContributorsVars> {
  @override
  final Iterable<Type> types = const [GContributorsVars, _$GContributorsVars];
  @override
  final String wireName = 'GContributorsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GContributorsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GContributorsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GContributorsVarsBuilder().build();
  }
}

class _$GContributorsVars extends GContributorsVars {
  factory _$GContributorsVars(
          [void Function(GContributorsVarsBuilder)? updates]) =>
      (new GContributorsVarsBuilder()..update(updates))._build();

  _$GContributorsVars._() : super._();

  @override
  GContributorsVars rebuild(void Function(GContributorsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GContributorsVarsBuilder toBuilder() =>
      new GContributorsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GContributorsVars;
  }

  @override
  int get hashCode {
    return 59531730;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GContributorsVars').toString();
  }
}

class GContributorsVarsBuilder
    implements Builder<GContributorsVars, GContributorsVarsBuilder> {
  _$GContributorsVars? _$v;

  GContributorsVarsBuilder();

  @override
  void replace(GContributorsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GContributorsVars;
  }

  @override
  void update(void Function(GContributorsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GContributorsVars build() => _build();

  _$GContributorsVars _build() {
    final _$result = _$v ?? new _$GContributorsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
