// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:aipictors/__generated__/schema.schema.gql.dart'
    show
        GAcceptPromptonRequestInput,
        GAccessType,
        GAddPromptonTagToWorkInput,
        GAddPromptonWorkToFolderInput,
        GAwardType,
        GAwardsWhereInput,
        GBlockPromptonUserInput,
        GCacheControlScope,
        GCancelPromptonRequestInput,
        GChangePromptonFolderToPaidInput,
        GClosePromptonRequestInput,
        GContributorType,
        GCreateAccountInput,
        GCreateFolderInput,
        GCreatePromptonChatMessageInput,
        GCreatePromptonCoffeeRequestInput,
        GCreatePromptonDeliverableInput,
        GCreatePromptonFileInput,
        GCreatePromptonFolderInput,
        GCreatePromptonFolderKeyInput,
        GCreatePromptonFolderViewInput,
        GCreatePromptonInquiryInput,
        GCreatePromptonPaymentMethodInput,
        GCreatePromptonPlanInput,
        GCreatePromptonPlanRequestInput,
        GCreatePromptonPlanViewInput,
        GCreatePromptonProfileBlockInput,
        GCreatePromptonPromptCategoryInput,
        GCreatePromptonPromptInput,
        GCreatePromptonPromptWorkInput,
        GCreatePromptonReactionInput,
        GCreatePromptonThumbnailFileInput,
        GCreatePromptonUserInput,
        GCreatePromptonUserViewInput,
        GCreatePromptonWorkBookmarkInput,
        GCreatePromptonWorkInput,
        GCreatePromptonWorkLikeInput,
        GCreatePromptonWorkViewInput,
        GCreateResponseCommentInput,
        GCreateStickerInput,
        GCreateWorkBookmarkInput,
        GCreateWorkCommentInput,
        GCreateWorkInput,
        GCreateWorkLikeInput,
        GDailyThemesWhereInput,
        GDecrementPromptonPlanSort,
        GDecrementPromptonProfileBlockIndexInput,
        GDeleteCommentInput,
        GDeleteFolderInput,
        GDeletePromptonFolderInput,
        GDeletePromptonIntegrationInput,
        GDeletePromptonPlanInput,
        GDeletePromptonProfileBlockInput,
        GDeletePromptonPromptCategoryInput,
        GDeletePromptonPromptInput,
        GDeletePromptonReactionInput,
        GDeletePromptonWorkBookmarkInput,
        GDeletePromptonWorkInput,
        GDeletePromptonWorkLikeInput,
        GDeleteStickerInput,
        GDeleteWorkBookmarkInput,
        GDeleteWorkInput,
        GDeleteWorkLikeInput,
        GFlipPromptonFolderWorkIndexInput,
        GFolderMode,
        GFoldersWhereInput,
        GFollowPromptonUserInput,
        GFollowUserInput,
        GIncrementPromptonProfileBlockIndexInput,
        GLoginPromptonInput,
        GLoginWithPasswordInput,
        GMarkPromptonFolderAsPrivateInput,
        GMarkPromptonFolderAsPublicInput,
        GMarkPromptonPlanAsPrivateInput,
        GMarkPromptonPlanAsPublicInput,
        GMarkPromptonWorkAsPrivateInput,
        GMarkPromptonWorkAsPublicInput,
        GMarkPromptonWorkAsUserHeaderInput,
        GMuteTagInput,
        GMuteUserInput,
        GNotificationType,
        GPinPromptonWorkInput,
        GPopularWorksWhereInput,
        GPostType,
        GPromptonFoldersWhereInput,
        GPromptonLabelsWhereInput,
        GPromptonPlansWhereInput,
        GPromptonRequestsWhereInput,
        GPromptonTagsWhereInput,
        GPromptonUserWorksWhereInput,
        GPromptonUsersWhereInput,
        GPromptonViewerWorksWhereInput,
        GPromptonWorksWhereInput,
        GRating,
        GRejectPromptonRequestInput,
        GRemovePromptonTagFromWorkInput,
        GRemovePromptonWorkFromFolderInput,
        GReportCommentInput,
        GReportFolderInput,
        GReportReason,
        GReportStickerInput,
        GReportUserInput,
        GReportWorkInput,
        GStickersWhereInput,
        GTagsWhereInput,
        GTestPromptonIntegrationInput,
        GUnfollowPromptonUserInput,
        GUnfollowUserInput,
        GUnmuteTagInput,
        GUnmuteUserInput,
        GUnpinPromptonWorkInput,
        GUpdateAccountLoginInput,
        GUpdateAccountPasswordInput,
        GUpdateFolderInput,
        GUpdatePromptonFolderInput,
        GUpdatePromptonFolderSortInput,
        GUpdatePromptonPlanInput,
        GUpdatePromptonPlanSortInput,
        GUpdatePromptonProfileBlockInput,
        GUpdatePromptonPromptCategoryInput,
        GUpdatePromptonPromptInput,
        GUpdatePromptonUserAvatarInput,
        GUpdatePromptonUserHeaderImageInput,
        GUpdatePromptonUserLoginInput,
        GUpdatePromptonUserProfileInput,
        GUpdatePromptonWorkInput,
        GUpdateStickerInput,
        GUpdateUserLoginInput,
        GUpdateUserPasswordInput,
        GUpdateUserProfileInput,
        GUpdateWorkInput,
        GUserWorksWhereInput,
        GUsersWhereInput,
        GWorkAwardsWhereInput,
        GWorksWhereInput;
import 'package:aipictors/graphql/__generated__/best_works.data.gql.dart'
    show
        GBestWorksData,
        GBestWorksData_bestWorks,
        GBestWorksData_bestWorks_thumbnailImage;
import 'package:aipictors/graphql/__generated__/best_works.req.gql.dart'
    show GBestWorksReq;
import 'package:aipictors/graphql/__generated__/best_works.var.gql.dart'
    show GBestWorksVars;
import 'package:aipictors/graphql/__generated__/contributors.data.gql.dart'
    show
        GContributorsData,
        GContributorsData_contributors,
        GContributorsData_contributors_user,
        GContributorsData_contributors_user_iconImage;
import 'package:aipictors/graphql/__generated__/contributors.req.gql.dart'
    show GContributorsReq;
import 'package:aipictors/graphql/__generated__/contributors.var.gql.dart'
    show GContributorsVars;
import 'package:aipictors/graphql/__generated__/daily_theme.data.gql.dart'
    show
        GDailyThemeData,
        GDailyThemeData_dailyTheme,
        GDailyThemeData_dailyTheme_works,
        GDailyThemeData_dailyTheme_works_thumbnailImage;
import 'package:aipictors/graphql/__generated__/daily_theme.req.gql.dart'
    show GDailyThemeReq;
import 'package:aipictors/graphql/__generated__/daily_theme.var.gql.dart'
    show GDailyThemeVars;
import 'package:aipictors/graphql/__generated__/daily_themes.data.gql.dart'
    show
        GDailyThemesData,
        GDailyThemesData_dailyThemes,
        GDailyThemesData_dailyThemes_firstWork,
        GDailyThemesData_dailyThemes_firstWork_thumbnailImage;
import 'package:aipictors/graphql/__generated__/daily_themes.req.gql.dart'
    show GDailyThemesReq;
import 'package:aipictors/graphql/__generated__/daily_themes.var.gql.dart'
    show GDailyThemesVars;
import 'package:aipictors/graphql/__generated__/feed_daily_theme_works.data.gql.dart'
    show
        GFeedDailyThemeWorksData,
        GFeedDailyThemeWorksData_dailyTheme,
        GFeedDailyThemeWorksData_dailyTheme_works,
        GFeedDailyThemeWorksData_dailyTheme_works_image,
        GFeedDailyThemeWorksData_dailyTheme_works_user,
        GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage,
        GFeedDailyThemeWorksData_dailyTheme_works_user_viewer,
        GFeedDailyThemeWorksData_dailyTheme_works_viewer;
import 'package:aipictors/graphql/__generated__/feed_daily_theme_works.req.gql.dart'
    show GFeedDailyThemeWorksReq;
import 'package:aipictors/graphql/__generated__/feed_daily_theme_works.var.gql.dart'
    show GFeedDailyThemeWorksVars;
import 'package:aipictors/graphql/__generated__/feed_hot_works.data.gql.dart'
    show
        GFeedHotWorksData,
        GFeedHotWorksData_hotWorks,
        GFeedHotWorksData_hotWorks_image,
        GFeedHotWorksData_hotWorks_user,
        GFeedHotWorksData_hotWorks_user_iconImage,
        GFeedHotWorksData_hotWorks_user_viewer,
        GFeedHotWorksData_hotWorks_viewer;
