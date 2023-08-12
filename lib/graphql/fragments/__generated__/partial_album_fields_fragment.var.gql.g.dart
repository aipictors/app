// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_album_fields_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialAlbumFieldsVars> _$gPartialAlbumFieldsVarsSerializer =
    new _$GPartialAlbumFieldsVarsSerializer();

class _$GPartialAlbumFieldsVarsSerializer
    implements StructuredSerializer<GPartialAlbumFieldsVars> {
  @override
  final Iterable<Type> types = const [
    GPartialAlbumFieldsVars,
    _$GPartialAlbumFieldsVars
  ];
  @override
  final String wireName = 'GPartialAlbumFieldsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialAlbumFieldsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GPartialAlbumFieldsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPartialAlbumFieldsVarsBuilder().build();
  }
}

class _$GPartialAlbumFieldsVars extends GPartialAlbumFieldsVars {
  factory _$GPartialAlbumFieldsVars(
          [void Function(GPartialAlbumFieldsVarsBuilder)? updates]) =>
      (new GPartialAlbumFieldsVarsBuilder()..update(updates))._build();

  _$GPartialAlbumFieldsVars._() : super._();

  @override
  GPartialAlbumFieldsVars rebuild(
          void Function(GPartialAlbumFieldsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialAlbumFieldsVarsBuilder toBuilder() =>
      new GPartialAlbumFieldsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialAlbumFieldsVars;
  }

  @override
  int get hashCode {
    return 937080763;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GPartialAlbumFieldsVars').toString();
  }
}

class GPartialAlbumFieldsVarsBuilder
    implements
        Builder<GPartialAlbumFieldsVars, GPartialAlbumFieldsVarsBuilder> {
  _$GPartialAlbumFieldsVars? _$v;

  GPartialAlbumFieldsVarsBuilder();

  @override
  void replace(GPartialAlbumFieldsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialAlbumFieldsVars;
  }

  @override
  void update(void Function(GPartialAlbumFieldsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialAlbumFieldsVars build() => _build();

  _$GPartialAlbumFieldsVars _build() {
    final _$result = _$v ?? new _$GPartialAlbumFieldsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
