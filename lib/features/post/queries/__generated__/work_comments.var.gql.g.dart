// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_comments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkCommentsVars> _$gWorkCommentsVarsSerializer =
    new _$GWorkCommentsVarsSerializer();

class _$GWorkCommentsVarsSerializer
    implements StructuredSerializer<GWorkCommentsVars> {
  @override
  final Iterable<Type> types = const [GWorkCommentsVars, _$GWorkCommentsVars];
  @override
  final String wireName = 'GWorkCommentsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorkCommentsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'workId',
      serializers.serialize(object.workId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GWorkCommentsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'workId':
          result.workId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsVars extends GWorkCommentsVars {
  @override
  final String workId;

  factory _$GWorkCommentsVars(
          [void Function(GWorkCommentsVarsBuilder)? updates]) =>
      (new GWorkCommentsVarsBuilder()..update(updates))._build();

  _$GWorkCommentsVars._({required this.workId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        workId, r'GWorkCommentsVars', 'workId');
  }

  @override
  GWorkCommentsVars rebuild(void Function(GWorkCommentsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsVarsBuilder toBuilder() =>
      new GWorkCommentsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsVars && workId == other.workId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkCommentsVars')
          ..add('workId', workId))
        .toString();
  }
}

class GWorkCommentsVarsBuilder
    implements Builder<GWorkCommentsVars, GWorkCommentsVarsBuilder> {
  _$GWorkCommentsVars? _$v;

  String? _workId;
  String? get workId => _$this._workId;
  set workId(String? workId) => _$this._workId = workId;

  GWorkCommentsVarsBuilder();

  GWorkCommentsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workId = $v.workId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsVars;
  }

  @override
  void update(void Function(GWorkCommentsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsVars build() => _build();

  _$GWorkCommentsVars _build() {
    final _$result = _$v ??
        new _$GWorkCommentsVars._(
            workId: BuiltValueNullFieldError.checkNotNull(
                workId, r'GWorkCommentsVars', 'workId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
