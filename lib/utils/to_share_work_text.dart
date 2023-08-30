String toShareWorkText({
  required String workId,
  required String workTitle,
  required String userName,
  required String hashtagText,
}) {
  final pageURL = 'https://www.aipictors.com/works/$workId';

  return '$workTitle | $userName $hashtagText\n$pageURL';
}
