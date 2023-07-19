// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_muted_tags.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerMutedTagsVars> _$gViewerMutedTagsVarsSerializer =
    new _$GViewerMutedTagsVarsSerializer();

class _$GViewerMutedTagsVarsSerializer
    implements StructuredSerializer<GViewerMutedTagsVars> {
  @override
  final Iterable<Type> types = const [
    GViewerMutedTagsVars,
    _$GViewerMutedTagsVars
  ];
  @override
  final String wireName = 'GViewerMutedTagsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerMutedTagsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GViewerMutedTagsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerMutedTagsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerMutedTagsVars extends GViewerMutedTagsVars {
  @override
  final int offset;
  @override
  final int limit;

  factory _$GViewerMutedTagsVars(
          [void Function(GViewerMutedTagsVarsBuilder)? updates]) =>
      (new GViewerMutedTagsVarsBuilder()..update(updates))._build();

  _$GViewerMutedTagsVars._({required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GViewerMutedTagsVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GViewerMutedTagsVars', 'limit');
  }

  @override
  GViewerMutedTagsVars rebuild(
          void Function(GViewerMutedTagsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerMutedTagsVarsBuilder toBuilder() =>
      new GViewerMutedTagsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerMutedTagsVars &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerMutedTagsVars')
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GViewerMutedTagsVarsBuilder
    implements Builder<GViewerMutedTagsVars, GViewerMutedTagsVarsBuilder> {
  _$GViewerMutedTagsVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GViewerMutedTagsVarsBuilder();

  GViewerMutedTagsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerMutedTagsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerMutedTagsVars;
  }

  @override
  void update(void Function(GViewerMutedTagsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerMutedTagsVars build() => _build();

  _$GViewerMutedTagsVars _build() {
    final _$result = _$v ??
        new _$GViewerMutedTagsVars._(
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GViewerMutedTagsVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GViewerMutedTagsVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