import 'package:aipictors/graphql/__generated__/feed_hot_works.req.gql.dart'
    show GFeedHotWorksReq;
import 'package:aipictors/graphql/__generated__/feed_hot_works.var.gql.dart'
    show GFeedHotWorksVars;
import 'package:aipictors/graphql/__generated__/feed_latest_works.data.gql.dart'
    show
        GFeedLatestWorksData,
        GFeedLatestWorksData_works,
        GFeedLatestWorksData_works_image,
        GFeedLatestWorksData_works_user,
        GFeedLatestWorksData_works_user_iconImage,
        GFeedLatestWorksData_works_user_viewer,
        GFeedLatestWorksData_works_viewer;
import 'package:aipictors/graphql/__generated__/feed_latest_works.req.gql.dart'
    show GFeedLatestWorksReq;
import 'package:aipictors/graphql/__generated__/feed_latest_works.var.gql.dart'
    show GFeedLatestWorksVars;
import 'package:aipictors/graphql/__generated__/folder.data.gql.dart'
    show
        GFolderData,
        GFolderData_folder,
        GFolderData_folder_thumbnailImage,
        GFolderData_folder_user,
        GFolderData_folder_user_iconImage,
        GFolderData_folder_user_viewer,
        GFolderData_folder_viewer;
import 'package:aipictors/graphql/__generated__/folder.req.gql.dart'
    show GFolderReq;
import 'package:aipictors/graphql/__generated__/folder.var.gql.dart'
    show GFolderVars;
import 'package:aipictors/graphql/__generated__/folder_works.data.gql.dart'
    show
        GFolderWorksData,
        GFolderWorksData_folder,
        GFolderWorksData_folder_works,
        GFolderWorksData_folder_works_thumbnailImage;
import 'package:aipictors/graphql/__generated__/folder_works.req.gql.dart'
    show GFolderWorksReq;
import 'package:aipictors/graphql/__generated__/folder_works.var.gql.dart'
    show GFolderWorksVars;
import 'package:aipictors/graphql/__generated__/folders.data.gql.dart'
    show
        GFoldersData,
        GFoldersData_folders,
        GFoldersData_folders_thumbnailImage,
        GFoldersData_folders_user,
        GFoldersData_folders_user_iconImage;
import 'package:aipictors/graphql/__generated__/folders.req.gql.dart'
    show GFoldersReq;
import 'package:aipictors/graphql/__generated__/folders.var.gql.dart'
    show GFoldersVars;
import 'package:aipictors/graphql/__generated__/hot_tags.data.gql.dart'
    show
        GHotTagsData,
        GHotTagsData_hotTags,
        GHotTagsData_hotTags_firstWork,
        GHotTagsData_hotTags_firstWork_thumbnailImage;
import 'package:aipictors/graphql/__generated__/hot_tags.req.gql.dart'
    show GHotTagsReq;
import 'package:aipictors/graphql/__generated__/hot_tags.var.gql.dart'
    show GHotTagsVars;
import 'package:aipictors/graphql/__generated__/hot_works.data.gql.dart'
    show
        GHotWorksData,
        GHotWorksData_hotWorks,
        GHotWorksData_hotWorks_thumbnailImage;
import 'package:aipictors/graphql/__generated__/hot_works.req.gql.dart'
    show GHotWorksReq;
import 'package:aipictors/graphql/__generated__/hot_works.var.gql.dart'
    show GHotWorksVars;
import 'package:aipictors/graphql/__generated__/popular_works.data.gql.dart'
    show
        GPopularWorksData,
        GPopularWorksData_popularWorks,
        GPopularWorksData_popularWorks_thumbnailImage;
import 'package:aipictors/graphql/__generated__/popular_works.req.gql.dart'
    show GPopularWorksReq;
import 'package:aipictors/graphql/__generated__/popular_works.var.gql.dart'
    show GPopularWorksVars;
import 'package:aipictors/graphql/__generated__/promotion.data.gql.dart'
    show GPromotionData, GPromotionData_promotion;
import 'package:aipictors/graphql/__generated__/promotion.req.gql.dart'
    show GPromotionReq;
import 'package:aipictors/graphql/__generated__/promotion.var.gql.dart'
    show GPromotionVars;
import 'package:aipictors/graphql/__generated__/promotions.data.gql.dart'
    show GPromotionsData, GPromotionsData_promotions;
import 'package:aipictors/graphql/__generated__/promotions.req.gql.dart'
    show GPromotionsReq;
import 'package:aipictors/graphql/__generated__/promotions.var.gql.dart'
    show GPromotionsVars;
import 'package:aipictors/graphql/__generated__/sticker.data.gql.dart'
    show GStickerData, GStickerData_sticker, GStickerData_sticker_image;
import 'package:aipictors/graphql/__generated__/sticker.req.gql.dart'
    show GStickerReq;
import 'package:aipictors/graphql/__generated__/sticker.var.gql.dart'
    show GStickerVars;
import 'package:aipictors/graphql/__generated__/stickers.data.gql.dart'
    show GStickersData, GStickersData_stickers, GStickersData_stickers_image;
import 'package:aipictors/graphql/__generated__/stickers.req.gql.dart'
    show GStickersReq;
import 'package:aipictors/graphql/__generated__/stickers.var.gql.dart'
    show GStickersVars;
import 'package:aipictors/graphql/__generated__/tag.data.gql.dart'
    show GTagData, GTagData_tag, GTagData_tag_viewer;
import 'package:aipictors/graphql/__generated__/tag.req.gql.dart' show GTagReq;
import 'package:aipictors/graphql/__generated__/tag.var.gql.dart' show GTagVars;
import 'package:aipictors/graphql/__generated__/tag_works.data.gql.dart'
    show
        GTagWorksData,
        GTagWorksData_tag,
        GTagWorksData_tag_works,
        GTagWorksData_tag_works_thumbnailImage;
import 'package:aipictors/graphql/__generated__/tag_works.req.gql.dart'
    show GTagWorksReq;
import 'package:aipictors/graphql/__generated__/tag_works.var.gql.dart'
    show GTagWorksVars;
import 'package:aipictors/graphql/__generated__/tags.data.gql.dart'
    show GTagsData, GTagsData_tags, GTagsData_tags_viewer;
import 'package:aipictors/graphql/__generated__/tags.req.gql.dart'
    show GTagsReq;
import 'package:aipictors/graphql/__generated__/tags.var.gql.dart'
    show GTagsVars;
import 'package:aipictors/graphql/__generated__/user.data.gql.dart'
    show
        GUserData,
        GUserData_user,
        GUserData_user_headerImage,
        GUserData_user_iconImage,
        GUserData_user_viewer;
import 'package:aipictors/graphql/__generated__/user.req.gql.dart'
    show GUserReq;
import 'package:aipictors/graphql/__generated__/user.var.gql.dart'
    show GUserVars;
import 'package:aipictors/graphql/__generated__/user_folders.data.gql.dart'
    show
        GUserFoldersData,
        GUserFoldersData_user,
        GUserFoldersData_user_folders,
        GUserFoldersData_user_folders_thumbnailImage;
import 'package:aipictors/graphql/__generated__/user_folders.req.gql.dart'
    show GUserFoldersReq;
import 'package:aipictors/graphql/__generated__/user_folders.var.gql.dart'
    show GUserFoldersVars;
import 'package:aipictors/graphql/__generated__/user_followees.data.gql.dart'
    show
        GUserFolloweesData,
        GUserFolloweesData_user,
        GUserFolloweesData_user_followees,
        GUserFolloweesData_user_followees_iconImage;
import 'package:aipictors/graphql/__generated__/user_followees.req.gql.dart'
    show GUserFolloweesReq;
import 'package:aipictors/graphql/__generated__/user_followees.var.gql.dart'
    show GUserFolloweesVars;
import 'package:aipictors/graphql/__generated__/user_followers.data.gql.dart'
    show
        GUserFollowersData,
        GUserFollowersData_user,
        GUserFollowersData_user_followers,
        GUserFollowersData_user_followers_iconImage;
import 'package:aipictors/graphql/__generated__/user_followers.req.gql.dart'
    show GUserFollowersReq;
import 'package:aipictors/graphql/__generated__/user_followers.var.gql.dart'
    show GUserFollowersVars;
import 'package:aipictors/graphql/__generated__/user_liked_works.data.gql.dart'
    show
        GUserLikedWorksData,
        GUserLikedWorksData_user,
        GUserLikedWorksData_user_likedWorks,
        GUserLikedWorksData_user_likedWorks_thumbnailImage;
import 'package:aipictors/graphql/__generated__/user_liked_works.req.gql.dart'
    show GUserLikedWorksReq;
