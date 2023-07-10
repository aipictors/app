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
      ..add(GBestWorksData_bestWorks_thumbnailImage.serializer)
      ..add(GBestWorksReq.serializer)
      ..add(GBestWorksVars.serializer)
      ..add(GCacheControlScope.serializer)
      ..add(GCommentFieldsData.serializer)
      ..add(GCommentFieldsData_sticker.serializer)
      ..add(GCommentFieldsData_sticker_image.serializer)
      ..add(GCommentFieldsData_user.serializer)
      ..add(GCommentFieldsData_user_iconImage.serializer)
      ..add(GCommentFieldsReq.serializer)
      ..add(GCommentFieldsVars.serializer)
      ..add(GContributorType.serializer)
      ..add(GCreateFolderInput.serializer)
      ..add(GCreateResponseCommentData.serializer)
      ..add(GCreateResponseCommentData_createResponseComment.serializer)
      ..add(GCreateResponseCommentInput.serializer)
      ..add(GCreateResponseCommentReq.serializer)
      ..add(GCreateResponseCommentVars.serializer)
      ..add(GCreateStickerInput.serializer)
      ..add(GCreateUserInput.serializer)
      ..add(GCreateWorkBookmarkInput.serializer)
      ..add(GCreateWorkCommentData.serializer)
      ..add(GCreateWorkCommentData_createWorkComment.serializer)
      ..add(GCreateWorkCommentInput.serializer)
      ..add(GCreateWorkCommentReq.serializer)
      ..add(GCreateWorkCommentVars.serializer)
      ..add(GCreateWorkInput.serializer)
      ..add(GCreateWorkLikeData.serializer)
      ..add(GCreateWorkLikeData_createWorkLike.serializer)
      ..add(GCreateWorkLikeData_createWorkLike_viewer.serializer)
      ..add(GCreateWorkLikeInput.serializer)
      ..add(GCreateWorkLikeReq.serializer)
      ..add(GCreateWorkLikeVars.serializer)
      ..add(GDailyThemeData.serializer)
      ..add(GDailyThemeData_dailyTheme.serializer)
      ..add(GDailyThemeData_dailyTheme_works.serializer)
      ..add(GDailyThemeData_dailyTheme_works_thumbnailImage.serializer)
      ..add(GDailyThemeData_dailyTheme_works_user.serializer)
      ..add(GDailyThemeData_dailyTheme_works_user_iconImage.serializer)
      ..add(GDailyThemeData_dailyTheme_works_viewer.serializer)
      ..add(GDailyThemeReq.serializer)
      ..add(GDailyThemeVars.serializer)
      ..add(GDailyThemesData.serializer)
      ..add(GDailyThemesData_dailyThemes.serializer)
      ..add(GDailyThemesData_dailyThemes_firstWork.serializer)
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
      ..add(GFeedHotWorksData.serializer)
      ..add(GFeedHotWorksData_hotWorks.serializer)
      ..add(GFeedHotWorksData_hotWorks_thumbnailImage.serializer)
      ..add(GFeedHotWorksData_hotWorks_user.serializer)
      ..add(GFeedHotWorksData_hotWorks_user_iconImage.serializer)
      ..add(GFeedHotWorksData_hotWorks_viewer.serializer)
      ..add(GFeedHotWorksReq.serializer)
      ..add(GFeedHotWorksVars.serializer)
      ..add(GFeedWorksData.serializer)
      ..add(GFeedWorksData_works.serializer)
      ..add(GFeedWorksData_works_thumbnailImage.serializer)
      ..add(GFeedWorksData_works_user.serializer)
      ..add(GFeedWorksData_works_user_iconImage.serializer)
      ..add(GFeedWorksData_works_viewer.serializer)
      ..add(GFeedWorksReq.serializer)
      ..add(GFeedWorksVars.serializer)
      ..add(GFolderData.serializer)
      ..add(GFolderData_folder.serializer)
      ..add(GFolderData_folder_thumbnailImage.serializer)
      ..add(GFolderData_folder_user.serializer)
      ..add(GFolderData_folder_user_iconImage.serializer)
      ..add(GFolderReq.serializer)
      ..add(GFolderVars.serializer)
      ..add(GFolderWorksData.serializer)
      ..add(GFolderWorksData_folder.serializer)
      ..add(GFolderWorksData_folder_works.serializer)
      ..add(GFolderWorksData_folder_works_thumbnailImage.serializer)
      ..add(GFolderWorksReq.serializer)
      ..add(GFolderWorksVars.serializer)
      ..add(GFoldersData.serializer)
      ..add(GFoldersData_folders.serializer)
      ..add(GFoldersData_folders_thumbnailImage.serializer)
      ..add(GFoldersData_folders_user.serializer)
      ..add(GFoldersData_folders_user_iconImage.serializer)
      ..add(GFoldersReq.serializer)
      ..add(GFoldersVars.serializer)
      ..add(GFoldersWhereInput.serializer)
      ..add(GFollowUserInput.serializer)
      ..add(GHotTagsData.serializer)
      ..add(GHotTagsData_hotTags.serializer)
      ..add(GHotTagsData_hotTags_firstWork.serializer)
      ..add(GHotTagsData_hotTags_firstWork_thumbnailImage.serializer)
      ..add(GHotTagsReq.serializer)
      ..add(GHotTagsVars.serializer)
      ..add(GHotWorksData.serializer)
      ..add(GHotWorksData_hotWorks.serializer)
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
      ..add(GPartialFolderFieldsData.serializer)
      ..add(GPartialFolderFieldsData_thumbnailImage.serializer)
      ..add(GPartialFolderFieldsReq.serializer)
      ..add(GPartialFolderFieldsVars.serializer)
      ..add(GPartialStickerFieldsData.serializer)
      ..add(GPartialStickerFieldsData_image.serializer)
      ..add(GPartialStickerFieldsReq.serializer)
      ..add(GPartialStickerFieldsVars.serializer)
      ..add(GPartialTagFieldsData.serializer)
      ..add(GPartialTagFieldsReq.serializer)
      ..add(GPartialTagFieldsVars.serializer)
      ..add(GPartialUserFieldsData.serializer)
      ..add(GPartialUserFieldsData_iconImage.serializer)
      ..add(GPartialUserFieldsReq.serializer)
      ..add(GPartialUserFieldsVars.serializer)
      ..add(GPartialWorkFieldsData.serializer)
      ..add(GPartialWorkFieldsData_thumbnailImage.serializer)
      ..add(GPartialWorkFieldsReq.serializer)
      ..add(GPartialWorkFieldsVars.serializer)
      ..add(GPopularWorksData.serializer)
      ..add(GPopularWorksData_popularWorks.serializer)
      ..add(GPopularWorksData_popularWorks_thumbnailImage.serializer)
      ..add(GPopularWorksReq.serializer)
      ..add(GPopularWorksVars.serializer)
      ..add(GPopularWorksWhereInput.serializer)
      ..add(GPostType.serializer)
      ..add(GRating.serializer)
      ..add(GStickersData.serializer)
      ..add(GStickersData_stickers.serializer)
      ..add(GStickersData_stickers_image.serializer)
      ..add(GStickersReq.serializer)
      ..add(GStickersVars.serializer)
      ..add(GStickersWhereInput.serializer)
      ..add(GTagData.serializer)
      ..add(GTagData_tag.serializer)
      ..add(GTagReq.serializer)
      ..add(GTagVars.serializer)
      ..add(GTagWorksData.serializer)
      ..add(GTagWorksData_tag.serializer)
      ..add(GTagWorksData_tag_works.serializer)
      ..add(GTagWorksData_tag_works_thumbnailImage.serializer)
      ..add(GTagWorksReq.serializer)
      ..add(GTagWorksVars.serializer)
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
      ..add(GViewerFeedWorksData.serializer)
      ..add(GViewerFeedWorksData_viewer.serializer)
      ..add(GViewerFeedWorksData_viewer_feedWorks.serializer)
      ..add(GViewerFeedWorksData_viewer_feedWorks_thumbnailImage.serializer)
      ..add(GViewerFeedWorksData_viewer_feedWorks_user.serializer)
      ..add(GViewerFeedWorksData_viewer_feedWorks_user_iconImage.serializer)
      ..add(GViewerFeedWorksData_viewer_feedWorks_viewer.serializer)
      ..add(GViewerFeedWorksReq.serializer)
      ..add(GViewerFeedWorksVars.serializer)
      ..add(GViewerNotificationsData.serializer)
      ..add(GViewerNotificationsData_viewer.serializer)
      ..add(GViewerNotificationsData_viewer_notifications.serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications_relatedUser.serializer)
      ..add(GViewerNotificationsData_viewer_notifications_relatedUser_iconImage
          .serializer)
      ..add(GViewerNotificationsData_viewer_notifications_sticker.serializer)
      ..add(GViewerNotificationsData_viewer_notifications_sticker_image
          .serializer)
      ..add(GViewerNotificationsData_viewer_notifications_work.serializer)
      ..add(GViewerNotificationsData_viewer_notifications_work_thumbnailImage
          .serializer)
      ..add(GViewerNotificationsReq.serializer)
      ..add(GViewerNotificationsVars.serializer)
      ..add(GWorkAwardsData.serializer)
      ..add(GWorkAwardsData_workAwards.serializer)
      ..add(GWorkAwardsData_workAwards_work.serializer)
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
      ..add(GWorkData_work_viewer.serializer)
      ..add(GWorkReq.serializer)
      ..add(GWorkUserFieldsData.serializer)
      ..add(GWorkUserFieldsData_iconImage.serializer)
      ..add(GWorkUserFieldsReq.serializer)
      ..add(GWorkUserFieldsVars.serializer)
      ..add(GWorkVars.serializer)
      ..add(GWorksData.serializer)
      ..add(GWorksData_works.serializer)
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
              BuiltList, const [const FullType(GFeedHotWorksData_hotWorks)]),
          () => new ListBuilder<GFeedHotWorksData_hotWorks>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFeedWorksData_works)]),
          () => new ListBuilder<GFeedWorksData_works>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFolderWorksData_folder_works)]),
          () => new ListBuilder<GFolderWorksData_folder_works>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFoldersData_folders)]),
          () => new ListBuilder<GFoldersData_folders>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GHotTagsData_hotTags)]),
          () => new ListBuilder<GHotTagsData_hotTags>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GHotWorksData_hotWorks)]),
          () => new ListBuilder<GHotWorksData_hotWorks>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GPopularWorksData_popularWorks)]),
          () => new ListBuilder<GPopularWorksData_popularWorks>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GStickersData_stickers)]),
          () => new ListBuilder<GStickersData_stickers>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GTagWorksData_tag_works)]),
          () => new ListBuilder<GTagWorksData_tag_works>())
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
          const FullType(BuiltList,
              const [const FullType(GViewerFeedWorksData_viewer_feedWorks)]),
          () => new ListBuilder<GViewerFeedWorksData_viewer_feedWorks>())
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
