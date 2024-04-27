// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_image_generation_tasks.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerImageGenerationTasksData>
    _$gViewerImageGenerationTasksDataSerializer =
    new _$GViewerImageGenerationTasksDataSerializer();
Serializer<GViewerImageGenerationTasksData_viewer>
    _$gViewerImageGenerationTasksDataViewerSerializer =
    new _$GViewerImageGenerationTasksData_viewerSerializer();
Serializer<GViewerImageGenerationTasksData_viewer_imageGenerationTasks>
    _$gViewerImageGenerationTasksDataViewerImageGenerationTasksSerializer =
    new _$GViewerImageGenerationTasksData_viewer_imageGenerationTasksSerializer();
Serializer<GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model>
    _$gViewerImageGenerationTasksDataViewerImageGenerationTasksModelSerializer =
    new _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelSerializer();

class _$GViewerImageGenerationTasksDataSerializer
    implements StructuredSerializer<GViewerImageGenerationTasksData> {
  @override
  final Iterable<Type> types = const [
    GViewerImageGenerationTasksData,
    _$GViewerImageGenerationTasksData
  ];
  @override
  final String wireName = 'GViewerImageGenerationTasksData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerImageGenerationTasksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GViewerImageGenerationTasksData_viewer)));
    }
    return result;
  }

  @override
  GViewerImageGenerationTasksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerImageGenerationTasksDataBuilder();

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
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GViewerImageGenerationTasksData_viewer))!
              as GViewerImageGenerationTasksData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerImageGenerationTasksData_viewerSerializer
    implements StructuredSerializer<GViewerImageGenerationTasksData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerImageGenerationTasksData_viewer,
    _$GViewerImageGenerationTasksData_viewer
  ];
  @override
  final String wireName = 'GViewerImageGenerationTasksData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerImageGenerationTasksData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'imageGenerationTasks',
      serializers.serialize(object.imageGenerationTasks,
          specifiedType: const FullType(BuiltList, const [
            const FullType(
                GViewerImageGenerationTasksData_viewer_imageGenerationTasks)
          ])),
    ];

    return result;
  }

  @override
  GViewerImageGenerationTasksData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerImageGenerationTasksData_viewerBuilder();

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
        case 'imageGenerationTasks':
          result.imageGenerationTasks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GViewerImageGenerationTasksData_viewer_imageGenerationTasks)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerImageGenerationTasksData_viewer_imageGenerationTasksSerializer
    implements
        StructuredSerializer<
            GViewerImageGenerationTasksData_viewer_imageGenerationTasks> {
  @override
  final Iterable<Type> types = const [
    GViewerImageGenerationTasksData_viewer_imageGenerationTasks,
    _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks
  ];
  @override
  final String wireName =
      'GViewerImageGenerationTasksData_viewer_imageGenerationTasks';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerImageGenerationTasksData_viewer_imageGenerationTasks object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'prompt',
      serializers.serialize(object.prompt,
          specifiedType: const FullType(String)),
      'negativePrompt',
      serializers.serialize(object.negativePrompt,
          specifiedType: const FullType(String)),
      'seed',
      serializers.serialize(object.seed, specifiedType: const FullType(double)),
      'steps',
      serializers.serialize(object.steps, specifiedType: const FullType(int)),
      'scale',
      serializers.serialize(object.scale, specifiedType: const FullType(int)),
      'sampler',
      serializers.serialize(object.sampler,
          specifiedType: const FullType(String)),
      'clipSkip',
      serializers.serialize(object.clipSkip,
          specifiedType: const FullType(int)),
      'sizeType',
      serializers.serialize(object.sizeType,
          specifiedType: const FullType(_i2.GImageGenerationSizeType)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(_i2.GImageGenerationStatus)),
      'isDeleted',
      serializers.serialize(object.isDeleted,
          specifiedType: const FullType(bool)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
      'generationType',
      serializers.serialize(object.generationType,
          specifiedType: const FullType(_i2.GImageGenerationType)),
      'model',
      serializers.serialize(object.model,
          specifiedType: const FullType(
              GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model)),
    ];
    Object? value;
    value = object.t2tImageUrl;
    if (value != null) {
      result
        ..add('t2tImageUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.t2tMaskImageUrl;
    if (value != null) {
      result
        ..add('t2tMaskImageUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.t2tDenoisingStrengthSize;
    if (value != null) {
      result
        ..add('t2tDenoisingStrengthSize')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.t2tInpaintingFillSize;
    if (value != null) {
      result
        ..add('t2tInpaintingFillSize')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.completedAt;
    if (value != null) {
      result
        ..add('completedAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isProtected;
    if (value != null) {
      result
        ..add('isProtected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.vae;
    if (value != null) {
      result
        ..add('vae')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thumbnailToken;
    if (value != null) {
      result
        ..add('thumbnailToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nanoid;
    if (value != null) {
      result
        ..add('nanoid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.estimatedSeconds;
    if (value != null) {
      result
        ..add('estimatedSeconds')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.controlNetControlMode;
    if (value != null) {
      result
        ..add('controlNetControlMode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.controlNetEnabled;
    if (value != null) {
      result
        ..add('controlNetEnabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.controlNetGuidanceEnd;
    if (value != null) {
      result
        ..add('controlNetGuidanceEnd')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.controlNetGuidanceStart;
    if (value != null) {
      result
        ..add('controlNetGuidanceStart')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.controlNetPixelPerfect;
    if (value != null) {
      result
        ..add('controlNetPixelPerfect')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.controlNetProcessorRes;
    if (value != null) {
      result
        ..add('controlNetProcessorRes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.controlNetResizeMode;
    if (value != null) {
      result
        ..add('controlNetResizeMode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.controlNetThresholdA;
    if (value != null) {
      result
        ..add('controlNetThresholdA')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.controlNetThresholdB;
    if (value != null) {
      result
        ..add('controlNetThresholdB')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.controlNetWeight;
    if (value != null) {
      result
        ..add('controlNetWeight')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.controlNetModule;
    if (value != null) {
      result
        ..add('controlNetModule')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.controlNetModel;
    if (value != null) {
      result
        ..add('controlNetModel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.controlNetSaveDetectedMap;
    if (value != null) {
      result
        ..add('controlNetSaveDetectedMap')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.controlNetHrOption;
    if (value != null) {
      result
        ..add('controlNetHrOption')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.upscaleSize;
    if (value != null) {
      result
        ..add('upscaleSize')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder();

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
        case 'prompt':
          result.prompt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'negativePrompt':
          result.negativePrompt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'seed':
          result.seed = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'steps':
          result.steps = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'scale':
          result.scale = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'sampler':
          result.sampler = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'clipSkip':
          result.clipSkip = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'sizeType':
          result.sizeType = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GImageGenerationSizeType))!
              as _i2.GImageGenerationSizeType;
          break;
        case 't2tImageUrl':
          result.t2tImageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 't2tMaskImageUrl':
          result.t2tMaskImageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 't2tDenoisingStrengthSize':
          result.t2tDenoisingStrengthSize = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 't2tInpaintingFillSize':
          result.t2tInpaintingFillSize = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'completedAt':
          result.completedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GImageGenerationStatus))!
              as _i2.GImageGenerationStatus;
          break;
        case 'isDeleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'isProtected':
          result.isProtected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'generationType':
          result.generationType = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GImageGenerationType))!
              as _i2.GImageGenerationType;
          break;
        case 'model':
          result.model.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model))!
              as GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model);
          break;
        case 'vae':
          result.vae = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'thumbnailToken':
          result.thumbnailToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nanoid':
          result.nanoid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'estimatedSeconds':
          result.estimatedSeconds = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'controlNetControlMode':
          result.controlNetControlMode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'controlNetEnabled':
          result.controlNetEnabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'controlNetGuidanceEnd':
          result.controlNetGuidanceEnd = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'controlNetGuidanceStart':
          result.controlNetGuidanceStart = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'controlNetPixelPerfect':
          result.controlNetPixelPerfect = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'controlNetProcessorRes':
          result.controlNetProcessorRes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'controlNetResizeMode':
          result.controlNetResizeMode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'controlNetThresholdA':
          result.controlNetThresholdA = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'controlNetThresholdB':
          result.controlNetThresholdB = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'controlNetWeight':
          result.controlNetWeight = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'controlNetModule':
          result.controlNetModule = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'controlNetModel':
          result.controlNetModel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'controlNetSaveDetectedMap':
          result.controlNetSaveDetectedMap = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'controlNetHrOption':
          result.controlNetHrOption = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'upscaleSize':
          result.upscaleSize = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelSerializer
    implements
        StructuredSerializer<
            GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model> {
  @override
  final Iterable<Type> types = const [
    GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model,
    _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model
  ];
  @override
  final String wireName =
      'GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerImageGenerationTasksData
    extends GViewerImageGenerationTasksData {
  @override
  final String G__typename;
  @override
  final GViewerImageGenerationTasksData_viewer? viewer;

  factory _$GViewerImageGenerationTasksData(
          [void Function(GViewerImageGenerationTasksDataBuilder)? updates]) =>
      (new GViewerImageGenerationTasksDataBuilder()..update(updates))._build();

  _$GViewerImageGenerationTasksData._({required this.G__typename, this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerImageGenerationTasksData', 'G__typename');
  }

  @override
  GViewerImageGenerationTasksData rebuild(
          void Function(GViewerImageGenerationTasksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerImageGenerationTasksDataBuilder toBuilder() =>
      new GViewerImageGenerationTasksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerImageGenerationTasksData &&
        G__typename == other.G__typename &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerImageGenerationTasksData')
          ..add('G__typename', G__typename)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerImageGenerationTasksDataBuilder
    implements
        Builder<GViewerImageGenerationTasksData,
            GViewerImageGenerationTasksDataBuilder> {
  _$GViewerImageGenerationTasksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerImageGenerationTasksData_viewerBuilder? _viewer;
  GViewerImageGenerationTasksData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerImageGenerationTasksData_viewerBuilder();
  set viewer(GViewerImageGenerationTasksData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerImageGenerationTasksDataBuilder() {
    GViewerImageGenerationTasksData._initializeBuilder(this);
  }

  GViewerImageGenerationTasksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerImageGenerationTasksData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerImageGenerationTasksData;
  }

  @override
  void update(void Function(GViewerImageGenerationTasksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerImageGenerationTasksData build() => _build();

  _$GViewerImageGenerationTasksData _build() {
    _$GViewerImageGenerationTasksData _$result;
    try {
      _$result = _$v ??
          new _$GViewerImageGenerationTasksData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GViewerImageGenerationTasksData', 'G__typename'),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerImageGenerationTasksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerImageGenerationTasksData_viewer
    extends GViewerImageGenerationTasksData_viewer {
  @override
  final String G__typename;
  @override
  final BuiltList<GViewerImageGenerationTasksData_viewer_imageGenerationTasks>
      imageGenerationTasks;

  factory _$GViewerImageGenerationTasksData_viewer(
          [void Function(GViewerImageGenerationTasksData_viewerBuilder)?
              updates]) =>
      (new GViewerImageGenerationTasksData_viewerBuilder()..update(updates))
          ._build();

  _$GViewerImageGenerationTasksData_viewer._(
      {required this.G__typename, required this.imageGenerationTasks})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerImageGenerationTasksData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(imageGenerationTasks,
        r'GViewerImageGenerationTasksData_viewer', 'imageGenerationTasks');
  }

  @override
  GViewerImageGenerationTasksData_viewer rebuild(
          void Function(GViewerImageGenerationTasksData_viewerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerImageGenerationTasksData_viewerBuilder toBuilder() =>
      new GViewerImageGenerationTasksData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerImageGenerationTasksData_viewer &&
        G__typename == other.G__typename &&
        imageGenerationTasks == other.imageGenerationTasks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, imageGenerationTasks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerImageGenerationTasksData_viewer')
          ..add('G__typename', G__typename)
          ..add('imageGenerationTasks', imageGenerationTasks))
        .toString();
  }
}

class GViewerImageGenerationTasksData_viewerBuilder
    implements
        Builder<GViewerImageGenerationTasksData_viewer,
            GViewerImageGenerationTasksData_viewerBuilder> {
  _$GViewerImageGenerationTasksData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GViewerImageGenerationTasksData_viewer_imageGenerationTasks>?
      _imageGenerationTasks;
  ListBuilder<GViewerImageGenerationTasksData_viewer_imageGenerationTasks>
      get imageGenerationTasks =>
          _$this._imageGenerationTasks ??= new ListBuilder<
              GViewerImageGenerationTasksData_viewer_imageGenerationTasks>();
  set imageGenerationTasks(
          ListBuilder<
                  GViewerImageGenerationTasksData_viewer_imageGenerationTasks>?
              imageGenerationTasks) =>
      _$this._imageGenerationTasks = imageGenerationTasks;

  GViewerImageGenerationTasksData_viewerBuilder() {
    GViewerImageGenerationTasksData_viewer._initializeBuilder(this);
  }

  GViewerImageGenerationTasksData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _imageGenerationTasks = $v.imageGenerationTasks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerImageGenerationTasksData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerImageGenerationTasksData_viewer;
  }

  @override
  void update(
      void Function(GViewerImageGenerationTasksData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerImageGenerationTasksData_viewer build() => _build();

  _$GViewerImageGenerationTasksData_viewer _build() {
    _$GViewerImageGenerationTasksData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GViewerImageGenerationTasksData_viewer._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GViewerImageGenerationTasksData_viewer', 'G__typename'),
              imageGenerationTasks: imageGenerationTasks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'imageGenerationTasks';
        imageGenerationTasks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerImageGenerationTasksData_viewer',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks
    extends GViewerImageGenerationTasksData_viewer_imageGenerationTasks {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String prompt;
  @override
  final String negativePrompt;
  @override
  final double seed;
  @override
  final int steps;
  @override
  final int scale;
  @override
  final String sampler;
  @override
  final int clipSkip;
  @override
  final _i2.GImageGenerationSizeType sizeType;
  @override
  final String? t2tImageUrl;
  @override
  final String? t2tMaskImageUrl;
  @override
  final String? t2tDenoisingStrengthSize;
  @override
  final String? t2tInpaintingFillSize;
  @override
  final int? rating;
  @override
  final int? completedAt;
  @override
  final _i2.GImageGenerationStatus status;
  @override
  final bool isDeleted;
  @override
  final bool? isProtected;
  @override
  final int count;
  @override
  final _i2.GImageGenerationType generationType;
  @override
  final GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model model;
  @override
  final String? vae;
  @override
  final String? token;
  @override
  final String? thumbnailToken;
  @override
  final String? nanoid;
  @override
  final int? estimatedSeconds;
  @override
  final String? controlNetControlMode;
  @override
  final bool? controlNetEnabled;
  @override
  final int? controlNetGuidanceEnd;
  @override
  final int? controlNetGuidanceStart;
  @override
  final bool? controlNetPixelPerfect;
  @override
  final int? controlNetProcessorRes;
  @override
  final String? controlNetResizeMode;
  @override
  final int? controlNetThresholdA;
  @override
  final int? controlNetThresholdB;
  @override
  final double? controlNetWeight;
  @override
  final String? controlNetModule;
  @override
  final String? controlNetModel;
  @override
  final bool? controlNetSaveDetectedMap;
  @override
  final String? controlNetHrOption;
  @override
  final double? upscaleSize;

  factory _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks(
          [void Function(
                  GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder)?
              updates]) =>
      (new GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder()
            ..update(updates))
          ._build();

  _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks._(
      {required this.G__typename,
      required this.id,
      required this.prompt,
      required this.negativePrompt,
      required this.seed,
      required this.steps,
      required this.scale,
      required this.sampler,
      required this.clipSkip,
      required this.sizeType,
      this.t2tImageUrl,
      this.t2tMaskImageUrl,
      this.t2tDenoisingStrengthSize,
      this.t2tInpaintingFillSize,
      this.rating,
      this.completedAt,
      required this.status,
      required this.isDeleted,
      this.isProtected,
      required this.count,
      required this.generationType,
      required this.model,
      this.vae,
      this.token,
      this.thumbnailToken,
      this.nanoid,
      this.estimatedSeconds,
      this.controlNetControlMode,
      this.controlNetEnabled,
      this.controlNetGuidanceEnd,
      this.controlNetGuidanceStart,
      this.controlNetPixelPerfect,
      this.controlNetProcessorRes,
      this.controlNetResizeMode,
      this.controlNetThresholdA,
      this.controlNetThresholdB,
      this.controlNetWeight,
      this.controlNetModule,
      this.controlNetModel,
      this.controlNetSaveDetectedMap,
      this.controlNetHrOption,
      this.upscaleSize})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(id,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'id');
    BuiltValueNullFieldError.checkNotNull(
        prompt,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'prompt');
    BuiltValueNullFieldError.checkNotNull(
        negativePrompt,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'negativePrompt');
    BuiltValueNullFieldError.checkNotNull(seed,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'seed');
    BuiltValueNullFieldError.checkNotNull(
        steps,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'steps');
    BuiltValueNullFieldError.checkNotNull(
        scale,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'scale');
    BuiltValueNullFieldError.checkNotNull(
        sampler,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'sampler');
    BuiltValueNullFieldError.checkNotNull(
        clipSkip,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'clipSkip');
    BuiltValueNullFieldError.checkNotNull(
        sizeType,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'sizeType');
    BuiltValueNullFieldError.checkNotNull(
        status,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'status');
    BuiltValueNullFieldError.checkNotNull(
        isDeleted,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'isDeleted');
    BuiltValueNullFieldError.checkNotNull(
        count,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'count');
    BuiltValueNullFieldError.checkNotNull(
        generationType,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'generationType');
    BuiltValueNullFieldError.checkNotNull(
        model,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
        'model');
  }

  @override
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks rebuild(
          void Function(
                  GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder
      toBuilder() =>
          new GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GViewerImageGenerationTasksData_viewer_imageGenerationTasks &&
        G__typename == other.G__typename &&
        id == other.id &&
        prompt == other.prompt &&
        negativePrompt == other.negativePrompt &&
        seed == other.seed &&
        steps == other.steps &&
        scale == other.scale &&
        sampler == other.sampler &&
        clipSkip == other.clipSkip &&
        sizeType == other.sizeType &&
        t2tImageUrl == other.t2tImageUrl &&
        t2tMaskImageUrl == other.t2tMaskImageUrl &&
        t2tDenoisingStrengthSize == other.t2tDenoisingStrengthSize &&
        t2tInpaintingFillSize == other.t2tInpaintingFillSize &&
        rating == other.rating &&
        completedAt == other.completedAt &&
        status == other.status &&
        isDeleted == other.isDeleted &&
        isProtected == other.isProtected &&
        count == other.count &&
        generationType == other.generationType &&
        model == other.model &&
        vae == other.vae &&
        token == other.token &&
        thumbnailToken == other.thumbnailToken &&
        nanoid == other.nanoid &&
        estimatedSeconds == other.estimatedSeconds &&
        controlNetControlMode == other.controlNetControlMode &&
        controlNetEnabled == other.controlNetEnabled &&
        controlNetGuidanceEnd == other.controlNetGuidanceEnd &&
        controlNetGuidanceStart == other.controlNetGuidanceStart &&
        controlNetPixelPerfect == other.controlNetPixelPerfect &&
        controlNetProcessorRes == other.controlNetProcessorRes &&
        controlNetResizeMode == other.controlNetResizeMode &&
        controlNetThresholdA == other.controlNetThresholdA &&
        controlNetThresholdB == other.controlNetThresholdB &&
        controlNetWeight == other.controlNetWeight &&
        controlNetModule == other.controlNetModule &&
        controlNetModel == other.controlNetModel &&
        controlNetSaveDetectedMap == other.controlNetSaveDetectedMap &&
        controlNetHrOption == other.controlNetHrOption &&
        upscaleSize == other.upscaleSize;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, prompt.hashCode);
    _$hash = $jc(_$hash, negativePrompt.hashCode);
    _$hash = $jc(_$hash, seed.hashCode);
    _$hash = $jc(_$hash, steps.hashCode);
    _$hash = $jc(_$hash, scale.hashCode);
    _$hash = $jc(_$hash, sampler.hashCode);
    _$hash = $jc(_$hash, clipSkip.hashCode);
    _$hash = $jc(_$hash, sizeType.hashCode);
    _$hash = $jc(_$hash, t2tImageUrl.hashCode);
    _$hash = $jc(_$hash, t2tMaskImageUrl.hashCode);
    _$hash = $jc(_$hash, t2tDenoisingStrengthSize.hashCode);
    _$hash = $jc(_$hash, t2tInpaintingFillSize.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, completedAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, isDeleted.hashCode);
    _$hash = $jc(_$hash, isProtected.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, generationType.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, vae.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, thumbnailToken.hashCode);
    _$hash = $jc(_$hash, nanoid.hashCode);
    _$hash = $jc(_$hash, estimatedSeconds.hashCode);
    _$hash = $jc(_$hash, controlNetControlMode.hashCode);
    _$hash = $jc(_$hash, controlNetEnabled.hashCode);
    _$hash = $jc(_$hash, controlNetGuidanceEnd.hashCode);
    _$hash = $jc(_$hash, controlNetGuidanceStart.hashCode);
    _$hash = $jc(_$hash, controlNetPixelPerfect.hashCode);
    _$hash = $jc(_$hash, controlNetProcessorRes.hashCode);
    _$hash = $jc(_$hash, controlNetResizeMode.hashCode);
    _$hash = $jc(_$hash, controlNetThresholdA.hashCode);
    _$hash = $jc(_$hash, controlNetThresholdB.hashCode);
    _$hash = $jc(_$hash, controlNetWeight.hashCode);
    _$hash = $jc(_$hash, controlNetModule.hashCode);
    _$hash = $jc(_$hash, controlNetModel.hashCode);
    _$hash = $jc(_$hash, controlNetSaveDetectedMap.hashCode);
    _$hash = $jc(_$hash, controlNetHrOption.hashCode);
    _$hash = $jc(_$hash, upscaleSize.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('prompt', prompt)
          ..add('negativePrompt', negativePrompt)
          ..add('seed', seed)
          ..add('steps', steps)
          ..add('scale', scale)
          ..add('sampler', sampler)
          ..add('clipSkip', clipSkip)
          ..add('sizeType', sizeType)
          ..add('t2tImageUrl', t2tImageUrl)
          ..add('t2tMaskImageUrl', t2tMaskImageUrl)
          ..add('t2tDenoisingStrengthSize', t2tDenoisingStrengthSize)
          ..add('t2tInpaintingFillSize', t2tInpaintingFillSize)
          ..add('rating', rating)
          ..add('completedAt', completedAt)
          ..add('status', status)
          ..add('isDeleted', isDeleted)
          ..add('isProtected', isProtected)
          ..add('count', count)
          ..add('generationType', generationType)
          ..add('model', model)
          ..add('vae', vae)
          ..add('token', token)
          ..add('thumbnailToken', thumbnailToken)
          ..add('nanoid', nanoid)
          ..add('estimatedSeconds', estimatedSeconds)
          ..add('controlNetControlMode', controlNetControlMode)
          ..add('controlNetEnabled', controlNetEnabled)
          ..add('controlNetGuidanceEnd', controlNetGuidanceEnd)
          ..add('controlNetGuidanceStart', controlNetGuidanceStart)
          ..add('controlNetPixelPerfect', controlNetPixelPerfect)
          ..add('controlNetProcessorRes', controlNetProcessorRes)
          ..add('controlNetResizeMode', controlNetResizeMode)
          ..add('controlNetThresholdA', controlNetThresholdA)
          ..add('controlNetThresholdB', controlNetThresholdB)
          ..add('controlNetWeight', controlNetWeight)
          ..add('controlNetModule', controlNetModule)
          ..add('controlNetModel', controlNetModel)
          ..add('controlNetSaveDetectedMap', controlNetSaveDetectedMap)
          ..add('controlNetHrOption', controlNetHrOption)
          ..add('upscaleSize', upscaleSize))
        .toString();
  }
}

class GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder
    implements
        Builder<GViewerImageGenerationTasksData_viewer_imageGenerationTasks,
            GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder> {
  _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  String? _negativePrompt;
  String? get negativePrompt => _$this._negativePrompt;
  set negativePrompt(String? negativePrompt) =>
      _$this._negativePrompt = negativePrompt;

  double? _seed;
  double? get seed => _$this._seed;
  set seed(double? seed) => _$this._seed = seed;

  int? _steps;
  int? get steps => _$this._steps;
  set steps(int? steps) => _$this._steps = steps;

  int? _scale;
  int? get scale => _$this._scale;
  set scale(int? scale) => _$this._scale = scale;

  String? _sampler;
  String? get sampler => _$this._sampler;
  set sampler(String? sampler) => _$this._sampler = sampler;

  int? _clipSkip;
  int? get clipSkip => _$this._clipSkip;
  set clipSkip(int? clipSkip) => _$this._clipSkip = clipSkip;

  _i2.GImageGenerationSizeType? _sizeType;
  _i2.GImageGenerationSizeType? get sizeType => _$this._sizeType;
  set sizeType(_i2.GImageGenerationSizeType? sizeType) =>
      _$this._sizeType = sizeType;

  String? _t2tImageUrl;
  String? get t2tImageUrl => _$this._t2tImageUrl;
  set t2tImageUrl(String? t2tImageUrl) => _$this._t2tImageUrl = t2tImageUrl;

  String? _t2tMaskImageUrl;
  String? get t2tMaskImageUrl => _$this._t2tMaskImageUrl;
  set t2tMaskImageUrl(String? t2tMaskImageUrl) =>
      _$this._t2tMaskImageUrl = t2tMaskImageUrl;

  String? _t2tDenoisingStrengthSize;
  String? get t2tDenoisingStrengthSize => _$this._t2tDenoisingStrengthSize;
  set t2tDenoisingStrengthSize(String? t2tDenoisingStrengthSize) =>
      _$this._t2tDenoisingStrengthSize = t2tDenoisingStrengthSize;

  String? _t2tInpaintingFillSize;
  String? get t2tInpaintingFillSize => _$this._t2tInpaintingFillSize;
  set t2tInpaintingFillSize(String? t2tInpaintingFillSize) =>
      _$this._t2tInpaintingFillSize = t2tInpaintingFillSize;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  int? _completedAt;
  int? get completedAt => _$this._completedAt;
  set completedAt(int? completedAt) => _$this._completedAt = completedAt;

  _i2.GImageGenerationStatus? _status;
  _i2.GImageGenerationStatus? get status => _$this._status;
  set status(_i2.GImageGenerationStatus? status) => _$this._status = status;

  bool? _isDeleted;
  bool? get isDeleted => _$this._isDeleted;
  set isDeleted(bool? isDeleted) => _$this._isDeleted = isDeleted;

  bool? _isProtected;
  bool? get isProtected => _$this._isProtected;
  set isProtected(bool? isProtected) => _$this._isProtected = isProtected;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  _i2.GImageGenerationType? _generationType;
  _i2.GImageGenerationType? get generationType => _$this._generationType;
  set generationType(_i2.GImageGenerationType? generationType) =>
      _$this._generationType = generationType;

  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder?
      _model;
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder
      get model => _$this._model ??=
          new GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder();
  set model(
          GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder?
              model) =>
      _$this._model = model;

  String? _vae;
  String? get vae => _$this._vae;
  set vae(String? vae) => _$this._vae = vae;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _thumbnailToken;
  String? get thumbnailToken => _$this._thumbnailToken;
  set thumbnailToken(String? thumbnailToken) =>
      _$this._thumbnailToken = thumbnailToken;

  String? _nanoid;
  String? get nanoid => _$this._nanoid;
  set nanoid(String? nanoid) => _$this._nanoid = nanoid;

  int? _estimatedSeconds;
  int? get estimatedSeconds => _$this._estimatedSeconds;
  set estimatedSeconds(int? estimatedSeconds) =>
      _$this._estimatedSeconds = estimatedSeconds;

  String? _controlNetControlMode;
  String? get controlNetControlMode => _$this._controlNetControlMode;
  set controlNetControlMode(String? controlNetControlMode) =>
      _$this._controlNetControlMode = controlNetControlMode;

  bool? _controlNetEnabled;
  bool? get controlNetEnabled => _$this._controlNetEnabled;
  set controlNetEnabled(bool? controlNetEnabled) =>
      _$this._controlNetEnabled = controlNetEnabled;

  int? _controlNetGuidanceEnd;
  int? get controlNetGuidanceEnd => _$this._controlNetGuidanceEnd;
  set controlNetGuidanceEnd(int? controlNetGuidanceEnd) =>
      _$this._controlNetGuidanceEnd = controlNetGuidanceEnd;

  int? _controlNetGuidanceStart;
  int? get controlNetGuidanceStart => _$this._controlNetGuidanceStart;
  set controlNetGuidanceStart(int? controlNetGuidanceStart) =>
      _$this._controlNetGuidanceStart = controlNetGuidanceStart;

  bool? _controlNetPixelPerfect;
  bool? get controlNetPixelPerfect => _$this._controlNetPixelPerfect;
  set controlNetPixelPerfect(bool? controlNetPixelPerfect) =>
      _$this._controlNetPixelPerfect = controlNetPixelPerfect;

  int? _controlNetProcessorRes;
  int? get controlNetProcessorRes => _$this._controlNetProcessorRes;
  set controlNetProcessorRes(int? controlNetProcessorRes) =>
      _$this._controlNetProcessorRes = controlNetProcessorRes;

  String? _controlNetResizeMode;
  String? get controlNetResizeMode => _$this._controlNetResizeMode;
  set controlNetResizeMode(String? controlNetResizeMode) =>
      _$this._controlNetResizeMode = controlNetResizeMode;

  int? _controlNetThresholdA;
  int? get controlNetThresholdA => _$this._controlNetThresholdA;
  set controlNetThresholdA(int? controlNetThresholdA) =>
      _$this._controlNetThresholdA = controlNetThresholdA;

  int? _controlNetThresholdB;
  int? get controlNetThresholdB => _$this._controlNetThresholdB;
  set controlNetThresholdB(int? controlNetThresholdB) =>
      _$this._controlNetThresholdB = controlNetThresholdB;

  double? _controlNetWeight;
  double? get controlNetWeight => _$this._controlNetWeight;
  set controlNetWeight(double? controlNetWeight) =>
      _$this._controlNetWeight = controlNetWeight;

  String? _controlNetModule;
  String? get controlNetModule => _$this._controlNetModule;
  set controlNetModule(String? controlNetModule) =>
      _$this._controlNetModule = controlNetModule;

  String? _controlNetModel;
  String? get controlNetModel => _$this._controlNetModel;
  set controlNetModel(String? controlNetModel) =>
      _$this._controlNetModel = controlNetModel;

  bool? _controlNetSaveDetectedMap;
  bool? get controlNetSaveDetectedMap => _$this._controlNetSaveDetectedMap;
  set controlNetSaveDetectedMap(bool? controlNetSaveDetectedMap) =>
      _$this._controlNetSaveDetectedMap = controlNetSaveDetectedMap;

  String? _controlNetHrOption;
  String? get controlNetHrOption => _$this._controlNetHrOption;
  set controlNetHrOption(String? controlNetHrOption) =>
      _$this._controlNetHrOption = controlNetHrOption;

  double? _upscaleSize;
  double? get upscaleSize => _$this._upscaleSize;
  set upscaleSize(double? upscaleSize) => _$this._upscaleSize = upscaleSize;

  GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder() {
    GViewerImageGenerationTasksData_viewer_imageGenerationTasks
        ._initializeBuilder(this);
  }

  GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _prompt = $v.prompt;
      _negativePrompt = $v.negativePrompt;
      _seed = $v.seed;
      _steps = $v.steps;
      _scale = $v.scale;
      _sampler = $v.sampler;
      _clipSkip = $v.clipSkip;
      _sizeType = $v.sizeType;
      _t2tImageUrl = $v.t2tImageUrl;
      _t2tMaskImageUrl = $v.t2tMaskImageUrl;
      _t2tDenoisingStrengthSize = $v.t2tDenoisingStrengthSize;
      _t2tInpaintingFillSize = $v.t2tInpaintingFillSize;
      _rating = $v.rating;
      _completedAt = $v.completedAt;
      _status = $v.status;
      _isDeleted = $v.isDeleted;
      _isProtected = $v.isProtected;
      _count = $v.count;
      _generationType = $v.generationType;
      _model = $v.model.toBuilder();
      _vae = $v.vae;
      _token = $v.token;
      _thumbnailToken = $v.thumbnailToken;
      _nanoid = $v.nanoid;
      _estimatedSeconds = $v.estimatedSeconds;
      _controlNetControlMode = $v.controlNetControlMode;
      _controlNetEnabled = $v.controlNetEnabled;
      _controlNetGuidanceEnd = $v.controlNetGuidanceEnd;
      _controlNetGuidanceStart = $v.controlNetGuidanceStart;
      _controlNetPixelPerfect = $v.controlNetPixelPerfect;
      _controlNetProcessorRes = $v.controlNetProcessorRes;
      _controlNetResizeMode = $v.controlNetResizeMode;
      _controlNetThresholdA = $v.controlNetThresholdA;
      _controlNetThresholdB = $v.controlNetThresholdB;
      _controlNetWeight = $v.controlNetWeight;
      _controlNetModule = $v.controlNetModule;
      _controlNetModel = $v.controlNetModel;
      _controlNetSaveDetectedMap = $v.controlNetSaveDetectedMap;
      _controlNetHrOption = $v.controlNetHrOption;
      _upscaleSize = $v.upscaleSize;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GViewerImageGenerationTasksData_viewer_imageGenerationTasks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks;
  }

  @override
  void update(
      void Function(
              GViewerImageGenerationTasksData_viewer_imageGenerationTasksBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks build() =>
      _build();

  _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks _build() {
    _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks _$result;
    try {
      _$result = _$v ??
          new _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'id'),
              prompt: BuiltValueNullFieldError.checkNotNull(
                  prompt,
                  r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
                  'prompt'),
              negativePrompt: BuiltValueNullFieldError.checkNotNull(
                  negativePrompt,
                  r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
                  'negativePrompt'),
              seed: BuiltValueNullFieldError.checkNotNull(
                  seed, r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'seed'),
              steps: BuiltValueNullFieldError.checkNotNull(steps, r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'steps'),
              scale: BuiltValueNullFieldError.checkNotNull(scale, r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'scale'),
              sampler: BuiltValueNullFieldError.checkNotNull(sampler, r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'sampler'),
              clipSkip: BuiltValueNullFieldError.checkNotNull(clipSkip, r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'clipSkip'),
              sizeType: BuiltValueNullFieldError.checkNotNull(sizeType, r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'sizeType'),
              t2tImageUrl: t2tImageUrl,
              t2tMaskImageUrl: t2tMaskImageUrl,
              t2tDenoisingStrengthSize: t2tDenoisingStrengthSize,
              t2tInpaintingFillSize: t2tInpaintingFillSize,
              rating: rating,
              completedAt: completedAt,
              status: BuiltValueNullFieldError.checkNotNull(status, r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'status'),
              isDeleted: BuiltValueNullFieldError.checkNotNull(isDeleted, r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'isDeleted'),
              isProtected: isProtected,
              count: BuiltValueNullFieldError.checkNotNull(count, r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'count'),
              generationType: BuiltValueNullFieldError.checkNotNull(generationType, r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks', 'generationType'),
              model: model.build(),
              vae: vae,
              token: token,
              thumbnailToken: thumbnailToken,
              nanoid: nanoid,
              estimatedSeconds: estimatedSeconds,
              controlNetControlMode: controlNetControlMode,
              controlNetEnabled: controlNetEnabled,
              controlNetGuidanceEnd: controlNetGuidanceEnd,
              controlNetGuidanceStart: controlNetGuidanceStart,
              controlNetPixelPerfect: controlNetPixelPerfect,
              controlNetProcessorRes: controlNetProcessorRes,
              controlNetResizeMode: controlNetResizeMode,
              controlNetThresholdA: controlNetThresholdA,
              controlNetThresholdB: controlNetThresholdB,
              controlNetWeight: controlNetWeight,
              controlNetModule: controlNetModule,
              controlNetModel: controlNetModel,
              controlNetSaveDetectedMap: controlNetSaveDetectedMap,
              controlNetHrOption: controlNetHrOption,
              upscaleSize: upscaleSize);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'model';
        model.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model
    extends GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String type;

  factory _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model(
          [void Function(
                  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder)?
              updates]) =>
      (new GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder()
            ..update(updates))
          ._build();

  _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model',
        'id');
    BuiltValueNullFieldError.checkNotNull(
        name,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model',
        'name');
    BuiltValueNullFieldError.checkNotNull(
        type,
        r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model',
        'type');
  }

  @override
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model rebuild(
          void Function(
                  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder
      toBuilder() =>
          new GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('type', type))
        .toString();
  }
}

class GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder
    implements
        Builder<
            GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model,
            GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder> {
  _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder() {
    GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model
        ._initializeBuilder(this);
  }

  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model;
  }

  @override
  void update(
      void Function(
              GViewerImageGenerationTasksData_viewer_imageGenerationTasks_modelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model build() =>
      _build();

  _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model _build() {
    final _$result = _$v ??
        new _$GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model',
                'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type,
                r'GViewerImageGenerationTasksData_viewer_imageGenerationTasks_model',
                'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