import 'package:aipictors/graphql/__generated__/user_liked_works.var.gql.dart'
    show GUserLikedWorksVars;
import 'package:aipictors/graphql/__generated__/user_stickers.data.gql.dart'
    show
        GUserStickersData,
        GUserStickersData_user,
        GUserStickersData_user_stickers,
        GUserStickersData_user_stickers_image;
import 'package:aipictors/graphql/__generated__/user_stickers.req.gql.dart'
    show GUserStickersReq;
import 'package:aipictors/graphql/__generated__/user_stickers.var.gql.dart'
    show GUserStickersVars;
import 'package:aipictors/graphql/__generated__/user_works.data.gql.dart'
    show
        GUserWorksData,
        GUserWorksData_user,
        GUserWorksData_user_works,
        GUserWorksData_user_works_thumbnailImage;
import 'package:aipictors/graphql/__generated__/user_works.req.gql.dart'
    show GUserWorksReq;
import 'package:aipictors/graphql/__generated__/user_works.var.gql.dart'
    show GUserWorksVars;
import 'package:aipictors/graphql/__generated__/users.data.gql.dart'
    show GUsersData, GUsersData_users, GUsersData_users_iconImage;
import 'package:aipictors/graphql/__generated__/users.req.gql.dart'
    show GUsersReq;
import 'package:aipictors/graphql/__generated__/users.var.gql.dart'
    show GUsersVars;
import 'package:aipictors/graphql/__generated__/viewer_bookmarked_works.data.gql.dart'
    show
        GViewerBookmarkedWorksData,
        GViewerBookmarkedWorksData_viewer,
        GViewerBookmarkedWorksData_viewer_bookmarkedWorks,
        GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage;
import 'package:aipictors/graphql/__generated__/viewer_bookmarked_works.req.gql.dart'
    show GViewerBookmarkedWorksReq;
import 'package:aipictors/graphql/__generated__/viewer_bookmarked_works.var.gql.dart'
    show GViewerBookmarkedWorksVars;
import 'package:aipictors/graphql/__generated__/viewer_feed_works.data.gql.dart'
    show
        GViewerFeedWorksData,
        GViewerFeedWorksData_viewer,
        GViewerFeedWorksData_viewer_feedWorks,
        GViewerFeedWorksData_viewer_feedWorks_image,
        GViewerFeedWorksData_viewer_feedWorks_user,
        GViewerFeedWorksData_viewer_feedWorks_user_iconImage,
        GViewerFeedWorksData_viewer_feedWorks_user_viewer,
        GViewerFeedWorksData_viewer_feedWorks_viewer;
import 'package:aipictors/graphql/__generated__/viewer_feed_works.req.gql.dart'
    show GViewerFeedWorksReq;
import 'package:aipictors/graphql/__generated__/viewer_feed_works.var.gql.dart'
    show GViewerFeedWorksVars;
import 'package:aipictors/graphql/__generated__/viewer_folders.data.gql.dart'
    show
        GViewerFoldersData,
        GViewerFoldersData_viewer,
        GViewerFoldersData_viewer_folders,
        GViewerFoldersData_viewer_folders_thumbnailImage;
import 'package:aipictors/graphql/__generated__/viewer_folders.req.gql.dart'
    show GViewerFoldersReq;
import 'package:aipictors/graphql/__generated__/viewer_folders.var.gql.dart'
    show GViewerFoldersVars;
import 'package:aipictors/graphql/__generated__/viewer_liked_works.data.gql.dart'
    show
        GViewerLikedWorksData,
        GViewerLikedWorksData_viewer,
        GViewerLikedWorksData_viewer_likedWorks,
        GViewerLikedWorksData_viewer_likedWorks_thumbnailImage;
import 'package:aipictors/graphql/__generated__/viewer_liked_works.req.gql.dart'
    show GViewerLikedWorksReq;
import 'package:aipictors/graphql/__generated__/viewer_liked_works.var.gql.dart'
    show GViewerLikedWorksVars;
import 'package:aipictors/graphql/__generated__/viewer_muted_tags.data.gql.dart'
    show
        GViewerMutedTagsData,
        GViewerMutedTagsData_viewer,
        GViewerMutedTagsData_viewer_mutedTags;
import 'package:aipictors/graphql/__generated__/viewer_muted_tags.req.gql.dart'
    show GViewerMutedTagsReq;
import 'package:aipictors/graphql/__generated__/viewer_muted_tags.var.gql.dart'
    show GViewerMutedTagsVars;
import 'package:aipictors/graphql/__generated__/viewer_muted_users.data.gql.dart'
    show
        GViewerMutedUsersData,
        GViewerMutedUsersData_viewer,
        GViewerMutedUsersData_viewer_mutedUsers,
        GViewerMutedUsersData_viewer_mutedUsers_iconImage;
import 'package:aipictors/graphql/__generated__/viewer_muted_users.req.gql.dart'
    show GViewerMutedUsersReq;
import 'package:aipictors/graphql/__generated__/viewer_muted_users.var.gql.dart'
    show GViewerMutedUsersVars;
import 'package:aipictors/graphql/__generated__/viewer_notifications.data.gql.dart'
    show
        GViewerNotificationsData_viewer_notifications,
        GViewerNotificationsData,
        GViewerNotificationsData_viewer,
        GViewerNotificationsData_viewer_notifications__asFollowNotificationNode,
        GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user,
        GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage,
        GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode,
        GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user,
        GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage,
        GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work,
        GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage,
        GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode,
        GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode,
        GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work,
        GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage,
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode,
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker,
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image,
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user,
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage,
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work,
        GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage,
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode,
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker,
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image,
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user,
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage,
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work,
        GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage,
        GViewerNotificationsData_viewer_notifications__base;
import 'package:aipictors/graphql/__generated__/viewer_notifications.req.gql.dart'
    show GViewerNotificationsReq;
import 'package:aipictors/graphql/__generated__/viewer_notifications.var.gql.dart'
    show GViewerNotificationsVars;
import 'package:aipictors/graphql/__generated__/viewer_user.data.gql.dart'
    show
        GViewerUserData,
        GViewerUserData_viewer,
        GViewerUserData_viewer_user,
        GViewerUserData_viewer_user_headerImage,
        GViewerUserData_viewer_user_iconImage;
import 'package:aipictors/graphql/__generated__/viewer_user.req.gql.dart'
    show GViewerUserReq;
import 'package:aipictors/graphql/__generated__/viewer_user.var.gql.dart'
    show GViewerUserVars;
import 'package:aipictors/graphql/__generated__/viewer_works.data.gql.dart'
    show
        GViewerWorksData,
        GViewerWorksData_viewer,
        GViewerWorksData_viewer_works,
        GViewerWorksData_viewer_works_thumbnailImage;
import 'package:aipictors/graphql/__generated__/viewer_works.req.gql.dart'
    show GViewerWorksReq;
import 'package:aipictors/graphql/__generated__/viewer_works.var.gql.dart'
    show GViewerWorksVars;
import 'package:aipictors/graphql/__generated__/work.data.gql.dart'
    show
        GWorkData,
        GWorkData_work,
        GWorkData_work_image,
        GWorkData_work_user,
        GWorkData_work_user_iconImage,
        GWorkData_work_user_viewer,
        GWorkData_work_viewer;
import 'package:aipictors/graphql/__generated__/work.req.gql.dart'
    show GWorkReq;
import 'package:aipictors/graphql/__generated__/work.var.gql.dart'
    show GWorkVars;
import 'package:aipictors/graphql/__generated__/work_awards.data.gql.dart'
    show
        GWorkAwardsData,
        GWorkAwardsData_workAwards,
        GWorkAwardsData_workAwards_work,
        GWorkAwardsData_workAwards_work_thumbnailImage;
import 'package:aipictors/graphql/__generated__/work_awards.req.gql.dart'
    show GWorkAwardsReq;
import 'package:aipictors/graphql/__generated__/work_awards.var.gql.dart'
    show GWorkAwardsVars;
import 'package:aipictors/graphql/__generated__/work_comments.data.gql.dart'
    show
        GWorkCommentsData,
        GWorkCommentsData_work,
        GWorkCommentsData_work_comments,
        GWorkCommentsData_work_comments_responses,
        GWorkCommentsData_work_comments_responses_sticker,
        GWorkCommentsData_work_comments_responses_sticker_image,
        GWorkCommentsData_work_comments_responses_user,
        GWorkCommentsData_work_comments_responses_user_iconImage,
        GWorkCommentsData_work_comments_sticker,
        GWorkCommentsData_work_comments_sticker_image,
        GWorkCommentsData_work_comments_user,
        GWorkCommentsData_work_comments_user_iconImage;
