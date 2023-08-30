String toShareWorkText({
  required String workId,
  required String workTitle,
  required String userName,
}) {
  final workPageUrl = 'https://www.aipictors.com/works/$workId';

  return '$workTitle | $userName #Aipictors\n$workPageUrl';
}
