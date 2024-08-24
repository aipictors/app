// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_folder.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportFolderData> _$gReportFolderDataSerializer =
    new _$GReportFolderDataSerializer();

class _$GReportFolderDataSerializer
    implements StructuredSerializer<GReportFolderData> {
  @override
  final Iterable<Type> types = const [GReportFolderData, _$GReportFolderData];
  @override
  final String wireName = 'GReportFolderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReportFolderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.reportFolder;
    if (value != null) {
      result
        ..add('reportFolder')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GReportFolderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportFolderDataBuilder();

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
        case 'reportFolder':
          result.reportFolder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GReportFolderData extends GReportFolderData {
  @override
  final String G__typename;
  @override
  final bool? reportFolder;

  factory _$GReportFolderData(
          [void Function(GReportFolderDataBuilder)? updates]) =>
      (new GReportFolderDataBuilder()..update(updates))._build();

  _$GReportFolderData._({required this.G__typename, this.reportFolder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReportFolderData', 'G__typename');
  }

  @override
  GReportFolderData rebuild(void Function(GReportFolderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportFolderDataBuilder toBuilder() =>
      new GReportFolderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportFolderData &&
        G__typename == other.G__typename &&
        reportFolder == other.reportFolder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, reportFolder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReportFolderData')
          ..add('G__typename', G__typename)
          ..add('reportFolder', reportFolder))
        .toString();
  }
}

class GReportFolderDataBuilder
    implements Builder<GReportFolderData, GReportFolderDataBuilder> {
  _$GReportFolderData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _reportFolder;
  bool? get reportFolder => _$this._reportFolder;
  set reportFolder(bool? reportFolder) => _$this._reportFolder = reportFolder;

  GReportFolderDataBuilder() {
    GReportFolderData._initializeBuilder(this);
  }

  GReportFolderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _reportFolder = $v.reportFolder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportFolderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportFolderData;
  }

  @override
  void update(void Function(GReportFolderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportFolderData build() => _build();

  _$GReportFolderData _build() {
    final _$result = _$v ??
        new _$GReportFolderData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GReportFolderData', 'G__typename'),
            reportFolder: reportFolder);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
