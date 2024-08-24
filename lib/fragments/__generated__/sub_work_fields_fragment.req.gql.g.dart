// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_work_fields_fragment.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSubWorkFieldsReq> _$gSubWorkFieldsReqSerializer =
    new _$GSubWorkFieldsReqSerializer();

class _$GSubWorkFieldsReqSerializer
    implements StructuredSerializer<GSubWorkFieldsReq> {
  @override
  final Iterable<Type> types = const [GSubWorkFieldsReq, _$GSubWorkFieldsReq];
  @override
  final String wireName = 'GSubWorkFieldsReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, GSubWorkFieldsReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GSubWorkFieldsVars)),
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
  GSubWorkFieldsReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSubWorkFieldsReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GSubWorkFieldsVars))!
              as _i3.GSubWorkFieldsVars);
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

class _$GSubWorkFieldsReq extends GSubWorkFieldsReq {
  @override
  final _i3.GSubWorkFieldsVars vars;
  @override
  final _i5.DocumentNode document;
  @override
  final String? fragmentName;
  @override
  final Map<String, dynamic> idFields;

  factory _$GSubWorkFieldsReq(
          [void Function(GSubWorkFieldsReqBuilder)? updates]) =>
      (new GSubWorkFieldsReqBuilder()..update(updates))._build();

  _$GSubWorkFieldsReq._(
      {required this.vars,
      required this.document,
      this.fragmentName,
      required this.idFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GSubWorkFieldsReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        document, r'GSubWorkFieldsReq', 'document');
    BuiltValueNullFieldError.checkNotNull(
        idFields, r'GSubWorkFieldsReq', 'idFields');
  }

  @override
  GSubWorkFieldsReq rebuild(void Function(GSubWorkFieldsReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSubWorkFieldsReqBuilder toBuilder() =>
      new GSubWorkFieldsReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSubWorkFieldsReq &&
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
    return (newBuiltValueToStringHelper(r'GSubWorkFieldsReq')
          ..add('vars', vars)
          ..add('document', document)
          ..add('fragmentName', fragmentName)
          ..add('idFields', idFields))
        .toString();
  }
}

class GSubWorkFieldsReqBuilder
    implements Builder<GSubWorkFieldsReq, GSubWorkFieldsReqBuilder> {
  _$GSubWorkFieldsReq? _$v;

  _i3.GSubWorkFieldsVarsBuilder? _vars;
  _i3.GSubWorkFieldsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GSubWorkFieldsVarsBuilder();
  set vars(_i3.GSubWorkFieldsVarsBuilder? vars) => _$this._vars = vars;

  _i5.DocumentNode? _document;
  _i5.DocumentNode? get document => _$this._document;
  set document(_i5.DocumentNode? document) => _$this._document = document;

  String? _fragmentName;
  String? get fragmentName => _$this._fragmentName;
  set fragmentName(String? fragmentName) => _$this._fragmentName = fragmentName;

  Map<String, dynamic>? _idFields;
  Map<String, dynamic>? get idFields => _$this._idFields;
  set idFields(Map<String, dynamic>? idFields) => _$this._idFields = idFields;

  GSubWorkFieldsReqBuilder() {
    GSubWorkFieldsReq._initializeBuilder(this);
  }

  GSubWorkFieldsReqBuilder get _$this {
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
  void replace(GSubWorkFieldsReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSubWorkFieldsReq;
  }

  @override
  void update(void Function(GSubWorkFieldsReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSubWorkFieldsReq build() => _build();

  _$GSubWorkFieldsReq _build() {
    _$GSubWorkFieldsReq _$result;
    try {
      _$result = _$v ??
          new _$GSubWorkFieldsReq._(
              vars: vars.build(),
              document: BuiltValueNullFieldError.checkNotNull(
                  document, r'GSubWorkFieldsReq', 'document'),
              fragmentName: fragmentName,
              idFields: BuiltValueNullFieldError.checkNotNull(
                  idFields, r'GSubWorkFieldsReq', 'idFields'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GSubWorkFieldsReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
