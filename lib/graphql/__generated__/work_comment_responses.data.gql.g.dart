// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_comment_responses.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GWorkCommentResponsesData> _$gWorkCommentResponsesDataSerializer =
    new _$GWorkCommentResponsesDataSerializer();
Serializer<GWorkCommentResponsesData_work>
    _$gWorkCommentResponsesDataWorkSerializer =
    new _$GWorkCommentResponsesData_workSerializer();
Serializer<GWorkCommentResponsesData_work_comment>
    _$gWorkCommentResponsesDataWorkCommentSerializer =
    new _$GWorkCommentResponsesData_work_commentSerializer();
Serializer<GWorkCommentResponsesData_work_comment_user>
    _$gWorkCommentResponsesDataWorkCommentUserSerializer =
    new _$GWorkCommentResponsesData_work_comment_userSerializer();
Serializer<GWorkCommentResponsesData_work_comment_user_iconImage>
    _$gWorkCommentResponsesDataWorkCommentUserIconImageSerializer =
    new _$GWorkCommentResponsesData_work_comment_user_iconImageSerializer();
Serializer<GWorkCommentResponsesData_work_comment_sticker>
    _$gWorkCommentResponsesDataWorkCommentStickerSerializer =
    new _$GWorkCommentResponsesData_work_comment_stickerSerializer();
Serializer<GWorkCommentResponsesData_work_comment_sticker_image>
    _$gWorkCommentResponsesDataWorkCommentStickerImageSerializer =
    new _$GWorkCommentResponsesData_work_comment_sticker_imageSerializer();
Serializer<GWorkCommentResponsesData_work_comment_responses>
    _$gWorkCommentResponsesDataWorkCommentResponsesSerializer =
    new _$GWorkCommentResponsesData_work_comment_responsesSerializer();
Serializer<GWorkCommentResponsesData_work_comment_responses_user>
    _$gWorkCommentResponsesDataWorkCommentResponsesUserSerializer =
    new _$GWorkCommentResponsesData_work_comment_responses_userSerializer();
Serializer<GWorkCommentResponsesData_work_comment_responses_user_iconImage>
    _$gWorkCommentResponsesDataWorkCommentResponsesUserIconImageSerializer =
    new _$GWorkCommentResponsesData_work_comment_responses_user_iconImageSerializer();
Serializer<GWorkCommentResponsesData_work_comment_responses_sticker>
    _$gWorkCommentResponsesDataWorkCommentResponsesStickerSerializer =
    new _$GWorkCommentResponsesData_work_comment_responses_stickerSerializer();
Serializer<GWorkCommentResponsesData_work_comment_responses_sticker_image>
    _$gWorkCommentResponsesDataWorkCommentResponsesStickerImageSerializer =
    new _$GWorkCommentResponsesData_work_comment_responses_sticker_imageSerializer();

class _$GWorkCommentResponsesDataSerializer
    implements StructuredSerializer<GWorkCommentResponsesData> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData,
    _$GWorkCommentResponsesData
  ];
  @override
  final String wireName = 'GWorkCommentResponsesData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentResponsesData object,
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
            specifiedType: const FullType(GWorkCommentResponsesData_work)));
    }
    return result;
  }

  @override
  GWorkCommentResponsesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentResponsesDataBuilder();

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
                  specifiedType:
                      const FullType(GWorkCommentResponsesData_work))!
              as GWorkCommentResponsesData_work);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentResponsesData_workSerializer
    implements StructuredSerializer<GWorkCommentResponsesData_work> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData_work,
    _$GWorkCommentResponsesData_work
  ];
  @override
  final String wireName = 'GWorkCommentResponsesData_work';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentResponsesData_work object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'comment',
      serializers.serialize(object.comment,
          specifiedType:
              const FullType(GWorkCommentResponsesData_work_comment)),
    ];

    return result;
  }

  @override
  GWorkCommentResponsesData_work deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentResponsesData_workBuilder();

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
        case 'comment':
          result.comment.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GWorkCommentResponsesData_work_comment))!
              as GWorkCommentResponsesData_work_comment);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentResponsesData_work_commentSerializer
    implements StructuredSerializer<GWorkCommentResponsesData_work_comment> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData_work_comment,
    _$GWorkCommentResponsesData_work_comment
  ];
  @override
  final String wireName = 'GWorkCommentResponsesData_work_comment';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GWorkCommentResponsesData_work_comment object,
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
            const FullType(GWorkCommentResponsesData_work_comment_responses)
          ])),
    ];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GWorkCommentResponsesData_work_comment_user)));
    }
    value = object.sticker;
    if (value != null) {
      result
        ..add('sticker')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GWorkCommentResponsesData_work_comment_sticker)));
    }
    return result;
  }

  @override
  GWorkCommentResponsesData_work_comment deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentResponsesData_work_commentBuilder();

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
                      GWorkCommentResponsesData_work_comment_user))!
              as GWorkCommentResponsesData_work_comment_user);
          break;
        case 'sticker':
          result.sticker.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentResponsesData_work_comment_sticker))!
              as GWorkCommentResponsesData_work_comment_sticker);
          break;
        case 'responses':
          result.responses.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GWorkCommentResponsesData_work_comment_responses)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentResponsesData_work_comment_userSerializer
    implements
        StructuredSerializer<GWorkCommentResponsesData_work_comment_user> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData_work_comment_user,
    _$GWorkCommentResponsesData_work_comment_user
  ];
  @override
  final String wireName = 'GWorkCommentResponsesData_work_comment_user';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentResponsesData_work_comment_user object,
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
                GWorkCommentResponsesData_work_comment_user_iconImage)));
    }
    return result;
  }

  @override
  GWorkCommentResponsesData_work_comment_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentResponsesData_work_comment_userBuilder();

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
                      GWorkCommentResponsesData_work_comment_user_iconImage))!
              as GWorkCommentResponsesData_work_comment_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentResponsesData_work_comment_user_iconImageSerializer
    implements
        StructuredSerializer<
            GWorkCommentResponsesData_work_comment_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData_work_comment_user_iconImage,
    _$GWorkCommentResponsesData_work_comment_user_iconImage
  ];
  @override
  final String wireName =
      'GWorkCommentResponsesData_work_comment_user_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentResponsesData_work_comment_user_iconImage object,
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
  GWorkCommentResponsesData_work_comment_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentResponsesData_work_comment_user_iconImageBuilder();

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

