// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_user.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportUserData> _$gReportUserDataSerializer =
    new _$GReportUserDataSerializer();

class _$GReportUserDataSerializer
    implements StructuredSerializer<GReportUserData> {
  @override
  final Iterable<Type> types = const [GReportUserData, _$GReportUserData];
  @override
  final String wireName = 'GReportUserData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReportUserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.reportUser;
    if (value != null) {
      result
        ..add('reportUser')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GReportUserData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportUserDataBuilder();

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
        case 'reportUser':
          result.reportUser = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GReportUserData extends GReportUserData {
  @override
  final String G__typename;
  @override
  final bool? reportUser;

  factory _$GReportUserData([void Function(GReportUserDataBuilder)? updates]) =>
      (new GReportUserDataBuilder()..update(updates))._build();

  _$GReportUserData._({required this.G__typename, this.reportUser})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReportUserData', 'G__typename');
  }

  @override
  GReportUserData rebuild(void Function(GReportUserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportUserDataBuilder toBuilder() =>
      new GReportUserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportUserData &&
        G__typename == other.G__typename &&
        reportUser == other.reportUser;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, reportUser.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReportUserData')
          ..add('G__typename', G__typename)
          ..add('reportUser', reportUser))
        .toString();
  }
}

class GReportUserDataBuilder
    implements Builder<GReportUserData, GReportUserDataBuilder> {
  _$GReportUserData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _reportUser;
  bool? get reportUser => _$this._reportUser;
  set reportUser(bool? reportUser) => _$this._reportUser = reportUser;

  GReportUserDataBuilder() {
    GReportUserData._initializeBuilder(this);
  }

  GReportUserDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _reportUser = $v.reportUser;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportUserData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportUserData;
  }

  @override
  void update(void Function(GReportUserDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportUserData build() => _build();

  _$GReportUserData _build() {
    final _$result = _$v ??
        new _$GReportUserData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GReportUserData', 'G__typename'),
            reportUser: reportUser);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
