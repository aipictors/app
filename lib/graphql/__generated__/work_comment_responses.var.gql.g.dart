// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_comment_responses.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkCommentResponsesVars> _$gWorkCommentResponsesVarsSerializer =
    new _$GWorkCommentResponsesVarsSerializer();

class _$GWorkCommentResponsesVarsSerializer
    implements StructuredSerializer<GWorkCommentResponsesVars> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesVars,
    _$GWorkCommentResponsesVars
  ];
  @override
  final String wireName = 'GWorkCommentResponsesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentResponsesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'workId',
      serializers.serialize(object.workId,
          specifiedType: const FullType(String)),
      'commentId',
      serializers.serialize(object.commentId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GWorkCommentResponsesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentResponsesVarsBuilder();

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
        case 'commentId':
          result.commentId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentResponsesVars extends GWorkCommentResponsesVars {
  @override
  final String workId;
  @override
  final String commentId;

  factory _$GWorkCommentResponsesVars(
          [void Function(GWorkCommentResponsesVarsBuilder)? updates]) =>
      (new GWorkCommentResponsesVarsBuilder()..update(updates))._build();

  _$GWorkCommentResponsesVars._({required this.workId, required this.commentId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        workId, r'GWorkCommentResponsesVars', 'workId');
    BuiltValueNullFieldError.checkNotNull(
        commentId, r'GWorkCommentResponsesVars', 'commentId');
  }

  @override
  GWorkCommentResponsesVars rebuild(
          void Function(GWorkCommentResponsesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesVarsBuilder toBuilder() =>
      new GWorkCommentResponsesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentResponsesVars &&
        workId == other.workId &&
        commentId == other.commentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, workId.hashCode);
    _$hash = $jc(_$hash, commentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkCommentResponsesVars')
          ..add('workId', workId)
          ..add('commentId', commentId))
        .toString();
  }
}

class GWorkCommentResponsesVarsBuilder
    implements
        Builder<GWorkCommentResponsesVars, GWorkCommentResponsesVarsBuilder> {
  _$GWorkCommentResponsesVars? _$v;

  String? _workId;
  String? get workId => _$this._workId;
  set workId(String? workId) => _$this._workId = workId;

  String? _commentId;
  String? get commentId => _$this._commentId;
  set commentId(String? commentId) => _$this._commentId = commentId;

  GWorkCommentResponsesVarsBuilder();

  GWorkCommentResponsesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _workId = $v.workId;
      _commentId = $v.commentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentResponsesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentResponsesVars;
  }

  @override
  void update(void Function(GWorkCommentResponsesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesVars build() => _build();

  _$GWorkCommentResponsesVars _build() {
    final _$result = _$v ??
        new _$GWorkCommentResponsesVars._(
            workId: BuiltValueNullFieldError.checkNotNull(
                workId, r'GWorkCommentResponsesVars', 'workId'),
            commentId: BuiltValueNullFieldError.checkNotNull(
                commentId, r'GWorkCommentResponsesVars', 'commentId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
