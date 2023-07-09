// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_folder_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialFolderFieldsVars> _$gPartialFolderFieldsVarsSerializer =
    new _$GPartialFolderFieldsVarsSerializer();

class _$GPartialFolderFieldsVarsSerializer
    implements StructuredSerializer<GPartialFolderFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GPartialFolderFieldsVars,
    _$GPartialFolderFieldsVars
  ];
  @override
  final String wireName = 'GPartialFolderFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialFolderFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GPartialFolderFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPartialFolderFieldsVarsBuilder().build();
  }
}

class _$GPartialFolderFieldsVars extends GPartialFolderFieldsVars {
  factory _$GPartialFolderFieldsVars(
          [void Function(GPartialFolderFieldsVarsBuilder)? updates]) =>
      (new GPartialFolderFieldsVarsBuilder()..update(updates))._build();

  _$GPartialFolderFieldsVars._() : super._();

  @override
  GPartialFolderFieldsVars rebuild(
          void Function(GPartialFolderFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialFolderFieldsVarsBuilder toBuilder() =>
      new GPartialFolderFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialFolderFieldsVars;
  }

  @override
  int get hashCode {
    return 716237529;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GPartialFolderFieldsVars').toString();
  }
}

class GPartialFolderFieldsVarsBuilder
    implements
        Builder<GPartialFolderFieldsVars, GPartialFolderFieldsVarsBuilder> {
  _$GPartialFolderFieldsVars? _$v;

  GPartialFolderFieldsVarsBuilder();

  @override
  void replace(GPartialFolderFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialFolderFieldsVars;
  }

  @override
  void update(void Function(GPartialFolderFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialFolderFieldsVars build() => _build();

  _$GPartialFolderFieldsVars _build() {
    final _$result = _$v ?? new _$GPartialFolderFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
