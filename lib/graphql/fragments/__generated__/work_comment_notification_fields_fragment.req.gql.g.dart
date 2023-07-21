// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_comment_notification_fields_fragment.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkCommentNotificationFieldsReq>
    _$gWorkCommentNotificationFieldsReqSerializer =
    new _$GWorkCommentNotificationFieldsReqSerializer();

class _$GWorkCommentNotificationFieldsReqSerializer
    implements StructuredSerializer<GWorkCommentNotificationFieldsReq> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentNotificationFieldsReq,
    _$GWorkCommentNotificationFieldsReq
  ];
  @override
  final String wireName = 'GWorkCommentNotificationFieldsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentNotificationFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType:
              const FullType(_i3.GWorkCommentNotificationFieldsVars)),
      'document',
      serializers.serialize(object.document,
          specifiedType: const FullType(_i5.DocumentNode)),
      'idFields',
      serializers.serialize(object.idFields,
          specifiedType: const FullType(
              Map, const [const FullType(String), const FullType(dynamic)])),
    ];
    Object? value;
    value = object.fragmentName;
    if (value != null) {
      result
        ..add('fragmentName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GWorkCommentNotificationFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentNotificationFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GWorkCommentNotificationFieldsVars))!
              as _i3.GWorkCommentNotificationFieldsVars);
          break;
        case 'document':
          result.document = serializers.deserialize(value,
                  specifiedType: const FullType(_i5.DocumentNode))!
              as _i5.DocumentNode;
          break;
        case 'fragmentName':
          result.fragmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idFields':
          result.idFields = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ]))! as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentNotificationFieldsReq
    extends GWorkCommentNotificationFieldsReq {
  @override
  final _i3.GWorkCommentNotificationFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GWorkCommentNotificationFieldsReq(
          [void Function(GWorkCommentNotificationFieldsReqBuilder)? updates]) =>
      (new GWorkCommentNotificationFieldsReqBuilder()..update(updates))
          ._build();

  _$GWorkCommentNotificationFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GWorkCommentNotificationFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GWorkCommentNotificationFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GWorkCommentNotificationFieldsReq', 'idFields');
  }

  @override
  GWorkCommentNotificationFieldsReq rebuild(
          void Function(GWorkCommentNotificationFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentNotificationFieldsReqBuilder toBuilder() =>
      new GWorkCommentNotificationFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentNotificationFieldsReq &&
        vars == other.vars &&
        document == other.document &&
        fragmentName == other.fragmentName &&
        idFields == other.idFields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, document.hashCode);
    _$hash = $jc(_$hash, fragmentName.hashCode);
    _$hash = $jc(_$hash, idFields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkCommentNotificationFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GWorkCommentNotificationFieldsReqBuilder
    implements
        Builder<GWorkCommentNotificationFieldsReq,
            GWorkCommentNotificationFieldsReqBuilder> {
  _$GWorkCommentNotificationFieldsReq? _$v;

  _i3.GWorkCommentNotificationFieldsVarsBuilder? _vars;
  _i3.GWorkCommentNotificationFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GWorkCommentNotificationFieldsVarsBuilder();
  set vars(_i3.GWorkCommentNotificationFieldsVarsBuilder? vars) =>
      _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GWorkCommentNotificationFieldsReqBuilder() {
    GWorkCommentNotificationFieldsReq._initializeBuilder(this);
  }

  GWorkCommentNotificationFieldsReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _document = $v.document;
      _fragmentName = $v.fragmentName;
      _idFields = $v.idFields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentNotificationFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentNotificationFieldsReq;
  }

  @override
  void update(
      void Function(GWorkCommentNotificationFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentNotificationFieldsReq build() => _build();

  _$GWorkCommentNotificationFieldsReq _build() {
    _$GWorkCommentNotificationFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentNotificationFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, r'GWorkCommentNotificationFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, r'GWorkCommentNotificationFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentNotificationFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
