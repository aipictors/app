// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_feed_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerFeedWorksVars> _$gViewerFeedWorksVarsSerializer =
    new _$GViewerFeedWorksVarsSerializer();

class _$GViewerFeedWorksVarsSerializer
    implements StructuredSerializer<GViewerFeedWorksVars> {
  @override
  final Iterable<Type> types = const [
    GViewerFeedWorksVars,
    _$GViewerFeedWorksVars
  ];
  @override
  final String wireName = 'GViewerFeedWorksVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerFeedWorksVars object,
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
  GViewerFeedWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerFeedWorksVarsBuilder();

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

class _$GViewerFeedWorksVars extends GViewerFeedWorksVars {
  @override
  final int offset;
  @override
  final int limit;

  factory _$GViewerFeedWorksVars(
          [void Function(GViewerFeedWorksVarsBuilder)? updates]) =>
      (new GViewerFeedWorksVarsBuilder()..update(updates))._build();

  _$GViewerFeedWorksVars._({required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GViewerFeedWorksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GViewerFeedWorksVars', 'limit');
  }

  @override
  GViewerFeedWorksVars rebuild(
          void Function(GViewerFeedWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerFeedWorksVarsBuilder toBuilder() =>
      new GViewerFeedWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerFeedWorksVars &&
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
    return (newBuiltValueToStringHelper(r'GViewerFeedWorksVars')
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GViewerFeedWorksVarsBuilder
    implements Builder<GViewerFeedWorksVars, GViewerFeedWorksVarsBuilder> {
  _$GViewerFeedWorksVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GViewerFeedWorksVarsBuilder();

  GViewerFeedWorksVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerFeedWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerFeedWorksVars;
  }

  @override
  void update(void Function(GViewerFeedWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerFeedWorksVars build() => _build();

  _$GViewerFeedWorksVars _build() {
    final _$result = _$v ??
        new _$GViewerFeedWorksVars._(
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GViewerFeedWorksVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GViewerFeedWorksVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
