// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_work.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportWorkData> _$gReportWorkDataSerializer =
    new _$GReportWorkDataSerializer();

class _$GReportWorkDataSerializer
    implements StructuredSerializer<GReportWorkData> {
  @override
  final Iterable<Type> types = const [GReportWorkData, _$GReportWorkData];
  @override
  final String wireName = 'GReportWorkData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReportWorkData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.reportWork;
    if (value != null) {
      result
        ..add('reportWork')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GReportWorkData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportWorkDataBuilder();

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
        case 'reportWork':
          result.reportWork = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GReportWorkData extends GReportWorkData {
  @override
  final String G__typename;
  @override
  final bool? reportWork;

  factory _$GReportWorkData([void Function(GReportWorkDataBuilder)? updates]) =>
      (new GReportWorkDataBuilder()..update(updates))._build();

  _$GReportWorkData._({required this.G__typename, this.reportWork})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReportWorkData', 'G__typename');
  }

  @override
  GReportWorkData rebuild(void Function(GReportWorkDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportWorkDataBuilder toBuilder() =>
      new GReportWorkDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportWorkData &&
        G__typename == other.G__typename &&
        reportWork == other.reportWork;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, reportWork.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReportWorkData')
          ..add('G__typename', G__typename)
          ..add('reportWork', reportWork))
        .toString();
  }
}

class GReportWorkDataBuilder
    implements Builder<GReportWorkData, GReportWorkDataBuilder> {
  _$GReportWorkData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _reportWork;
  bool? get reportWork => _$this._reportWork;
  set reportWork(bool? reportWork) => _$this._reportWork = reportWork;

  GReportWorkDataBuilder() {
    GReportWorkData._initializeBuilder(this);
  }

  GReportWorkDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _reportWork = $v.reportWork;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportWorkData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportWorkData;
  }

  @override
  void update(void Function(GReportWorkDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportWorkData build() => _build();

  _$GReportWorkData _build() {
    final _$result = _$v ??
        new _$GReportWorkData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GReportWorkData', 'G__typename'),
            reportWork: reportWork);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
