// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_work_comment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateWorkCommentData> _$gCreateWorkCommentDataSerializer =
    new _$GCreateWorkCommentDataSerializer();
Serializer<GCreateWorkCommentData_createWorkComment>
    _$gCreateWorkCommentDataCreateWorkCommentSerializer =
    new _$GCreateWorkCommentData_createWorkCommentSerializer();

class _$GCreateWorkCommentDataSerializer
    implements StructuredSerializer<GCreateWorkCommentData> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkCommentData,
    _$GCreateWorkCommentData
  ];
  @override
  final String wireName = 'GCreateWorkCommentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkCommentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createWorkComment',
      serializers.serialize(object.createWorkComment,
          specifiedType:
              const FullType(GCreateWorkCommentData_createWorkComment)),
    ];

    return result;
  }

  @override
  GCreateWorkCommentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkCommentDataBuilder();

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
        case 'createWorkComment':
          result.createWorkComment.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GCreateWorkCommentData_createWorkComment))!
              as GCreateWorkCommentData_createWorkComment);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateWorkCommentData_createWorkCommentSerializer
    implements StructuredSerializer<GCreateWorkCommentData_createWorkComment> {
  @override
  final Iterable<Type> types = const [
    GCreateWorkCommentData_createWorkComment,
    _$GCreateWorkCommentData_createWorkComment
  ];
  @override
  final String wireName = 'GCreateWorkCommentData_createWorkComment';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateWorkCommentData_createWorkComment object,
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
  GCreateWorkCommentData_createWorkComment deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateWorkCommentData_createWorkCommentBuilder();

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

class _$GCreateWorkCommentData extends GCreateWorkCommentData {
  @override
  final String G__typename;
  @override
  final GCreateWorkCommentData_createWorkComment createWorkComment;

  factory _$GCreateWorkCommentData(
          [void Function(GCreateWorkCommentDataBuilder)? updates]) =>
      (new GCreateWorkCommentDataBuilder()..update(updates))._build();

  _$GCreateWorkCommentData._(
      {required this.G__typename, required this.createWorkComment})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateWorkCommentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createWorkComment, r'GCreateWorkCommentData', 'createWorkComment');
  }

  @override
  GCreateWorkCommentData rebuild(
          void Function(GCreateWorkCommentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkCommentDataBuilder toBuilder() =>
      new GCreateWorkCommentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkCommentData &&
        G__typename == other.G__typename &&
        createWorkComment == other.createWorkComment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createWorkComment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateWorkCommentData')
          ..add('G__typename', G__typename)
          ..add('createWorkComment', createWorkComment))
        .toString();
  }
}

class GCreateWorkCommentDataBuilder
    implements Builder<GCreateWorkCommentData, GCreateWorkCommentDataBuilder> {
  _$GCreateWorkCommentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateWorkCommentData_createWorkCommentBuilder? _createWorkComment;
  GCreateWorkCommentData_createWorkCommentBuilder get createWorkComment =>
      _$this._createWorkComment ??=
          new GCreateWorkCommentData_createWorkCommentBuilder();
  set createWorkComment(
          GCreateWorkCommentData_createWorkCommentBuilder? createWorkComment) =>
      _$this._createWorkComment = createWorkComment;

  GCreateWorkCommentDataBuilder() {
    GCreateWorkCommentData._initializeBuilder(this);
  }

  GCreateWorkCommentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createWorkComment = $v.createWorkComment.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkCommentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkCommentData;
  }

  @override
  void update(void Function(GCreateWorkCommentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkCommentData build() => _build();

  _$GCreateWorkCommentData _build() {
    _$GCreateWorkCommentData _$result;
    try {
      _$result = _$v ??
          new _$GCreateWorkCommentData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateWorkCommentData', 'G__typename'),
              createWorkComment: createWorkComment.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createWorkComment';
        createWorkComment.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateWorkCommentData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateWorkCommentData_createWorkComment
    extends GCreateWorkCommentData_createWorkComment {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GCreateWorkCommentData_createWorkComment(
          [void Function(GCreateWorkCommentData_createWorkCommentBuilder)?
              updates]) =>
      (new GCreateWorkCommentData_createWorkCommentBuilder()..update(updates))
          ._build();

  _$GCreateWorkCommentData_createWorkComment._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GCreateWorkCommentData_createWorkComment', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateWorkCommentData_createWorkComment', 'id');
  }

  @override
  GCreateWorkCommentData_createWorkComment rebuild(
          void Function(GCreateWorkCommentData_createWorkCommentBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateWorkCommentData_createWorkCommentBuilder toBuilder() =>
      new GCreateWorkCommentData_createWorkCommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateWorkCommentData_createWorkComment &&
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
    return (newBuiltValueToStringHelper(
            r'GCreateWorkCommentData_createWorkComment')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GCreateWorkCommentData_createWorkCommentBuilder
    implements
        Builder<GCreateWorkCommentData_createWorkComment,
            GCreateWorkCommentData_createWorkCommentBuilder> {
  _$GCreateWorkCommentData_createWorkComment? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCreateWorkCommentData_createWorkCommentBuilder() {
    GCreateWorkCommentData_createWorkComment._initializeBuilder(this);
  }

  GCreateWorkCommentData_createWorkCommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateWorkCommentData_createWorkComment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateWorkCommentData_createWorkComment;
  }

  @override
  void update(
      void Function(GCreateWorkCommentData_createWorkCommentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateWorkCommentData_createWorkComment build() => _build();

  _$GCreateWorkCommentData_createWorkComment _build() {
    final _$result = _$v ??
        new _$GCreateWorkCommentData_createWorkComment._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GCreateWorkCommentData_createWorkComment', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateWorkCommentData_createWorkComment', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
