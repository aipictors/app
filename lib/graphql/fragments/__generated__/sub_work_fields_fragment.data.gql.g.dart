// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_work_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSubWorkFieldsData> _$gSubWorkFieldsDataSerializer =
    new _$GSubWorkFieldsDataSerializer();

class _$GSubWorkFieldsDataSerializer
    implements StructuredSerializer<GSubWorkFieldsData> {
  @override
  final Iterable<Type> types = const [GSubWorkFieldsData, _$GSubWorkFieldsData];
  @override
  final String wireName = 'GSubWorkFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSubWorkFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('imageUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GSubWorkFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSubWorkFieldsDataBuilder();

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
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GSubWorkFieldsData extends GSubWorkFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String? imageUrl;

  factory _$GSubWorkFieldsData(
          [void Function(GSubWorkFieldsDataBuilder)? updates]) =>
      (new GSubWorkFieldsDataBuilder()..update(updates))._build();

  _$GSubWorkFieldsData._(
      {required this.G__typename, required this.id, this.imageUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSubWorkFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GSubWorkFieldsData', 'id');
  }

  @override
  GSubWorkFieldsData rebuild(
          void Function(GSubWorkFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSubWorkFieldsDataBuilder toBuilder() =>
      new GSubWorkFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSubWorkFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSubWorkFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('imageUrl', imageUrl))
        .toString();
  }
}

class GSubWorkFieldsDataBuilder
    implements Builder<GSubWorkFieldsData, GSubWorkFieldsDataBuilder> {
  _$GSubWorkFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  GSubWorkFieldsDataBuilder() {
    GSubWorkFieldsData._initializeBuilder(this);
  }

  GSubWorkFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _imageUrl = $v.imageUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSubWorkFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSubWorkFieldsData;
  }

  @override
  void update(void Function(GSubWorkFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSubWorkFieldsData build() => _build();

  _$GSubWorkFieldsData _build() {
    final _$result = _$v ??
        new _$GSubWorkFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GSubWorkFieldsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GSubWorkFieldsData', 'id'),
            imageUrl: imageUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
