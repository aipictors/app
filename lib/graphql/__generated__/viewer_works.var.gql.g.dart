// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerWorksVars> _$gViewerWorksVarsSerializer =
    new _$GViewerWorksVarsSerializer();

class _$GViewerWorksVarsSerializer
    implements StructuredSerializer<GViewerWorksVars> {
  @override
  final Iterable<Type> types = const [GViewerWorksVars, _$GViewerWorksVars];
  @override
  final String wireName = 'GViewerWorksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GViewerWorksVars object,
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
  GViewerWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerWorksVarsBuilder();

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

class _$GViewerWorksVars extends GViewerWorksVars {
  @override
  final int offset;
  @override
  final int limit;

  factory _$GViewerWorksVars(
          [void Function(GViewerWorksVarsBuilder)? updates]) =>
      (new GViewerWorksVarsBuilder()..update(updates))._build();

  _$GViewerWorksVars._({required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GViewerWorksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GViewerWorksVars', 'limit');
  }

  @override
  GViewerWorksVars rebuild(void Function(GViewerWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerWorksVarsBuilder toBuilder() =>
      new GViewerWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerWorksVars &&
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
    return (newBuiltValueToStringHelper(r'GViewerWorksVars')
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GViewerWorksVarsBuilder
    implements Builder<GViewerWorksVars, GViewerWorksVarsBuilder> {
  _$GViewerWorksVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GViewerWorksVarsBuilder();

  GViewerWorksVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerWorksVars;
  }

  @override
  void update(void Function(GViewerWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerWorksVars build() => _build();

  _$GViewerWorksVars _build() {
    final _$result = _$v ??
        new _$GViewerWorksVars._(
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GViewerWorksVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GViewerWorksVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
