enum SurveyTouchPoint {
  twitter('twitter'),
  twitterAdvertisement('twitter_advertisement'),
  friend('friend'),
  googleSearch('google_search'),
  appStore('app_store'),
  googlePlayStore('google_play_store'),
  other('other');

  const SurveyTouchPoint(this.value);

  final String value;

  static SurveyTouchPoint fromText(String value) {
    for (final item in SurveyTouchPoint.values) {
      if (item.value == value) {
        return item;
      }
    }
    return SurveyTouchPoint.other;
  }
}
