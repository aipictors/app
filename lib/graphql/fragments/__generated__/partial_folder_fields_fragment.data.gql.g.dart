// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_folder_fields_fragment.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPartialFolderFieldsData> _$gPartialFolderFieldsDataSerializer =
    new _$GPartialFolderFieldsDataSerializer();

class _$GPartialFolderFieldsDataSerializer
    implements StructuredSerializer<GPartialFolderFieldsData> {
  @override
  final Iterable<Type> types = const [
    GPartialFolderFieldsData,
    _$GPartialFolderFieldsData
  ];
  @override
  final String wireName = 'GPartialFolderFieldsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPartialFolderFieldsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GRating)));
    }
    value = object.thumbnailImageURL;
    if (value != null) {
      result
        ..add('thumbnailImageURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GPartialFolderFieldsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPartialFolderFieldsDataBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GRating)) as _i1.GRating?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'thumbnailImageURL':
          result.thumbnailImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GPartialFolderFieldsData extends GPartialFolderFieldsData {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final _i1.GRating? rating;
  @override
  final String description;
  @override
  final String? thumbnailImageURL;

  factory _$GPartialFolderFieldsData(
          [void Function(GPartialFolderFieldsDataBuilder)? updates]) =>
      (new GPartialFolderFieldsDataBuilder()..update(updates))._build();

  _$GPartialFolderFieldsData._(
      {required this.G__typename,
      required this.id,
      required this.title,
      this.rating,
      required this.description,
      this.thumbnailImageURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GPartialFolderFieldsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GPartialFolderFieldsData', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GPartialFolderFieldsData', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GPartialFolderFieldsData', 'description');
  }

  @override
  GPartialFolderFieldsData rebuild(
          void Function(GPartialFolderFieldsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPartialFolderFieldsDataBuilder toBuilder() =>
      new GPartialFolderFieldsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPartialFolderFieldsData &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        rating == other.rating &&
        description == other.description &&
        thumbnailImageURL == other.thumbnailImageURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, thumbnailImageURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPartialFolderFieldsData')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('rating', rating)
          ..add('description', description)
          ..add('thumbnailImageURL', thumbnailImageURL))
        .toString();
  }
}

class GPartialFolderFieldsDataBuilder
    implements
        Builder<GPartialFolderFieldsData, GPartialFolderFieldsDataBuilder> {
  _$GPartialFolderFieldsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  _i1.GRating? _rating;
  _i1.GRating? get rating => _$this._rating;
  set rating(_i1.GRating? rating) => _$this._rating = rating;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _thumbnailImageURL;
  String? get thumbnailImageURL => _$this._thumbnailImageURL;
  set thumbnailImageURL(String? thumbnailImageURL) =>
      _$this._thumbnailImageURL = thumbnailImageURL;

  GPartialFolderFieldsDataBuilder() {
    GPartialFolderFieldsData._initializeBuilder(this);
  }

  GPartialFolderFieldsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _rating = $v.rating;
      _description = $v.description;
      _thumbnailImageURL = $v.thumbnailImageURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPartialFolderFieldsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPartialFolderFieldsData;
  }

  @override
  void update(void Function(GPartialFolderFieldsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPartialFolderFieldsData build() => _build();

  _$GPartialFolderFieldsData _build() {
    final _$result = _$v ??
        new _$GPartialFolderFieldsData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPartialFolderFieldsData', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPartialFolderFieldsData', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GPartialFolderFieldsData', 'title'),
            rating: rating,
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GPartialFolderFieldsData', 'description'),
            thumbnailImageURL: thumbnailImageURL);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