import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart'
    show GWorkCommentsReq;
import 'package:aipictors/graphql/__generated__/work_comments.var.gql.dart'
    show GWorkCommentsVars;
import 'package:aipictors/graphql/__generated__/works.data.gql.dart'
    show GWorksData, GWorksData_works, GWorksData_works_thumbnailImage;
import 'package:aipictors/graphql/__generated__/works.req.gql.dart'
    show GWorksReq;
import 'package:aipictors/graphql/__generated__/works.var.gql.dart'
    show GWorksVars;
import 'package:aipictors/graphql/fragments/__generated__/comment_fields_fragment.data.gql.dart'
    show
        GCommentFieldsData,
        GCommentFieldsData_sticker,
        GCommentFieldsData_sticker_image,
        GCommentFieldsData_user,
        GCommentFieldsData_user_iconImage;
import 'package:aipictors/graphql/fragments/__generated__/comment_fields_fragment.req.gql.dart'
    show GCommentFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/comment_fields_fragment.var.gql.dart'
    show GCommentFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/follow_notification_fields_fragment.data.gql.dart'
    show
        GFollowNotificationFieldsData,
        GFollowNotificationFieldsData_user,
        GFollowNotificationFieldsData_user_iconImage;
import 'package:aipictors/graphql/fragments/__generated__/follow_notification_fields_fragment.req.gql.dart'
    show GFollowNotificationFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/follow_notification_fields_fragment.var.gql.dart'
    show GFollowNotificationFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/liked_work_notification_fields_fragment.data.gql.dart'
    show
        GLikedWorkNotificationFieldsData,
        GLikedWorkNotificationFieldsData_user,
        GLikedWorkNotificationFieldsData_user_iconImage,
        GLikedWorkNotificationFieldsData_work,
        GLikedWorkNotificationFieldsData_work_thumbnailImage;
import 'package:aipictors/graphql/fragments/__generated__/liked_work_notification_fields_fragment.req.gql.dart'
    show GLikedWorkNotificationFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/liked_work_notification_fields_fragment.var.gql.dart'
    show GLikedWorkNotificationFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/liked_works_summary_notification_fields_fragment.data.gql.dart'
    show GLikedWorksSummaryNotificationFieldsData;
import 'package:aipictors/graphql/fragments/__generated__/liked_works_summary_notification_fields_fragment.req.gql.dart'
    show GLikedWorksSummaryNotificationFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/liked_works_summary_notification_fields_fragment.var.gql.dart'
    show GLikedWorksSummaryNotificationFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/partial_feed_work_fields_fragment.data.gql.dart'
    show GPartialFeedWorkFieldsData, GPartialFeedWorkFieldsData_image;
import 'package:aipictors/graphql/fragments/__generated__/partial_feed_work_fields_fragment.req.gql.dart'
    show GPartialFeedWorkFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/partial_feed_work_fields_fragment.var.gql.dart'
    show GPartialFeedWorkFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.data.gql.dart'
    show GPartialFolderFieldsData, GPartialFolderFieldsData_thumbnailImage;
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.req.gql.dart'
    show GPartialFolderFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.var.gql.dart'
    show GPartialFolderFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/partial_promotion_fields_fragment.data.gql.dart'
    show GPartialPromotionFieldsData;
import 'package:aipictors/graphql/fragments/__generated__/partial_promotion_fields_fragment.req.gql.dart'
    show GPartialPromotionFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/partial_promotion_fields_fragment.var.gql.dart'
    show GPartialPromotionFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/partial_sticker_fields_fragment.data.gql.dart'
    show GPartialStickerFieldsData, GPartialStickerFieldsData_image;
import 'package:aipictors/graphql/fragments/__generated__/partial_sticker_fields_fragment.req.gql.dart'
    show GPartialStickerFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/partial_sticker_fields_fragment.var.gql.dart'
    show GPartialStickerFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/partial_tag_fields_fragment.data.gql.dart'
    show GPartialTagFieldsData;
import 'package:aipictors/graphql/fragments/__generated__/partial_tag_fields_fragment.req.gql.dart'
    show GPartialTagFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/partial_tag_fields_fragment.var.gql.dart'
    show GPartialTagFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.data.gql.dart'
    show GPartialUserFieldsData, GPartialUserFieldsData_iconImage;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.req.gql.dart'
    show GPartialUserFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/partial_user_fields_fragment.var.gql.dart'
    show GPartialUserFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.data.gql.dart'
    show GPartialWorkFieldsData, GPartialWorkFieldsData_thumbnailImage;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.req.gql.dart'
    show GPartialWorkFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/partial_work_fields_fragment.var.gql.dart'
    show GPartialWorkFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/user_fields_fragment.data.gql.dart'
    show
        GUserFieldsData,
        GUserFieldsData_headerImage,
        GUserFieldsData_iconImage;
import 'package:aipictors/graphql/fragments/__generated__/user_fields_fragment.req.gql.dart'
    show GUserFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/user_fields_fragment.var.gql.dart'
    show GUserFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/work_award_notification_fields_fragment.data.gql.dart'
    show
        GWorkAwardNotificationFieldsData,
        GWorkAwardNotificationFieldsData_work,
        GWorkAwardNotificationFieldsData_work_thumbnailImage;
import 'package:aipictors/graphql/fragments/__generated__/work_award_notification_fields_fragment.req.gql.dart'
    show GWorkAwardNotificationFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/work_award_notification_fields_fragment.var.gql.dart'
    show GWorkAwardNotificationFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/work_comment_notification_fields_fragment.data.gql.dart'
    show
        GWorkCommentNotificationFieldsData,
        GWorkCommentNotificationFieldsData_sticker,
        GWorkCommentNotificationFieldsData_sticker_image,
        GWorkCommentNotificationFieldsData_user,
        GWorkCommentNotificationFieldsData_user_iconImage,
        GWorkCommentNotificationFieldsData_work,
        GWorkCommentNotificationFieldsData_work_thumbnailImage;
import 'package:aipictors/graphql/fragments/__generated__/work_comment_notification_fields_fragment.req.gql.dart'
    show GWorkCommentNotificationFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/work_comment_notification_fields_fragment.var.gql.dart'
    show GWorkCommentNotificationFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/work_comment_reply_notification_fields_fragment.data.gql.dart'
    show
        GWorkCommentReplyNotificationFieldsData,
        GWorkCommentReplyNotificationFieldsData_sticker,
        GWorkCommentReplyNotificationFieldsData_sticker_image,
        GWorkCommentReplyNotificationFieldsData_user,
        GWorkCommentReplyNotificationFieldsData_user_iconImage,
        GWorkCommentReplyNotificationFieldsData_work,
        GWorkCommentReplyNotificationFieldsData_work_thumbnailImage;
import 'package:aipictors/graphql/fragments/__generated__/work_comment_reply_notification_fields_fragment.req.gql.dart'
    show GWorkCommentReplyNotificationFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/work_comment_reply_notification_fields_fragment.var.gql.dart'
    show GWorkCommentReplyNotificationFieldsVars;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.data.gql.dart'
    show GWorkUserFieldsData, GWorkUserFieldsData_iconImage;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.req.gql.dart'
    show GWorkUserFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.var.gql.dart'
    show GWorkUserFieldsVars;
import 'package:aipictors/graphql/mutations/__generated__/create_account.data.gql.dart'
    show GCreateAccountData, GCreateAccountData_createAccount;
import 'package:aipictors/graphql/mutations/__generated__/create_account.req.gql.dart'
    show GCreateAccountReq;
import 'package:aipictors/graphql/mutations/__generated__/create_account.var.gql.dart'
    show GCreateAccountVars;
import 'package:aipictors/graphql/mutations/__generated__/create_folder.data.gql.dart'
    show GCreateFolderData, GCreateFolderData_createFolder;
import 'package:aipictors/graphql/mutations/__generated__/create_folder.req.gql.dart'
    show GCreateFolderReq;
import 'package:aipictors/graphql/mutations/__generated__/create_folder.var.gql.dart'
    show GCreateFolderVars;
import 'package:aipictors/graphql/mutations/__generated__/create_response_comment.data.gql.dart'
    show
        GCreateResponseCommentData,
        GCreateResponseCommentData_createResponseComment;
import 'package:aipictors/graphql/mutations/__generated__/create_response_comment.req.gql.dart'
    show GCreateResponseCommentReq;
import 'package:aipictors/graphql/mutations/__generated__/create_response_comment.var.gql.dart'
    show GCreateResponseCommentVars;
