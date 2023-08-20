String toShareText(bool isUser, String id, String userName, String? workTitle) {
  final userPageUrl = 'https://www.aipictors.com/users/$id';
  final workPageUrl = 'https://www.aipictors.com/works/$id';

  final userShareText = '$userName #Aipictors\n$userPageUrl';
  final workShareText = '$workTitle | $userName #Aipictors\n$workPageUrl';

  if (isUser) {
    return userShareText;
  } else {
    return workShareText;
  }
}
