// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_response_comment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateResponseCommentData> _$gCreateResponseCommentDataSerializer =
    new _$GCreateResponseCommentDataSerializer();
Serializer<GCreateResponseCommentData_createResponseComment>
    _$gCreateResponseCommentDataCreateResponseCommentSerializer =
    new _$GCreateResponseCommentData_createResponseCommentSerializer();

class _$GCreateResponseCommentDataSerializer
    implements StructuredSerializer<GCreateResponseCommentData> {
  @override
  final Iterable<Type> types = const [
    GCreateResponseCommentData,
    _$GCreateResponseCommentData
  ];
  @override
  final String wireName = 'GCreateResponseCommentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateResponseCommentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createResponseComment',
      serializers.serialize(object.createResponseComment,
          specifiedType:
              const FullType(GCreateResponseCommentData_createResponseComment)),
    ];

    return result;
  }

  @override
  GCreateResponseCommentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateResponseCommentDataBuilder();

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
        case 'createResponseComment':
          result.createResponseComment.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GCreateResponseCommentData_createResponseComment))!
              as GCreateResponseCommentData_createResponseComment);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateResponseCommentData_createResponseCommentSerializer
    implements
        StructuredSerializer<GCreateResponseCommentData_createResponseComment> {
  @override
  final Iterable<Type> types = const [
    GCreateResponseCommentData_createResponseComment,
    _$GCreateResponseCommentData_createResponseComment
  ];
  @override
  final String wireName = 'GCreateResponseCommentData_createResponseComment';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GCreateResponseCommentData_createResponseComment object,
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
  GCreateResponseCommentData_createResponseComment deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GCreateResponseCommentData_createResponseCommentBuilder();

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

class _$GCreateResponseCommentData extends GCreateResponseCommentData {
  @override
  final String G__typename;
  @override
  final GCreateResponseCommentData_createResponseComment createResponseComment;

  factory _$GCreateResponseCommentData(
          [void Function(GCreateResponseCommentDataBuilder)? updates]) =>
      (new GCreateResponseCommentDataBuilder()..update(updates))._build();

  _$GCreateResponseCommentData._(
      {required this.G__typename, required this.createResponseComment})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GCreateResponseCommentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(createResponseComment,
        r'GCreateResponseCommentData', 'createResponseComment');
  }

  @override
  GCreateResponseCommentData rebuild(
          void Function(GCreateResponseCommentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateResponseCommentDataBuilder toBuilder() =>
      new GCreateResponseCommentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateResponseCommentData &&
        G__typename == other.G__typename &&
        createResponseComment == other.createResponseComment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, createResponseComment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateResponseCommentData')
          ..add('G__typename', G__typename)
          ..add('createResponseComment', createResponseComment))
        .toString();
  }
}

class GCreateResponseCommentDataBuilder
    implements
        Builder<GCreateResponseCommentData, GCreateResponseCommentDataBuilder> {
  _$GCreateResponseCommentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateResponseCommentData_createResponseCommentBuilder?
      _createResponseComment;
  GCreateResponseCommentData_createResponseCommentBuilder
      get createResponseComment => _$this._createResponseComment ??=
          new GCreateResponseCommentData_createResponseCommentBuilder();
  set createResponseComment(
          GCreateResponseCommentData_createResponseCommentBuilder?
              createResponseComment) =>
      _$this._createResponseComment = createResponseComment;

  GCreateResponseCommentDataBuilder() {
    GCreateResponseCommentData._initializeBuilder(this);
  }

  GCreateResponseCommentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createResponseComment = $v.createResponseComment.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateResponseCommentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateResponseCommentData;
  }

  @override
  void update(void Function(GCreateResponseCommentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateResponseCommentData build() => _build();

  _$GCreateResponseCommentData _build() {
    _$GCreateResponseCommentData _$result;
    try {
      _$result = _$v ??
          new _$GCreateResponseCommentData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GCreateResponseCommentData', 'G__typename'),
              createResponseComment: createResponseComment.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createResponseComment';
        createResponseComment.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateResponseCommentData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateResponseCommentData_createResponseComment
    extends GCreateResponseCommentData_createResponseComment {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GCreateResponseCommentData_createResponseComment(
          [void Function(
                  GCreateResponseCommentData_createResponseCommentBuilder)?
              updates]) =>
      (new GCreateResponseCommentData_createResponseCommentBuilder()
            ..update(updates))
          ._build();

  _$GCreateResponseCommentData_createResponseComment._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GCreateResponseCommentData_createResponseComment', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GCreateResponseCommentData_createResponseComment', 'id');
  }

  @override
  GCreateResponseCommentData_createResponseComment rebuild(
          void Function(GCreateResponseCommentData_createResponseCommentBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateResponseCommentData_createResponseCommentBuilder toBuilder() =>
      new GCreateResponseCommentData_createResponseCommentBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateResponseCommentData_createResponseComment &&
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
            r'GCreateResponseCommentData_createResponseComment')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GCreateResponseCommentData_createResponseCommentBuilder
    implements
        Builder<GCreateResponseCommentData_createResponseComment,
            GCreateResponseCommentData_createResponseCommentBuilder> {
  _$GCreateResponseCommentData_createResponseComment? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GCreateResponseCommentData_createResponseCommentBuilder() {
    GCreateResponseCommentData_createResponseComment._initializeBuilder(this);
  }

  GCreateResponseCommentData_createResponseCommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateResponseCommentData_createResponseComment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateResponseCommentData_createResponseComment;
  }

  @override
  void update(
      void Function(GCreateResponseCommentData_createResponseCommentBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateResponseCommentData_createResponseComment build() => _build();

  _$GCreateResponseCommentData_createResponseComment _build() {
    final _$result = _$v ??
        new _$GCreateResponseCommentData_createResponseComment._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GCreateResponseCommentData_createResponseComment',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GCreateResponseCommentData_createResponseComment', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
