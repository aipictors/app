// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_comments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkCommentsData> _$gWorkCommentsDataSerializer =
    new _$GWorkCommentsDataSerializer();
Serializer<GWorkCommentsData_work> _$gWorkCommentsDataWorkSerializer =
    new _$GWorkCommentsData_workSerializer();
Serializer<GWorkCommentsData_work_comments>
    _$gWorkCommentsDataWorkCommentsSerializer =
    new _$GWorkCommentsData_work_commentsSerializer();
Serializer<GWorkCommentsData_work_comments_user>
    _$gWorkCommentsDataWorkCommentsUserSerializer =
    new _$GWorkCommentsData_work_comments_userSerializer();
Serializer<GWorkCommentsData_work_comments_user_iconImage>
    _$gWorkCommentsDataWorkCommentsUserIconImageSerializer =
    new _$GWorkCommentsData_work_comments_user_iconImageSerializer();
Serializer<GWorkCommentsData_work_comments_sticker>
    _$gWorkCommentsDataWorkCommentsStickerSerializer =
    new _$GWorkCommentsData_work_comments_stickerSerializer();
Serializer<GWorkCommentsData_work_comments_sticker_image>
    _$gWorkCommentsDataWorkCommentsStickerImageSerializer =
    new _$GWorkCommentsData_work_comments_sticker_imageSerializer();
Serializer<GWorkCommentsData_work_comments_responses>
    _$gWorkCommentsDataWorkCommentsResponsesSerializer =
    new _$GWorkCommentsData_work_comments_responsesSerializer();
Serializer<GWorkCommentsData_work_comments_responses_user>
    _$gWorkCommentsDataWorkCommentsResponsesUserSerializer =
    new _$GWorkCommentsData_work_comments_responses_userSerializer();
Serializer<GWorkCommentsData_work_comments_responses_user_iconImage>
    _$gWorkCommentsDataWorkCommentsResponsesUserIconImageSerializer =
    new _$GWorkCommentsData_work_comments_responses_user_iconImageSerializer();
Serializer<GWorkCommentsData_work_comments_responses_sticker>
    _$gWorkCommentsDataWorkCommentsResponsesStickerSerializer =
    new _$GWorkCommentsData_work_comments_responses_stickerSerializer();
Serializer<GWorkCommentsData_work_comments_responses_sticker_image>
    _$gWorkCommentsDataWorkCommentsResponsesStickerImageSerializer =
    new _$GWorkCommentsData_work_comments_responses_sticker_imageSerializer();