class _$GWorkCommentResponsesData_work_comment_stickerSerializer
    implements
        StructuredSerializer<GWorkCommentResponsesData_work_comment_sticker> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData_work_comment_sticker,
    _$GWorkCommentResponsesData_work_comment_sticker
  ];
  @override
  final String wireName = 'GWorkCommentResponsesData_work_comment_sticker';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentResponsesData_work_comment_sticker object,
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
                GWorkCommentResponsesData_work_comment_sticker_image)));
    }
    return result;
  }

  @override
  GWorkCommentResponsesData_work_comment_sticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GWorkCommentResponsesData_work_comment_stickerBuilder();

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
                      GWorkCommentResponsesData_work_comment_sticker_image))!
              as GWorkCommentResponsesData_work_comment_sticker_image);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentResponsesData_work_comment_sticker_imageSerializer
    implements
        StructuredSerializer<
            GWorkCommentResponsesData_work_comment_sticker_image> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData_work_comment_sticker_image,
    _$GWorkCommentResponsesData_work_comment_sticker_image
  ];
  @override
  final String wireName =
      'GWorkCommentResponsesData_work_comment_sticker_image';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentResponsesData_work_comment_sticker_image object,
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
  GWorkCommentResponsesData_work_comment_sticker_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentResponsesData_work_comment_sticker_imageBuilder();

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

class _$GWorkCommentResponsesData_work_comment_responsesSerializer
    implements
        StructuredSerializer<GWorkCommentResponsesData_work_comment_responses> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData_work_comment_responses,
    _$GWorkCommentResponsesData_work_comment_responses
  ];
  @override
  final String wireName = 'GWorkCommentResponsesData_work_comment_responses';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentResponsesData_work_comment_responses object,
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
                GWorkCommentResponsesData_work_comment_responses_user)));
    }
    value = object.sticker;
    if (value != null) {
      result
        ..add('sticker')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GWorkCommentResponsesData_work_comment_responses_sticker)));
    }
    return result;
  }

  @override
  GWorkCommentResponsesData_work_comment_responses deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentResponsesData_work_comment_responsesBuilder();

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
                      GWorkCommentResponsesData_work_comment_responses_user))!
              as GWorkCommentResponsesData_work_comment_responses_user);
          break;
        case 'sticker':
          result.sticker.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GWorkCommentResponsesData_work_comment_responses_sticker))!
              as GWorkCommentResponsesData_work_comment_responses_sticker);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentResponsesData_work_comment_responses_userSerializer
    implements
        StructuredSerializer<
            GWorkCommentResponsesData_work_comment_responses_user> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData_work_comment_responses_user,
    _$GWorkCommentResponsesData_work_comment_responses_user
  ];
  @override
  final String wireName =
      'GWorkCommentResponsesData_work_comment_responses_user';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentResponsesData_work_comment_responses_user object,
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
                GWorkCommentResponsesData_work_comment_responses_user_iconImage)));
    }
    return result;
  }

  @override
  GWorkCommentResponsesData_work_comment_responses_user deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentResponsesData_work_comment_responses_userBuilder();

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
                      GWorkCommentResponsesData_work_comment_responses_user_iconImage))!
              as GWorkCommentResponsesData_work_comment_responses_user_iconImage);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentResponsesData_work_comment_responses_user_iconImageSerializer
    implements
        StructuredSerializer<
            GWorkCommentResponsesData_work_comment_responses_user_iconImage> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData_work_comment_responses_user_iconImage,
    _$GWorkCommentResponsesData_work_comment_responses_user_iconImage
  ];
  @override
  final String wireName =
      'GWorkCommentResponsesData_work_comment_responses_user_iconImage';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentResponsesData_work_comment_responses_user_iconImage object,
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
  GWorkCommentResponsesData_work_comment_responses_user_iconImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder();

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

class _$GWorkCommentResponsesData_work_comment_responses_stickerSerializer
    implements
        StructuredSerializer<
            GWorkCommentResponsesData_work_comment_responses_sticker> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData_work_comment_responses_sticker,
    _$GWorkCommentResponsesData_work_comment_responses_sticker
  ];
  @override
  final String wireName =
      'GWorkCommentResponsesData_work_comment_responses_sticker';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentResponsesData_work_comment_responses_sticker object,
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
                GWorkCommentResponsesData_work_comment_responses_sticker_image)));
    }
    return result;
  }

  @override
  GWorkCommentResponsesData_work_comment_responses_sticker deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentResponsesData_work_comment_responses_stickerBuilder();

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
                      GWorkCommentResponsesData_work_comment_responses_sticker_image))!
              as GWorkCommentResponsesData_work_comment_responses_sticker_image);
          break;
      }
    }

    return result.build();
  }
}

