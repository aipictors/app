// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GStickerVars> _$gStickerVarsSerializer =
    new _$GStickerVarsSerializer();

class _$GStickerVarsSerializer implements StructuredSerializer<GStickerVars> {
  @override
  final Iterable<Type> types = const [GStickerVars, _$GStickerVars];
  @override
  final String wireName = 'GStickerVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GStickerVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GStickerVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStickerVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GStickerVars extends GStickerVars {
  @override
  final String id;

  factory _$GStickerVars([void Function(GStickerVarsBuilder)? updates]) =>
      (new GStickerVarsBuilder()..update(updates))._build();

  _$GStickerVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GStickerVars', 'id');
  }

  @override
  GStickerVars rebuild(void Function(GStickerVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStickerVarsBuilder toBuilder() => new GStickerVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStickerVars && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GStickerVars')..add('id', id))
        .toString();
  }
}

class GStickerVarsBuilder
    implements Builder<GStickerVars, GStickerVarsBuilder> {
  _$GStickerVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GStickerVarsBuilder();

  GStickerVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStickerVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GStickerVars;
  }

  @override
  void update(void Function(GStickerVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GStickerVars build() => _build();

  _$GStickerVars _build() {
    final _$result = _$v ??
        new _$GStickerVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GStickerVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
