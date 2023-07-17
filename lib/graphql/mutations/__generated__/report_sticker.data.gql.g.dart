// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_sticker.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportStickerData> _$gReportStickerDataSerializer =
    new _$GReportStickerDataSerializer();

class _$GReportStickerDataSerializer
    implements StructuredSerializer<GReportStickerData> {
  @override
  final Iterable<Type> types = const [GReportStickerData, _$GReportStickerData];
  @override
  final String wireName = 'GReportStickerData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GReportStickerData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.reportSticker;
    if (value != null) {
      result
        ..add('reportSticker')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GReportStickerData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportStickerDataBuilder();

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
        case 'reportSticker':
          result.reportSticker = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GReportStickerData extends GReportStickerData {
  @override
  final String G__typename;
  @override
  final bool? reportSticker;

  factory _$GReportStickerData(
          [void Function(GReportStickerDataBuilder)? updates]) =>
      (new GReportStickerDataBuilder()..update(updates))._build();

  _$GReportStickerData._({required this.G__typename, this.reportSticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReportStickerData', 'G__typename');
  }

  @override
  GReportStickerData rebuild(
          void Function(GReportStickerDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportStickerDataBuilder toBuilder() =>
      new GReportStickerDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportStickerData &&
        G__typename == other.G__typename &&
        reportSticker == other.reportSticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, reportSticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReportStickerData')
          ..add('G__typename', G__typename)
          ..add('reportSticker', reportSticker))
        .toString();
  }
}

class GReportStickerDataBuilder
    implements Builder<GReportStickerData, GReportStickerDataBuilder> {
  _$GReportStickerData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _reportSticker;
  bool? get reportSticker => _$this._reportSticker;
  set reportSticker(bool? reportSticker) =>
      _$this._reportSticker = reportSticker;

  GReportStickerDataBuilder() {
    GReportStickerData._initializeBuilder(this);
  }

  GReportStickerDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _reportSticker = $v.reportSticker;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportStickerData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportStickerData;
  }

  @override
  void update(void Function(GReportStickerDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportStickerData build() => _build();

  _$GReportStickerData _build() {
    final _$result = _$v ??
        new _$GReportStickerData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GReportStickerData', 'G__typename'),
            reportSticker: reportSticker);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
