String toShareUserText({
  required String userId,
  required String userName,
}) {
  final userPageUrl = 'https://www.aipictors.com/users/$userId';

  return '$userName #Aipictors\n$userPageUrl';
}
