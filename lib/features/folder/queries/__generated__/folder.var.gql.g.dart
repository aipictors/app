// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFolderVars> _$gFolderVarsSerializer = new _$GFolderVarsSerializer();

class _$GFolderVarsSerializer implements StructuredSerializer<GFolderVars> {
  @override
  final Iterable<Type> types = const [GFolderVars, _$GFolderVars];
  @override
  final String wireName = 'GFolderVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFolderVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFolderVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFolderVarsBuilder();

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

class _$GFolderVars extends GFolderVars {
  @override
  final String id;

  factory _$GFolderVars([void Function(GFolderVarsBuilder)? updates]) =>
      (new GFolderVarsBuilder()..update(updates))._build();

  _$GFolderVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GFolderVars', 'id');
  }

  @override
  GFolderVars rebuild(void Function(GFolderVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFolderVarsBuilder toBuilder() => new GFolderVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFolderVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GFolderVars')..add('id', id))
        .toString();
  }
}

class GFolderVarsBuilder implements Builder<GFolderVars, GFolderVarsBuilder> {
  _$GFolderVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GFolderVarsBuilder();

  GFolderVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFolderVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFolderVars;
  }

  @override
  void update(void Function(GFolderVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFolderVars build() => _build();

  _$GFolderVars _build() {
    final _$result = _$v ??
        new _$GFolderVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GFolderVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
