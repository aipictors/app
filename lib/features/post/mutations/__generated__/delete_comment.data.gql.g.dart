// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_comment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GDeleteCommentData> _$gDeleteCommentDataSerializer =
    new _$GDeleteCommentDataSerializer();
Serializer<GDeleteCommentData_deleteComment>
    _$gDeleteCommentDataDeleteCommentSerializer =
    new _$GDeleteCommentData_deleteCommentSerializer();

class _$GDeleteCommentDataSerializer
    implements StructuredSerializer<GDeleteCommentData> {
  @override
  final Iterable<Type> types = const [GDeleteCommentData, _$GDeleteCommentData];
  @override
  final String wireName = 'GDeleteCommentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteCommentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deleteComment',
      serializers.serialize(object.deleteComment,
          specifiedType: const FullType(GDeleteCommentData_deleteComment)),
    ];

    return result;
  }

  @override
  GDeleteCommentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteCommentDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'deleteComment':
          result.deleteComment.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GDeleteCommentData_deleteComment))!
              as GDeleteCommentData_deleteComment);
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteCommentData_deleteCommentSerializer
    implements StructuredSerializer<GDeleteCommentData_deleteComment> {
  @override
  final Iterable<Type> types = const [
    GDeleteCommentData_deleteComment,
    _$GDeleteCommentData_deleteComment
  ];
  @override
  final String wireName = 'GDeleteCommentData_deleteComment';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GDeleteCommentData_deleteComment object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GDeleteCommentData_deleteComment deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDeleteCommentData_deleteCommentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GDeleteCommentData extends GDeleteCommentData {
  @override
  final String G__typename;
  @override
  final GDeleteCommentData_deleteComment deleteComment;

  factory _$GDeleteCommentData(
          [void Function(GDeleteCommentDataBuilder)? updates]) =>
      (new GDeleteCommentDataBuilder()..update(updates))._build();

  _$GDeleteCommentData._(
      {required this.G__typename, required this.deleteComment})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteCommentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deleteComment, r'GDeleteCommentData', 'deleteComment');
  }

  @override
  GDeleteCommentData rebuild(
          void Function(GDeleteCommentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteCommentDataBuilder toBuilder() =>
      new GDeleteCommentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteCommentData &&
        G__typename == other.G__typename &&
        deleteComment == other.deleteComment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deleteComment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteCommentData')
          ..add('G__typename', G__typename)
          ..add('deleteComment', deleteComment))
        .toString();
  }
}

class GDeleteCommentDataBuilder
    implements Builder<GDeleteCommentData, GDeleteCommentDataBuilder> {
  _$GDeleteCommentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GDeleteCommentData_deleteCommentBuilder? _deleteComment;
  GDeleteCommentData_deleteCommentBuilder get deleteComment =>
      _$this._deleteComment ??= new GDeleteCommentData_deleteCommentBuilder();
  set deleteComment(GDeleteCommentData_deleteCommentBuilder? deleteComment) =>
      _$this._deleteComment = deleteComment;

  GDeleteCommentDataBuilder() {
    GDeleteCommentData._initializeBuilder(this);
  }

  GDeleteCommentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deleteComment = $v.deleteComment.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteCommentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteCommentData;
  }

  @override
  void update(void Function(GDeleteCommentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteCommentData build() => _build();

  _$GDeleteCommentData _build() {
    _$GDeleteCommentData _$result;
    try {
      _$result = _$v ??
          new _$GDeleteCommentData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GDeleteCommentData', 'G__typename'),
              deleteComment: deleteComment.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deleteComment';
        deleteComment.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDeleteCommentData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDeleteCommentData_deleteComment
    extends GDeleteCommentData_deleteComment {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GDeleteCommentData_deleteComment(
          [void Function(GDeleteCommentData_deleteCommentBuilder)? updates]) =>
      (new GDeleteCommentData_deleteCommentBuilder()..update(updates))._build();

  _$GDeleteCommentData_deleteComment._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GDeleteCommentData_deleteComment', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GDeleteCommentData_deleteComment', 'id');
  }

  @override
  GDeleteCommentData_deleteComment rebuild(
          void Function(GDeleteCommentData_deleteCommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDeleteCommentData_deleteCommentBuilder toBuilder() =>
      new GDeleteCommentData_deleteCommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDeleteCommentData_deleteComment &&
        G__typename == other.G__typename &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDeleteCommentData_deleteComment')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GDeleteCommentData_deleteCommentBuilder
    implements
        Builder<GDeleteCommentData_deleteComment,
            GDeleteCommentData_deleteCommentBuilder> {
  _$GDeleteCommentData_deleteComment? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GDeleteCommentData_deleteCommentBuilder() {
    GDeleteCommentData_deleteComment._initializeBuilder(this);
  }

  GDeleteCommentData_deleteCommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDeleteCommentData_deleteComment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDeleteCommentData_deleteComment;
  }

  @override
  void update(void Function(GDeleteCommentData_deleteCommentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDeleteCommentData_deleteComment build() => _build();

  _$GDeleteCommentData_deleteComment _build() {
    final _$result = _$v ??
        new _$GDeleteCommentData_deleteComment._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GDeleteCommentData_deleteComment', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GDeleteCommentData_deleteComment', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
