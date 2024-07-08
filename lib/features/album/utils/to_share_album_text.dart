String toShareAlbumText({
  required String userId,
  required String albumSlug,
  required String albumTitle,
  required String userName,
  required String hashtagText,
}) {
  final pageURL =
      'https://www.aipictors.com/series/?user=$userId&id=$albumSlug';

  return '$albumTitle | $userName $hashtagText\n$pageURL';
}
