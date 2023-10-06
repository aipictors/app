String toShareWorkText({
  required String workId,
  required String workTitle,
  required String userName,
  required String hashtagText,
}) {
  //final pageURL = 'https://www.aipictors.com/works/$workId';
  const pageURL = '';

  return '$workTitle | $userName $hashtagText\n$pageURL';
}
