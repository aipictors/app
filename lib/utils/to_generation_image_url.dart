String toGenerationImageUrl(String token, String name) {
  return 'https://www.aipictors.com/wp-content/themes/AISite/private-image-direct.php?token=${Uri.encodeComponent(token)}&name=$name';
}