import 'package:aipictors/graphql/mutations/__generated__/create_sticker.data.gql.dart'
    show GCreateStickerData, GCreateStickerData_createSticker;
import 'package:aipictors/graphql/mutations/__generated__/create_sticker.req.gql.dart'
    show GCreateStickerReq;
import 'package:aipictors/graphql/mutations/__generated__/create_sticker.var.gql.dart'
    show GCreateStickerVars;
import 'package:aipictors/graphql/mutations/__generated__/create_work.data.gql.dart'
    show GCreateWorkData, GCreateWorkData_createWork;
import 'package:aipictors/graphql/mutations/__generated__/create_work.req.gql.dart'
    show GCreateWorkReq;
import 'package:aipictors/graphql/mutations/__generated__/create_work.var.gql.dart'
    show GCreateWorkVars;
import 'package:aipictors/graphql/mutations/__generated__/create_work_bookmark.data.gql.dart'
    show
        GCreateWorkBookmarkData,
        GCreateWorkBookmarkData_createWorkBookmark,
        GCreateWorkBookmarkData_createWorkBookmark_viewer;
import 'package:aipictors/graphql/mutations/__generated__/create_work_bookmark.req.gql.dart'
    show GCreateWorkBookmarkReq;
import 'package:aipictors/graphql/mutations/__generated__/create_work_bookmark.var.gql.dart'
    show GCreateWorkBookmarkVars;
import 'package:aipictors/graphql/mutations/__generated__/create_work_comment.data.gql.dart'
    show GCreateWorkCommentData, GCreateWorkCommentData_createWorkComment;
import 'package:aipictors/graphql/mutations/__generated__/create_work_comment.req.gql.dart'
    show GCreateWorkCommentReq;
import 'package:aipictors/graphql/mutations/__generated__/create_work_comment.var.gql.dart'
    show GCreateWorkCommentVars;
import 'package:aipictors/graphql/mutations/__generated__/create_work_like.data.gql.dart'
    show
        GCreateWorkLikeData,
        GCreateWorkLikeData_createWorkLike,
        GCreateWorkLikeData_createWorkLike_viewer;
import 'package:aipictors/graphql/mutations/__generated__/create_work_like.req.gql.dart'
    show GCreateWorkLikeReq;
import 'package:aipictors/graphql/mutations/__generated__/create_work_like.var.gql.dart'
    show GCreateWorkLikeVars;
import 'package:aipictors/graphql/mutations/__generated__/delete_comment.data.gql.dart'
    show GDeleteCommentData, GDeleteCommentData_deleteComment;
import 'package:aipictors/graphql/mutations/__generated__/delete_comment.req.gql.dart'
    show GDeleteCommentReq;
import 'package:aipictors/graphql/mutations/__generated__/delete_comment.var.gql.dart'
    show GDeleteCommentVars;
import 'package:aipictors/graphql/mutations/__generated__/delete_folder.data.gql.dart'
    show GDeleteFolderData, GDeleteFolderData_deleteFolder;
import 'package:aipictors/graphql/mutations/__generated__/delete_folder.req.gql.dart'
    show GDeleteFolderReq;
import 'package:aipictors/graphql/mutations/__generated__/delete_folder.var.gql.dart'
    show GDeleteFolderVars;
import 'package:aipictors/graphql/mutations/__generated__/delete_sticker.data.gql.dart'
    show GDeleteStickerData, GDeleteStickerData_deleteSticker;
import 'package:aipictors/graphql/mutations/__generated__/delete_sticker.req.gql.dart'
    show GDeleteStickerReq;
import 'package:aipictors/graphql/mutations/__generated__/delete_sticker.var.gql.dart'
    show GDeleteStickerVars;
import 'package:aipictors/graphql/mutations/__generated__/delete_work.data.gql.dart'
    show GDeleteWorkData, GDeleteWorkData_deleteWork;
import 'package:aipictors/graphql/mutations/__generated__/delete_work.req.gql.dart'
    show GDeleteWorkReq;
import 'package:aipictors/graphql/mutations/__generated__/delete_work.var.gql.dart'
    show GDeleteWorkVars;
import 'package:aipictors/graphql/mutations/__generated__/follow_user.data.gql.dart'
    show
        GFollowUserData,
        GFollowUserData_followUser,
        GFollowUserData_followUser_viewer;
import 'package:aipictors/graphql/mutations/__generated__/follow_user.req.gql.dart'
    show GFollowUserReq;
import 'package:aipictors/graphql/mutations/__generated__/follow_user.var.gql.dart'
    show GFollowUserVars;
import 'package:aipictors/graphql/mutations/__generated__/login_with_password.data.gql.dart'
    show GLoginWithPasswordData, GLoginWithPasswordData_loginWithPassword;
import 'package:aipictors/graphql/mutations/__generated__/login_with_password.req.gql.dart'
    show GLoginWithPasswordReq;
import 'package:aipictors/graphql/mutations/__generated__/login_with_password.var.gql.dart'
    show GLoginWithPasswordVars;
import 'package:aipictors/graphql/mutations/__generated__/mute_tag.data.gql.dart'
    show GMuteTagData, GMuteTagData_muteTag, GMuteTagData_muteTag_viewer;
import 'package:aipictors/graphql/mutations/__generated__/mute_tag.req.gql.dart'
    show GMuteTagReq;
import 'package:aipictors/graphql/mutations/__generated__/mute_tag.var.gql.dart'
    show GMuteTagVars;
import 'package:aipictors/graphql/mutations/__generated__/mute_user.data.gql.dart'
    show GMuteUserData, GMuteUserData_muteUser, GMuteUserData_muteUser_viewer;
import 'package:aipictors/graphql/mutations/__generated__/mute_user.req.gql.dart'
    show GMuteUserReq;
import 'package:aipictors/graphql/mutations/__generated__/mute_user.var.gql.dart'
    show GMuteUserVars;
import 'package:aipictors/graphql/mutations/__generated__/report_comment.data.gql.dart'
    show GReportCommentData;
import 'package:aipictors/graphql/mutations/__generated__/report_comment.req.gql.dart'
    show GReportCommentReq;
import 'package:aipictors/graphql/mutations/__generated__/report_comment.var.gql.dart'
    show GReportCommentVars;
import 'package:aipictors/graphql/mutations/__generated__/report_folder.data.gql.dart'
    show GReportFolderData;
import 'package:aipictors/graphql/mutations/__generated__/report_folder.req.gql.dart'
    show GReportFolderReq;
import 'package:aipictors/graphql/mutations/__generated__/report_folder.var.gql.dart'
    show GReportFolderVars;
import 'package:aipictors/graphql/mutations/__generated__/report_sticker.data.gql.dart'
    show GReportStickerData;
import 'package:aipictors/graphql/mutations/__generated__/report_sticker.req.gql.dart'
    show GReportStickerReq;
import 'package:aipictors/graphql/mutations/__generated__/report_sticker.var.gql.dart'
    show GReportStickerVars;
import 'package:aipictors/graphql/mutations/__generated__/report_user.data.gql.dart'
    show GReportUserData;
import 'package:aipictors/graphql/mutations/__generated__/report_user.req.gql.dart'
    show GReportUserReq;
import 'package:aipictors/graphql/mutations/__generated__/report_user.var.gql.dart'
    show GReportUserVars;
import 'package:aipictors/graphql/mutations/__generated__/report_work.data.gql.dart'
    show GReportWorkData;
import 'package:aipictors/graphql/mutations/__generated__/report_work.req.gql.dart'
    show GReportWorkReq;
import 'package:aipictors/graphql/mutations/__generated__/report_work.var.gql.dart'
    show GReportWorkVars;
import 'package:aipictors/graphql/mutations/__generated__/update_account_login.data.gql.dart'
    show GUpdateAccountLoginData, GUpdateAccountLoginData_updateAccountLogin;
import 'package:aipictors/graphql/mutations/__generated__/update_account_login.req.gql.dart'
    show GUpdateAccountLoginReq;
import 'package:aipictors/graphql/mutations/__generated__/update_account_login.var.gql.dart'
    show GUpdateAccountLoginVars;
import 'package:aipictors/graphql/mutations/__generated__/update_account_password.data.gql.dart'
    show
        GUpdateAccountPasswordData,
        GUpdateAccountPasswordData_updateAccountPassword;
import 'package:aipictors/graphql/mutations/__generated__/update_account_password.req.gql.dart'
    show GUpdateAccountPasswordReq;
import 'package:aipictors/graphql/mutations/__generated__/update_account_password.var.gql.dart'
    show GUpdateAccountPasswordVars;
import 'package:aipictors/graphql/mutations/__generated__/update_folder.data.gql.dart'
    show GUpdateFolderData, GUpdateFolderData_updateFolder;
