import 'package:aipictors/providers/auth_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_user_id_provider.g.dart';

@riverpod
Future<String?>? authUserId(AuthUserIdRef ref) {
  final user = ref.watch(authStateProvider);
  return user.value?.getIdTokenResult().then((value) {
    return value.claims?['userId'];
  });
}
