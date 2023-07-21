// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_award_notification_fields_fragment.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkAwardNotificationFieldsReq>
    _$gWorkAwardNotificationFieldsReqSerializer =
    new _$GWorkAwardNotificationFieldsReqSerializer();

class _$GWorkAwardNotificationFieldsReqSerializer
    implements StructuredSerializer<GWorkAwardNotificationFieldsReq> {
  @override
  final Iterable<Type> types = const [
    GWorkAwardNotificationFieldsReq,
    _$GWorkAwardNotificationFieldsReq
  ];
  @override
  final String wireName = 'GWorkAwardNotificationFieldsReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkAwardNotificationFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GWorkAwardNotificationFieldsVars)),
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
  GWorkAwardNotificationFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkAwardNotificationFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GWorkAwardNotificationFieldsVars))!
              as _i3.GWorkAwardNotificationFieldsVars);
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

class _$GWorkAwardNotificationFieldsReq
    extends GWorkAwardNotificationFieldsReq {
  @override
  final _i3.GWorkAwardNotificationFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GWorkAwardNotificationFieldsReq(
          [void Function(GWorkAwardNotificationFieldsReqBuilder)? updates]) =>
      (new GWorkAwardNotificationFieldsReqBuilder()..update(updates))._build();

  _$GWorkAwardNotificationFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GWorkAwardNotificationFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GWorkAwardNotificationFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GWorkAwardNotificationFieldsReq', 'idFields');
  }

  @override
  GWorkAwardNotificationFieldsReq rebuild(
          void Function(GWorkAwardNotificationFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkAwardNotificationFieldsReqBuilder toBuilder() =>
      new GWorkAwardNotificationFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkAwardNotificationFieldsReq &&
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
    return (newBuiltValueToStringHelper(r'GWorkAwardNotificationFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GWorkAwardNotificationFieldsReqBuilder
    implements
        Builder<GWorkAwardNotificationFieldsReq,
            GWorkAwardNotificationFieldsReqBuilder> {
  _$GWorkAwardNotificationFieldsReq? _$v;

  _i3.GWorkAwardNotificationFieldsVarsBuilder? _vars;
  _i3.GWorkAwardNotificationFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GWorkAwardNotificationFieldsVarsBuilder();
  set vars(_i3.GWorkAwardNotificationFieldsVarsBuilder? vars) =>
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

  GWorkAwardNotificationFieldsReqBuilder() {
    GWorkAwardNotificationFieldsReq._initializeBuilder(this);
  }

  GWorkAwardNotificationFieldsReqBuilder get _$this {
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
  void replace(GWorkAwardNotificationFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkAwardNotificationFieldsReq;
  }

  @override
  void update(void Function(GWorkAwardNotificationFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkAwardNotificationFieldsReq build() => _build();

  _$GWorkAwardNotificationFieldsReq _build() {
    _$GWorkAwardNotificationFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GWorkAwardNotificationFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, r'GWorkAwardNotificationFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, r'GWorkAwardNotificationFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkAwardNotificationFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
