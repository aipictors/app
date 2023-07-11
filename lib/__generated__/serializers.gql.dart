// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:aipictors/__generated__/schema.schema.gql.dart'
    show
        GAccessType,
        GAwardType,
        GAwardsWhereInput,
        GCacheControlScope,
        GContributorType,
        GCreateFolderInput,
        GCreateResponseCommentInput,
        GCreateStickerInput,
        GCreateUserInput,
        GCreateWorkBookmarkInput,
        GCreateWorkCommentInput,
        GCreateWorkInput,
        GCreateWorkLikeInput,
        GDailyThemesWhereInput,
        GDeleteCommentInput,
        GDeleteFolderInput,
        GDeleteStickerInput,
        GDeleteWorkBookmarkInput,
        GDeleteWorkInput,
        GDeleteWorkLikeInput,
        GFoldersWhereInput,
        GFollowUserInput,
        GLoginWithPasswordInput,
        GMuteTagInput,
        GMuteUserInput,
        GNotificationType,
        GPopularWorksWhereInput,
        GPostType,
        GRating,
        GStickersWhereInput,
        GTagsWhereInput,
        GUnfollowUserInput,
        GUnmuteTagInput,
        GUnmuteUserInput,
        GUpdateFolderInput,
        GUpdateStickerInput,
        GUpdateUserProfileInput,
        GUserWorksWhereInput,
        GUsersWhereInput,
        GWorkAwardsWhereInput,
        GWorksWhereInput,
        G_Any,
        Gfederation__FieldSet,
        Glink__Import,
        Glink__Purpose;
import 'package:aipictors/graphql/__generated__/best_works.data.gql.dart'
    show
        GBestWorksData,
        GBestWorksData_bestWorks,
        GBestWorksData_bestWorks_thumbnailImage;
import 'package:aipictors/graphql/__generated__/best_works.req.gql.dart'
    show GBestWorksReq;
import 'package:aipictors/graphql/__generated__/best_works.var.gql.dart'
    show GBestWorksVars;
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
        GDailyThemeData,
        GDailyThemeData_dailyTheme,
        GDailyThemeData_dailyTheme_works,
        GDailyThemeData_dailyTheme_works_thumbnailImage,
        GDailyThemeData_dailyTheme_works_user,
        GDailyThemeData_dailyTheme_works_user_iconImage,
        GDailyThemeData_dailyTheme_works_viewer;
import 'package:aipictors/graphql/__generated__/feed_daily_theme_works.req.gql.dart'
    show GDailyThemeReq;
import 'package:aipictors/graphql/__generated__/feed_daily_theme_works.var.gql.dart'
    show GDailyThemeVars;
import 'package:aipictors/graphql/__generated__/feed_hot_works.data.gql.dart'
    show
        GFeedHotWorksData,
        GFeedHotWorksData_hotWorks,
        GFeedHotWorksData_hotWorks_thumbnailImage,
        GFeedHotWorksData_hotWorks_user,
        GFeedHotWorksData_hotWorks_user_iconImage,
        GFeedHotWorksData_hotWorks_viewer;
import 'package:aipictors/graphql/__generated__/feed_hot_works.req.gql.dart'
    show GFeedHotWorksReq;
import 'package:aipictors/graphql/__generated__/feed_hot_works.var.gql.dart'
    show GFeedHotWorksVars;
import 'package:aipictors/graphql/__generated__/feed_works.data.gql.dart'
    show
        GFeedWorksData,
        GFeedWorksData_works,
        GFeedWorksData_works_thumbnailImage,
        GFeedWorksData_works_user,
        GFeedWorksData_works_user_iconImage,
        GFeedWorksData_works_viewer;
import 'package:aipictors/graphql/__generated__/feed_works.req.gql.dart'
    show GFeedWorksReq;
import 'package:aipictors/graphql/__generated__/feed_works.var.gql.dart'
    show GFeedWorksVars;
