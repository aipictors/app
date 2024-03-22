// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(FetchPolicy.serializer)
      ..add(GAcceptPromptonRequestInput.serializer)
      ..add(GAccessType.serializer)
      ..add(GAddPromptonTagToWorkInput.serializer)
      ..add(GAddPromptonWorkToFolderInput.serializer)
      ..add(GAlbumData.serializer)
      ..add(GAlbumData_album.serializer)
      ..add(GAlbumData_album_thumbnailImage.serializer)
      ..add(GAlbumData_album_user.serializer)
      ..add(GAlbumData_album_user_iconImage.serializer)
      ..add(GAlbumData_album_user_viewer.serializer)
      ..add(GAlbumReq.serializer)
      ..add(GAlbumVars.serializer)
      ..add(GAlbumWorksData.serializer)
      ..add(GAlbumWorksData_album.serializer)
      ..add(GAlbumWorksData_album_viewer.serializer)
      ..add(GAlbumWorksData_album_works.serializer)
      ..add(GAlbumWorksData_album_works_image.serializer)
      ..add(GAlbumWorksData_album_works_viewer.serializer)
      ..add(GAlbumWorksReq.serializer)
      ..add(GAlbumWorksVars.serializer)
      ..add(GAlbumsData.serializer)
      ..add(GAlbumsData_albums.serializer)
      ..add(GAlbumsData_albums_thumbnailImage.serializer)
      ..add(GAlbumsData_albums_user.serializer)
      ..add(GAlbumsData_albums_user_iconImage.serializer)
      ..add(GAlbumsReq.serializer)
      ..add(GAlbumsVars.serializer)
      ..add(GAlbumsWhereInput.serializer)
      ..add(GAnnouncementsData.serializer)
      ..add(GAnnouncementsData_announcements.serializer)
      ..add(GAnnouncementsReq.serializer)
      ..add(GAnnouncementsVars.serializer)
      ..add(GAwardType.serializer)
      ..add(GAwardsWhereInput.serializer)
      ..add(GBestWorksData.serializer)
      ..add(GBestWorksData_bestWorks.serializer)
      ..add(GBestWorksData_bestWorks_thumbnailImage.serializer)
      ..add(GBestWorksReq.serializer)
      ..add(GBestWorksVars.serializer)
      ..add(GBlockPromptonUserInput.serializer)
      ..add(GCacheControlScope.serializer)
      ..add(GCancelImageGenerationMemoInput.serializer)
      ..add(GCancelImageGenerationReservedTaskInput.serializer)
      ..add(GCancelImageGenerationTaskInput.serializer)
      ..add(GCancelPromptonRequestInput.serializer)
      ..add(GChangePromptonFolderToPaidInput.serializer)
      ..add(GClosePromptonRequestInput.serializer)
      ..add(GCommentFieldsData.serializer)
      ..add(GCommentFieldsData_sticker.serializer)
      ..add(GCommentFieldsData_sticker_image.serializer)
      ..add(GCommentFieldsData_user.serializer)
      ..add(GCommentFieldsData_user_iconImage.serializer)
      ..add(GCommentFieldsReq.serializer)
      ..add(GCommentFieldsVars.serializer)
      ..add(GCommentsOrderBy.serializer)
      ..add(GCommentsWhereInput.serializer)
      ..add(GCreateAccountData.serializer)
      ..add(GCreateAccountData_createAccount.serializer)
      ..add(GCreateAccountInput.serializer)
      ..add(GCreateAccountReq.serializer)
      ..add(GCreateAccountVars.serializer)
      ..add(GCreateAlbumData.serializer)
      ..add(GCreateAlbumData_createFolder.serializer)
      ..add(GCreateAlbumInput.serializer)
      ..add(GCreateAlbumReq.serializer)
      ..add(GCreateAlbumVars.serializer)
      ..add(GCreateAlbumWorkData.serializer)
      ..add(GCreateAlbumWorkData_createAlbumWork.serializer)
      ..add(GCreateAlbumWorkInput.serializer)
      ..add(GCreateAlbumWorkReq.serializer)
      ..add(GCreateAlbumWorkVars.serializer)
      ..add(GCreateFolderData.serializer)
      ..add(GCreateFolderData_createFolder.serializer)
      ..add(GCreateFolderInput.serializer)
      ..add(GCreateFolderReq.serializer)
      ..add(GCreateFolderVars.serializer)
      ..add(GCreateFolderWorkData.serializer)
      ..add(GCreateFolderWorkData_createFolderWork.serializer)
      ..add(GCreateFolderWorkInput.serializer)
      ..add(GCreateFolderWorkReq.serializer)
      ..add(GCreateFolderWorkVars.serializer)
      ..add(GCreateImageGenerationMemoInput.serializer)
      ..add(GCreateImageGenerationTaskInput.serializer)
      ..add(GCreateMessageInput.serializer)
      ..add(GCreateNoteInput.serializer)
      ..add(GCreateNovelInput.serializer)
      ..add(GCreatePassCheckoutSessionInput.serializer)
      ..add(GCreatePromptonAipicRequestInput.serializer)
      ..add(GCreatePromptonChatMessageInput.serializer)
      ..add(GCreatePromptonCoffeeRequestInput.serializer)
      ..add(GCreatePromptonDeliverableInput.serializer)
      ..add(GCreatePromptonFileInput.serializer)
      ..add(GCreatePromptonFolderInput.serializer)
      ..add(GCreatePromptonFolderKeyInput.serializer)
      ..add(GCreatePromptonImageGenerationInput.serializer)
      ..add(GCreatePromptonInquiryInput.serializer)
      ..add(GCreatePromptonPaymentMethodInput.serializer)
      ..add(GCreatePromptonPlanInput.serializer)
      ..add(GCreatePromptonPlanRequestInput.serializer)
      ..add(GCreatePromptonProfileBlockInput.serializer)
      ..add(GCreatePromptonPromptCategoryInput.serializer)
      ..add(GCreatePromptonPromptInput.serializer)
      ..add(GCreatePromptonPromptWorkInput.serializer)
      ..add(GCreatePromptonReactionInput.serializer)
      ..add(GCreatePromptonUserFromTokenInput.serializer)
      ..add(GCreatePromptonUserInput.serializer)
      ..add(GCreatePromptonWorkInput.serializer)
      ..add(GCreatePromptonWorkLikeInput.serializer)
      ..add(GCreateReservedImageGenerationTaskInput.serializer)
      ..add(GCreateResponseCommentData.serializer)
      ..add(GCreateResponseCommentData_createResponseComment.serializer)
      ..add(GCreateResponseCommentInput.serializer)
      ..add(GCreateResponseCommentReq.serializer)
      ..add(GCreateResponseCommentVars.serializer)
      ..add(GCreateStickerData.serializer)
      ..add(GCreateStickerData_createSticker.serializer)
      ..add(GCreateStickerInput.serializer)
      ..add(GCreateStickerReq.serializer)
      ..add(GCreateStickerVars.serializer)
      ..add(GCreateUserStickerData.serializer)
      ..add(GCreateUserStickerData_createUserSticker.serializer)
      ..add(GCreateUserStickerInput.serializer)
      ..add(GCreateUserStickerReq.serializer)
      ..add(GCreateUserStickerVars.serializer)
      ..add(GCreateWorkCommentData.serializer)
      ..add(GCreateWorkCommentData_createWorkComment.serializer)
      ..add(GCreateWorkCommentInput.serializer)
      ..add(GCreateWorkCommentReq.serializer)
      ..add(GCreateWorkCommentVars.serializer)
      ..add(GCreateWorkData.serializer)
      ..add(GCreateWorkData_createWork.serializer)
      ..add(GCreateWorkInput.serializer)
      ..add(GCreateWorkLikeData.serializer)
      ..add(GCreateWorkLikeData_createWorkLike.serializer)
      ..add(GCreateWorkLikeData_createWorkLike_viewer.serializer)
      ..add(GCreateWorkLikeInput.serializer)
      ..add(GCreateWorkLikeReq.serializer)
      ..add(GCreateWorkLikeVars.serializer)
      ..add(GCreateWorkReq.serializer)
      ..add(GCreateWorkVars.serializer)
      ..add(GDailyThemeData.serializer)
      ..add(GDailyThemeData_dailyTheme.serializer)
      ..add(GDailyThemeData_dailyTheme_works.serializer)
      ..add(GDailyThemeData_dailyTheme_works_thumbnailImage.serializer)
      ..add(GDailyThemeReq.serializer)
      ..add(GDailyThemeVars.serializer)
      ..add(GDailyThemesData.serializer)
      ..add(GDailyThemesData_dailyThemes.serializer)
      ..add(GDailyThemesData_dailyThemes_firstWork.serializer)
      ..add(GDailyThemesData_dailyThemes_firstWork_thumbnailImage.serializer)
      ..add(GDailyThemesReq.serializer)
      ..add(GDailyThemesVars.serializer)
      ..add(GDailyThemesWhereInput.serializer)
      ..add(GDecrementPromptonPlanSort.serializer)
      ..add(GDecrementPromptonProfileBlockIndexInput.serializer)
      ..add(GDeleteAlbumData.serializer)
      ..add(GDeleteAlbumData_deleteAlbum.serializer)
      ..add(GDeleteAlbumInput.serializer)
      ..add(GDeleteAlbumReq.serializer)
      ..add(GDeleteAlbumVars.serializer)
      ..add(GDeleteAlbumWorkData.serializer)
      ..add(GDeleteAlbumWorkData_deleteAlbumWork.serializer)
      ..add(GDeleteAlbumWorkInput.serializer)
      ..add(GDeleteAlbumWorkReq.serializer)
      ..add(GDeleteAlbumWorkVars.serializer)
      ..add(GDeleteCommentData.serializer)
      ..add(GDeleteCommentData_deleteComment.serializer)
      ..add(GDeleteCommentInput.serializer)
      ..add(GDeleteCommentReq.serializer)
      ..add(GDeleteCommentVars.serializer)
      ..add(GDeleteFolderData.serializer)
      ..add(GDeleteFolderData_deleteFolder.serializer)
      ..add(GDeleteFolderInput.serializer)
      ..add(GDeleteFolderReq.serializer)
      ..add(GDeleteFolderVars.serializer)
      ..add(GDeleteFolderWorkData.serializer)
      ..add(GDeleteFolderWorkData_deleteFolderWork.serializer)
      ..add(GDeleteFolderWorkInput.serializer)
      ..add(GDeleteFolderWorkReq.serializer)
      ..add(GDeleteFolderWorkVars.serializer)
      ..add(GDeleteImageGenerationMemoInput.serializer)
      ..add(GDeleteImageGenerationTaskInput.serializer)
      ..add(GDeleteMessageInput.serializer)
      ..add(GDeleteNoteInput.serializer)
      ..add(GDeleteNovelInput.serializer)
      ..add(GDeletePromptonFolderInput.serializer)
      ..add(GDeletePromptonIntegrationInput.serializer)
      ..add(GDeletePromptonPlanInput.serializer)
      ..add(GDeletePromptonProfileBlockInput.serializer)
      ..add(GDeletePromptonPromptCategoryInput.serializer)
      ..add(GDeletePromptonPromptInput.serializer)
      ..add(GDeletePromptonReactionInput.serializer)
      ..add(GDeletePromptonWorkInput.serializer)
      ..add(GDeletePromptonWorkLikeInput.serializer)
      ..add(GDeleteStickerData.serializer)
      ..add(GDeleteStickerData_deleteSticker.serializer)
      ..add(GDeleteStickerInput.serializer)
      ..add(GDeleteStickerReq.serializer)
      ..add(GDeleteStickerVars.serializer)
      ..add(GDeleteUserStickerData.serializer)
      ..add(GDeleteUserStickerData_deleteUserSticker.serializer)
      ..add(GDeleteUserStickerInput.serializer)
      ..add(GDeleteUserStickerReq.serializer)
      ..add(GDeleteUserStickerVars.serializer)
      ..add(GDeleteWorkData.serializer)
      ..add(GDeleteWorkData_deleteWork.serializer)
      ..add(GDeleteWorkInput.serializer)
      ..add(GDeleteWorkLikeInput.serializer)
      ..add(GDeleteWorkReq.serializer)
      ..add(GDeleteWorkVars.serializer)
      ..add(GDirection.serializer)
      ..add(GFeedDailyThemeWorksData.serializer)
      ..add(GFeedDailyThemeWorksData_dailyTheme.serializer)
      ..add(GFeedDailyThemeWorksData_dailyTheme_works.serializer)
      ..add(GFeedDailyThemeWorksData_dailyTheme_works_image.serializer)
      ..add(GFeedDailyThemeWorksData_dailyTheme_works_user.serializer)
      ..add(GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage.serializer)
      ..add(GFeedDailyThemeWorksData_dailyTheme_works_user_viewer.serializer)
      ..add(GFeedDailyThemeWorksData_dailyTheme_works_viewer.serializer)
      ..add(GFeedDailyThemeWorksReq.serializer)
      ..add(GFeedDailyThemeWorksVars.serializer)
      ..add(GFeedHotWorksData.serializer)
      ..add(GFeedHotWorksData_hotWorks.serializer)
      ..add(GFeedHotWorksData_hotWorks_image.serializer)
      ..add(GFeedHotWorksData_hotWorks_user.serializer)
      ..add(GFeedHotWorksData_hotWorks_user_iconImage.serializer)
      ..add(GFeedHotWorksData_hotWorks_user_viewer.serializer)
      ..add(GFeedHotWorksData_hotWorks_viewer.serializer)
      ..add(GFeedHotWorksReq.serializer)
      ..add(GFeedHotWorksVars.serializer)
      ..add(GFeedLatestWorksData.serializer)
      ..add(GFeedLatestWorksData_works.serializer)
      ..add(GFeedLatestWorksData_works_image.serializer)
      ..add(GFeedLatestWorksData_works_user.serializer)
      ..add(GFeedLatestWorksData_works_user_iconImage.serializer)
      ..add(GFeedLatestWorksData_works_user_viewer.serializer)
      ..add(GFeedLatestWorksData_works_viewer.serializer)
      ..add(GFeedLatestWorksReq.serializer)
      ..add(GFeedLatestWorksVars.serializer)
      ..add(GFeedPopularWorksData.serializer)
      ..add(GFeedPopularWorksData_popularWorks.serializer)
      ..add(GFeedPopularWorksData_popularWorks_image.serializer)
      ..add(GFeedPopularWorksData_popularWorks_user.serializer)
      ..add(GFeedPopularWorksData_popularWorks_user_iconImage.serializer)
      ..add(GFeedPopularWorksData_popularWorks_user_viewer.serializer)
      ..add(GFeedPopularWorksData_popularWorks_viewer.serializer)
      ..add(GFeedPopularWorksReq.serializer)
      ..add(GFeedPopularWorksVars.serializer)
      ..add(GFlipPromptonFolderWorkIndexInput.serializer)
      ..add(GFolderData.serializer)
      ..add(GFolderData_folder.serializer)
      ..add(GFolderData_folder_user.serializer)
      ..add(GFolderData_folder_user_iconImage.serializer)
      ..add(GFolderData_folder_user_viewer.serializer)
      ..add(GFolderMode.serializer)
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
      ..add(GFoldersData_folders_user.serializer)
      ..add(GFoldersData_folders_user_iconImage.serializer)
      ..add(GFoldersReq.serializer)
      ..add(GFoldersVars.serializer)
      ..add(GFoldersWhereInput.serializer)
      ..add(GFollowNotificationFieldsData.serializer)
      ..add(GFollowNotificationFieldsData_user.serializer)
      ..add(GFollowNotificationFieldsData_user_iconImage.serializer)
      ..add(GFollowNotificationFieldsReq.serializer)
      ..add(GFollowNotificationFieldsVars.serializer)
      ..add(GFollowPromptonUserInput.serializer)
      ..add(GFollowUserData.serializer)
      ..add(GFollowUserData_followUser.serializer)
      ..add(GFollowUserData_followUser_viewer.serializer)
      ..add(GFollowUserInput.serializer)
      ..add(GFollowUserReq.serializer)
      ..add(GFollowUserVars.serializer)
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
      ..add(GHotWorksWhereInput.serializer)
      ..add(GImageGenerationMemoOrderBy.serializer)
      ..add(GImageGenerationSizeType.serializer)
      ..add(GImageGenerationStatus.serializer)
      ..add(GImageGenerationTaskOrderBy.serializer)
      ..add(GImageGenerationTasksWhereInput.serializer)
      ..add(GImageGenerationType.serializer)
      ..add(GImageModelCategory.serializer)
      ..add(GImageStyle.serializer)
      ..add(GIncrementPromptonProfileBlockIndexInput.serializer)
      ..add(GLikedWorkNotificationFieldsData.serializer)
      ..add(GLikedWorkNotificationFieldsData_user.serializer)
      ..add(GLikedWorkNotificationFieldsData_user_iconImage.serializer)
      ..add(GLikedWorkNotificationFieldsData_work.serializer)
      ..add(GLikedWorkNotificationFieldsData_work_thumbnailImage.serializer)
      ..add(GLikedWorkNotificationFieldsReq.serializer)
      ..add(GLikedWorkNotificationFieldsVars.serializer)
      ..add(GLikedWorksSummaryNotificationFieldsData.serializer)
      ..add(GLikedWorksSummaryNotificationFieldsReq.serializer)
      ..add(GLikedWorksSummaryNotificationFieldsVars.serializer)
      ..add(GLoginWithPasswordData.serializer)
      ..add(GLoginWithPasswordData_loginWithPassword.serializer)
      ..add(GLoginWithPasswordInput.serializer)
      ..add(GLoginWithPasswordReq.serializer)
      ..add(GLoginWithPasswordVars.serializer)
      ..add(GMarkPromptonFolderAsPrivateInput.serializer)
      ..add(GMarkPromptonFolderAsPublicInput.serializer)
      ..add(GMarkPromptonPlanAsPrivateInput.serializer)
      ..add(GMarkPromptonPlanAsPublicInput.serializer)
      ..add(GMarkPromptonWorkAsPrivateInput.serializer)
      ..add(GMarkPromptonWorkAsPublicInput.serializer)
      ..add(GMarkPromptonWorkAsUserHeaderInput.serializer)
      ..add(GMilestonesWhereInput.serializer)
      ..add(GMuteTagData.serializer)
      ..add(GMuteTagData_muteTag.serializer)
      ..add(GMuteTagData_muteTag_viewer.serializer)
      ..add(GMuteTagInput.serializer)
      ..add(GMuteTagReq.serializer)
      ..add(GMuteTagVars.serializer)
      ..add(GMuteUserData.serializer)
      ..add(GMuteUserData_muteUser.serializer)
      ..add(GMuteUserData_muteUser_viewer.serializer)
      ..add(GMuteUserInput.serializer)
      ..add(GMuteUserReq.serializer)
      ..add(GMuteUserVars.serializer)
      ..add(GNotificationType.serializer)
      ..add(GPartialAlbumFieldsData.serializer)
      ..add(GPartialAlbumFieldsData_thumbnailImage.serializer)
      ..add(GPartialAlbumFieldsReq.serializer)
      ..add(GPartialAlbumFieldsVars.serializer)
      ..add(GPartialFeedWorkFieldsData.serializer)
      ..add(GPartialFeedWorkFieldsData_image.serializer)
      ..add(GPartialFeedWorkFieldsReq.serializer)
      ..add(GPartialFeedWorkFieldsVars.serializer)
      ..add(GPartialFolderFieldsData.serializer)
      ..add(GPartialFolderFieldsReq.serializer)
      ..add(GPartialFolderFieldsVars.serializer)
      ..add(GPartialPromotionFieldsData.serializer)
      ..add(GPartialPromotionFieldsReq.serializer)
      ..add(GPartialPromotionFieldsVars.serializer)
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
      ..add(GPassType.serializer)
      ..add(GPaymentType.serializer)
      ..add(GPinPromptonWorkInput.serializer)
      ..add(GPopularWorksData.serializer)
      ..add(GPopularWorksData_popularWorks.serializer)
      ..add(GPopularWorksData_popularWorks_thumbnailImage.serializer)
      ..add(GPopularWorksReq.serializer)
      ..add(GPopularWorksVars.serializer)
      ..add(GPopularWorksWhereInput.serializer)
      ..add(GPromotionData.serializer)
      ..add(GPromotionData_promotion.serializer)
      ..add(GPromotionReq.serializer)
      ..add(GPromotionVars.serializer)
      ..add(GPromotionsData.serializer)
      ..add(GPromotionsData_promotions.serializer)
      ..add(GPromotionsReq.serializer)
      ..add(GPromotionsVars.serializer)
      ..add(GPromptonFoldersWhereInput.serializer)
      ..add(GPromptonImageGenerationsWhereInput.serializer)
      ..add(GPromptonLabelsWhereInput.serializer)
      ..add(GPromptonPlansWhereInput.serializer)
      ..add(GPromptonRequestsWhereInput.serializer)
      ..add(GPromptonTagsWhereInput.serializer)
      ..add(GPromptonUserWorksWhereInput.serializer)
      ..add(GPromptonUsersWhereInput.serializer)
      ..add(GPromptonViewerWorksWhereInput.serializer)
      ..add(GPromptonWorksWhereInput.serializer)
      ..add(GRating.serializer)
      ..add(GRejectPromptonRequestInput.serializer)
      ..add(GRemovePromptonTagFromWorkInput.serializer)
      ..add(GRemovePromptonWorkFromFolderInput.serializer)
      ..add(GReportAlbumData.serializer)
      ..add(GReportAlbumInput.serializer)
      ..add(GReportAlbumReq.serializer)
      ..add(GReportAlbumVars.serializer)
      ..add(GReportCommentData.serializer)
      ..add(GReportCommentInput.serializer)
      ..add(GReportCommentReq.serializer)
      ..add(GReportCommentVars.serializer)
      ..add(GReportFolderData.serializer)
      ..add(GReportFolderInput.serializer)
      ..add(GReportFolderReq.serializer)
      ..add(GReportFolderVars.serializer)
      ..add(GReportReason.serializer)
      ..add(GReportStickerData.serializer)
      ..add(GReportStickerInput.serializer)
      ..add(GReportStickerReq.serializer)
      ..add(GReportStickerVars.serializer)
      ..add(GReportUserData.serializer)
      ..add(GReportUserInput.serializer)
      ..add(GReportUserReq.serializer)
      ..add(GReportUserVars.serializer)
      ..add(GReportWorkData.serializer)
      ..add(GReportWorkInput.serializer)
      ..add(GReportWorkReq.serializer)
      ..add(GReportWorkVars.serializer)
      ..add(GSignImageGenerationTermsInput.serializer)
      ..add(GStickerData.serializer)
      ..add(GStickerData_sticker.serializer)
      ..add(GStickerData_sticker_image.serializer)
      ..add(GStickerData_sticker_user.serializer)
      ..add(GStickerData_sticker_user_iconImage.serializer)
      ..add(GStickerData_sticker_user_viewer.serializer)
      ..add(GStickerGenre.serializer)
      ..add(GStickerReq.serializer)
      ..add(GStickerVars.serializer)
      ..add(GStickersData.serializer)
      ..add(GStickersData_stickers.serializer)
      ..add(GStickersData_stickers_image.serializer)
      ..add(GStickersReq.serializer)
      ..add(GStickersVars.serializer)
      ..add(GStickersWhereInput.serializer)
      ..add(GSubWorkFieldsData.serializer)
      ..add(GSubWorkFieldsData_image.serializer)
      ..add(GSubWorkFieldsData_thumbnailImage.serializer)
      ..add(GSubWorkFieldsReq.serializer)
      ..add(GSubWorkFieldsVars.serializer)
      ..add(GTagData.serializer)
      ..add(GTagData_tag.serializer)
      ..add(GTagData_tag_viewer.serializer)
      ..add(GTagReq.serializer)
      ..add(GTagVars.serializer)
      ..add(GTagWorksData.serializer)
      ..add(GTagWorksData_tag.serializer)
      ..add(GTagWorksData_tag_works.serializer)
      ..add(GTagWorksData_tag_works_thumbnailImage.serializer)
      ..add(GTagWorksReq.serializer)
      ..add(GTagWorksVars.serializer)
      ..add(GTagsData.serializer)
      ..add(GTagsData_tags.serializer)
      ..add(GTagsData_tags_viewer.serializer)
      ..add(GTagsReq.serializer)
      ..add(GTagsVars.serializer)
      ..add(GTagsWhereInput.serializer)
      ..add(GTestPromptonIntegrationInput.serializer)
      ..add(GUnfollowPromptonUserInput.serializer)
      ..add(GUnfollowUserInput.serializer)
      ..add(GUnmuteTagInput.serializer)
      ..add(GUnmuteUserInput.serializer)
      ..add(GUnpinPromptonWorkInput.serializer)
      ..add(GUnwatchFolderInput.serializer)
      ..add(GUpdateAccountFcmTokenData.serializer)
      ..add(GUpdateAccountFcmTokenData_updateAccountFcmToken.serializer)
      ..add(GUpdateAccountFcmTokenInput.serializer)
      ..add(GUpdateAccountFcmTokenReq.serializer)
      ..add(GUpdateAccountFcmTokenVars.serializer)
      ..add(GUpdateAccountLoginData.serializer)
      ..add(GUpdateAccountLoginData_updateAccountLogin.serializer)
      ..add(GUpdateAccountLoginInput.serializer)
      ..add(GUpdateAccountLoginReq.serializer)
      ..add(GUpdateAccountLoginVars.serializer)
      ..add(GUpdateAccountPasswordData.serializer)
      ..add(GUpdateAccountPasswordData_updateAccountPassword.serializer)
      ..add(GUpdateAccountPasswordInput.serializer)
      ..add(GUpdateAccountPasswordReq.serializer)
      ..add(GUpdateAccountPasswordVars.serializer)
      ..add(GUpdateAccountWebFcmTokenInput.serializer)
      ..add(GUpdateAlbumInput.serializer)
      ..add(GUpdateFolderData.serializer)
      ..add(GUpdateFolderData_updateFolder.serializer)
      ..add(GUpdateFolderInput.serializer)
      ..add(GUpdateFolderReq.serializer)
      ..add(GUpdateFolderVars.serializer)
      ..add(GUpdateImageGenerationMemoInput.serializer)
      ..add(GUpdateNoteInput.serializer)
      ..add(GUpdateNovelInput.serializer)
      ..add(GUpdatePromptonFolderInput.serializer)
      ..add(GUpdatePromptonFolderSortInput.serializer)
      ..add(GUpdatePromptonPlanInput.serializer)
      ..add(GUpdatePromptonPlanSortInput.serializer)
      ..add(GUpdatePromptonProfileBlockInput.serializer)
      ..add(GUpdatePromptonPromptCategoryInput.serializer)
      ..add(GUpdatePromptonPromptInput.serializer)
      ..add(GUpdatePromptonUserAvatarInput.serializer)
      ..add(GUpdatePromptonUserHeaderImageInput.serializer)
      ..add(GUpdatePromptonUserInvoiceRegistrationNumberInput.serializer)
      ..add(GUpdatePromptonUserLoginInput.serializer)
      ..add(GUpdatePromptonUserProfileInput.serializer)
      ..add(GUpdatePromptonWorkInput.serializer)
      ..add(GUpdateProtectedImageGenerationTaskInput.serializer)
      ..add(GUpdateRatingImageGenerationModelInput.serializer)
      ..add(GUpdateRatingImageGenerationTaskInput.serializer)
      ..add(GUpdateStickerData.serializer)
      ..add(GUpdateStickerData_updateSticker.serializer)
      ..add(GUpdateStickerInput.serializer)
      ..add(GUpdateStickerReq.serializer)
      ..add(GUpdateStickerVars.serializer)
      ..add(GUpdateUserProfileData.serializer)
      ..add(GUpdateUserProfileData_updateUserProfile.serializer)
      ..add(GUpdateUserProfileInput.serializer)
      ..add(GUpdateUserProfileReq.serializer)
      ..add(GUpdateUserProfileVars.serializer)
      ..add(GUpdateWorkData.serializer)
      ..add(GUpdateWorkData_updateWork.serializer)
      ..add(GUpdateWorkInput.serializer)
      ..add(GUpdateWorkReq.serializer)
      ..add(GUpdateWorkVars.serializer)
      ..add(GUserAlbumInput.serializer)
      ..add(GUserAlbumsData.serializer)
      ..add(GUserAlbumsData_user.serializer)
      ..add(GUserAlbumsData_user_albums.serializer)
      ..add(GUserAlbumsData_user_albums_thumbnailImage.serializer)
      ..add(GUserAlbumsReq.serializer)
      ..add(GUserAlbumsVars.serializer)
      ..add(GUserData.serializer)
      ..add(GUserData_user.serializer)
      ..add(GUserData_user_headerImage.serializer)
      ..add(GUserData_user_iconImage.serializer)
      ..add(GUserData_user_viewer.serializer)
      ..add(GUserFieldsData.serializer)
      ..add(GUserFieldsData_headerImage.serializer)
      ..add(GUserFieldsData_iconImage.serializer)
      ..add(GUserFieldsReq.serializer)
      ..add(GUserFieldsVars.serializer)
      ..add(GUserFolderInput.serializer)
      ..add(GUserFoldersData.serializer)
      ..add(GUserFoldersData_user.serializer)
      ..add(GUserFoldersData_user_folders.serializer)
      ..add(GUserFoldersReq.serializer)
      ..add(GUserFoldersVars.serializer)
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
      ..add(GUserReq.serializer)
      ..add(GUserStickersData.serializer)
      ..add(GUserStickersData_viewer.serializer)
      ..add(GUserStickersData_viewer_userStickers.serializer)
      ..add(GUserStickersData_viewer_userStickers_image.serializer)
      ..add(GUserStickersReq.serializer)
      ..add(GUserStickersVars.serializer)
      ..add(GUserVars.serializer)
      ..add(GUserWorksData.serializer)
      ..add(GUserWorksData_user.serializer)
      ..add(GUserWorksData_user_works.serializer)
      ..add(GUserWorksData_user_works_thumbnailImage.serializer)
      ..add(GUserWorksReq.serializer)
      ..add(GUserWorksVars.serializer)
      ..add(GUserWorksWhereInput.serializer)
      ..add(GUsersData.serializer)
      ..add(GUsersData_users.serializer)
      ..add(GUsersData_users_iconImage.serializer)
      ..add(GUsersReq.serializer)
      ..add(GUsersVars.serializer)
      ..add(GUsersWhereInput.serializer)
      ..add(GViewerAlbumsData.serializer)
      ..add(GViewerAlbumsData_viewer.serializer)
      ..add(GViewerAlbumsData_viewer_albums.serializer)
      ..add(GViewerAlbumsData_viewer_albums_thumbnailImage.serializer)
      ..add(GViewerAlbumsReq.serializer)
      ..add(GViewerAlbumsVars.serializer)
      ..add(GViewerFeedWorksData.serializer)
      ..add(GViewerFeedWorksData_viewer.serializer)
      ..add(GViewerFeedWorksData_viewer_feedWorks.serializer)
      ..add(GViewerFeedWorksData_viewer_feedWorks_image.serializer)
      ..add(GViewerFeedWorksData_viewer_feedWorks_user.serializer)
      ..add(GViewerFeedWorksData_viewer_feedWorks_user_iconImage.serializer)
      ..add(GViewerFeedWorksData_viewer_feedWorks_user_viewer.serializer)
      ..add(GViewerFeedWorksData_viewer_feedWorks_viewer.serializer)
      ..add(GViewerFeedWorksReq.serializer)
      ..add(GViewerFeedWorksVars.serializer)
      ..add(GViewerFoldersData.serializer)
      ..add(GViewerFoldersData_viewer.serializer)
      ..add(GViewerFoldersData_viewer_folders.serializer)
      ..add(GViewerFoldersReq.serializer)
      ..add(GViewerFoldersVars.serializer)
      ..add(GViewerLikedWorksData.serializer)
      ..add(GViewerLikedWorksData_viewer.serializer)
      ..add(GViewerLikedWorksData_viewer_likedWorks.serializer)
      ..add(GViewerLikedWorksData_viewer_likedWorks_thumbnailImage.serializer)
      ..add(GViewerLikedWorksReq.serializer)
      ..add(GViewerLikedWorksVars.serializer)
      ..add(GViewerMutedTagsData.serializer)
      ..add(GViewerMutedTagsData_viewer.serializer)
      ..add(GViewerMutedTagsData_viewer_mutedTags.serializer)
      ..add(GViewerMutedTagsReq.serializer)
      ..add(GViewerMutedTagsVars.serializer)
      ..add(GViewerMutedUsersData.serializer)
      ..add(GViewerMutedUsersData_viewer.serializer)
      ..add(GViewerMutedUsersData_viewer_mutedUsers.serializer)
      ..add(GViewerMutedUsersData_viewer_mutedUsers_iconImage.serializer)
      ..add(GViewerMutedUsersReq.serializer)
      ..add(GViewerMutedUsersVars.serializer)
      ..add(GViewerNotificationsData.serializer)
      ..add(GViewerNotificationsData_viewer.serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asFollowNotificationNode
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work
              .serializer)
      ..add(
          GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage
              .serializer)
      ..add(GViewerNotificationsData_viewer_notifications__base.serializer)
      ..add(GViewerNotificationsReq.serializer)
      ..add(GViewerNotificationsVars.serializer)
      ..add(GViewerUserData.serializer)
      ..add(GViewerUserData_viewer.serializer)
      ..add(GViewerUserData_viewer_user.serializer)
      ..add(GViewerUserData_viewer_user_headerImage.serializer)
      ..add(GViewerUserData_viewer_user_iconImage.serializer)
      ..add(GViewerUserReq.serializer)
      ..add(GViewerUserVars.serializer)
      ..add(GViewerWorksData.serializer)
      ..add(GViewerWorksData_viewer.serializer)
      ..add(GViewerWorksData_viewer_works.serializer)
      ..add(GViewerWorksData_viewer_works_thumbnailImage.serializer)
      ..add(GViewerWorksReq.serializer)
      ..add(GViewerWorksVars.serializer)
      ..add(GWatchFolderInput.serializer)
      ..add(GWorkAwardNotificationFieldsData.serializer)
      ..add(GWorkAwardNotificationFieldsData_work.serializer)
      ..add(GWorkAwardNotificationFieldsData_work_thumbnailImage.serializer)
      ..add(GWorkAwardNotificationFieldsReq.serializer)
      ..add(GWorkAwardNotificationFieldsVars.serializer)
      ..add(GWorkAwardsData.serializer)
      ..add(GWorkAwardsData_workAwards.serializer)
      ..add(GWorkAwardsData_workAwards_work.serializer)
      ..add(GWorkAwardsData_workAwards_work_thumbnailImage.serializer)
      ..add(GWorkAwardsReq.serializer)
      ..add(GWorkAwardsVars.serializer)
      ..add(GWorkAwardsWhereInput.serializer)
      ..add(GWorkCommentNotificationFieldsData.serializer)
      ..add(GWorkCommentNotificationFieldsData_sticker.serializer)
      ..add(GWorkCommentNotificationFieldsData_sticker_image.serializer)
      ..add(GWorkCommentNotificationFieldsData_user.serializer)
      ..add(GWorkCommentNotificationFieldsData_user_iconImage.serializer)
      ..add(GWorkCommentNotificationFieldsData_work.serializer)
      ..add(GWorkCommentNotificationFieldsData_work_thumbnailImage.serializer)
      ..add(GWorkCommentNotificationFieldsReq.serializer)
      ..add(GWorkCommentNotificationFieldsVars.serializer)
      ..add(GWorkCommentReplyNotificationFieldsData.serializer)
      ..add(GWorkCommentReplyNotificationFieldsData_sticker.serializer)
      ..add(GWorkCommentReplyNotificationFieldsData_sticker_image.serializer)
      ..add(GWorkCommentReplyNotificationFieldsData_user.serializer)
      ..add(GWorkCommentReplyNotificationFieldsData_user_iconImage.serializer)
      ..add(GWorkCommentReplyNotificationFieldsData_work.serializer)
      ..add(GWorkCommentReplyNotificationFieldsData_work_thumbnailImage
          .serializer)
      ..add(GWorkCommentReplyNotificationFieldsReq.serializer)
      ..add(GWorkCommentReplyNotificationFieldsVars.serializer)
      ..add(GWorkCommentResponsesData.serializer)
      ..add(GWorkCommentResponsesData_work.serializer)
      ..add(GWorkCommentResponsesData_work_comment.serializer)
      ..add(GWorkCommentResponsesData_work_comment_responses.serializer)
      ..add(GWorkCommentResponsesData_work_comment_responses_sticker.serializer)
      ..add(GWorkCommentResponsesData_work_comment_responses_sticker_image
          .serializer)
      ..add(GWorkCommentResponsesData_work_comment_responses_user.serializer)
      ..add(GWorkCommentResponsesData_work_comment_responses_user_iconImage
          .serializer)
      ..add(GWorkCommentResponsesData_work_comment_sticker.serializer)
      ..add(GWorkCommentResponsesData_work_comment_sticker_image.serializer)
      ..add(GWorkCommentResponsesData_work_comment_user.serializer)
      ..add(GWorkCommentResponsesData_work_comment_user_iconImage.serializer)
      ..add(GWorkCommentResponsesReq.serializer)
      ..add(GWorkCommentResponsesVars.serializer)
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
      ..add(GWorkData_work_subWorks.serializer)
      ..add(GWorkData_work_subWorks_image.serializer)
      ..add(GWorkData_work_subWorks_thumbnailImage.serializer)
      ..add(GWorkData_work_user.serializer)
      ..add(GWorkData_work_user_iconImage.serializer)
      ..add(GWorkData_work_user_viewer.serializer)
      ..add(GWorkData_work_viewer.serializer)
      ..add(GWorkOrderBy.serializer)
      ..add(GWorkReq.serializer)
      ..add(GWorkType.serializer)
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
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GAlbumWorksData_album_works)]),
          () => new ListBuilder<GAlbumWorksData_album_works>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GAlbumsData_albums)]),
          () => new ListBuilder<GAlbumsData_albums>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GAnnouncementsData_announcements)]),
          () => new ListBuilder<GAnnouncementsData_announcements>())
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
          const FullType(BuiltList, const [
            const FullType(GFeedDailyThemeWorksData_dailyTheme_works)
          ]),
          () => new ListBuilder<GFeedDailyThemeWorksData_dailyTheme_works>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFeedHotWorksData_hotWorks)]),
          () => new ListBuilder<GFeedHotWorksData_hotWorks>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GFeedLatestWorksData_works)]),
          () => new ListBuilder<GFeedLatestWorksData_works>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GFeedPopularWorksData_popularWorks)]),
          () => new ListBuilder<GFeedPopularWorksData_popularWorks>())
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
              BuiltList, const [const FullType(GPromotionsData_promotions)]),
          () => new ListBuilder<GPromotionsData_promotions>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GStickersData_stickers)]),
          () => new ListBuilder<GStickersData_stickers>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GTagWorksData_tag_works)]),
          () => new ListBuilder<GTagWorksData_tag_works>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GTagsData_tags)]),
          () => new ListBuilder<GTagsData_tags>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GUserAlbumsData_user_albums)]),
          () => new ListBuilder<GUserAlbumsData_user_albums>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GUserFoldersData_user_folders)]),
          () => new ListBuilder<GUserFoldersData_user_folders>())
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
              const [const FullType(GUserStickersData_viewer_userStickers)]),
          () => new ListBuilder<GUserStickersData_viewer_userStickers>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GUserWorksData_user_works)]),
          () => new ListBuilder<GUserWorksData_user_works>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GUsersData_users)]),
          () => new ListBuilder<GUsersData_users>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GViewerAlbumsData_viewer_albums)]),
          () => new ListBuilder<GViewerAlbumsData_viewer_albums>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GViewerFeedWorksData_viewer_feedWorks)]),
          () => new ListBuilder<GViewerFeedWorksData_viewer_feedWorks>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GViewerFoldersData_viewer_folders)]),
          () => new ListBuilder<GViewerFoldersData_viewer_folders>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GViewerLikedWorksData_viewer_likedWorks)]),
          () => new ListBuilder<GViewerLikedWorksData_viewer_likedWorks>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GViewerMutedTagsData_viewer_mutedTags)]),
          () => new ListBuilder<GViewerMutedTagsData_viewer_mutedTags>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GViewerMutedUsersData_viewer_mutedUsers)]),
          () => new ListBuilder<GViewerMutedUsersData_viewer_mutedUsers>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GViewerNotificationsData_viewer_notifications)
          ]),
          () =>
              new ListBuilder<GViewerNotificationsData_viewer_notifications>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GViewerWorksData_viewer_works)]),
          () => new ListBuilder<GViewerWorksData_viewer_works>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GWorkAwardsData_workAwards)]),
          () => new ListBuilder<GWorkAwardsData_workAwards>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GWorkCommentResponsesData_work_comment_responses)
          ]),
          () => new ListBuilder<
              GWorkCommentResponsesData_work_comment_responses>())
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
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GWorkData_work_subWorks)]),
          () => new ListBuilder<GWorkData_work_subWorks>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
