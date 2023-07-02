import 'package:firebase_auth/firebase_auth.dart';

Future logout() async {
  await FirebaseAuth.instance.signOut();
}
