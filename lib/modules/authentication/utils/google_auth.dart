// ignore_for_file: unused_local_variable, avoid_print

import 'package:google_sign_in/google_sign_in.dart';

Future<GoogleSignInAccount?> googleAuth() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  return googleUser;
}