import 'package:aipictors/graphql/__generated__/folder.data.gql.dart'
    show
        GFolderData,
        GFolderData_folder,
        GFolderData_folder_thumbnailImage,
        GFolderData_folder_user,
        GFolderData_folder_user_iconImage;
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
import 'package:aipictors/graphql/__generated__/stickers.data.gql.dart'
    show GStickersData, GStickersData_stickers, GStickersData_stickers_image;
import 'package:aipictors/graphql/__generated__/stickers.req.gql.dart'
    show GStickersReq;
import 'package:aipictors/graphql/__generated__/stickers.var.gql.dart'
    show GStickersVars;
import 'package:aipictors/graphql/__generated__/tag.data.gql.dart'
    show GTagData, GTagData_tag;
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
import 'package:aipictors/graphql/__generated__/user.data.gql.dart'
    show
        GUserData,
        GUserData_user,
        GUserData_user_headerImage,
        GUserData_user_iconImage;
import 'package:aipictors/graphql/__generated__/user.req.gql.dart'
    show GUserReq;
import 'package:aipictors/graphql/__generated__/user.var.gql.dart'
    show GUserVars;
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
import 'package:aipictors/graphql/__generated__/user_works.data.gql.dart'
    show
        GUserWorksData,
        GUserWorksData_user,
        GUserWorksData_user_works,
        GUserWorksData_user_works_image;
import 'package:aipictors/graphql/__generated__/user_works.req.gql.dart'
    show GUserWorksReq;
import 'package:aipictors/graphql/__generated__/user_works.var.gql.dart'
    show GUserWorksVars;
import 'package:aipictors/graphql/__generated__/viewer_feed_works.data.gql.dart'
    show
        GViewerFeedWorksData,
        GViewerFeedWorksData_viewer,
        GViewerFeedWorksData_viewer_feedWorks,
        GViewerFeedWorksData_viewer_feedWorks_thumbnailImage,
        GViewerFeedWorksData_viewer_feedWorks_user,
        GViewerFeedWorksData_viewer_feedWorks_user_iconImage,
        GViewerFeedWorksData_viewer_feedWorks_viewer;
import 'package:aipictors/graphql/__generated__/viewer_feed_works.req.gql.dart'
    show GViewerFeedWorksReq;
import 'package:aipictors/graphql/__generated__/viewer_feed_works.var.gql.dart'
    show GViewerFeedWorksVars;
import 'package:aipictors/graphql/__generated__/viewer_notifications.data.gql.dart'
    show
        GViewerNotificationsData,
        GViewerNotificationsData_viewer,
        GViewerNotificationsData_viewer_notifications,
        GViewerNotificationsData_viewer_notifications_relatedUser,
        GViewerNotificationsData_viewer_notifications_relatedUser_iconImage,
        GViewerNotificationsData_viewer_notifications_sticker,
        GViewerNotificationsData_viewer_notifications_sticker_image,
        GViewerNotificationsData_viewer_notifications_work,
        GViewerNotificationsData_viewer_notifications_work_thumbnailImage;
import 'package:aipictors/graphql/__generated__/viewer_notifications.req.gql.dart'
    show GViewerNotificationsReq;
import 'package:aipictors/graphql/__generated__/viewer_notifications.var.gql.dart'
    show GViewerNotificationsVars;
import 'package:aipictors/graphql/__generated__/work.data.gql.dart'
    show
        GWorkData,
        GWorkData_work,
        GWorkData_work_image,
        GWorkData_work_user,
        GWorkData_work_user_iconImage,
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
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.data.gql.dart'
    show GPartialFolderFieldsData, GPartialFolderFieldsData_thumbnailImage;
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.req.gql.dart'
    show GPartialFolderFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/partial_folder_fields_fragment.var.gql.dart'
    show GPartialFolderFieldsVars;
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
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.data.gql.dart'
    show GWorkUserFieldsData, GWorkUserFieldsData_iconImage;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.req.gql.dart'
    show GWorkUserFieldsReq;
