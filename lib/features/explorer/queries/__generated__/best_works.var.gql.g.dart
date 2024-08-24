// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GBestWorksVars> _$gBestWorksVarsSerializer =
    new _$GBestWorksVarsSerializer();

class _$GBestWorksVarsSerializer
    implements StructuredSerializer<GBestWorksVars> {
  @override
  final Iterable<Type> types = const [GBestWorksVars, _$GBestWorksVars];
  @override
  final String wireName = 'GBestWorksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GBestWorksVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GBestWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GBestWorksVarsBuilder().build();
  }
}

class _$GBestWorksVars extends GBestWorksVars {
  factory _$GBestWorksVars([void Function(GBestWorksVarsBuilder)? updates]) =>
      (new GBestWorksVarsBuilder()..update(updates))._build();

  _$GBestWorksVars._() : super._();

  @override
  GBestWorksVars rebuild(void Function(GBestWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBestWorksVarsBuilder toBuilder() =>
      new GBestWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBestWorksVars;
  }

  @override
  int get hashCode {
    return 816894865;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GBestWorksVars').toString();
  }
}

class GBestWorksVarsBuilder
    implements Builder<GBestWorksVars, GBestWorksVarsBuilder> {
  _$GBestWorksVars? _$v;

  GBestWorksVarsBuilder();

  @override
  void replace(GBestWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GBestWorksVars;
  }

  @override
  void update(void Function(GBestWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GBestWorksVars build() => _build();

  _$GBestWorksVars _build() {
    final _$result = _$v ?? new _$GBestWorksVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
