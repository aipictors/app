// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_image_generation_tasks.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerImageGenerationTasksVars>
    _$gViewerImageGenerationTasksVarsSerializer =
    new _$GViewerImageGenerationTasksVarsSerializer();

class _$GViewerImageGenerationTasksVarsSerializer
    implements StructuredSerializer<GViewerImageGenerationTasksVars> {
  @override
  final Iterable<Type> types = const [
    GViewerImageGenerationTasksVars,
    _$GViewerImageGenerationTasksVars
  ];
  @override
  final String wireName = 'GViewerImageGenerationTasksVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerImageGenerationTasksVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.where;
    if (value != null) {
      result
        ..add('where')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(_i1.GImageGenerationTasksWhereInput)));
    }
    return result;
  }

  @override
  GViewerImageGenerationTasksVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerImageGenerationTasksVarsBuilder();

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
        case 'where':
          result.where.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i1.GImageGenerationTasksWhereInput))!
              as _i1.GImageGenerationTasksWhereInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerImageGenerationTasksVars
    extends GViewerImageGenerationTasksVars {
  @override
  final int offset;
  @override
  final int limit;
  @override
  final _i1.GImageGenerationTasksWhereInput? where;

  factory _$GViewerImageGenerationTasksVars(
          [void Function(GViewerImageGenerationTasksVarsBuilder)? updates]) =>
      (new GViewerImageGenerationTasksVarsBuilder()..update(updates))._build();

  _$GViewerImageGenerationTasksVars._(
      {required this.offset, required this.limit, this.where})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GViewerImageGenerationTasksVars', 'offset');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GViewerImageGenerationTasksVars', 'limit');
  }

  @override
  GViewerImageGenerationTasksVars rebuild(
          void Function(GViewerImageGenerationTasksVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerImageGenerationTasksVarsBuilder toBuilder() =>
      new GViewerImageGenerationTasksVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerImageGenerationTasksVars &&
        offset == other.offset &&
        limit == other.limit &&
        where == other.where;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, where.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerImageGenerationTasksVars')
          ..add('offset', offset)
          ..add('limit', limit)
          ..add('where', where))
        .toString();
  }
}

class GViewerImageGenerationTasksVarsBuilder
    implements
        Builder<GViewerImageGenerationTasksVars,
            GViewerImageGenerationTasksVarsBuilder> {
  _$GViewerImageGenerationTasksVars? _$v;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  _i1.GImageGenerationTasksWhereInputBuilder? _where;
  _i1.GImageGenerationTasksWhereInputBuilder get where =>
      _$this._where ??= new _i1.GImageGenerationTasksWhereInputBuilder();
  set where(_i1.GImageGenerationTasksWhereInputBuilder? where) =>
      _$this._where = where;

  GViewerImageGenerationTasksVarsBuilder();

  GViewerImageGenerationTasksVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offset = $v.offset;
      _limit = $v.limit;
      _where = $v.where?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerImageGenerationTasksVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerImageGenerationTasksVars;
  }

  @override
  void update(void Function(GViewerImageGenerationTasksVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerImageGenerationTasksVars build() => _build();

  _$GViewerImageGenerationTasksVars _build() {
    _$GViewerImageGenerationTasksVars _$result;
    try {
      _$result = _$v ??
          new _$GViewerImageGenerationTasksVars._(
              offset: BuiltValueNullFieldError.checkNotNull(
                  offset, r'GViewerImageGenerationTasksVars', 'offset'),
              limit: BuiltValueNullFieldError.checkNotNull(
                  limit, r'GViewerImageGenerationTasksVars', 'limit'),
              where: _where?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'where';
        _where?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerImageGenerationTasksVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
