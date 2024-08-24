// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_album.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportAlbumData> _$gReportAlbumDataSerializer =
    new _$GReportAlbumDataSerializer();

class _$GReportAlbumDataSerializer
    implements StructuredSerializer<GReportAlbumData> {
  @override
  final Iterable<Type> types = const [GReportAlbumData, _$GReportAlbumData];
  @override
  final String wireName = 'GReportAlbumData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReportAlbumData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.reportAlbum;
    if (value != null) {
      result
        ..add('reportAlbum')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GReportAlbumData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportAlbumDataBuilder();

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
        case 'reportAlbum':
          result.reportAlbum = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GReportAlbumData extends GReportAlbumData {
  @override
  final String G__typename;
  @override
  final bool? reportAlbum;

  factory _$GReportAlbumData(
          [void Function(GReportAlbumDataBuilder)? updates]) =>
      (new GReportAlbumDataBuilder()..update(updates))._build();

  _$GReportAlbumData._({required this.G__typename, this.reportAlbum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReportAlbumData', 'G__typename');
  }

  @override
  GReportAlbumData rebuild(void Function(GReportAlbumDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportAlbumDataBuilder toBuilder() =>
      new GReportAlbumDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportAlbumData &&
        G__typename == other.G__typename &&
        reportAlbum == other.reportAlbum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, reportAlbum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReportAlbumData')
          ..add('G__typename', G__typename)
          ..add('reportAlbum', reportAlbum))
        .toString();
  }
}

class GReportAlbumDataBuilder
    implements Builder<GReportAlbumData, GReportAlbumDataBuilder> {
  _$GReportAlbumData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _reportAlbum;
  bool? get reportAlbum => _$this._reportAlbum;
  set reportAlbum(bool? reportAlbum) => _$this._reportAlbum = reportAlbum;

  GReportAlbumDataBuilder() {
    GReportAlbumData._initializeBuilder(this);
  }

  GReportAlbumDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _reportAlbum = $v.reportAlbum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportAlbumData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportAlbumData;
  }

  @override
  void update(void Function(GReportAlbumDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportAlbumData build() => _build();

  _$GReportAlbumData _build() {
    final _$result = _$v ??
        new _$GReportAlbumData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GReportAlbumData', 'G__typename'),
            reportAlbum: reportAlbum);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