import 'package:aipictors/graphql/mutations/__generated__/update_folder.req.gql.dart'
    show GUpdateFolderReq;
import 'package:aipictors/graphql/mutations/__generated__/update_folder.var.gql.dart'
    show GUpdateFolderVars;
import 'package:aipictors/graphql/mutations/__generated__/update_sticker.data.gql.dart'
    show GUpdateStickerData, GUpdateStickerData_updateSticker;
import 'package:aipictors/graphql/mutations/__generated__/update_sticker.req.gql.dart'
    show GUpdateStickerReq;
import 'package:aipictors/graphql/mutations/__generated__/update_sticker.var.gql.dart'
    show GUpdateStickerVars;
import 'package:aipictors/graphql/mutations/__generated__/update_user_profile.data.gql.dart'
    show GUpdateUserProfileData, GUpdateUserProfileData_updateUserProfile;
import 'package:aipictors/graphql/mutations/__generated__/update_user_profile.req.gql.dart'
    show GUpdateUserProfileReq;
import 'package:aipictors/graphql/mutations/__generated__/update_user_profile.var.gql.dart'
    show GUpdateUserProfileVars;
import 'package:aipictors/graphql/mutations/__generated__/update_work.data.gql.dart'
    show GUpdateWorkData, GUpdateWorkData_updateWork;
import 'package:aipictors/graphql/mutations/__generated__/update_work.req.gql.dart'
    show GUpdateWorkReq;