class _$GWorkCommentResponsesData_work_comment_responses_sticker_imageSerializer
    implements
        StructuredSerializer<
            GWorkCommentResponsesData_work_comment_responses_sticker_image> {
  @override
  final Iterable<Type> types = const [
    GWorkCommentResponsesData_work_comment_responses_sticker_image,
    _$GWorkCommentResponsesData_work_comment_responses_sticker_image
  ];
  @override
  final String wireName =
      'GWorkCommentResponsesData_work_comment_responses_sticker_image';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GWorkCommentResponsesData_work_comment_responses_sticker_image object,
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
  GWorkCommentResponsesData_work_comment_responses_sticker_image deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder();

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

class _$GWorkCommentResponsesData extends GWorkCommentResponsesData {
  @override
  final String G__typename;
  @override
  final GWorkCommentResponsesData_work? work;

  factory _$GWorkCommentResponsesData(
          [void Function(GWorkCommentResponsesDataBuilder)? updates]) =>
      (new GWorkCommentResponsesDataBuilder()..update(updates))._build();

  _$GWorkCommentResponsesData._({required this.G__typename, this.work})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentResponsesData', 'G__typename');
  }

  @override
  GWorkCommentResponsesData rebuild(
          void Function(GWorkCommentResponsesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesDataBuilder toBuilder() =>
      new GWorkCommentResponsesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentResponsesData &&
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
    return (newBuiltValueToStringHelper(r'GWorkCommentResponsesData')
          ..add('G__typename', G__typename)
          ..add('work', work))
        .toString();
  }
}

class GWorkCommentResponsesDataBuilder
    implements
        Builder<GWorkCommentResponsesData, GWorkCommentResponsesDataBuilder> {
  _$GWorkCommentResponsesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GWorkCommentResponsesData_workBuilder? _work;
  GWorkCommentResponsesData_workBuilder get work =>
      _$this._work ??= new GWorkCommentResponsesData_workBuilder();
  set work(GWorkCommentResponsesData_workBuilder? work) => _$this._work = work;

  GWorkCommentResponsesDataBuilder() {
    GWorkCommentResponsesData._initializeBuilder(this);
  }

  GWorkCommentResponsesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _work = $v.work?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentResponsesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentResponsesData;
  }

  @override
  void update(void Function(GWorkCommentResponsesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData build() => _build();

  _$GWorkCommentResponsesData _build() {
    _$GWorkCommentResponsesData _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentResponsesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GWorkCommentResponsesData', 'G__typename'),
              work: _work?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'work';
        _work?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentResponsesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentResponsesData_work extends GWorkCommentResponsesData_work {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GWorkCommentResponsesData_work_comment comment;

  factory _$GWorkCommentResponsesData_work(
          [void Function(GWorkCommentResponsesData_workBuilder)? updates]) =>
      (new GWorkCommentResponsesData_workBuilder()..update(updates))._build();

  _$GWorkCommentResponsesData_work._(
      {required this.G__typename, required this.id, required this.comment})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentResponsesData_work', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentResponsesData_work', 'id');
    BuiltValueNullFieldError.checkNotNull(
        comment, r'GWorkCommentResponsesData_work', 'comment');
  }

  @override
  GWorkCommentResponsesData_work rebuild(
          void Function(GWorkCommentResponsesData_workBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesData_workBuilder toBuilder() =>
      new GWorkCommentResponsesData_workBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentResponsesData_work &&
        G__typename == other.G__typename &&
        id == other.id &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GWorkCommentResponsesData_work')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('comment', comment))
        .toString();
  }
}

class GWorkCommentResponsesData_workBuilder
    implements
        Builder<GWorkCommentResponsesData_work,
            GWorkCommentResponsesData_workBuilder> {
  _$GWorkCommentResponsesData_work? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GWorkCommentResponsesData_work_commentBuilder? _comment;
  GWorkCommentResponsesData_work_commentBuilder get comment =>
      _$this._comment ??= new GWorkCommentResponsesData_work_commentBuilder();
  set comment(GWorkCommentResponsesData_work_commentBuilder? comment) =>
      _$this._comment = comment;

  GWorkCommentResponsesData_workBuilder() {
    GWorkCommentResponsesData_work._initializeBuilder(this);
  }

  GWorkCommentResponsesData_workBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _comment = $v.comment.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GWorkCommentResponsesData_work other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentResponsesData_work;
  }

  @override
  void update(void Function(GWorkCommentResponsesData_workBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData_work build() => _build();

  _$GWorkCommentResponsesData_work _build() {
    _$GWorkCommentResponsesData_work _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentResponsesData_work._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkCommentResponsesData_work', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentResponsesData_work', 'id'),
              comment: comment.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comment';
        comment.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentResponsesData_work', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentResponsesData_work_comment
    extends GWorkCommentResponsesData_work_comment {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String text;
  @override
  final GWorkCommentResponsesData_work_comment_user? user;
  @override
  final GWorkCommentResponsesData_work_comment_sticker? sticker;
  @override
  final BuiltList<GWorkCommentResponsesData_work_comment_responses> responses;

  factory _$GWorkCommentResponsesData_work_comment(
          [void Function(GWorkCommentResponsesData_work_commentBuilder)?
              updates]) =>
      (new GWorkCommentResponsesData_work_commentBuilder()..update(updates))
          ._build();

  _$GWorkCommentResponsesData_work_comment._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      required this.text,
      this.user,
      this.sticker,
      required this.responses})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GWorkCommentResponsesData_work_comment', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentResponsesData_work_comment', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'GWorkCommentResponsesData_work_comment', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        text, r'GWorkCommentResponsesData_work_comment', 'text');
    BuiltValueNullFieldError.checkNotNull(
        responses, r'GWorkCommentResponsesData_work_comment', 'responses');
  }

  @override
  GWorkCommentResponsesData_work_comment rebuild(
          void Function(GWorkCommentResponsesData_work_commentBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesData_work_commentBuilder toBuilder() =>
      new GWorkCommentResponsesData_work_commentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentResponsesData_work_comment &&
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
    return (newBuiltValueToStringHelper(
            r'GWorkCommentResponsesData_work_comment')
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

class GWorkCommentResponsesData_work_commentBuilder
    implements
        Builder<GWorkCommentResponsesData_work_comment,
            GWorkCommentResponsesData_work_commentBuilder> {
  _$GWorkCommentResponsesData_work_comment? _$v;

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

  GWorkCommentResponsesData_work_comment_userBuilder? _user;
  GWorkCommentResponsesData_work_comment_userBuilder get user =>
      _$this._user ??= new GWorkCommentResponsesData_work_comment_userBuilder();
  set user(GWorkCommentResponsesData_work_comment_userBuilder? user) =>
      _$this._user = user;

  GWorkCommentResponsesData_work_comment_stickerBuilder? _sticker;
  GWorkCommentResponsesData_work_comment_stickerBuilder get sticker =>
      _$this._sticker ??=
          new GWorkCommentResponsesData_work_comment_stickerBuilder();
  set sticker(GWorkCommentResponsesData_work_comment_stickerBuilder? sticker) =>
      _$this._sticker = sticker;

  ListBuilder<GWorkCommentResponsesData_work_comment_responses>? _responses;
  ListBuilder<GWorkCommentResponsesData_work_comment_responses> get responses =>
      _$this._responses ??=
          new ListBuilder<GWorkCommentResponsesData_work_comment_responses>();
  set responses(
          ListBuilder<GWorkCommentResponsesData_work_comment_responses>?
              responses) =>
      _$this._responses = responses;

  GWorkCommentResponsesData_work_commentBuilder() {
    GWorkCommentResponsesData_work_comment._initializeBuilder(this);
  }

  GWorkCommentResponsesData_work_commentBuilder get _$this {
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
  void replace(GWorkCommentResponsesData_work_comment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentResponsesData_work_comment;
  }

  @override
  void update(
      void Function(GWorkCommentResponsesData_work_commentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData_work_comment build() => _build();

  _$GWorkCommentResponsesData_work_comment _build() {
    _$GWorkCommentResponsesData_work_comment _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentResponsesData_work_comment._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GWorkCommentResponsesData_work_comment', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentResponsesData_work_comment', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(createdAt,
                  r'GWorkCommentResponsesData_work_comment', 'createdAt'),
              text: BuiltValueNullFieldError.checkNotNull(
                  text, r'GWorkCommentResponsesData_work_comment', 'text'),
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
            r'GWorkCommentResponsesData_work_comment',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentResponsesData_work_comment_user
    extends GWorkCommentResponsesData_work_comment_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String login;
  @override
  final GWorkCommentResponsesData_work_comment_user_iconImage? iconImage;

  factory _$GWorkCommentResponsesData_work_comment_user(
          [void Function(GWorkCommentResponsesData_work_comment_userBuilder)?
              updates]) =>
      (new GWorkCommentResponsesData_work_comment_userBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentResponsesData_work_comment_user._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentResponsesData_work_comment_user', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentResponsesData_work_comment_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GWorkCommentResponsesData_work_comment_user', 'name');
    BuiltValueNullFieldError.checkNotNull(
        login, r'GWorkCommentResponsesData_work_comment_user', 'login');
  }

  @override
  GWorkCommentResponsesData_work_comment_user rebuild(
          void Function(GWorkCommentResponsesData_work_comment_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesData_work_comment_userBuilder toBuilder() =>
      new GWorkCommentResponsesData_work_comment_userBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentResponsesData_work_comment_user &&
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
            r'GWorkCommentResponsesData_work_comment_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('login', login)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GWorkCommentResponsesData_work_comment_userBuilder
    implements
        Builder<GWorkCommentResponsesData_work_comment_user,
            GWorkCommentResponsesData_work_comment_userBuilder> {
  _$GWorkCommentResponsesData_work_comment_user? _$v;

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

  GWorkCommentResponsesData_work_comment_user_iconImageBuilder? _iconImage;
  GWorkCommentResponsesData_work_comment_user_iconImageBuilder get iconImage =>
      _$this._iconImage ??=
          new GWorkCommentResponsesData_work_comment_user_iconImageBuilder();
  set iconImage(
          GWorkCommentResponsesData_work_comment_user_iconImageBuilder?
              iconImage) =>
      _$this._iconImage = iconImage;

  GWorkCommentResponsesData_work_comment_userBuilder() {
    GWorkCommentResponsesData_work_comment_user._initializeBuilder(this);
  }

  GWorkCommentResponsesData_work_comment_userBuilder get _$this {
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
  void replace(GWorkCommentResponsesData_work_comment_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentResponsesData_work_comment_user;
  }

  @override
  void update(
      void Function(GWorkCommentResponsesData_work_comment_userBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData_work_comment_user build() => _build();

  _$GWorkCommentResponsesData_work_comment_user _build() {
    _$GWorkCommentResponsesData_work_comment_user _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentResponsesData_work_comment_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GWorkCommentResponsesData_work_comment_user',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentResponsesData_work_comment_user', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GWorkCommentResponsesData_work_comment_user', 'name'),
              login: BuiltValueNullFieldError.checkNotNull(login,
                  r'GWorkCommentResponsesData_work_comment_user', 'login'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentResponsesData_work_comment_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentResponsesData_work_comment_user_iconImage
    extends GWorkCommentResponsesData_work_comment_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentResponsesData_work_comment_user_iconImage(
          [void Function(
                  GWorkCommentResponsesData_work_comment_user_iconImageBuilder)?
              updates]) =>
      (new GWorkCommentResponsesData_work_comment_user_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentResponsesData_work_comment_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GWorkCommentResponsesData_work_comment_user_iconImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentResponsesData_work_comment_user_iconImage', 'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GWorkCommentResponsesData_work_comment_user_iconImage',
        'downloadURL');
  }

  @override
  GWorkCommentResponsesData_work_comment_user_iconImage rebuild(
          void Function(
                  GWorkCommentResponsesData_work_comment_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesData_work_comment_user_iconImageBuilder toBuilder() =>
      new GWorkCommentResponsesData_work_comment_user_iconImageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentResponsesData_work_comment_user_iconImage &&
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
            r'GWorkCommentResponsesData_work_comment_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentResponsesData_work_comment_user_iconImageBuilder
    implements
        Builder<GWorkCommentResponsesData_work_comment_user_iconImage,
            GWorkCommentResponsesData_work_comment_user_iconImageBuilder> {
  _$GWorkCommentResponsesData_work_comment_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentResponsesData_work_comment_user_iconImageBuilder() {
    GWorkCommentResponsesData_work_comment_user_iconImage._initializeBuilder(
        this);
  }

  GWorkCommentResponsesData_work_comment_user_iconImageBuilder get _$this {
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
  void replace(GWorkCommentResponsesData_work_comment_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentResponsesData_work_comment_user_iconImage;
  }

  @override
  void update(
      void Function(
              GWorkCommentResponsesData_work_comment_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData_work_comment_user_iconImage build() => _build();

  _$GWorkCommentResponsesData_work_comment_user_iconImage _build() {
    final _$result = _$v ??
        new _$GWorkCommentResponsesData_work_comment_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentResponsesData_work_comment_user_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GWorkCommentResponsesData_work_comment_user_iconImage', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentResponsesData_work_comment_user_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentResponsesData_work_comment_sticker
    extends GWorkCommentResponsesData_work_comment_sticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GWorkCommentResponsesData_work_comment_sticker_image? image;

  factory _$GWorkCommentResponsesData_work_comment_sticker(
          [void Function(GWorkCommentResponsesData_work_comment_stickerBuilder)?
              updates]) =>
      (new GWorkCommentResponsesData_work_comment_stickerBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentResponsesData_work_comment_sticker._(
      {required this.G__typename, required this.id, this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentResponsesData_work_comment_sticker', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentResponsesData_work_comment_sticker', 'id');
  }

  @override
  GWorkCommentResponsesData_work_comment_sticker rebuild(
          void Function(GWorkCommentResponsesData_work_comment_stickerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesData_work_comment_stickerBuilder toBuilder() =>
      new GWorkCommentResponsesData_work_comment_stickerBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentResponsesData_work_comment_sticker &&
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
            r'GWorkCommentResponsesData_work_comment_sticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('image', image))
        .toString();
  }
}

class GWorkCommentResponsesData_work_comment_stickerBuilder
    implements
        Builder<GWorkCommentResponsesData_work_comment_sticker,
            GWorkCommentResponsesData_work_comment_stickerBuilder> {
  _$GWorkCommentResponsesData_work_comment_sticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GWorkCommentResponsesData_work_comment_sticker_imageBuilder? _image;
  GWorkCommentResponsesData_work_comment_sticker_imageBuilder get image =>
      _$this._image ??=
          new GWorkCommentResponsesData_work_comment_sticker_imageBuilder();
  set image(
          GWorkCommentResponsesData_work_comment_sticker_imageBuilder? image) =>
      _$this._image = image;

  GWorkCommentResponsesData_work_comment_stickerBuilder() {
    GWorkCommentResponsesData_work_comment_sticker._initializeBuilder(this);
  }

  GWorkCommentResponsesData_work_comment_stickerBuilder get _$this {
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
  void replace(GWorkCommentResponsesData_work_comment_sticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentResponsesData_work_comment_sticker;
  }

  @override
  void update(
      void Function(GWorkCommentResponsesData_work_comment_stickerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData_work_comment_sticker build() => _build();

  _$GWorkCommentResponsesData_work_comment_sticker _build() {
    _$GWorkCommentResponsesData_work_comment_sticker _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentResponsesData_work_comment_sticker._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GWorkCommentResponsesData_work_comment_sticker',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GWorkCommentResponsesData_work_comment_sticker', 'id'),
              image: _image?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentResponsesData_work_comment_sticker',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentResponsesData_work_comment_sticker_image
    extends GWorkCommentResponsesData_work_comment_sticker_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentResponsesData_work_comment_sticker_image(
          [void Function(
                  GWorkCommentResponsesData_work_comment_sticker_imageBuilder)?
              updates]) =>
      (new GWorkCommentResponsesData_work_comment_sticker_imageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentResponsesData_work_comment_sticker_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentResponsesData_work_comment_sticker_image', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentResponsesData_work_comment_sticker_image', 'id');
    BuiltValueNullFieldError.checkNotNull(downloadURL,
        r'GWorkCommentResponsesData_work_comment_sticker_image', 'downloadURL');
  }

  @override
  GWorkCommentResponsesData_work_comment_sticker_image rebuild(
          void Function(
                  GWorkCommentResponsesData_work_comment_sticker_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesData_work_comment_sticker_imageBuilder toBuilder() =>
      new GWorkCommentResponsesData_work_comment_sticker_imageBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentResponsesData_work_comment_sticker_image &&
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
            r'GWorkCommentResponsesData_work_comment_sticker_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentResponsesData_work_comment_sticker_imageBuilder
    implements
        Builder<GWorkCommentResponsesData_work_comment_sticker_image,
            GWorkCommentResponsesData_work_comment_sticker_imageBuilder> {
  _$GWorkCommentResponsesData_work_comment_sticker_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentResponsesData_work_comment_sticker_imageBuilder() {
    GWorkCommentResponsesData_work_comment_sticker_image._initializeBuilder(
        this);
  }

  GWorkCommentResponsesData_work_comment_sticker_imageBuilder get _$this {
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
  void replace(GWorkCommentResponsesData_work_comment_sticker_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentResponsesData_work_comment_sticker_image;
  }

  @override
  void update(
      void Function(
              GWorkCommentResponsesData_work_comment_sticker_imageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData_work_comment_sticker_image build() => _build();

  _$GWorkCommentResponsesData_work_comment_sticker_image _build() {
    final _$result = _$v ??
        new _$GWorkCommentResponsesData_work_comment_sticker_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentResponsesData_work_comment_sticker_image',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(id,
                r'GWorkCommentResponsesData_work_comment_sticker_image', 'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentResponsesData_work_comment_sticker_image',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentResponsesData_work_comment_responses
    extends GWorkCommentResponsesData_work_comment_responses {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String text;
  @override
  final GWorkCommentResponsesData_work_comment_responses_user? user;
  @override
  final GWorkCommentResponsesData_work_comment_responses_sticker? sticker;

  factory _$GWorkCommentResponsesData_work_comment_responses(
          [void Function(
                  GWorkCommentResponsesData_work_comment_responsesBuilder)?
              updates]) =>
      (new GWorkCommentResponsesData_work_comment_responsesBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentResponsesData_work_comment_responses._(
      {required this.G__typename,
      required this.id,
      required this.createdAt,
      required this.text,
      this.user,
      this.sticker})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GWorkCommentResponsesData_work_comment_responses', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentResponsesData_work_comment_responses', 'id');
    BuiltValueNullFieldError.checkNotNull(createdAt,
        r'GWorkCommentResponsesData_work_comment_responses', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        text, r'GWorkCommentResponsesData_work_comment_responses', 'text');
  }

  @override
  GWorkCommentResponsesData_work_comment_responses rebuild(
          void Function(GWorkCommentResponsesData_work_comment_responsesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesData_work_comment_responsesBuilder toBuilder() =>
      new GWorkCommentResponsesData_work_comment_responsesBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentResponsesData_work_comment_responses &&
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
            r'GWorkCommentResponsesData_work_comment_responses')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('text', text)
          ..add('user', user)
          ..add('sticker', sticker))
        .toString();
  }
}

class GWorkCommentResponsesData_work_comment_responsesBuilder
    implements
        Builder<GWorkCommentResponsesData_work_comment_responses,
            GWorkCommentResponsesData_work_comment_responsesBuilder> {
  _$GWorkCommentResponsesData_work_comment_responses? _$v;

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

  GWorkCommentResponsesData_work_comment_responses_userBuilder? _user;
  GWorkCommentResponsesData_work_comment_responses_userBuilder get user =>
      _$this._user ??=
          new GWorkCommentResponsesData_work_comment_responses_userBuilder();
  set user(
          GWorkCommentResponsesData_work_comment_responses_userBuilder? user) =>
      _$this._user = user;

  GWorkCommentResponsesData_work_comment_responses_stickerBuilder? _sticker;
  GWorkCommentResponsesData_work_comment_responses_stickerBuilder get sticker =>
      _$this._sticker ??=
          new GWorkCommentResponsesData_work_comment_responses_stickerBuilder();
  set sticker(
          GWorkCommentResponsesData_work_comment_responses_stickerBuilder?
              sticker) =>
      _$this._sticker = sticker;

  GWorkCommentResponsesData_work_comment_responsesBuilder() {
    GWorkCommentResponsesData_work_comment_responses._initializeBuilder(this);
  }

  GWorkCommentResponsesData_work_comment_responsesBuilder get _$this {
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
  void replace(GWorkCommentResponsesData_work_comment_responses other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentResponsesData_work_comment_responses;
  }

  @override
  void update(
      void Function(GWorkCommentResponsesData_work_comment_responsesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData_work_comment_responses build() => _build();

  _$GWorkCommentResponsesData_work_comment_responses _build() {
    _$GWorkCommentResponsesData_work_comment_responses _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentResponsesData_work_comment_responses._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GWorkCommentResponsesData_work_comment_responses',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(id,
                  r'GWorkCommentResponsesData_work_comment_responses', 'id'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt,
                  r'GWorkCommentResponsesData_work_comment_responses',
                  'createdAt'),
              text: BuiltValueNullFieldError.checkNotNull(text,
                  r'GWorkCommentResponsesData_work_comment_responses', 'text'),
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
            r'GWorkCommentResponsesData_work_comment_responses',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentResponsesData_work_comment_responses_user
    extends GWorkCommentResponsesData_work_comment_responses_user {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String login;
  @override
  final GWorkCommentResponsesData_work_comment_responses_user_iconImage?
      iconImage;

  factory _$GWorkCommentResponsesData_work_comment_responses_user(
          [void Function(
                  GWorkCommentResponsesData_work_comment_responses_userBuilder)?
              updates]) =>
      (new GWorkCommentResponsesData_work_comment_responses_userBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentResponsesData_work_comment_responses_user._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.login,
      this.iconImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GWorkCommentResponsesData_work_comment_responses_user',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentResponsesData_work_comment_responses_user', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GWorkCommentResponsesData_work_comment_responses_user', 'name');
    BuiltValueNullFieldError.checkNotNull(login,
        r'GWorkCommentResponsesData_work_comment_responses_user', 'login');
  }

  @override
  GWorkCommentResponsesData_work_comment_responses_user rebuild(
          void Function(
                  GWorkCommentResponsesData_work_comment_responses_userBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesData_work_comment_responses_userBuilder toBuilder() =>
      new GWorkCommentResponsesData_work_comment_responses_userBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentResponsesData_work_comment_responses_user &&
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
            r'GWorkCommentResponsesData_work_comment_responses_user')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('login', login)
          ..add('iconImage', iconImage))
        .toString();
  }
}

class GWorkCommentResponsesData_work_comment_responses_userBuilder
    implements
        Builder<GWorkCommentResponsesData_work_comment_responses_user,
            GWorkCommentResponsesData_work_comment_responses_userBuilder> {
  _$GWorkCommentResponsesData_work_comment_responses_user? _$v;

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

  GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder?
      _iconImage;
  GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder
      get iconImage => _$this._iconImage ??=
          new GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder();
  set iconImage(
          GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder?
              iconImage) =>
      _$this._iconImage = iconImage;

  GWorkCommentResponsesData_work_comment_responses_userBuilder() {
    GWorkCommentResponsesData_work_comment_responses_user._initializeBuilder(
        this);
  }

  GWorkCommentResponsesData_work_comment_responses_userBuilder get _$this {
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
  void replace(GWorkCommentResponsesData_work_comment_responses_user other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentResponsesData_work_comment_responses_user;
  }

  @override
  void update(
      void Function(
              GWorkCommentResponsesData_work_comment_responses_userBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData_work_comment_responses_user build() => _build();

  _$GWorkCommentResponsesData_work_comment_responses_user _build() {
    _$GWorkCommentResponsesData_work_comment_responses_user _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentResponsesData_work_comment_responses_user._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GWorkCommentResponsesData_work_comment_responses_user',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id,
                  r'GWorkCommentResponsesData_work_comment_responses_user',
                  'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name,
                  r'GWorkCommentResponsesData_work_comment_responses_user',
                  'name'),
              login: BuiltValueNullFieldError.checkNotNull(
                  login,
                  r'GWorkCommentResponsesData_work_comment_responses_user',
                  'login'),
              iconImage: _iconImage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iconImage';
        _iconImage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentResponsesData_work_comment_responses_user',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentResponsesData_work_comment_responses_user_iconImage
    extends GWorkCommentResponsesData_work_comment_responses_user_iconImage {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentResponsesData_work_comment_responses_user_iconImage(
          [void Function(
                  GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder)?
              updates]) =>
      (new GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentResponsesData_work_comment_responses_user_iconImage._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GWorkCommentResponsesData_work_comment_responses_user_iconImage',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GWorkCommentResponsesData_work_comment_responses_user_iconImage',
        'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GWorkCommentResponsesData_work_comment_responses_user_iconImage',
        'downloadURL');
  }

  @override
  GWorkCommentResponsesData_work_comment_responses_user_iconImage rebuild(
          void Function(
                  GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder
      toBuilder() =>
          new GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GWorkCommentResponsesData_work_comment_responses_user_iconImage &&
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
            r'GWorkCommentResponsesData_work_comment_responses_user_iconImage')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder
    implements
        Builder<GWorkCommentResponsesData_work_comment_responses_user_iconImage,
            GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder> {
  _$GWorkCommentResponsesData_work_comment_responses_user_iconImage? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder() {
    GWorkCommentResponsesData_work_comment_responses_user_iconImage
        ._initializeBuilder(this);
  }

  GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder
      get _$this {
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
  void replace(
      GWorkCommentResponsesData_work_comment_responses_user_iconImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GWorkCommentResponsesData_work_comment_responses_user_iconImage;
  }

  @override
  void update(
      void Function(
              GWorkCommentResponsesData_work_comment_responses_user_iconImageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData_work_comment_responses_user_iconImage build() =>
      _build();

  _$GWorkCommentResponsesData_work_comment_responses_user_iconImage _build() {
    final _$result = _$v ??
        new _$GWorkCommentResponsesData_work_comment_responses_user_iconImage._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentResponsesData_work_comment_responses_user_iconImage',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GWorkCommentResponsesData_work_comment_responses_user_iconImage',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentResponsesData_work_comment_responses_user_iconImage',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentResponsesData_work_comment_responses_sticker
    extends GWorkCommentResponsesData_work_comment_responses_sticker {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final GWorkCommentResponsesData_work_comment_responses_sticker_image? image;

  factory _$GWorkCommentResponsesData_work_comment_responses_sticker(
          [void Function(
                  GWorkCommentResponsesData_work_comment_responses_stickerBuilder)?
              updates]) =>
      (new GWorkCommentResponsesData_work_comment_responses_stickerBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentResponsesData_work_comment_responses_sticker._(
      {required this.G__typename, required this.id, this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GWorkCommentResponsesData_work_comment_responses_sticker',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GWorkCommentResponsesData_work_comment_responses_sticker', 'id');
  }

  @override
  GWorkCommentResponsesData_work_comment_responses_sticker rebuild(
          void Function(
                  GWorkCommentResponsesData_work_comment_responses_stickerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesData_work_comment_responses_stickerBuilder toBuilder() =>
      new GWorkCommentResponsesData_work_comment_responses_stickerBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GWorkCommentResponsesData_work_comment_responses_sticker &&
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
            r'GWorkCommentResponsesData_work_comment_responses_sticker')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('image', image))
        .toString();
  }
}

class GWorkCommentResponsesData_work_comment_responses_stickerBuilder
    implements
        Builder<GWorkCommentResponsesData_work_comment_responses_sticker,
            GWorkCommentResponsesData_work_comment_responses_stickerBuilder> {
  _$GWorkCommentResponsesData_work_comment_responses_sticker? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder? _image;
  GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder
      get image => _$this._image ??=
          new GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder();
  set image(
          GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder?
              image) =>
      _$this._image = image;

  GWorkCommentResponsesData_work_comment_responses_stickerBuilder() {
    GWorkCommentResponsesData_work_comment_responses_sticker._initializeBuilder(
        this);
  }

  GWorkCommentResponsesData_work_comment_responses_stickerBuilder get _$this {
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
  void replace(GWorkCommentResponsesData_work_comment_responses_sticker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GWorkCommentResponsesData_work_comment_responses_sticker;
  }

  @override
  void update(
      void Function(
              GWorkCommentResponsesData_work_comment_responses_stickerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData_work_comment_responses_sticker build() => _build();

  _$GWorkCommentResponsesData_work_comment_responses_sticker _build() {
    _$GWorkCommentResponsesData_work_comment_responses_sticker _$result;
    try {
      _$result = _$v ??
          new _$GWorkCommentResponsesData_work_comment_responses_sticker._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GWorkCommentResponsesData_work_comment_responses_sticker',
                  'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id,
                  r'GWorkCommentResponsesData_work_comment_responses_sticker',
                  'id'),
              image: _image?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GWorkCommentResponsesData_work_comment_responses_sticker',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GWorkCommentResponsesData_work_comment_responses_sticker_image
    extends GWorkCommentResponsesData_work_comment_responses_sticker_image {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String downloadURL;

  factory _$GWorkCommentResponsesData_work_comment_responses_sticker_image(
          [void Function(
                  GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder)?
              updates]) =>
      (new GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder()
            ..update(updates))
          ._build();

  _$GWorkCommentResponsesData_work_comment_responses_sticker_image._(
      {required this.G__typename, required this.id, required this.downloadURL})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GWorkCommentResponsesData_work_comment_responses_sticker_image',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id,
        r'GWorkCommentResponsesData_work_comment_responses_sticker_image',
        'id');
    BuiltValueNullFieldError.checkNotNull(
        downloadURL,
        r'GWorkCommentResponsesData_work_comment_responses_sticker_image',
        'downloadURL');
  }

  @override
  GWorkCommentResponsesData_work_comment_responses_sticker_image rebuild(
          void Function(
                  GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder
      toBuilder() =>
          new GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GWorkCommentResponsesData_work_comment_responses_sticker_image &&
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
            r'GWorkCommentResponsesData_work_comment_responses_sticker_image')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('downloadURL', downloadURL))
        .toString();
  }
}

class GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder
    implements
        Builder<GWorkCommentResponsesData_work_comment_responses_sticker_image,
            GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder> {
  _$GWorkCommentResponsesData_work_comment_responses_sticker_image? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _downloadURL;
  String? get downloadURL => _$this._downloadURL;
  set downloadURL(String? downloadURL) => _$this._downloadURL = downloadURL;

  GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder() {
    GWorkCommentResponsesData_work_comment_responses_sticker_image
        ._initializeBuilder(this);
  }

  GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder
      get _$this {
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
  void replace(
      GWorkCommentResponsesData_work_comment_responses_sticker_image other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GWorkCommentResponsesData_work_comment_responses_sticker_image;
  }

  @override
  void update(
      void Function(
              GWorkCommentResponsesData_work_comment_responses_sticker_imageBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GWorkCommentResponsesData_work_comment_responses_sticker_image build() =>
      _build();

  _$GWorkCommentResponsesData_work_comment_responses_sticker_image _build() {
    final _$result = _$v ??
        new _$GWorkCommentResponsesData_work_comment_responses_sticker_image._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GWorkCommentResponsesData_work_comment_responses_sticker_image',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GWorkCommentResponsesData_work_comment_responses_sticker_image',
                'id'),
            downloadURL: BuiltValueNullFieldError.checkNotNull(
                downloadURL,
                r'GWorkCommentResponsesData_work_comment_responses_sticker_image',
                'downloadURL'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
