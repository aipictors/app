// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_image_generation_status.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerImageGenerationStatusData>
    _$gViewerImageGenerationStatusDataSerializer =
    new _$GViewerImageGenerationStatusDataSerializer();
Serializer<GViewerImageGenerationStatusData_imageGenerationEngineStatus>
    _$gViewerImageGenerationStatusDataImageGenerationEngineStatusSerializer =
    new _$GViewerImageGenerationStatusData_imageGenerationEngineStatusSerializer();
Serializer<GViewerImageGenerationStatusData_viewer>
    _$gViewerImageGenerationStatusDataViewerSerializer =
    new _$GViewerImageGenerationStatusData_viewerSerializer();

class _$GViewerImageGenerationStatusDataSerializer
    implements StructuredSerializer<GViewerImageGenerationStatusData> {
  @override
  final Iterable<Type> types = const [
    GViewerImageGenerationStatusData,
    _$GViewerImageGenerationStatusData
  ];
  @override
  final String wireName = 'GViewerImageGenerationStatusData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerImageGenerationStatusData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'imageGenerationEngineStatus',
      serializers.serialize(object.imageGenerationEngineStatus,
          specifiedType: const FullType(
              GViewerImageGenerationStatusData_imageGenerationEngineStatus)),
    ];
    Object? value;
    value = object.viewer;
    if (value != null) {
      result
        ..add('viewer')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GViewerImageGenerationStatusData_viewer)));
    }
    return result;
  }

  @override
  GViewerImageGenerationStatusData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerImageGenerationStatusDataBuilder();

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
        case 'imageGenerationEngineStatus':
          result.imageGenerationEngineStatus.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      GViewerImageGenerationStatusData_imageGenerationEngineStatus))!
              as GViewerImageGenerationStatusData_imageGenerationEngineStatus);
          break;
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GViewerImageGenerationStatusData_viewer))!
              as GViewerImageGenerationStatusData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerImageGenerationStatusData_imageGenerationEngineStatusSerializer
    implements
        StructuredSerializer<
            GViewerImageGenerationStatusData_imageGenerationEngineStatus> {
  @override
  final Iterable<Type> types = const [
    GViewerImageGenerationStatusData_imageGenerationEngineStatus,
    _$GViewerImageGenerationStatusData_imageGenerationEngineStatus
  ];
  @override
  final String wireName =
      'GViewerImageGenerationStatusData_imageGenerationEngineStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GViewerImageGenerationStatusData_imageGenerationEngineStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'normalTasksCount',
      serializers.serialize(object.normalTasksCount,
          specifiedType: const FullType(int)),
      'standardTasksCount',
      serializers.serialize(object.standardTasksCount,
          specifiedType: const FullType(int)),
      'normalPredictionGenerationWait',
      serializers.serialize(object.normalPredictionGenerationWait,
          specifiedType: const FullType(int)),
      'standardPredictionGenerationWait',
      serializers.serialize(object.standardPredictionGenerationWait,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GViewerImageGenerationStatusData_imageGenerationEngineStatus deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder();

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
        case 'normalTasksCount':
          result.normalTasksCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'standardTasksCount':
          result.standardTasksCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'normalPredictionGenerationWait':
          result.normalPredictionGenerationWait = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'standardPredictionGenerationWait':
          result.standardPredictionGenerationWait = serializers
              .deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerImageGenerationStatusData_viewerSerializer
    implements StructuredSerializer<GViewerImageGenerationStatusData_viewer> {
  @override
  final Iterable<Type> types = const [
    GViewerImageGenerationStatusData_viewer,
    _$GViewerImageGenerationStatusData_viewer
  ];
  @override
  final String wireName = 'GViewerImageGenerationStatusData_viewer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GViewerImageGenerationStatusData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'remainingImageGenerationTasksCount',
      serializers.serialize(object.remainingImageGenerationTasksCount,
          specifiedType: const FullType(int)),
      'inProgressImageGenerationTasksCount',
      serializers.serialize(object.inProgressImageGenerationTasksCount,
          specifiedType: const FullType(int)),
      'inProgressImageGenerationTasksCost',
      serializers.serialize(object.inProgressImageGenerationTasksCost,
          specifiedType: const FullType(int)),
      'inProgressImageGenerationReservedTasksCount',
      serializers.serialize(object.inProgressImageGenerationReservedTasksCount,
          specifiedType: const FullType(int)),
      'remainingImageGenerationTasksTotalCount',
      serializers.serialize(object.remainingImageGenerationTasksTotalCount,
          specifiedType: const FullType(int)),
      'availableImageGenerationMaxTasksCount',
      serializers.serialize(object.availableImageGenerationMaxTasksCount,
          specifiedType: const FullType(int)),
      'imageGenerationWaitCount',
      serializers.serialize(object.imageGenerationWaitCount,
          specifiedType: const FullType(int)),
      'availableImageGenerationLoraModelsCount',
      serializers.serialize(object.availableImageGenerationLoraModelsCount,
          specifiedType: const FullType(int)),
      'availableConsecutiveImageGenerationsCount',
      serializers.serialize(object.availableConsecutiveImageGenerationsCount,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GViewerImageGenerationStatusData_viewer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GViewerImageGenerationStatusData_viewerBuilder();

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
        case 'remainingImageGenerationTasksCount':
          result.remainingImageGenerationTasksCount = serializers
              .deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'inProgressImageGenerationTasksCount':
          result.inProgressImageGenerationTasksCount = serializers
              .deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'inProgressImageGenerationTasksCost':
          result.inProgressImageGenerationTasksCost = serializers
              .deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'inProgressImageGenerationReservedTasksCount':
          result.inProgressImageGenerationReservedTasksCount = serializers
              .deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'remainingImageGenerationTasksTotalCount':
          result.remainingImageGenerationTasksTotalCount = serializers
              .deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'availableImageGenerationMaxTasksCount':
          result.availableImageGenerationMaxTasksCount = serializers
              .deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'imageGenerationWaitCount':
          result.imageGenerationWaitCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'availableImageGenerationLoraModelsCount':
          result.availableImageGenerationLoraModelsCount = serializers
              .deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'availableConsecutiveImageGenerationsCount':
          result.availableConsecutiveImageGenerationsCount = serializers
              .deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerImageGenerationStatusData
    extends GViewerImageGenerationStatusData {
  @override
  final String G__typename;
  @override
  final GViewerImageGenerationStatusData_imageGenerationEngineStatus
      imageGenerationEngineStatus;
  @override
  final GViewerImageGenerationStatusData_viewer? viewer;

  factory _$GViewerImageGenerationStatusData(
          [void Function(GViewerImageGenerationStatusDataBuilder)? updates]) =>
      (new GViewerImageGenerationStatusDataBuilder()..update(updates))._build();

  _$GViewerImageGenerationStatusData._(
      {required this.G__typename,
      required this.imageGenerationEngineStatus,
      this.viewer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerImageGenerationStatusData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(imageGenerationEngineStatus,
        r'GViewerImageGenerationStatusData', 'imageGenerationEngineStatus');
  }

  @override
  GViewerImageGenerationStatusData rebuild(
          void Function(GViewerImageGenerationStatusDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerImageGenerationStatusDataBuilder toBuilder() =>
      new GViewerImageGenerationStatusDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerImageGenerationStatusData &&
        G__typename == other.G__typename &&
        imageGenerationEngineStatus == other.imageGenerationEngineStatus &&
        viewer == other.viewer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, imageGenerationEngineStatus.hashCode);
    _$hash = $jc(_$hash, viewer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GViewerImageGenerationStatusData')
          ..add('G__typename', G__typename)
          ..add('imageGenerationEngineStatus', imageGenerationEngineStatus)
          ..add('viewer', viewer))
        .toString();
  }
}

class GViewerImageGenerationStatusDataBuilder
    implements
        Builder<GViewerImageGenerationStatusData,
            GViewerImageGenerationStatusDataBuilder> {
  _$GViewerImageGenerationStatusData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder?
      _imageGenerationEngineStatus;
  GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder
      get imageGenerationEngineStatus => _$this._imageGenerationEngineStatus ??=
          new GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder();
  set imageGenerationEngineStatus(
          GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder?
              imageGenerationEngineStatus) =>
      _$this._imageGenerationEngineStatus = imageGenerationEngineStatus;

  GViewerImageGenerationStatusData_viewerBuilder? _viewer;
  GViewerImageGenerationStatusData_viewerBuilder get viewer =>
      _$this._viewer ??= new GViewerImageGenerationStatusData_viewerBuilder();
  set viewer(GViewerImageGenerationStatusData_viewerBuilder? viewer) =>
      _$this._viewer = viewer;

  GViewerImageGenerationStatusDataBuilder() {
    GViewerImageGenerationStatusData._initializeBuilder(this);
  }

  GViewerImageGenerationStatusDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _imageGenerationEngineStatus = $v.imageGenerationEngineStatus.toBuilder();
      _viewer = $v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerImageGenerationStatusData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerImageGenerationStatusData;
  }

  @override
  void update(void Function(GViewerImageGenerationStatusDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerImageGenerationStatusData build() => _build();

  _$GViewerImageGenerationStatusData _build() {
    _$GViewerImageGenerationStatusData _$result;
    try {
      _$result = _$v ??
          new _$GViewerImageGenerationStatusData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GViewerImageGenerationStatusData', 'G__typename'),
              imageGenerationEngineStatus: imageGenerationEngineStatus.build(),
              viewer: _viewer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'imageGenerationEngineStatus';
        imageGenerationEngineStatus.build();
        _$failedField = 'viewer';
        _viewer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GViewerImageGenerationStatusData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GViewerImageGenerationStatusData_imageGenerationEngineStatus
    extends GViewerImageGenerationStatusData_imageGenerationEngineStatus {
  @override
  final String G__typename;
  @override
  final int normalTasksCount;
  @override
  final int standardTasksCount;
  @override
  final int normalPredictionGenerationWait;
  @override
  final int standardPredictionGenerationWait;

  factory _$GViewerImageGenerationStatusData_imageGenerationEngineStatus(
          [void Function(
                  GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder)?
              updates]) =>
      (new GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder()
            ..update(updates))
          ._build();

  _$GViewerImageGenerationStatusData_imageGenerationEngineStatus._(
      {required this.G__typename,
      required this.normalTasksCount,
      required this.standardTasksCount,
      required this.normalPredictionGenerationWait,
      required this.standardPredictionGenerationWait})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GViewerImageGenerationStatusData_imageGenerationEngineStatus',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        normalTasksCount,
        r'GViewerImageGenerationStatusData_imageGenerationEngineStatus',
        'normalTasksCount');
    BuiltValueNullFieldError.checkNotNull(
        standardTasksCount,
        r'GViewerImageGenerationStatusData_imageGenerationEngineStatus',
        'standardTasksCount');
    BuiltValueNullFieldError.checkNotNull(
        normalPredictionGenerationWait,
        r'GViewerImageGenerationStatusData_imageGenerationEngineStatus',
        'normalPredictionGenerationWait');
    BuiltValueNullFieldError.checkNotNull(
        standardPredictionGenerationWait,
        r'GViewerImageGenerationStatusData_imageGenerationEngineStatus',
        'standardPredictionGenerationWait');
  }

  @override
  GViewerImageGenerationStatusData_imageGenerationEngineStatus rebuild(
          void Function(
                  GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder
      toBuilder() =>
          new GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GViewerImageGenerationStatusData_imageGenerationEngineStatus &&
        G__typename == other.G__typename &&
        normalTasksCount == other.normalTasksCount &&
        standardTasksCount == other.standardTasksCount &&
        normalPredictionGenerationWait ==
            other.normalPredictionGenerationWait &&
        standardPredictionGenerationWait ==
            other.standardPredictionGenerationWait;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, normalTasksCount.hashCode);
    _$hash = $jc(_$hash, standardTasksCount.hashCode);
    _$hash = $jc(_$hash, normalPredictionGenerationWait.hashCode);
    _$hash = $jc(_$hash, standardPredictionGenerationWait.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerImageGenerationStatusData_imageGenerationEngineStatus')
          ..add('G__typename', G__typename)
          ..add('normalTasksCount', normalTasksCount)
          ..add('standardTasksCount', standardTasksCount)
          ..add(
              'normalPredictionGenerationWait', normalPredictionGenerationWait)
          ..add('standardPredictionGenerationWait',
              standardPredictionGenerationWait))
        .toString();
  }
}

class GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder
    implements
        Builder<GViewerImageGenerationStatusData_imageGenerationEngineStatus,
            GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder> {
  _$GViewerImageGenerationStatusData_imageGenerationEngineStatus? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _normalTasksCount;
  int? get normalTasksCount => _$this._normalTasksCount;
  set normalTasksCount(int? normalTasksCount) =>
      _$this._normalTasksCount = normalTasksCount;

  int? _standardTasksCount;
  int? get standardTasksCount => _$this._standardTasksCount;
  set standardTasksCount(int? standardTasksCount) =>
      _$this._standardTasksCount = standardTasksCount;

  int? _normalPredictionGenerationWait;
  int? get normalPredictionGenerationWait =>
      _$this._normalPredictionGenerationWait;
  set normalPredictionGenerationWait(int? normalPredictionGenerationWait) =>
      _$this._normalPredictionGenerationWait = normalPredictionGenerationWait;

  int? _standardPredictionGenerationWait;
  int? get standardPredictionGenerationWait =>
      _$this._standardPredictionGenerationWait;
  set standardPredictionGenerationWait(int? standardPredictionGenerationWait) =>
      _$this._standardPredictionGenerationWait =
          standardPredictionGenerationWait;

  GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder() {
    GViewerImageGenerationStatusData_imageGenerationEngineStatus
        ._initializeBuilder(this);
  }

  GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _normalTasksCount = $v.normalTasksCount;
      _standardTasksCount = $v.standardTasksCount;
      _normalPredictionGenerationWait = $v.normalPredictionGenerationWait;
      _standardPredictionGenerationWait = $v.standardPredictionGenerationWait;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GViewerImageGenerationStatusData_imageGenerationEngineStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v =
        other as _$GViewerImageGenerationStatusData_imageGenerationEngineStatus;
  }

  @override
  void update(
      void Function(
              GViewerImageGenerationStatusData_imageGenerationEngineStatusBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerImageGenerationStatusData_imageGenerationEngineStatus build() =>
      _build();

  _$GViewerImageGenerationStatusData_imageGenerationEngineStatus _build() {
    final _$result = _$v ??
        new _$GViewerImageGenerationStatusData_imageGenerationEngineStatus._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GViewerImageGenerationStatusData_imageGenerationEngineStatus', 'G__typename'),
            normalTasksCount: BuiltValueNullFieldError.checkNotNull(
                normalTasksCount, r'GViewerImageGenerationStatusData_imageGenerationEngineStatus', 'normalTasksCount'),
            standardTasksCount: BuiltValueNullFieldError.checkNotNull(
                standardTasksCount,
                r'GViewerImageGenerationStatusData_imageGenerationEngineStatus',
                'standardTasksCount'),
            normalPredictionGenerationWait: BuiltValueNullFieldError.checkNotNull(
                normalPredictionGenerationWait,
                r'GViewerImageGenerationStatusData_imageGenerationEngineStatus',
                'normalPredictionGenerationWait'),
            standardPredictionGenerationWait: BuiltValueNullFieldError.checkNotNull(
                standardPredictionGenerationWait,
                r'GViewerImageGenerationStatusData_imageGenerationEngineStatus',
                'standardPredictionGenerationWait'));
    replace(_$result);
    return _$result;
  }
}

class _$GViewerImageGenerationStatusData_viewer
    extends GViewerImageGenerationStatusData_viewer {
  @override
  final String G__typename;
  @override
  final int remainingImageGenerationTasksCount;
  @override
  final int inProgressImageGenerationTasksCount;
  @override
  final int inProgressImageGenerationTasksCost;
  @override
  final int inProgressImageGenerationReservedTasksCount;
  @override
  final int remainingImageGenerationTasksTotalCount;
  @override
  final int availableImageGenerationMaxTasksCount;
  @override
  final int imageGenerationWaitCount;
  @override
  final int availableImageGenerationLoraModelsCount;
  @override
  final int availableConsecutiveImageGenerationsCount;

  factory _$GViewerImageGenerationStatusData_viewer(
          [void Function(GViewerImageGenerationStatusData_viewerBuilder)?
              updates]) =>
      (new GViewerImageGenerationStatusData_viewerBuilder()..update(updates))
          ._build();

  _$GViewerImageGenerationStatusData_viewer._(
      {required this.G__typename,
      required this.remainingImageGenerationTasksCount,
      required this.inProgressImageGenerationTasksCount,
      required this.inProgressImageGenerationTasksCost,
      required this.inProgressImageGenerationReservedTasksCount,
      required this.remainingImageGenerationTasksTotalCount,
      required this.availableImageGenerationMaxTasksCount,
      required this.imageGenerationWaitCount,
      required this.availableImageGenerationLoraModelsCount,
      required this.availableConsecutiveImageGenerationsCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GViewerImageGenerationStatusData_viewer', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        remainingImageGenerationTasksCount,
        r'GViewerImageGenerationStatusData_viewer',
        'remainingImageGenerationTasksCount');
    BuiltValueNullFieldError.checkNotNull(
        inProgressImageGenerationTasksCount,
        r'GViewerImageGenerationStatusData_viewer',
        'inProgressImageGenerationTasksCount');
    BuiltValueNullFieldError.checkNotNull(
        inProgressImageGenerationTasksCost,
        r'GViewerImageGenerationStatusData_viewer',
        'inProgressImageGenerationTasksCost');
    BuiltValueNullFieldError.checkNotNull(
        inProgressImageGenerationReservedTasksCount,
        r'GViewerImageGenerationStatusData_viewer',
        'inProgressImageGenerationReservedTasksCount');
    BuiltValueNullFieldError.checkNotNull(
        remainingImageGenerationTasksTotalCount,
        r'GViewerImageGenerationStatusData_viewer',
        'remainingImageGenerationTasksTotalCount');
    BuiltValueNullFieldError.checkNotNull(
        availableImageGenerationMaxTasksCount,
        r'GViewerImageGenerationStatusData_viewer',
        'availableImageGenerationMaxTasksCount');
    BuiltValueNullFieldError.checkNotNull(imageGenerationWaitCount,
        r'GViewerImageGenerationStatusData_viewer', 'imageGenerationWaitCount');
    BuiltValueNullFieldError.checkNotNull(
        availableImageGenerationLoraModelsCount,
        r'GViewerImageGenerationStatusData_viewer',
        'availableImageGenerationLoraModelsCount');
    BuiltValueNullFieldError.checkNotNull(
        availableConsecutiveImageGenerationsCount,
        r'GViewerImageGenerationStatusData_viewer',
        'availableConsecutiveImageGenerationsCount');
  }

  @override
  GViewerImageGenerationStatusData_viewer rebuild(
          void Function(GViewerImageGenerationStatusData_viewerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerImageGenerationStatusData_viewerBuilder toBuilder() =>
      new GViewerImageGenerationStatusData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerImageGenerationStatusData_viewer &&
        G__typename == other.G__typename &&
        remainingImageGenerationTasksCount ==
            other.remainingImageGenerationTasksCount &&
        inProgressImageGenerationTasksCount ==
            other.inProgressImageGenerationTasksCount &&
        inProgressImageGenerationTasksCost ==
            other.inProgressImageGenerationTasksCost &&
        inProgressImageGenerationReservedTasksCount ==
            other.inProgressImageGenerationReservedTasksCount &&
        remainingImageGenerationTasksTotalCount ==
            other.remainingImageGenerationTasksTotalCount &&
        availableImageGenerationMaxTasksCount ==
            other.availableImageGenerationMaxTasksCount &&
        imageGenerationWaitCount == other.imageGenerationWaitCount &&
        availableImageGenerationLoraModelsCount ==
            other.availableImageGenerationLoraModelsCount &&
        availableConsecutiveImageGenerationsCount ==
            other.availableConsecutiveImageGenerationsCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, remainingImageGenerationTasksCount.hashCode);
    _$hash = $jc(_$hash, inProgressImageGenerationTasksCount.hashCode);
    _$hash = $jc(_$hash, inProgressImageGenerationTasksCost.hashCode);
    _$hash = $jc(_$hash, inProgressImageGenerationReservedTasksCount.hashCode);
    _$hash = $jc(_$hash, remainingImageGenerationTasksTotalCount.hashCode);
    _$hash = $jc(_$hash, availableImageGenerationMaxTasksCount.hashCode);
    _$hash = $jc(_$hash, imageGenerationWaitCount.hashCode);
    _$hash = $jc(_$hash, availableImageGenerationLoraModelsCount.hashCode);
    _$hash = $jc(_$hash, availableConsecutiveImageGenerationsCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GViewerImageGenerationStatusData_viewer')
          ..add('G__typename', G__typename)
          ..add('remainingImageGenerationTasksCount',
              remainingImageGenerationTasksCount)
          ..add('inProgressImageGenerationTasksCount',
              inProgressImageGenerationTasksCount)
          ..add('inProgressImageGenerationTasksCost',
              inProgressImageGenerationTasksCost)
          ..add('inProgressImageGenerationReservedTasksCount',
              inProgressImageGenerationReservedTasksCount)
          ..add('remainingImageGenerationTasksTotalCount',
              remainingImageGenerationTasksTotalCount)
          ..add('availableImageGenerationMaxTasksCount',
              availableImageGenerationMaxTasksCount)
          ..add('imageGenerationWaitCount', imageGenerationWaitCount)
          ..add('availableImageGenerationLoraModelsCount',
              availableImageGenerationLoraModelsCount)
          ..add('availableConsecutiveImageGenerationsCount',
              availableConsecutiveImageGenerationsCount))
        .toString();
  }
}

class GViewerImageGenerationStatusData_viewerBuilder
    implements
        Builder<GViewerImageGenerationStatusData_viewer,
            GViewerImageGenerationStatusData_viewerBuilder> {
  _$GViewerImageGenerationStatusData_viewer? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _remainingImageGenerationTasksCount;
  int? get remainingImageGenerationTasksCount =>
      _$this._remainingImageGenerationTasksCount;
  set remainingImageGenerationTasksCount(
          int? remainingImageGenerationTasksCount) =>
      _$this._remainingImageGenerationTasksCount =
          remainingImageGenerationTasksCount;

  int? _inProgressImageGenerationTasksCount;
  int? get inProgressImageGenerationTasksCount =>
      _$this._inProgressImageGenerationTasksCount;
  set inProgressImageGenerationTasksCount(
          int? inProgressImageGenerationTasksCount) =>
      _$this._inProgressImageGenerationTasksCount =
          inProgressImageGenerationTasksCount;

  int? _inProgressImageGenerationTasksCost;
  int? get inProgressImageGenerationTasksCost =>
      _$this._inProgressImageGenerationTasksCost;
  set inProgressImageGenerationTasksCost(
          int? inProgressImageGenerationTasksCost) =>
      _$this._inProgressImageGenerationTasksCost =
          inProgressImageGenerationTasksCost;

  int? _inProgressImageGenerationReservedTasksCount;
  int? get inProgressImageGenerationReservedTasksCount =>
      _$this._inProgressImageGenerationReservedTasksCount;
  set inProgressImageGenerationReservedTasksCount(
          int? inProgressImageGenerationReservedTasksCount) =>
      _$this._inProgressImageGenerationReservedTasksCount =
          inProgressImageGenerationReservedTasksCount;

  int? _remainingImageGenerationTasksTotalCount;
  int? get remainingImageGenerationTasksTotalCount =>
      _$this._remainingImageGenerationTasksTotalCount;
  set remainingImageGenerationTasksTotalCount(
          int? remainingImageGenerationTasksTotalCount) =>
      _$this._remainingImageGenerationTasksTotalCount =
          remainingImageGenerationTasksTotalCount;

  int? _availableImageGenerationMaxTasksCount;
  int? get availableImageGenerationMaxTasksCount =>
      _$this._availableImageGenerationMaxTasksCount;
  set availableImageGenerationMaxTasksCount(
          int? availableImageGenerationMaxTasksCount) =>
      _$this._availableImageGenerationMaxTasksCount =
          availableImageGenerationMaxTasksCount;

  int? _imageGenerationWaitCount;
  int? get imageGenerationWaitCount => _$this._imageGenerationWaitCount;
  set imageGenerationWaitCount(int? imageGenerationWaitCount) =>
      _$this._imageGenerationWaitCount = imageGenerationWaitCount;

  int? _availableImageGenerationLoraModelsCount;
  int? get availableImageGenerationLoraModelsCount =>
      _$this._availableImageGenerationLoraModelsCount;
  set availableImageGenerationLoraModelsCount(
          int? availableImageGenerationLoraModelsCount) =>
      _$this._availableImageGenerationLoraModelsCount =
          availableImageGenerationLoraModelsCount;

  int? _availableConsecutiveImageGenerationsCount;
  int? get availableConsecutiveImageGenerationsCount =>
      _$this._availableConsecutiveImageGenerationsCount;
  set availableConsecutiveImageGenerationsCount(
          int? availableConsecutiveImageGenerationsCount) =>
      _$this._availableConsecutiveImageGenerationsCount =
          availableConsecutiveImageGenerationsCount;

  GViewerImageGenerationStatusData_viewerBuilder() {
    GViewerImageGenerationStatusData_viewer._initializeBuilder(this);
  }

  GViewerImageGenerationStatusData_viewerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _remainingImageGenerationTasksCount =
          $v.remainingImageGenerationTasksCount;
      _inProgressImageGenerationTasksCount =
          $v.inProgressImageGenerationTasksCount;
      _inProgressImageGenerationTasksCost =
          $v.inProgressImageGenerationTasksCost;
      _inProgressImageGenerationReservedTasksCount =
          $v.inProgressImageGenerationReservedTasksCount;
      _remainingImageGenerationTasksTotalCount =
          $v.remainingImageGenerationTasksTotalCount;
      _availableImageGenerationMaxTasksCount =
          $v.availableImageGenerationMaxTasksCount;
      _imageGenerationWaitCount = $v.imageGenerationWaitCount;
      _availableImageGenerationLoraModelsCount =
          $v.availableImageGenerationLoraModelsCount;
      _availableConsecutiveImageGenerationsCount =
          $v.availableConsecutiveImageGenerationsCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GViewerImageGenerationStatusData_viewer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerImageGenerationStatusData_viewer;
  }

  @override
  void update(
      void Function(GViewerImageGenerationStatusData_viewerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GViewerImageGenerationStatusData_viewer build() => _build();

  _$GViewerImageGenerationStatusData_viewer _build() {
    final _$result = _$v ??
        new _$GViewerImageGenerationStatusData_viewer._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GViewerImageGenerationStatusData_viewer', 'G__typename'),
            remainingImageGenerationTasksCount: BuiltValueNullFieldError.checkNotNull(
                remainingImageGenerationTasksCount, r'GViewerImageGenerationStatusData_viewer', 'remainingImageGenerationTasksCount'),
            inProgressImageGenerationTasksCount: BuiltValueNullFieldError.checkNotNull(
                inProgressImageGenerationTasksCount,
                r'GViewerImageGenerationStatusData_viewer',
                'inProgressImageGenerationTasksCount'),
            inProgressImageGenerationTasksCost: BuiltValueNullFieldError.checkNotNull(
                inProgressImageGenerationTasksCost,
                r'GViewerImageGenerationStatusData_viewer',
                'inProgressImageGenerationTasksCost'),
            inProgressImageGenerationReservedTasksCount: BuiltValueNullFieldError.checkNotNull(
                inProgressImageGenerationReservedTasksCount,
                r'GViewerImageGenerationStatusData_viewer',
                'inProgressImageGenerationReservedTasksCount'),
            remainingImageGenerationTasksTotalCount: BuiltValueNullFieldError.checkNotNull(remainingImageGenerationTasksTotalCount, r'GViewerImageGenerationStatusData_viewer', 'remainingImageGenerationTasksTotalCount'),
            availableImageGenerationMaxTasksCount: BuiltValueNullFieldError.checkNotNull(availableImageGenerationMaxTasksCount, r'GViewerImageGenerationStatusData_viewer', 'availableImageGenerationMaxTasksCount'),
            imageGenerationWaitCount: BuiltValueNullFieldError.checkNotNull(imageGenerationWaitCount, r'GViewerImageGenerationStatusData_viewer', 'imageGenerationWaitCount'),
            availableImageGenerationLoraModelsCount: BuiltValueNullFieldError.checkNotNull(availableImageGenerationLoraModelsCount, r'GViewerImageGenerationStatusData_viewer', 'availableImageGenerationLoraModelsCount'),
            availableConsecutiveImageGenerationsCount: BuiltValueNullFieldError.checkNotNull(availableConsecutiveImageGenerationsCount, r'GViewerImageGenerationStatusData_viewer', 'availableConsecutiveImageGenerationsCount'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
