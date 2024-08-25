// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_comment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReportCommentData> _$gReportCommentDataSerializer =
    new _$GReportCommentDataSerializer();

class _$GReportCommentDataSerializer
    implements StructuredSerializer<GReportCommentData> {
  @override
  final Iterable<Type> types = const [GReportCommentData, _$GReportCommentData];
  @override
  final String wireName = 'GReportCommentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GReportCommentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.reportComment;
    if (value != null) {
      result
        ..add('reportComment')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  GReportCommentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReportCommentDataBuilder();

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
        case 'reportComment':
          result.reportComment = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$GReportCommentData extends GReportCommentData {
  @override
  final String G__typename;
  @override
  final bool? reportComment;

  factory _$GReportCommentData(
          [void Function(GReportCommentDataBuilder)? updates]) =>
      (new GReportCommentDataBuilder()..update(updates))._build();

  _$GReportCommentData._({required this.G__typename, this.reportComment})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReportCommentData', 'G__typename');
  }

  @override
  GReportCommentData rebuild(
          void Function(GReportCommentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReportCommentDataBuilder toBuilder() =>
      new GReportCommentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReportCommentData &&
        G__typename == other.G__typename &&
        reportComment == other.reportComment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, reportComment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReportCommentData')
          ..add('G__typename', G__typename)
          ..add('reportComment', reportComment))
        .toString();
  }
}

class GReportCommentDataBuilder
    implements Builder<GReportCommentData, GReportCommentDataBuilder> {
  _$GReportCommentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _reportComment;
  bool? get reportComment => _$this._reportComment;
  set reportComment(bool? reportComment) =>
      _$this._reportComment = reportComment;

  GReportCommentDataBuilder() {
    GReportCommentData._initializeBuilder(this);
  }

  GReportCommentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _reportComment = $v.reportComment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReportCommentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReportCommentData;
  }

  @override
  void update(void Function(GReportCommentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReportCommentData build() => _build();

  _$GReportCommentData _build() {
    final _$result = _$v ??
        new _$GReportCommentData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GReportCommentData', 'G__typename'),
            reportComment: reportComment);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
