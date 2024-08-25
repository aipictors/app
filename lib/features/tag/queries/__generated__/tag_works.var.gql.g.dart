// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_works.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GTagWorksVars> _$gTagWorksVarsSerializer =
    new _$GTagWorksVarsSerializer();

class _$GTagWorksVarsSerializer implements StructuredSerializer<GTagWorksVars> {
  @override
  final Iterable<Type> types = const [GTagWorksVars, _$GTagWorksVars];
  @override
  final String wireName = 'GTagWorksVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GTagWorksVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'tagName',
      serializers.serialize(object.tagName,
          specifiedType: const FullType(String)),
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GTagWorksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GTagWorksVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'tagName':
          result.tagName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
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

class _$GTagWorksVars extends GTagWorksVars {
  @override
  final String tagName;
  @override
  final int offset;
  @override
  final int limit;

  factory _$GTagWorksVars([void Function(GTagWorksVarsBuilder)? updates]) =>
      (new GTagWorksVarsBuilder()..update(updates))._build();

  _$GTagWorksVars._(
      {required this.tagName, required this.offset, required this.limit})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(tagName, r'GTagWorksVars', 'tagName');
    BuiltValueNullFieldError.checkNotNull(offset, r'GTagWorksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(limit, r'GTagWorksVars', 'limit');
  }

  @override
  GTagWorksVars rebuild(void Function(GTagWorksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GTagWorksVarsBuilder toBuilder() => new GTagWorksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GTagWorksVars &&
        tagName == other.tagName &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tagName.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GTagWorksVars')
          ..add('tagName', tagName)
          ..add('offset', offset)
          ..add('limit', limit))
        .toString();
  }
}

class GTagWorksVarsBuilder
    implements Builder<GTagWorksVars, GTagWorksVarsBuilder> {
  _$GTagWorksVars? _$v;

  String? _tagName;
  String? get tagName => _$this._tagName;
  set tagName(String? tagName) => _$this._tagName = tagName;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  GTagWorksVarsBuilder();

  GTagWorksVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tagName = $v.tagName;
      _offset = $v.offset;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GTagWorksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GTagWorksVars;
  }

  @override
  void update(void Function(GTagWorksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GTagWorksVars build() => _build();

  _$GTagWorksVars _build() {
    final _$result = _$v ??
        new _$GTagWorksVars._(
            tagName: BuiltValueNullFieldError.checkNotNull(
                tagName, r'GTagWorksVars', 'tagName'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'GTagWorksVars', 'offset'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'GTagWorksVars', 'limit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