class _$GWorkCommentsDataSerializer
    implements StructuredSerializer<GWorkCommentsData> {
  @override
  final Iterable<Type> types = const [GWorkCommentsData, _$GWorkCommentsData];
  @override
  final String wireName = 'GWorkCommentsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GWorkCommentsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.work;
    if (value != null) {
      result
        ..add('work')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GWorkCommentsData_work)));
    }
    return result;
  }

  @override
  GWorkCommentsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentsDataBuilder();

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
        case 'work':
          result.work.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GWorkCommentsData_work))!
              as GWorkCommentsData_work);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData_workSerializer
    implements StructuredSerializer<GWorkCommentsData_work> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentsData_work,
    _$GWorkCommentsData_work
  ];
  @override
  final String wireName = 'GWorkCommentsData_work';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentsData_work object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'comments',
      serializers.serialize(object.comments,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GWorkCommentsData_work_comments)])),
    ];

    return result;
  }

  @override
  GWorkCommentsData_work deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentsData_workBuilder();

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
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GWorkCommentsData_work_comments)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData_work_commentsSerializer
    implements StructuredSerializer<GWorkCommentsData_work_comments> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentsData_work_comments,
    _$GWorkCommentsData_work_comments
  ];
  @override
  final String wireName = 'GWorkCommentsData_work_comments';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentsData_work_comments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'responses',
      serializers.serialize(object.responses,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GWorkCommentsData_work_comments_responses)
          ])),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GWorkCommentsData_work_comments_user)));
    }
    value = object.sticker;
    if (value != null) {
      result
        ..add('sticker')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GWorkCommentsData_work_comments_sticker)));
    }
    return result;
  }

  @override
  GWorkCommentsData_work_comments deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentsData_work_commentsBuilder();

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
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GWorkCommentsData_work_comments_user))!
              as GWorkCommentsData_work_comments_user);
          break;
        case 'sticker':
          result.sticker.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GWorkCommentsData_work_comments_sticker))!
              as GWorkCommentsData_work_comments_sticker);
          break;
        case 'responses':
          result.responses.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GWorkCommentsData_work_comments_responses)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData_work_comments_userSerializer
    implements StructuredSerializer<GWorkCommentsData_work_comments_user> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentsData_work_comments_user,
    _$GWorkCommentsData_work_comments_user
  ];
  @override
  final String wireName = 'GWorkCommentsData_work_comments_user';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentsData_work_comments_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GWorkCommentsData_work_comments_user_iconImage)));
    }
    return result;
  }

  @override
  GWorkCommentsData_work_comments_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentsData_work_comments_userBuilder();

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
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconImage':
          result.iconImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentsData_work_comments_user_iconImage))!
              as GWorkCommentsData_work_comments_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData_work_comments_user_iconImageSerializer
    implements
        StructuredSerializer<GWorkCommentsData_work_comments_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentsData_work_comments_user_iconImage,
    _$GWorkCommentsData_work_comments_user_iconImage
  ];
  @override
  final String wireName = 'GWorkCommentsData_work_comments_user_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentsData_work_comments_user_iconImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'downloadURL',
      serializers.serialize(object.downloadURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GWorkCommentsData_work_comments_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentsData_work_comments_user_iconImageBuilder();

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
        case 'downloadURL':
          result.downloadURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData_work_comments_stickerSerializer
    implements StructuredSerializer<GWorkCommentsData_work_comments_sticker> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentsData_work_comments_sticker,
    _$GWorkCommentsData_work_comments_sticker
  ];
  @override
  final String wireName = 'GWorkCommentsData_work_comments_sticker';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentsData_work_comments_sticker object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GWorkCommentsData_work_comments_sticker_image)));
    }
    return result;
  }

  @override
  GWorkCommentsData_work_comments_sticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentsData_work_comments_stickerBuilder();

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
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentsData_work_comments_sticker_image))!
              as GWorkCommentsData_work_comments_sticker_image);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData_work_comments_sticker_imageSerializer
    implements
        StructuredSerializer<GWorkCommentsData_work_comments_sticker_image> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentsData_work_comments_sticker_image,
    _$GWorkCommentsData_work_comments_sticker_image
  ];
  @override
  final String wireName = 'GWorkCommentsData_work_comments_sticker_image';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentsData_work_comments_sticker_image object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'downloadURL',
      serializers.serialize(object.downloadURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GWorkCommentsData_work_comments_sticker_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentsData_work_comments_sticker_imageBuilder();

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
        case 'downloadURL':
          result.downloadURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData_work_comments_responsesSerializer
    implements StructuredSerializer<GWorkCommentsData_work_comments_responses> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentsData_work_comments_responses,
    _$GWorkCommentsData_work_comments_responses
  ];
  @override
  final String wireName = 'GWorkCommentsData_work_comments_responses';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentsData_work_comments_responses object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(int)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GWorkCommentsData_work_comments_responses_user)));
    }
    value = object.sticker;
    if (value != null) {
      result
        ..add('sticker')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GWorkCommentsData_work_comments_responses_sticker)));
    }
    return result;
  }

  @override
  GWorkCommentsData_work_comments_responses deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentsData_work_comments_responsesBuilder();

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
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentsData_work_comments_responses_user))!
              as GWorkCommentsData_work_comments_responses_user);
          break;
        case 'sticker':
          result.sticker.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentsData_work_comments_responses_sticker))!
              as GWorkCommentsData_work_comments_responses_sticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData_work_comments_responses_userSerializer
    implements
        StructuredSerializer<GWorkCommentsData_work_comments_responses_user> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentsData_work_comments_responses_user,
    _$GWorkCommentsData_work_comments_responses_user
  ];
  @override
  final String wireName = 'GWorkCommentsData_work_comments_responses_user';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentsData_work_comments_responses_user object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.iconImage;
    if (value != null) {
      result
        ..add('iconImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GWorkCommentsData_work_comments_responses_user_iconImage)));
    }
    return result;
  }

  @override
  GWorkCommentsData_work_comments_responses_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentsData_work_comments_responses_userBuilder();

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
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'iconImage':
          result.iconImage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentsData_work_comments_responses_user_iconImage))!
              as GWorkCommentsData_work_comments_responses_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData_work_comments_responses_user_iconImageSerializer
    implements
        StructuredSerializer<
            GWorkCommentsData_work_comments_responses_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentsData_work_comments_responses_user_iconImage,
    _$GWorkCommentsData_work_comments_responses_user_iconImage
  ];
  @override
  final String wireName =
      'GWorkCommentsData_work_comments_responses_user_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentsData_work_comments_responses_user_iconImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'downloadURL',
      serializers.serialize(object.downloadURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GWorkCommentsData_work_comments_responses_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentsData_work_comments_responses_user_iconImageBuilder();

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
        case 'downloadURL':
          result.downloadURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData_work_comments_responses_stickerSerializer
    implements
        StructuredSerializer<
            GWorkCommentsData_work_comments_responses_sticker> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentsData_work_comments_responses_sticker,
    _$GWorkCommentsData_work_comments_responses_sticker
  ];
  @override
  final String wireName = 'GWorkCommentsData_work_comments_responses_sticker';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentsData_work_comments_responses_sticker object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GWorkCommentsData_work_comments_responses_sticker_image)));
    }
    return result;
  }

  @override
  GWorkCommentsData_work_comments_responses_sticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentsData_work_comments_responses_stickerBuilder();

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
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentsData_work_comments_responses_sticker_image))!
              as GWorkCommentsData_work_comments_responses_sticker_image);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData_work_comments_responses_sticker_imageSerializer
    implements
        StructuredSerializer<
            GWorkCommentsData_work_comments_responses_sticker_image> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentsData_work_comments_responses_sticker_image,
    _$GWorkCommentsData_work_comments_responses_sticker_image
  ];
  @override
  final String wireName =
      'GWorkCommentsData_work_comments_responses_sticker_image';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentsData_work_comments_responses_sticker_image object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'downloadURL',
      serializers.serialize(object.downloadURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GWorkCommentsData_work_comments_responses_sticker_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentsData_work_comments_responses_sticker_imageBuilder();

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
        case 'downloadURL':
          result.downloadURL = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentsData extends GWorkCommentsData {
  @override
  final String G__typename;
  @override
  final GWorkCommentsData_work? work;

  factory _$GWorkCommentsData(
          [void Function(GWorkCommentsDataBuilder)? updates]) =>
      (new GWorkCommentsDataBuilder()..update(updates))._build();

  _$GWorkCommentsData._({required this.G__typename, this.work}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentsData', 'G__typename');
  }

  @override
  GWorkCommentsData rebuild(void Function(GWorkCommentsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsDataBuilder toBuilder() =>
      new GWorkCommentsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData &&
        G__typename == other.G__typename &&
        work == other.work;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, work.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkCommentsData')
          ..add('G__typename', G__typename)
          ..add('work', work))
        .toString();
  }
}

class GWorkCommentsDataBuilder
    implements Builder<GWorkCommentsData, GWorkCommentsDataBuilder> {
  _$GWorkCommentsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GWorkCommentsData_workBuilder? _work;
  GWorkCommentsData_workBuilder get work =>
      _$this._work ??= new GWorkCommentsData_workBuilder();
  set work(GWorkCommentsData_workBuilder? work) => _$this._work = work;

  GWorkCommentsDataBuilder() {
    GWorkCommentsData._initializeBuilder(this);
  }

  GWorkCommentsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _work = $v.work?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData;
  }

  @override
  void update(void Function(GWorkCommentsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData build() => _build();

  _$GWorkCommentsData _build() {
    _$GWorkCommentsData _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkCommentsData', 'G__typename'),
              work: _work?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'work';
        _work?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentsData_work extends GWorkCommentsData_work {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final BuiltList<GWorkCommentsData_work_comments> comments;

  factory _$GWorkCommentsData_work(
          [void Function(GWorkCommentsData_workBuilder)? updates]) =>
      (new GWorkCommentsData_workBuilder()..update(updates))._build();

  _$GWorkCommentsData_work._(
      {required this.G__typename, required this.id, required this.comments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentsData_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GWorkCommentsData_work', 'id');
    BuiltValueNullFieldError.checkNotNull(
        comments, r'GWorkCommentsData_work', 'comments');
  }

  @override
  GWorkCommentsData_work rebuild(
          void Function(GWorkCommentsData_workBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsData_workBuilder toBuilder() =>
      new GWorkCommentsData_workBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData_work &&
        G__typename == other.G__typename &&
        id == other.id &&
        comments == other.comments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkCommentsData_work')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('comments', comments))
        .toString();
  }
}

class GWorkCommentsData_workBuilder
    implements Builder<GWorkCommentsData_work, GWorkCommentsData_workBuilder> {
  _$GWorkCommentsData_work? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<GWorkCommentsData_work_comments>? _comments;
  ListBuilder<GWorkCommentsData_work_comments> get comments =>
      _$this._comments ??= new ListBuilder<GWorkCommentsData_work_comments>();
  set comments(ListBuilder<GWorkCommentsData_work_comments>? comments) =>
      _$this._comments = comments;

  GWorkCommentsData_workBuilder() {
    GWorkCommentsData_work._initializeBuilder(this);
  }

  GWorkCommentsData_workBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _comments = $v.comments.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData_work other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData_work;
  }

  @override
  void update(void Function(GWorkCommentsData_workBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData_work build() => _build();

  _$GWorkCommentsData_work _build() {
    _$GWorkCommentsData_work _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentsData_work._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkCommentsData_work', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentsData_work', 'id'),
              comments: comments.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comments';
        comments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentsData_work', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentsData_work_comments
    extends GWorkCommentsData_work_comments {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String text;
  @override
  final GWorkCommentsData_work_comments_user? user;
  @override
  final GWorkCommentsData_work_comments_sticker? sticker;
  @override
  final BuiltList<GWorkCommentsData_work_comments_responses> responses;

  factory _$GWorkCommentsData_work_comments(
          [void Function(GWorkCommentsData_work_commentsBuilder)? updates]) =>
      (new GWorkCommentsData_work_commentsBuilder()..update(updates))._build();

  _$GWorkCommentsData_work_comments._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      required this.text,
      this.user,
      this.sticker,
      required this.responses})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentsData_work_comments', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentsData_work_comments', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkCommentsData_work_comments', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        text, r'GWorkCommentsData_work_comments', 'text');
    BuiltValueNullFieldError.checkNotNull(
        responses, r'GWorkCommentsData_work_comments', 'responses');
  }

  @override
  GWorkCommentsData_work_comments rebuild(
          void Function(GWorkCommentsData_work_commentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsData_work_commentsBuilder toBuilder() =>
      new GWorkCommentsData_work_commentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData_work_comments &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        text == other.text &&
        user == other.user &&
        sticker == other.sticker &&
        responses == other.responses;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, sticker.hashCode);
    _$hash = $jc(_$hash, responses.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkCommentsData_work_comments')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('text', text)
          ..add('user', user)
          ..add('sticker', sticker)
          ..add('responses', responses))
        .toString();
  }
}

class GWorkCommentsData_work_commentsBuilder
    implements
        Builder<GWorkCommentsData_work_comments,
            GWorkCommentsData_work_commentsBuilder> {
  _$GWorkCommentsData_work_comments? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  GWorkCommentsData_work_comments_userBuilder? _user;
  GWorkCommentsData_work_comments_userBuilder get user =>
      _$this._user ??= new GWorkCommentsData_work_comments_userBuilder();
  set user(GWorkCommentsData_work_comments_userBuilder? user) =>
      _$this._user = user;

  GWorkCommentsData_work_comments_stickerBuilder? _sticker;
  GWorkCommentsData_work_comments_stickerBuilder get sticker =>
      _$this._sticker ??= new GWorkCommentsData_work_comments_stickerBuilder();
  set sticker(GWorkCommentsData_work_comments_stickerBuilder? sticker) =>
      _$this._sticker = sticker;

  ListBuilder<GWorkCommentsData_work_comments_responses>? _responses;
  ListBuilder<GWorkCommentsData_work_comments_responses> get responses =>
      _$this._responses ??=
          new ListBuilder<GWorkCommentsData_work_comments_responses>();
  set responses(
          ListBuilder<GWorkCommentsData_work_comments_responses>? responses) =>
      _$this._responses = responses;

  GWorkCommentsData_work_commentsBuilder() {
    GWorkCommentsData_work_comments._initializeBuilder(this);
  }

  GWorkCommentsData_work_commentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _text = $v.text;
      _user = $v.user?.toBuilder();
      _sticker = $v.sticker?.toBuilder();
      _responses = $v.responses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData_work_comments other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData_work_comments;
  }

  @override
  void update(void Function(GWorkCommentsData_work_commentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData_work_comments build() => _build();

  _$GWorkCommentsData_work_comments _build() {
    _$GWorkCommentsData_work_comments _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentsData_work_comments._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkCommentsData_work_comments', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentsData_work_comments', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'GWorkCommentsData_work_comments', 'createdAt'),
              text: BuiltValueNullFieldError.checkNotNull(
                  text, r'GWorkCommentsData_work_comments', 'text'),
              user: _user?.build(),
              sticker: _sticker?.build(),
              responses: responses.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'sticker';
        _sticker?.build();
        _$failedField = 'responses';
        responses.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentsData_work_comments', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentsData_work_comments_user
    extends GWorkCommentsData_work_comments_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String login;
  @override
  final GWorkCommentsData_work_comments_user_iconImage? iconImage;

  factory _$GWorkCommentsData_work_comments_user(
          [void Function(GWorkCommentsData_work_comments_userBuilder)?
              updates]) =>
      (new GWorkCommentsData_work_comments_userBuilder()..update(updates))
          ._build();

  _$GWorkCommentsData_work_comments_user._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentsData_work_comments_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentsData_work_comments_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GWorkCommentsData_work_comments_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GWorkCommentsData_work_comments_user', 'login');
  }

  @override
  GWorkCommentsData_work_comments_user rebuild(
          void Function(GWorkCommentsData_work_comments_userBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsData_work_comments_userBuilder toBuilder() =>
      new GWorkCommentsData_work_comments_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData_work_comments_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        login == other.login &&
        iconImage == other.iconImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkCommentsData_work_comments_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('login', login)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GWorkCommentsData_work_comments_userBuilder
    implements
        Builder<GWorkCommentsData_work_comments_user,
            GWorkCommentsData_work_comments_userBuilder> {
  _$GWorkCommentsData_work_comments_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  GWorkCommentsData_work_comments_user_iconImageBuilder? _iconImage;
  GWorkCommentsData_work_comments_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GWorkCommentsData_work_comments_user_iconImageBuilder();
  set iconImage(
          GWorkCommentsData_work_comments_user_iconImageBuilder? iconImage) =>
      _$this._iconImage = iconImage;

  GWorkCommentsData_work_comments_userBuilder() {
    GWorkCommentsData_work_comments_user._initializeBuilder(this);
  }

  GWorkCommentsData_work_comments_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _login = $v.login;
      _iconImage = $v.iconImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData_work_comments_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData_work_comments_user;
  }

  @override
  void update(
      void Function(GWorkCommentsData_work_comments_userBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData_work_comments_user build() => _build();

  _$GWorkCommentsData_work_comments_user _build() {
    _$GWorkCommentsData_work_comments_user _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentsData_work_comments_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkCommentsData_work_comments_user', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentsData_work_comments_user', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GWorkCommentsData_work_comments_user', 'name'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login, r'GWorkCommentsData_work_comments_user', 'login'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentsData_work_comments_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentsData_work_comments_user_iconImage
    extends GWorkCommentsData_work_comments_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentsData_work_comments_user_iconImage(
          [void Function(GWorkCommentsData_work_comments_user_iconImageBuilder)?
              updates]) =>
      (new GWorkCommentsData_work_comments_user_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentsData_work_comments_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentsData_work_comments_user_iconImage', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentsData_work_comments_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GWorkCommentsData_work_comments_user_iconImage', 'downloadURL');
  }

  @override
  GWorkCommentsData_work_comments_user_iconImage rebuild(
          void Function(GWorkCommentsData_work_comments_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsData_work_comments_user_iconImageBuilder toBuilder() =>
      new GWorkCommentsData_work_comments_user_iconImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData_work_comments_user_iconImage &&
        G__typename == other.G__typename &&
        id == other.id &&
        downloadURL == other.downloadURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, downloadURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GWorkCommentsData_work_comments_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentsData_work_comments_user_iconImageBuilder
    implements
        Builder<GWorkCommentsData_work_comments_user_iconImage,
            GWorkCommentsData_work_comments_user_iconImageBuilder> {
  _$GWorkCommentsData_work_comments_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentsData_work_comments_user_iconImageBuilder() {
    GWorkCommentsData_work_comments_user_iconImage._initializeBuilder(this);
  }

  GWorkCommentsData_work_comments_user_iconImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _downloadURL = $v.downloadURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData_work_comments_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData_work_comments_user_iconImage;
  }

  @override
  void update(
      void Function(GWorkCommentsData_work_comments_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData_work_comments_user_iconImage build() => _build();

  _$GWorkCommentsData_work_comments_user_iconImage _build() {
    final _$result = _$v ??
        new _$GWorkCommentsData_work_comments_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentsData_work_comments_user_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkCommentsData_work_comments_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentsData_work_comments_user_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentsData_work_comments_sticker
    extends GWorkCommentsData_work_comments_sticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GWorkCommentsData_work_comments_sticker_image? image;

  factory _$GWorkCommentsData_work_comments_sticker(
          [void Function(GWorkCommentsData_work_comments_stickerBuilder)?
              updates]) =>
      (new GWorkCommentsData_work_comments_stickerBuilder()..update(updates))
          ._build();

  _$GWorkCommentsData_work_comments_sticker._(
      {required this.G__typename, required this.id, this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentsData_work_comments_sticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentsData_work_comments_sticker', 'id');
  }

  @override
  GWorkCommentsData_work_comments_sticker rebuild(
          void Function(GWorkCommentsData_work_comments_stickerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsData_work_comments_stickerBuilder toBuilder() =>
      new GWorkCommentsData_work_comments_stickerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData_work_comments_sticker &&
        G__typename == other.G__typename &&
        id == other.id &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GWorkCommentsData_work_comments_sticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('image', image))
        .toString();
  }
}

class GWorkCommentsData_work_comments_stickerBuilder
    implements
        Builder<GWorkCommentsData_work_comments_sticker,
            GWorkCommentsData_work_comments_stickerBuilder> {
  _$GWorkCommentsData_work_comments_sticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GWorkCommentsData_work_comments_sticker_imageBuilder? _image;
  GWorkCommentsData_work_comments_sticker_imageBuilder get image =>
      _$this._image ??=
          new GWorkCommentsData_work_comments_sticker_imageBuilder();
  set image(GWorkCommentsData_work_comments_sticker_imageBuilder? image) =>
      _$this._image = image;

  GWorkCommentsData_work_comments_stickerBuilder() {
    GWorkCommentsData_work_comments_sticker._initializeBuilder(this);
  }

  GWorkCommentsData_work_comments_stickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _image = $v.image?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData_work_comments_sticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData_work_comments_sticker;
  }

  @override
  void update(
      void Function(GWorkCommentsData_work_comments_stickerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData_work_comments_sticker build() => _build();

  _$GWorkCommentsData_work_comments_sticker _build() {
    _$GWorkCommentsData_work_comments_sticker _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentsData_work_comments_sticker._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkCommentsData_work_comments_sticker', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentsData_work_comments_sticker', 'id'),
              image: _image?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentsData_work_comments_sticker',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentsData_work_comments_sticker_image
    extends GWorkCommentsData_work_comments_sticker_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentsData_work_comments_sticker_image(
          [void Function(GWorkCommentsData_work_comments_sticker_imageBuilder)?
              updates]) =>
      (new GWorkCommentsData_work_comments_sticker_imageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentsData_work_comments_sticker_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentsData_work_comments_sticker_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentsData_work_comments_sticker_image', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GWorkCommentsData_work_comments_sticker_image', 'downloadURL');
  }

  @override
  GWorkCommentsData_work_comments_sticker_image rebuild(
          void Function(GWorkCommentsData_work_comments_sticker_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsData_work_comments_sticker_imageBuilder toBuilder() =>
      new GWorkCommentsData_work_comments_sticker_imageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData_work_comments_sticker_image &&
        G__typename == other.G__typename &&
        id == other.id &&
        downloadURL == other.downloadURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, downloadURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GWorkCommentsData_work_comments_sticker_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentsData_work_comments_sticker_imageBuilder
    implements
        Builder<GWorkCommentsData_work_comments_sticker_image,
            GWorkCommentsData_work_comments_sticker_imageBuilder> {
  _$GWorkCommentsData_work_comments_sticker_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentsData_work_comments_sticker_imageBuilder() {
    GWorkCommentsData_work_comments_sticker_image._initializeBuilder(this);
  }

  GWorkCommentsData_work_comments_sticker_imageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _downloadURL = $v.downloadURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData_work_comments_sticker_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData_work_comments_sticker_image;
  }

  @override
  void update(
      void Function(GWorkCommentsData_work_comments_sticker_imageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData_work_comments_sticker_image build() => _build();

  _$GWorkCommentsData_work_comments_sticker_image _build() {
    final _$result = _$v ??
        new _$GWorkCommentsData_work_comments_sticker_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentsData_work_comments_sticker_image',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GWorkCommentsData_work_comments_sticker_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentsData_work_comments_sticker_image',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentsData_work_comments_responses
    extends GWorkCommentsData_work_comments_responses {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String text;
  @override
  final GWorkCommentsData_work_comments_responses_user? user;
  @override
  final GWorkCommentsData_work_comments_responses_sticker? sticker;

  factory _$GWorkCommentsData_work_comments_responses(
          [void Function(GWorkCommentsData_work_comments_responsesBuilder)?
              updates]) =>
      (new GWorkCommentsData_work_comments_responsesBuilder()..update(updates))
          ._build();

  _$GWorkCommentsData_work_comments_responses._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      required this.text,
      this.user,
      this.sticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentsData_work_comments_responses', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentsData_work_comments_responses', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkCommentsData_work_comments_responses', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        text, r'GWorkCommentsData_work_comments_responses', 'text');
  }

  @override
  GWorkCommentsData_work_comments_responses rebuild(
          void Function(GWorkCommentsData_work_comments_responsesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsData_work_comments_responsesBuilder toBuilder() =>
      new GWorkCommentsData_work_comments_responsesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData_work_comments_responses &&
        G__typename == other.G__typename &&
        id == other.id &&
        createdAt == other.createdAt &&
        text == other.text &&
        user == other.user &&
        sticker == other.sticker;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, sticker.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GWorkCommentsData_work_comments_responses')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('text', text)
          ..add('user', user)
          ..add('sticker', sticker))
        .toString();
  }
}

class GWorkCommentsData_work_comments_responsesBuilder
    implements
        Builder<GWorkCommentsData_work_comments_responses,
            GWorkCommentsData_work_comments_responsesBuilder> {
  _$GWorkCommentsData_work_comments_responses? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  GWorkCommentsData_work_comments_responses_userBuilder? _user;
  GWorkCommentsData_work_comments_responses_userBuilder get user =>
      _$this._user ??=
          new GWorkCommentsData_work_comments_responses_userBuilder();
  set user(GWorkCommentsData_work_comments_responses_userBuilder? user) =>
      _$this._user = user;

  GWorkCommentsData_work_comments_responses_stickerBuilder? _sticker;
  GWorkCommentsData_work_comments_responses_stickerBuilder get sticker =>
      _$this._sticker ??=
          new GWorkCommentsData_work_comments_responses_stickerBuilder();
  set sticker(
          GWorkCommentsData_work_comments_responses_stickerBuilder? sticker) =>
      _$this._sticker = sticker;

  GWorkCommentsData_work_comments_responsesBuilder() {
    GWorkCommentsData_work_comments_responses._initializeBuilder(this);
  }

  GWorkCommentsData_work_comments_responsesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _text = $v.text;
      _user = $v.user?.toBuilder();
      _sticker = $v.sticker?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData_work_comments_responses other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData_work_comments_responses;
  }

  @override
  void update(
      void Function(GWorkCommentsData_work_comments_responsesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData_work_comments_responses build() => _build();

  _$GWorkCommentsData_work_comments_responses _build() {
    _$GWorkCommentsData_work_comments_responses _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentsData_work_comments_responses._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkCommentsData_work_comments_responses', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentsData_work_comments_responses', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(createdAt,
                  r'GWorkCommentsData_work_comments_responses', 'createdAt'),
              text: BuiltValueNullFieldError.checkNotNull(
                  text, r'GWorkCommentsData_work_comments_responses', 'text'),
              user: _user?.build(),
              sticker: _sticker?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'sticker';
        _sticker?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentsData_work_comments_responses',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentsData_work_comments_responses_user
    extends GWorkCommentsData_work_comments_responses_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String login;
  @override
  final GWorkCommentsData_work_comments_responses_user_iconImage? iconImage;

  factory _$GWorkCommentsData_work_comments_responses_user(
          [void Function(GWorkCommentsData_work_comments_responses_userBuilder)?
              updates]) =>
      (new GWorkCommentsData_work_comments_responses_userBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentsData_work_comments_responses_user._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentsData_work_comments_responses_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentsData_work_comments_responses_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GWorkCommentsData_work_comments_responses_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GWorkCommentsData_work_comments_responses_user', 'login');
  }

  @override
  GWorkCommentsData_work_comments_responses_user rebuild(
          void Function(GWorkCommentsData_work_comments_responses_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsData_work_comments_responses_userBuilder toBuilder() =>
      new GWorkCommentsData_work_comments_responses_userBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData_work_comments_responses_user &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        login == other.login &&
        iconImage == other.iconImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, iconImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GWorkCommentsData_work_comments_responses_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('login', login)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GWorkCommentsData_work_comments_responses_userBuilder
    implements
        Builder<GWorkCommentsData_work_comments_responses_user,
            GWorkCommentsData_work_comments_responses_userBuilder> {
  _$GWorkCommentsData_work_comments_responses_user? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  GWorkCommentsData_work_comments_responses_user_iconImageBuilder? _iconImage;
  GWorkCommentsData_work_comments_responses_user_iconImageBuilder
      get iconImage => _$this._iconImage ??=
          new GWorkCommentsData_work_comments_responses_user_iconImageBuilder();
  set iconImage(
          GWorkCommentsData_work_comments_responses_user_iconImageBuilder?
              iconImage) =>
      _$this._iconImage = iconImage;

  GWorkCommentsData_work_comments_responses_userBuilder() {
    GWorkCommentsData_work_comments_responses_user._initializeBuilder(this);
  }

  GWorkCommentsData_work_comments_responses_userBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _login = $v.login;
      _iconImage = $v.iconImage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData_work_comments_responses_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData_work_comments_responses_user;
  }

  @override
  void update(
      void Function(GWorkCommentsData_work_comments_responses_userBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData_work_comments_responses_user build() => _build();

  _$GWorkCommentsData_work_comments_responses_user _build() {
    _$GWorkCommentsData_work_comments_responses_user _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentsData_work_comments_responses_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GWorkCommentsData_work_comments_responses_user',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentsData_work_comments_responses_user', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(name,
                  r'GWorkCommentsData_work_comments_responses_user', 'name'),
              login: BuiltValueNullFieldError.checkNotNull(login,
                  r'GWorkCommentsData_work_comments_responses_user', 'login'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentsData_work_comments_responses_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentsData_work_comments_responses_user_iconImage
    extends GWorkCommentsData_work_comments_responses_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentsData_work_comments_responses_user_iconImage(
          [void Function(
                  GWorkCommentsData_work_comments_responses_user_iconImageBuilder)?
              updates]) =>
      (new GWorkCommentsData_work_comments_responses_user_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentsData_work_comments_responses_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GWorkCommentsData_work_comments_responses_user_iconImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentsData_work_comments_responses_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GWorkCommentsData_work_comments_responses_user_iconImage',
        'downloadURL');
  }

  @override
  GWorkCommentsData_work_comments_responses_user_iconImage rebuild(
          void Function(
                  GWorkCommentsData_work_comments_responses_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsData_work_comments_responses_user_iconImageBuilder toBuilder() =>
      new GWorkCommentsData_work_comments_responses_user_iconImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData_work_comments_responses_user_iconImage &&
        G__typename == other.G__typename &&
        id == other.id &&
        downloadURL == other.downloadURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, downloadURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GWorkCommentsData_work_comments_responses_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentsData_work_comments_responses_user_iconImageBuilder
    implements
        Builder<GWorkCommentsData_work_comments_responses_user_iconImage,
            GWorkCommentsData_work_comments_responses_user_iconImageBuilder> {
  _$GWorkCommentsData_work_comments_responses_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentsData_work_comments_responses_user_iconImageBuilder() {
    GWorkCommentsData_work_comments_responses_user_iconImage._initializeBuilder(
        this);
  }

  GWorkCommentsData_work_comments_responses_user_iconImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _downloadURL = $v.downloadURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData_work_comments_responses_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData_work_comments_responses_user_iconImage;
  }

  @override
  void update(
      void Function(
              GWorkCommentsData_work_comments_responses_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData_work_comments_responses_user_iconImage build() => _build();

  _$GWorkCommentsData_work_comments_responses_user_iconImage _build() {
    final _$result = _$v ??
        new _$GWorkCommentsData_work_comments_responses_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentsData_work_comments_responses_user_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GWorkCommentsData_work_comments_responses_user_iconImage',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentsData_work_comments_responses_user_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentsData_work_comments_responses_sticker
    extends GWorkCommentsData_work_comments_responses_sticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GWorkCommentsData_work_comments_responses_sticker_image? image;

  factory _$GWorkCommentsData_work_comments_responses_sticker(
          [void Function(
                  GWorkCommentsData_work_comments_responses_stickerBuilder)?
              updates]) =>
      (new GWorkCommentsData_work_comments_responses_stickerBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentsData_work_comments_responses_sticker._(
      {required this.G__typename, required this.id, this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentsData_work_comments_responses_sticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentsData_work_comments_responses_sticker', 'id');
  }

  @override
  GWorkCommentsData_work_comments_responses_sticker rebuild(
          void Function(
                  GWorkCommentsData_work_comments_responses_stickerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsData_work_comments_responses_stickerBuilder toBuilder() =>
      new GWorkCommentsData_work_comments_responses_stickerBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData_work_comments_responses_sticker &&
        G__typename == other.G__typename &&
        id == other.id &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GWorkCommentsData_work_comments_responses_sticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('image', image))
        .toString();
  }
}

class GWorkCommentsData_work_comments_responses_stickerBuilder
    implements
        Builder<GWorkCommentsData_work_comments_responses_sticker,
            GWorkCommentsData_work_comments_responses_stickerBuilder> {
  _$GWorkCommentsData_work_comments_responses_sticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GWorkCommentsData_work_comments_responses_sticker_imageBuilder? _image;
  GWorkCommentsData_work_comments_responses_sticker_imageBuilder get image =>
      _$this._image ??=
          new GWorkCommentsData_work_comments_responses_sticker_imageBuilder();
  set image(
          GWorkCommentsData_work_comments_responses_sticker_imageBuilder?
              image) =>
      _$this._image = image;

  GWorkCommentsData_work_comments_responses_stickerBuilder() {
    GWorkCommentsData_work_comments_responses_sticker._initializeBuilder(this);
  }

  GWorkCommentsData_work_comments_responses_stickerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _image = $v.image?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData_work_comments_responses_sticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData_work_comments_responses_sticker;
  }

  @override
  void update(
      void Function(GWorkCommentsData_work_comments_responses_stickerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData_work_comments_responses_sticker build() => _build();

  _$GWorkCommentsData_work_comments_responses_sticker _build() {
    _$GWorkCommentsData_work_comments_responses_sticker _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentsData_work_comments_responses_sticker._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GWorkCommentsData_work_comments_responses_sticker',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(id,
                  r'GWorkCommentsData_work_comments_responses_sticker', 'id'),
              image: _image?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentsData_work_comments_responses_sticker',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentsData_work_comments_responses_sticker_image
    extends GWorkCommentsData_work_comments_responses_sticker_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentsData_work_comments_responses_sticker_image(
          [void Function(
                  GWorkCommentsData_work_comments_responses_sticker_imageBuilder)?
              updates]) =>
      (new GWorkCommentsData_work_comments_responses_sticker_imageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentsData_work_comments_responses_sticker_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GWorkCommentsData_work_comments_responses_sticker_image',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentsData_work_comments_responses_sticker_image', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GWorkCommentsData_work_comments_responses_sticker_image',
        'downloadURL');
  }

  @override
  GWorkCommentsData_work_comments_responses_sticker_image rebuild(
          void Function(
                  GWorkCommentsData_work_comments_responses_sticker_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentsData_work_comments_responses_sticker_imageBuilder toBuilder() =>
      new GWorkCommentsData_work_comments_responses_sticker_imageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentsData_work_comments_responses_sticker_image &&
        G__typename == other.G__typename &&
        id == other.id &&
        downloadURL == other.downloadURL;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, downloadURL.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GWorkCommentsData_work_comments_responses_sticker_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentsData_work_comments_responses_sticker_imageBuilder
    implements
        Builder<GWorkCommentsData_work_comments_responses_sticker_image,
            GWorkCommentsData_work_comments_responses_sticker_imageBuilder> {
  _$GWorkCommentsData_work_comments_responses_sticker_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentsData_work_comments_responses_sticker_imageBuilder() {
    GWorkCommentsData_work_comments_responses_sticker_image._initializeBuilder(
        this);
  }

  GWorkCommentsData_work_comments_responses_sticker_imageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _downloadURL = $v.downloadURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentsData_work_comments_responses_sticker_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentsData_work_comments_responses_sticker_image;
  }

  @override
  void update(
      void Function(
              GWorkCommentsData_work_comments_responses_sticker_imageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentsData_work_comments_responses_sticker_image build() => _build();

  _$GWorkCommentsData_work_comments_responses_sticker_image _build() {
    final _$result = _$v ??
        new _$GWorkCommentsData_work_comments_responses_sticker_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentsData_work_comments_responses_sticker_image',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GWorkCommentsData_work_comments_responses_sticker_image',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentsData_work_comments_responses_sticker_image',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