import 'package:aipictors/graphql/fragments/__generated__/work_user_fields_fragment.var.gql.dart'
    show GWorkUserFieldsVars;
import 'package:aipictors/graphql/mutations/__generated__/create_response_comment.data.gql.dart'
    show
        GCreateResponseCommentData,
        GCreateResponseCommentData_createResponseComment;
import 'package:aipictors/graphql/mutations/__generated__/create_response_comment.req.gql.dart'
    show GCreateResponseCommentReq;
import 'package:aipictors/graphql/mutations/__generated__/create_response_comment.var.gql.dart'
    show GCreateResponseCommentVars;
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
import 'package:aipictors/graphql/mutations/__generated__/login_with_password.data.gql.dart'
    show GLoginWithPasswordData, GLoginWithPasswordData_loginWithPassword;
import 'package:aipictors/graphql/mutations/__generated__/login_with_password.req.gql.dart'
    show GLoginWithPasswordReq;
import 'package:aipictors/graphql/mutations/__generated__/login_with_password.var.gql.dart'
    show GLoginWithPasswordVars;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAccessType,
  GAwardType,
  GAwardsWhereInput,
  GBestWorksData,
  GBestWorksData_bestWorks,
  GBestWorksData_bestWorks_thumbnailImage,
  GBestWorksReq,
  GBestWorksVars,
  GCacheControlScope,
  GCommentFieldsData,
  GCommentFieldsData_sticker,
  GCommentFieldsData_sticker_image,
  GCommentFieldsData_user,
  GCommentFieldsData_user_iconImage,
  GCommentFieldsReq,
  GCommentFieldsVars,
  GContributorType,
  GCreateFolderInput,
  GCreateResponseCommentData,
  GCreateResponseCommentData_createResponseComment,
  GCreateResponseCommentInput,
  GCreateResponseCommentReq,
  GCreateResponseCommentVars,
  GCreateStickerInput,
  GCreateUserInput,
  GCreateWorkBookmarkInput,
  GCreateWorkCommentData,
  GCreateWorkCommentData_createWorkComment,
  GCreateWorkCommentInput,
  GCreateWorkCommentReq,
  GCreateWorkCommentVars,
  GCreateWorkInput,
  GCreateWorkLikeData,
  GCreateWorkLikeData_createWorkLike,
  GCreateWorkLikeData_createWorkLike_viewer,
  GCreateWorkLikeInput,
  GCreateWorkLikeReq,
  GCreateWorkLikeVars,
  GDailyThemeData,
  GDailyThemeData_dailyTheme,
  GDailyThemeData_dailyTheme_works,
  GDailyThemeData_dailyTheme_works_thumbnailImage,
  GDailyThemeData_dailyTheme_works_user,
  GDailyThemeData_dailyTheme_works_user_iconImage,
  GDailyThemeData_dailyTheme_works_viewer,
  GDailyThemeReq,
  GDailyThemeVars,
  GDailyThemesData,
  GDailyThemesData_dailyThemes,
  GDailyThemesData_dailyThemes_firstWork,
  GDailyThemesData_dailyThemes_firstWork_thumbnailImage,
  GDailyThemesReq,
  GDailyThemesVars,
  GDailyThemesWhereInput,
  GDeleteCommentInput,
  GDeleteFolderInput,
  GDeleteStickerInput,
  GDeleteWorkBookmarkInput,
  GDeleteWorkInput,
  GDeleteWorkLikeInput,
  GFeedHotWorksData,
  GFeedHotWorksData_hotWorks,
  GFeedHotWorksData_hotWorks_thumbnailImage,
  GFeedHotWorksData_hotWorks_user,
  GFeedHotWorksData_hotWorks_user_iconImage,
  GFeedHotWorksData_hotWorks_viewer,
  GFeedHotWorksReq,
  GFeedHotWorksVars,
  GFeedWorksData,
  GFeedWorksData_works,
  GFeedWorksData_works_thumbnailImage,
  GFeedWorksData_works_user,
  GFeedWorksData_works_user_iconImage,
  GFeedWorksData_works_viewer,
  GFeedWorksReq,
  GFeedWorksVars,
  GFolderData,
  GFolderData_folder,
  GFolderData_folder_thumbnailImage,
  GFolderData_folder_user,
  GFolderData_folder_user_iconImage,
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
  GFollowUserInput,
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
  GLoginWithPasswordData,
  GLoginWithPasswordData_loginWithPassword,
  GLoginWithPasswordInput,
  GLoginWithPasswordReq,
  GLoginWithPasswordVars,
  GMuteTagInput,
  GMuteUserInput,
  GNotificationType,
  GPartialFolderFieldsData,
  GPartialFolderFieldsData_thumbnailImage,
  GPartialFolderFieldsReq,
  GPartialFolderFieldsVars,
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
  GPopularWorksData,
  GPopularWorksData_popularWorks,
  GPopularWorksData_popularWorks_thumbnailImage,
  GPopularWorksReq,
  GPopularWorksVars,
  GPopularWorksWhereInput,
  GPostType,
  GRating,
  GStickersData,
  GStickersData_stickers,
  GStickersData_stickers_image,
  GStickersReq,
  GStickersVars,
  GStickersWhereInput,
  GTagData,
  GTagData_tag,
  GTagReq,
  GTagVars,
  GTagWorksData,
  GTagWorksData_tag,
  GTagWorksData_tag_works,
  GTagWorksData_tag_works_thumbnailImage,
  GTagWorksReq,
  GTagWorksVars,
  GTagsWhereInput,
  GUnfollowUserInput,
  GUnmuteTagInput,
  GUnmuteUserInput,
  GUpdateFolderInput,
  GUpdateStickerInput,
  GUpdateUserProfileInput,
  GUserData,
  GUserData_user,
  GUserData_user_headerImage,
  GUserData_user_iconImage,
  GUserFieldsData,
  GUserFieldsData_headerImage,
  GUserFieldsData_iconImage,
  GUserFieldsReq,
  GUserFieldsVars,
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
  GUserVars,
  GUserWorksData,
  GUserWorksData_user,
  GUserWorksData_user_works,
  GUserWorksData_user_works_image,
  GUserWorksReq,
  GUserWorksVars,
  GUserWorksWhereInput,
  GUsersWhereInput,
  GViewerFeedWorksData,
  GViewerFeedWorksData_viewer,
  GViewerFeedWorksData_viewer_feedWorks,
  GViewerFeedWorksData_viewer_feedWorks_thumbnailImage,
  GViewerFeedWorksData_viewer_feedWorks_user,
  GViewerFeedWorksData_viewer_feedWorks_user_iconImage,
  GViewerFeedWorksData_viewer_feedWorks_viewer,
  GViewerFeedWorksReq,
  GViewerFeedWorksVars,
  GViewerNotificationsData,
  GViewerNotificationsData_viewer,
  GViewerNotificationsData_viewer_notifications,
  GViewerNotificationsData_viewer_notifications_relatedUser,
  GViewerNotificationsData_viewer_notifications_relatedUser_iconImage,
  GViewerNotificationsData_viewer_notifications_sticker,
  GViewerNotificationsData_viewer_notifications_sticker_image,
  GViewerNotificationsData_viewer_notifications_work,
  GViewerNotificationsData_viewer_notifications_work_thumbnailImage,
  GViewerNotificationsReq,
  GViewerNotificationsVars,
  GWorkAwardsData,
  GWorkAwardsData_workAwards,
  GWorkAwardsData_workAwards_work,
  GWorkAwardsData_workAwards_work_thumbnailImage,
  GWorkAwardsReq,
  GWorkAwardsVars,
  GWorkAwardsWhereInput,
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
  G_Any,
  Gfederation__FieldSet,
  Glink__Import,
  Glink__Purpose,
])
final Serializers serializers = _serializersBuilder.build();
