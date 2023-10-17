String toShareUserText({
  required String userId,
  required String userName,
  required String hashtagText,
}) {
  final pageURL = 'https://www.aipictors.com/users/$userId';

  return '$userName $hashtagText\n$pageURL';
}
