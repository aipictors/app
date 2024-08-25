// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_user.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerUserVars> _$gViewerUserVarsSerializer =
    new _$GViewerUserVarsSerializer();

class _$GViewerUserVarsSerializer
    implements StructuredSerializer<GViewerUserVars> {
  @override
  final Iterable<Type> types = const [GViewerUserVars, _$GViewerUserVars];
  @override
  final String wireName = 'GViewerUserVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GViewerUserVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GViewerUserVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GViewerUserVarsBuilder().build();
  }
}

class _$GViewerUserVars extends GViewerUserVars {
  factory _$GViewerUserVars([void Function(GViewerUserVarsBuilder)? updates]) =>
      (new GViewerUserVarsBuilder()..update(updates))._build();

  _$GViewerUserVars._() : super._();

  @override
  GViewerUserVars rebuild(void Function(GViewerUserVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerUserVarsBuilder toBuilder() =>
      new GViewerUserVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerUserVars;
  }

  @override
  int get hashCode {
    return 982995596;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GViewerUserVars').toString();
  }
}

class GViewerUserVarsBuilder
    implements Builder<GViewerUserVars, GViewerUserVarsBuilder> {
  _$GViewerUserVars? _$v;

  GViewerUserVarsBuilder();

  @override
  void replace(GViewerUserVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerUserVars;
  }

  @override
  void update(void Function(GViewerUserVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerUserVars build() => _build();

  _$GViewerUserVars _build() {
    final _$result = _$v ?? new _$GViewerUserVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
