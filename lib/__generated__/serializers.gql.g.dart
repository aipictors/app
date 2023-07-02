// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(FetchPolicy.serializer)
      ..add(GAccessType.serializer)
      ..add(GAwardType.serializer)
      ..add(GAwardsWhereInput.serializer)
      ..add(GBestWorksData.serializer)
      ..add(GBestWorksData_bestWorks.serializer)
      ..add(GBestWorksData_bestWorks_image.serializer)
      ..add(GBestWorksData_bestWorks_thumbnailImage.serializer)
      ..add(GBestWorksReq.serializer)
      ..add(GBestWorksVars.serializer)
      ..add(GCommentFieldsData.serializer)
      ..add(GCommentFieldsData_sticker.serializer)
      ..add(GCommentFieldsData_sticker_image.serializer)
      ..add(GCommentFieldsData_user.serializer)
      ..add(GCommentFieldsData_user_iconImage.serializer)
      ..add(GCommentFieldsReq.serializer)
      ..add(GCommentFieldsVars.serializer)
      ..add(GCreateCommentInput.serializer)
      ..add(GCreateFolderInput.serializer)
      ..add(GCreateStickerInput.serializer)
      ..add(GCreateUserInput.serializer)
      ..add(GCreateWorkBookmarkInput.serializer)
      ..add(GCreateWorkInput.serializer)
      ..add(GCreateWorkLikeInput.serializer)
      ..add(GDailyThemeData.serializer)
      ..add(GDailyThemeData_dailyTheme.serializer)
      ..add(GDailyThemeData_dailyTheme_works.serializer)
      ..add(GDailyThemeData_dailyTheme_works_image.serializer)
      ..add(GDailyThemeData_dailyTheme_works_thumbnailImage.serializer)
      ..add(GDailyThemeReq.serializer)
      ..add(GDailyThemeVars.serializer)
      ..add(GDailyThemesData.serializer)
      ..add(GDailyThemesData_dailyThemes.serializer)
      ..add(GDailyThemesData_dailyThemes_firstWork.serializer)
      ..add(GDailyThemesData_dailyThemes_firstWork_image.serializer)
      ..add(GDailyThemesData_dailyThemes_firstWork_thumbnailImage.serializer)
      ..add(GDailyThemesReq.serializer)
      ..add(GDailyThemesVars.serializer)
      ..add(GDailyThemesWhereInput.serializer)
      ..add(GDeleteCommentInput.serializer)
      ..add(GDeleteFolderInput.serializer)
      ..add(GDeleteStickerInput.serializer)
      ..add(GDeleteWorkBookmarkInput.serializer)
      ..add(GDeleteWorkInput.serializer)
      ..add(GDeleteWorkLikeInput.serializer)
      ..add(GFoldersWhereInput.serializer)
      ..add(GFollowUserInput.serializer)
      ..add(GHotWorksData.serializer)
      ..add(GHotWorksData_hotWorks.serializer)
      ..add(GHotWorksData_hotWorks_image.serializer)
      ..add(GHotWorksData_hotWorks_thumbnailImage.serializer)
      ..add(GHotWorksReq.serializer)
      ..add(GHotWorksVars.serializer)
      ..add(GLoginWithPasswordData.serializer)
      ..add(GLoginWithPasswordData_loginWithPassword.serializer)
      ..add(GLoginWithPasswordInput.serializer)
      ..add(GLoginWithPasswordReq.serializer)
      ..add(GLoginWithPasswordVars.serializer)
      ..add(GMuteTagInput.serializer)
      ..add(GMuteUserInput.serializer)
      ..add(GNotificationType.serializer)
      ..add(GPartialUserFieldsData.serializer)
      ..add(GPartialUserFieldsData_iconImage.serializer)
      ..add(GPartialUserFieldsReq.serializer)
      ..add(GPartialUserFieldsVars.serializer)
      ..add(GPartialWorkFieldsData.serializer)
      ..add(GPartialWorkFieldsData_image.serializer)
      ..add(GPartialWorkFieldsData_thumbnailImage.serializer)
      ..add(GPartialWorkFieldsReq.serializer)
      ..add(GPartialWorkFieldsVars.serializer)
      ..add(GPopularWorksData.serializer)
      ..add(GPopularWorksData_popularWorks.serializer)
      ..add(GPopularWorksData_popularWorks_image.serializer)
      ..add(GPopularWorksData_popularWorks_thumbnailImage.serializer)
      ..add(GPopularWorksReq.serializer)
      ..add(GPopularWorksVars.serializer)
      ..add(GPopularWorksWhereInput.serializer)
      ..add(GPostType.serializer)
      ..add(GRating.serializer)
      ..add(GStickersWhereInput.serializer)
      ..add(GTabWorksWhereInput.serializer)
      ..add(GTagsWhereInput.serializer)
      ..add(GUnfollowUserInput.serializer)
      ..add(GUnmuteTagInput.serializer)
      ..add(GUnmuteUserInput.serializer)
      ..add(GUpdateFolderInput.serializer)
      ..add(GUpdateStickerInput.serializer)
      ..add(GUpdateUserProfileInput.serializer)
      ..add(GUserData.serializer)
      ..add(GUserData_user.serializer)
      ..add(GUserData_user_headerImage.serializer)
      ..add(GUserData_user_iconImage.serializer)
      ..add(GUserFieldsData.serializer)
      ..add(GUserFieldsData_headerImage.serializer)
      ..add(GUserFieldsData_iconImage.serializer)
      ..add(GUserFieldsReq.serializer)
      ..add(GUserFieldsVars.serializer)
      ..add(GUserFolloweesData.serializer)
      ..add(GUserFolloweesData_user.serializer)
      ..add(GUserFolloweesData_user_followees.serializer)
      ..add(GUserFolloweesData_user_followees_iconImage.serializer)
      ..add(GUserFolloweesReq.serializer)
      ..add(GUserFolloweesVars.serializer)
      ..add(GUserFollowersData.serializer)
      ..add(GUserFollowersData_user.serializer)
      ..add(GUserFollowersData_user_followers.serializer)
      ..add(GUserFollowersData_user_followers_iconImage.serializer)
      ..add(GUserFollowersReq.serializer)
      ..add(GUserFollowersVars.serializer)
      ..add(GUserLikedWorksData.serializer)
      ..add(GUserLikedWorksData_user.serializer)
      ..add(GUserLikedWorksData_user_likedWorks.serializer)
      ..add(GUserLikedWorksData_user_likedWorks_image.serializer)
      ..add(GUserLikedWorksData_user_likedWorks_thumbnailImage.serializer)
      ..add(GUserLikedWorksReq.serializer)
      ..add(GUserLikedWorksVars.serializer)
      ..add(GUserReq.serializer)
      ..add(GUserVars.serializer)
      ..add(GUserWorksData.serializer)
      ..add(GUserWorksData_user.serializer)
      ..add(GUserWorksData_user_works.serializer)
      ..add(GUserWorksData_user_works_image.serializer)
      ..add(GUserWorksReq.serializer)
      ..add(GUserWorksVars.serializer)
      ..add(GUserWorksWhereInput.serializer)
      ..add(GUsersWhereInput.serializer)
      ..add(GViewerNotificationsData.serializer)
      ..add(GViewerNotificationsData_viewer.serializer)
      ..add(GViewerNotificationsData_viewer_notifications.serializer)
      ..add(GViewerNotificationsReq.serializer)
      ..add(GViewerNotificationsVars.serializer)
      ..add(GWorkAwardsData.serializer)
      ..add(GWorkAwardsData_workAwards.serializer)
      ..add(GWorkAwardsData_workAwards_work.serializer)
      ..add(GWorkAwardsData_workAwards_work_image.serializer)
      ..add(GWorkAwardsData_workAwards_work_thumbnailImage.serializer)
      ..add(GWorkAwardsReq.serializer)
      ..add(GWorkAwardsVars.serializer)
      ..add(GWorkAwardsWhereInput.serializer)
      ..add(GWorkCommentsData.serializer)
      ..add(GWorkCommentsData_work.serializer)
      ..add(GWorkCommentsData_work_comments.serializer)
      ..add(GWorkCommentsData_work_comments_responses.serializer)
      ..add(GWorkCommentsData_work_comments_responses_sticker.serializer)
      ..add(GWorkCommentsData_work_comments_responses_sticker_image.serializer)
      ..add(GWorkCommentsData_work_comments_responses_user.serializer)
      ..add(GWorkCommentsData_work_comments_responses_user_iconImage.serializer)
      ..add(GWorkCommentsData_work_comments_sticker.serializer)
      ..add(GWorkCommentsData_work_comments_sticker_image.serializer)
      ..add(GWorkCommentsData_work_comments_user.serializer)
      ..add(GWorkCommentsData_work_comments_user_iconImage.serializer)
      ..add(GWorkCommentsReq.serializer)
      ..add(GWorkCommentsVars.serializer)
      ..add(GWorkData.serializer)
      ..add(GWorkData_work.serializer)
      ..add(GWorkData_work_image.serializer)
      ..add(GWorkData_work_user.serializer)
      ..add(GWorkData_work_user_iconImage.serializer)
      ..add(GWorkReq.serializer)
      ..add(GWorkUserFieldsData.serializer)
      ..add(GWorkUserFieldsData_iconImage.serializer)
      ..add(GWorkUserFieldsReq.serializer)
      ..add(GWorkUserFieldsVars.serializer)
      ..add(GWorkVars.serializer)
      ..add(GWorksData.serializer)
      ..add(GWorksData_works.serializer)
      ..add(GWorksData_works_image.serializer)
      ..add(GWorksData_works_thumbnailImage.serializer)
      ..add(GWorksReq.serializer)
      ..add(GWorksVars.serializer)
      ..add(GWorksWhereInput.serializer)
      ..add(G_Any.serializer)
      ..add(Gfederation__FieldSet.serializer)
      ..add(Glink__Import.serializer)
      ..add(Glink__Purpose.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GBestWorksData_bestWorks)]),
          () => new ListBuilder<GBestWorksData_bestWorks>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GDailyThemeData_dailyTheme_works)]),
          () => new ListBuilder<GDailyThemeData_dailyTheme_works>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GDailyThemesData_dailyThemes)]),
          () => new ListBuilder<GDailyThemesData_dailyThemes>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GHotWorksData_hotWorks)]),
          () => new ListBuilder<GHotWorksData_hotWorks>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GPopularWorksData_popularWorks)]),
          () => new ListBuilder<GPopularWorksData_popularWorks>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GUserFolloweesData_user_followees)]),
          () => new ListBuilder<GUserFolloweesData_user_followees>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GUserFollowersData_user_followers)]),
          () => new ListBuilder<GUserFollowersData_user_followers>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GUserLikedWorksData_user_likedWorks)]),
          () => new ListBuilder<GUserLikedWorksData_user_likedWorks>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GUserWorksData_user_works)]),
          () => new ListBuilder<GUserWorksData_user_works>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GViewerNotificationsData_viewer_notifications)
          ]),
          () =>
              new ListBuilder<GViewerNotificationsData_viewer_notifications>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GWorkAwardsData_workAwards)]),
          () => new ListBuilder<GWorkAwardsData_workAwards>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GWorkCommentsData_work_comments)]),
          () => new ListBuilder<GWorkCommentsData_work_comments>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GWorkCommentsData_work_comments_responses)
          ]),
          () => new ListBuilder<GWorkCommentsData_work_comments_responses>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GWorksData_works)]),
          () => new ListBuilder<GWorksData_works>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
