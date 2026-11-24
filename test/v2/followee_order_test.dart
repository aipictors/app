import 'package:aipictors/v2/user/user_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('フォロー中の並び順を URL から読む', () {
    expect(FolloweeOrder.fromQuery('posted'), FolloweeOrder.posted);
    expect(FolloweeOrder.fromQuery(null), FolloweeOrder.followed);
    expect(FolloweeOrder.fromQuery('unknown'), FolloweeOrder.followed);
  });

  test('API に渡す並び順は Web の /following と同じ値', () {
    expect(FolloweeOrder.followed.orderBy, 'DATE_FOLLOWED');
    expect(FolloweeOrder.posted.orderBy, 'DATE_POSTED');
  });
}