import 'package:aipictors/graphql/mutations/__generated__/update_work.var.gql.dart'
    show GUpdateWorkVars;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(GViewerNotificationsData_viewer_notifications.serializer)
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAcceptPromptonRequestInput,
  GAccessType,
  GAddPromptonTagToWorkInput,
  GAddPromptonWorkToFolderInput,
  GAwardType,
  GAwardsWhereInput,
  GBestWorksData,
  GBestWorksData_bestWorks,
  GBestWorksData_bestWorks_thumbnailImage,
  GBestWorksReq,
  GBestWorksVars,
  GBlockPromptonUserInput,
  GCacheControlScope,
  GCancelPromptonRequestInput,
  GChangePromptonFolderToPaidInput,
  GClosePromptonRequestInput,
  GCommentFieldsData,
  GCommentFieldsData_sticker,
  GCommentFieldsData_sticker_image,
  GCommentFieldsData_user,
  GCommentFieldsData_user_iconImage,
  GCommentFieldsReq,
  GCommentFieldsVars,
  GContributorType,
  GContributorsData,
  GContributorsData_contributors,
  GContributorsData_contributors_user,
  GContributorsData_contributors_user_iconImage,
  GContributorsReq,
  GContributorsVars,
  GCreateAccountData,
  GCreateAccountData_createAccount,
  GCreateAccountInput,
  GCreateAccountReq,
  GCreateAccountVars,
  GCreateFolderData,
  GCreateFolderData_createFolder,
  GCreateFolderInput,
  GCreateFolderReq,
  GCreateFolderVars,
  GCreatePromptonChatMessageInput,
  GCreatePromptonCoffeeRequestInput,
  GCreatePromptonDeliverableInput,
  GCreatePromptonFileInput,
  GCreatePromptonFolderInput,
  GCreatePromptonFolderKeyInput,
  GCreatePromptonFolderViewInput,
  GCreatePromptonInquiryInput,
  GCreatePromptonPaymentMethodInput,
  GCreatePromptonPlanInput,
  GCreatePromptonPlanRequestInput,
  GCreatePromptonPlanViewInput,
  GCreatePromptonProfileBlockInput,
  GCreatePromptonPromptCategoryInput,
  GCreatePromptonPromptInput,
  GCreatePromptonPromptWorkInput,
  GCreatePromptonReactionInput,
  GCreatePromptonThumbnailFileInput,
  GCreatePromptonUserInput,
  GCreatePromptonUserViewInput,
  GCreatePromptonWorkBookmarkInput,
  GCreatePromptonWorkInput,
  GCreatePromptonWorkLikeInput,
  GCreatePromptonWorkViewInput,
  GCreateResponseCommentData,
  GCreateResponseCommentData_createResponseComment,
  GCreateResponseCommentInput,
  GCreateResponseCommentReq,
  GCreateResponseCommentVars,
  GCreateStickerData,
  GCreateStickerData_createSticker,
  GCreateStickerInput,
  GCreateStickerReq,
  GCreateStickerVars,
  GCreateWorkBookmarkData,
  GCreateWorkBookmarkData_createWorkBookmark,
  GCreateWorkBookmarkData_createWorkBookmark_viewer,
  GCreateWorkBookmarkInput,
  GCreateWorkBookmarkReq,
  GCreateWorkBookmarkVars,
  GCreateWorkCommentData,
  GCreateWorkCommentData_createWorkComment,
  GCreateWorkCommentInput,
  GCreateWorkCommentReq,
  GCreateWorkCommentVars,
  GCreateWorkData,
  GCreateWorkData_createWork,
  GCreateWorkInput,
  GCreateWorkLikeData,
  GCreateWorkLikeData_createWorkLike,
  GCreateWorkLikeData_createWorkLike_viewer,
  GCreateWorkLikeInput,
  GCreateWorkLikeReq,
  GCreateWorkLikeVars,
  GCreateWorkReq,
  GCreateWorkVars,
  GDailyThemeData,
  GDailyThemeData_dailyTheme,
  GDailyThemeData_dailyTheme_works,
  GDailyThemeData_dailyTheme_works_thumbnailImage,
  GDailyThemeReq,
  GDailyThemeVars,
  GDailyThemesData,
  GDailyThemesData_dailyThemes,
  GDailyThemesData_dailyThemes_firstWork,
  GDailyThemesData_dailyThemes_firstWork_thumbnailImage,
  GDailyThemesReq,
  GDailyThemesVars,
  GDailyThemesWhereInput,
  GDecrementPromptonPlanSort,
  GDecrementPromptonProfileBlockIndexInput,
  GDeleteCommentData,
  GDeleteCommentData_deleteComment,
  GDeleteCommentInput,
  GDeleteCommentReq,
  GDeleteCommentVars,
  GDeleteFolderData,
  GDeleteFolderData_deleteFolder,
  GDeleteFolderInput,
  GDeleteFolderReq,
  GDeleteFolderVars,
  GDeletePromptonFolderInput,
  GDeletePromptonIntegrationInput,
  GDeletePromptonPlanInput,
  GDeletePromptonProfileBlockInput,
  GDeletePromptonPromptCategoryInput,
  GDeletePromptonPromptInput,
  GDeletePromptonReactionInput,
  GDeletePromptonWorkBookmarkInput,
  GDeletePromptonWorkInput,
  GDeletePromptonWorkLikeInput,
  GDeleteStickerData,
  GDeleteStickerData_deleteSticker,
  GDeleteStickerInput,
  GDeleteStickerReq,
  GDeleteStickerVars,
  GDeleteWorkBookmarkInput,
  GDeleteWorkData,
  GDeleteWorkData_deleteWork,
  GDeleteWorkInput,
  GDeleteWorkLikeInput,
  GDeleteWorkReq,
  GDeleteWorkVars,
  GFeedDailyThemeWorksData,
  GFeedDailyThemeWorksData_dailyTheme,
  GFeedDailyThemeWorksData_dailyTheme_works,
  GFeedDailyThemeWorksData_dailyTheme_works_image,
  GFeedDailyThemeWorksData_dailyTheme_works_user,
  GFeedDailyThemeWorksData_dailyTheme_works_user_iconImage,
  GFeedDailyThemeWorksData_dailyTheme_works_user_viewer,
  GFeedDailyThemeWorksData_dailyTheme_works_viewer,
  GFeedDailyThemeWorksReq,
  GFeedDailyThemeWorksVars,
  GFeedHotWorksData,
  GFeedHotWorksData_hotWorks,
  GFeedHotWorksData_hotWorks_image,
  GFeedHotWorksData_hotWorks_user,
  GFeedHotWorksData_hotWorks_user_iconImage,
  GFeedHotWorksData_hotWorks_user_viewer,
  GFeedHotWorksData_hotWorks_viewer,
  GFeedHotWorksReq,
  GFeedHotWorksVars,
  GFeedLatestWorksData,
  GFeedLatestWorksData_works,
  GFeedLatestWorksData_works_image,
  GFeedLatestWorksData_works_user,
  GFeedLatestWorksData_works_user_iconImage,
  GFeedLatestWorksData_works_user_viewer,
  GFeedLatestWorksData_works_viewer,
  GFeedLatestWorksReq,
  GFeedLatestWorksVars,
  GFlipPromptonFolderWorkIndexInput,
  GFolderData,
  GFolderData_folder,
  GFolderData_folder_thumbnailImage,
  GFolderData_folder_user,
  GFolderData_folder_user_iconImage,
  GFolderData_folder_user_viewer,
  GFolderData_folder_viewer,
  GFolderMode,
  GFolderReq,
  GFolderVars,
  GFolderWorksData,
  GFolderWorksData_folder,
  GFolderWorksData_folder_works,
  GFolderWorksData_folder_works_thumbnailImage,
  GFolderWorksReq,
  GFolderWorksVars,
  GFoldersData,
  GFoldersData_folders,
  GFoldersData_folders_thumbnailImage,
  GFoldersData_folders_user,
  GFoldersData_folders_user_iconImage,
  GFoldersReq,
  GFoldersVars,
  GFoldersWhereInput,
  GFollowNotificationFieldsData,
  GFollowNotificationFieldsData_user,
  GFollowNotificationFieldsData_user_iconImage,
  GFollowNotificationFieldsReq,
  GFollowNotificationFieldsVars,
  GFollowPromptonUserInput,
  GFollowUserData,
  GFollowUserData_followUser,
  GFollowUserData_followUser_viewer,
  GFollowUserInput,
  GFollowUserReq,
  GFollowUserVars,
  GHotTagsData,
  GHotTagsData_hotTags,
  GHotTagsData_hotTags_firstWork,
  GHotTagsData_hotTags_firstWork_thumbnailImage,
  GHotTagsReq,
  GHotTagsVars,
  GHotWorksData,
  GHotWorksData_hotWorks,
  GHotWorksData_hotWorks_thumbnailImage,
  GHotWorksReq,
  GHotWorksVars,
  GIncrementPromptonProfileBlockIndexInput,
  GLikedWorkNotificationFieldsData,
  GLikedWorkNotificationFieldsData_user,
  GLikedWorkNotificationFieldsData_user_iconImage,
  GLikedWorkNotificationFieldsData_work,
  GLikedWorkNotificationFieldsData_work_thumbnailImage,
  GLikedWorkNotificationFieldsReq,
  GLikedWorkNotificationFieldsVars,
  GLikedWorksSummaryNotificationFieldsData,
  GLikedWorksSummaryNotificationFieldsReq,
  GLikedWorksSummaryNotificationFieldsVars,
  GLoginPromptonInput,
  GLoginWithPasswordData,
  GLoginWithPasswordData_loginWithPassword,
  GLoginWithPasswordInput,
  GLoginWithPasswordReq,
  GLoginWithPasswordVars,
  GMarkPromptonFolderAsPrivateInput,
  GMarkPromptonFolderAsPublicInput,
  GMarkPromptonPlanAsPrivateInput,
  GMarkPromptonPlanAsPublicInput,
  GMarkPromptonWorkAsPrivateInput,
  GMarkPromptonWorkAsPublicInput,
  GMarkPromptonWorkAsUserHeaderInput,
  GMuteTagData,
  GMuteTagData_muteTag,
  GMuteTagData_muteTag_viewer,
  GMuteTagInput,
  GMuteTagReq,
  GMuteTagVars,
  GMuteUserData,
  GMuteUserData_muteUser,
  GMuteUserData_muteUser_viewer,
  GMuteUserInput,
  GMuteUserReq,
  GMuteUserVars,
  GNotificationType,
  GPartialFeedWorkFieldsData,
  GPartialFeedWorkFieldsData_image,
  GPartialFeedWorkFieldsReq,
  GPartialFeedWorkFieldsVars,
  GPartialFolderFieldsData,
  GPartialFolderFieldsData_thumbnailImage,
  GPartialFolderFieldsReq,
  GPartialFolderFieldsVars,
  GPartialPromotionFieldsData,
  GPartialPromotionFieldsReq,
  GPartialPromotionFieldsVars,
  GPartialStickerFieldsData,
  GPartialStickerFieldsData_image,
  GPartialStickerFieldsReq,
  GPartialStickerFieldsVars,
  GPartialTagFieldsData,
  GPartialTagFieldsReq,
  GPartialTagFieldsVars,
  GPartialUserFieldsData,
  GPartialUserFieldsData_iconImage,
  GPartialUserFieldsReq,
  GPartialUserFieldsVars,
  GPartialWorkFieldsData,
  GPartialWorkFieldsData_thumbnailImage,
  GPartialWorkFieldsReq,
  GPartialWorkFieldsVars,
  GPinPromptonWorkInput,
  GPopularWorksData,
  GPopularWorksData_popularWorks,
  GPopularWorksData_popularWorks_thumbnailImage,
  GPopularWorksReq,
  GPopularWorksVars,
  GPopularWorksWhereInput,
  GPostType,
  GPromotionData,
  GPromotionData_promotion,
  GPromotionReq,
  GPromotionVars,
  GPromotionsData,
  GPromotionsData_promotions,
  GPromotionsReq,
  GPromotionsVars,
  GPromptonFoldersWhereInput,
  GPromptonLabelsWhereInput,
  GPromptonPlansWhereInput,
  GPromptonRequestsWhereInput,
  GPromptonTagsWhereInput,
  GPromptonUserWorksWhereInput,
  GPromptonUsersWhereInput,
  GPromptonViewerWorksWhereInput,
  GPromptonWorksWhereInput,
  GRating,
  GRejectPromptonRequestInput,
  GRemovePromptonTagFromWorkInput,
  GRemovePromptonWorkFromFolderInput,
  GReportCommentData,
  GReportCommentInput,
  GReportCommentReq,
  GReportCommentVars,
  GReportFolderData,
  GReportFolderInput,
  GReportFolderReq,
  GReportFolderVars,
  GReportReason,
  GReportStickerData,
  GReportStickerInput,
  GReportStickerReq,
  GReportStickerVars,
  GReportUserData,
  GReportUserInput,
  GReportUserReq,
  GReportUserVars,
  GReportWorkData,
  GReportWorkInput,
  GReportWorkReq,
  GReportWorkVars,
  GStickerData,
  GStickerData_sticker,
  GStickerData_sticker_image,
  GStickerReq,
  GStickerVars,
  GStickersData,
  GStickersData_stickers,
  GStickersData_stickers_image,
  GStickersReq,
  GStickersVars,
  GStickersWhereInput,
  GTagData,
  GTagData_tag,
  GTagData_tag_viewer,
  GTagReq,
  GTagVars,
  GTagWorksData,
  GTagWorksData_tag,
  GTagWorksData_tag_works,
  GTagWorksData_tag_works_thumbnailImage,
  GTagWorksReq,
  GTagWorksVars,
  GTagsData,
  GTagsData_tags,
  GTagsData_tags_viewer,
  GTagsReq,
  GTagsVars,
  GTagsWhereInput,
  GTestPromptonIntegrationInput,
  GUnfollowPromptonUserInput,
  GUnfollowUserInput,
  GUnmuteTagInput,
  GUnmuteUserInput,
  GUnpinPromptonWorkInput,
  GUpdateAccountLoginData,
  GUpdateAccountLoginData_updateAccountLogin,
  GUpdateAccountLoginInput,
  GUpdateAccountLoginReq,
  GUpdateAccountLoginVars,
  GUpdateAccountPasswordData,
  GUpdateAccountPasswordData_updateAccountPassword,
  GUpdateAccountPasswordInput,
  GUpdateAccountPasswordReq,
  GUpdateAccountPasswordVars,
  GUpdateFolderData,
  GUpdateFolderData_updateFolder,
  GUpdateFolderInput,
  GUpdateFolderReq,
  GUpdateFolderVars,
  GUpdatePromptonFolderInput,
  GUpdatePromptonFolderSortInput,
  GUpdatePromptonPlanInput,
  GUpdatePromptonPlanSortInput,
  GUpdatePromptonProfileBlockInput,
  GUpdatePromptonPromptCategoryInput,
  GUpdatePromptonPromptInput,
  GUpdatePromptonUserAvatarInput,
  GUpdatePromptonUserHeaderImageInput,
  GUpdatePromptonUserLoginInput,
  GUpdatePromptonUserProfileInput,
  GUpdatePromptonWorkInput,
  GUpdateStickerData,
  GUpdateStickerData_updateSticker,
  GUpdateStickerInput,
  GUpdateStickerReq,
  GUpdateStickerVars,
  GUpdateUserLoginInput,
  GUpdateUserPasswordInput,
  GUpdateUserProfileData,
  GUpdateUserProfileData_updateUserProfile,
  GUpdateUserProfileInput,
  GUpdateUserProfileReq,
  GUpdateUserProfileVars,
  GUpdateWorkData,
  GUpdateWorkData_updateWork,
  GUpdateWorkInput,
  GUpdateWorkReq,
  GUpdateWorkVars,
  GUserData,
  GUserData_user,
  GUserData_user_headerImage,
  GUserData_user_iconImage,
  GUserData_user_viewer,
  GUserFieldsData,
  GUserFieldsData_headerImage,
  GUserFieldsData_iconImage,
  GUserFieldsReq,
  GUserFieldsVars,
  GUserFoldersData,
  GUserFoldersData_user,
  GUserFoldersData_user_folders,
  GUserFoldersData_user_folders_thumbnailImage,
  GUserFoldersReq,
  GUserFoldersVars,
  GUserFolloweesData,
  GUserFolloweesData_user,
  GUserFolloweesData_user_followees,
  GUserFolloweesData_user_followees_iconImage,
  GUserFolloweesReq,
  GUserFolloweesVars,
  GUserFollowersData,
  GUserFollowersData_user,
  GUserFollowersData_user_followers,
  GUserFollowersData_user_followers_iconImage,
  GUserFollowersReq,
  GUserFollowersVars,
  GUserLikedWorksData,
  GUserLikedWorksData_user,
  GUserLikedWorksData_user_likedWorks,
  GUserLikedWorksData_user_likedWorks_thumbnailImage,
  GUserLikedWorksReq,
  GUserLikedWorksVars,
  GUserReq,
  GUserStickersData,
  GUserStickersData_user,
  GUserStickersData_user_stickers,
  GUserStickersData_user_stickers_image,
  GUserStickersReq,
  GUserStickersVars,
  GUserVars,
  GUserWorksData,
  GUserWorksData_user,
  GUserWorksData_user_works,
  GUserWorksData_user_works_thumbnailImage,
  GUserWorksReq,
  GUserWorksVars,
  GUserWorksWhereInput,
  GUsersData,
  GUsersData_users,
  GUsersData_users_iconImage,
  GUsersReq,
  GUsersVars,
  GUsersWhereInput,
  GViewerBookmarkedWorksData,
  GViewerBookmarkedWorksData_viewer,
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks,
  GViewerBookmarkedWorksData_viewer_bookmarkedWorks_thumbnailImage,
  GViewerBookmarkedWorksReq,
  GViewerBookmarkedWorksVars,
  GViewerFeedWorksData,
  GViewerFeedWorksData_viewer,
  GViewerFeedWorksData_viewer_feedWorks,
  GViewerFeedWorksData_viewer_feedWorks_image,
  GViewerFeedWorksData_viewer_feedWorks_user,
  GViewerFeedWorksData_viewer_feedWorks_user_iconImage,
  GViewerFeedWorksData_viewer_feedWorks_user_viewer,
  GViewerFeedWorksData_viewer_feedWorks_viewer,
  GViewerFeedWorksReq,
  GViewerFeedWorksVars,
  GViewerFoldersData,
  GViewerFoldersData_viewer,
  GViewerFoldersData_viewer_folders,
  GViewerFoldersData_viewer_folders_thumbnailImage,
  GViewerFoldersReq,
  GViewerFoldersVars,
  GViewerLikedWorksData,
  GViewerLikedWorksData_viewer,
  GViewerLikedWorksData_viewer_likedWorks,
  GViewerLikedWorksData_viewer_likedWorks_thumbnailImage,
  GViewerLikedWorksReq,
  GViewerLikedWorksVars,
  GViewerMutedTagsData,
  GViewerMutedTagsData_viewer,
  GViewerMutedTagsData_viewer_mutedTags,
  GViewerMutedTagsReq,
  GViewerMutedTagsVars,
  GViewerMutedUsersData,
  GViewerMutedUsersData_viewer,
  GViewerMutedUsersData_viewer_mutedUsers,
  GViewerMutedUsersData_viewer_mutedUsers_iconImage,
  GViewerMutedUsersReq,
  GViewerMutedUsersVars,
  GViewerNotificationsData,
  GViewerNotificationsData_viewer,
  GViewerNotificationsData_viewer_notifications__asFollowNotificationNode,
  GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user,
  GViewerNotificationsData_viewer_notifications__asFollowNotificationNode_user_iconImage,
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode,
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user,
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_user_iconImage,
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work,
  GViewerNotificationsData_viewer_notifications__asLikedWorkNotificationNode_work_thumbnailImage,
  GViewerNotificationsData_viewer_notifications__asLikedWorksSummaryNotificationNode,
  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode,
  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work,
  GViewerNotificationsData_viewer_notifications__asWorkAwardNotificationNode_work_thumbnailImage,
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode,
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker,
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_sticker_image,
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user,
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_user_iconImage,
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work,
  GViewerNotificationsData_viewer_notifications__asWorkCommentNotificationNode_work_thumbnailImage,
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode,
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker,
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_sticker_image,
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user,
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_user_iconImage,
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work,
  GViewerNotificationsData_viewer_notifications__asWorkCommentReplyNotificationNode_work_thumbnailImage,
  GViewerNotificationsData_viewer_notifications__base,
  GViewerNotificationsReq,
  GViewerNotificationsVars,
  GViewerUserData,
  GViewerUserData_viewer,
  GViewerUserData_viewer_user,
  GViewerUserData_viewer_user_headerImage,
  GViewerUserData_viewer_user_iconImage,
  GViewerUserReq,
  GViewerUserVars,
  GViewerWorksData,
  GViewerWorksData_viewer,
  GViewerWorksData_viewer_works,
  GViewerWorksData_viewer_works_thumbnailImage,
  GViewerWorksReq,
  GViewerWorksVars,
  GWorkAwardNotificationFieldsData,
  GWorkAwardNotificationFieldsData_work,
  GWorkAwardNotificationFieldsData_work_thumbnailImage,
  GWorkAwardNotificationFieldsReq,
  GWorkAwardNotificationFieldsVars,
  GWorkAwardsData,
  GWorkAwardsData_workAwards,
  GWorkAwardsData_workAwards_work,
  GWorkAwardsData_workAwards_work_thumbnailImage,
  GWorkAwardsReq,
  GWorkAwardsVars,
  GWorkAwardsWhereInput,
  GWorkCommentNotificationFieldsData,
  GWorkCommentNotificationFieldsData_sticker,
  GWorkCommentNotificationFieldsData_sticker_image,
  GWorkCommentNotificationFieldsData_user,
  GWorkCommentNotificationFieldsData_user_iconImage,
  GWorkCommentNotificationFieldsData_work,
  GWorkCommentNotificationFieldsData_work_thumbnailImage,
  GWorkCommentNotificationFieldsReq,
  GWorkCommentNotificationFieldsVars,
  GWorkCommentReplyNotificationFieldsData,
  GWorkCommentReplyNotificationFieldsData_sticker,
  GWorkCommentReplyNotificationFieldsData_sticker_image,
  GWorkCommentReplyNotificationFieldsData_user,
  GWorkCommentReplyNotificationFieldsData_user_iconImage,
  GWorkCommentReplyNotificationFieldsData_work,
  GWorkCommentReplyNotificationFieldsData_work_thumbnailImage,
  GWorkCommentReplyNotificationFieldsReq,
  GWorkCommentReplyNotificationFieldsVars,
  GWorkCommentsData,
  GWorkCommentsData_work,
  GWorkCommentsData_work_comments,
  GWorkCommentsData_work_comments_responses,
  GWorkCommentsData_work_comments_responses_sticker,
  GWorkCommentsData_work_comments_responses_sticker_image,
  GWorkCommentsData_work_comments_responses_user,
  GWorkCommentsData_work_comments_responses_user_iconImage,
  GWorkCommentsData_work_comments_sticker,
  GWorkCommentsData_work_comments_sticker_image,
  GWorkCommentsData_work_comments_user,
  GWorkCommentsData_work_comments_user_iconImage,
  GWorkCommentsReq,
  GWorkCommentsVars,
  GWorkData,
  GWorkData_work,
  GWorkData_work_image,
  GWorkData_work_user,
  GWorkData_work_user_iconImage,
  GWorkData_work_user_viewer,
  GWorkData_work_viewer,
  GWorkReq,
  GWorkUserFieldsData,
  GWorkUserFieldsData_iconImage,
  GWorkUserFieldsReq,
  GWorkUserFieldsVars,
  GWorkVars,
  GWorksData,
  GWorksData_works,
  GWorksData_works_thumbnailImage,
  GWorksReq,
  GWorksVars,
  GWorksWhereInput,
])
final Serializers serializers = _serializersBuilder.build();
