// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_image_generation_task.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerImageGenerationTaskVars>
    _$gViewerImageGenerationTaskVarsSerializer =
    new _$GViewerImageGenerationTaskVarsSerializer();

class _$GViewerImageGenerationTaskVarsSerializer
    implements StructuredSerializer<GViewerImageGenerationTaskVars> {
  @override
  final Iterable<Type> types = const [
    GViewerImageGenerationTaskVars,
    _$GViewerImageGenerationTaskVars
  ];
  @override
  final String wireName = 'GViewerImageGenerationTaskVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerImageGenerationTaskVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GViewerImageGenerationTaskVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerImageGenerationTaskVarsBuilder();

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

class _$GViewerImageGenerationTaskVars extends GViewerImageGenerationTaskVars {
  @override
  final String id;

  factory _$GViewerImageGenerationTaskVars(
          [void Function(GViewerImageGenerationTaskVarsBuilder)? updates]) =>
      (new GViewerImageGenerationTaskVarsBuilder()..update(updates))._build();

  _$GViewerImageGenerationTaskVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'GViewerImageGenerationTaskVars', 'id');
  }

  @override
  GViewerImageGenerationTaskVars rebuild(
          void Function(GViewerImageGenerationTaskVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerImageGenerationTaskVarsBuilder toBuilder() =>
      new GViewerImageGenerationTaskVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerImageGenerationTaskVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GViewerImageGenerationTaskVars')
          ..add('id', id))
        .toString();
  }
}

class GViewerImageGenerationTaskVarsBuilder
    implements
        Builder<GViewerImageGenerationTaskVars,
            GViewerImageGenerationTaskVarsBuilder> {
  _$GViewerImageGenerationTaskVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GViewerImageGenerationTaskVarsBuilder();

  GViewerImageGenerationTaskVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerImageGenerationTaskVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerImageGenerationTaskVars;
  }

  @override
  void update(void Function(GViewerImageGenerationTaskVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerImageGenerationTaskVars build() => _build();

  _$GViewerImageGenerationTaskVars _build() {
    final _$result = _$v ??
        new _$GViewerImageGenerationTaskVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GViewerImageGenerationTaskVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
