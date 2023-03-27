import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class AuthService {
  Future login({required Map<String, dynamic> data}) async {
    final res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/login'),
      body: {
        'email': data['email'],
        'password': data['password'],
      },
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    } else {
      return null;
    }
  }

  Future register({required Map<String, dynamic> data}) async {
    final res = await http.post(
      Uri.parse('${CONST.API_BASE_URL}/register'),
      body: {
        "email": data['email'],
        "password": data['password'],
      },
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    }
  }

  // Future<String?> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleSignInAccount =
  //       await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount!.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleSignInAuthentication.accessToken,
  //     idToken: googleSignInAuthentication.idToken,
  //   );

  //   final UserCredential authResult =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   final User? user = authResult.user;

  //   if (user != null) {
  //     assert(!user.isAnonymous);
  //     assert(await user.getIdToken() != null);

  //     final User currentUser = FirebaseAuth.instance.currentUser!;
  //     assert(user.uid == currentUser.uid);

  //     return 'signInWithGoogle succeeded: $user';
  //   }

  //   return null;
  // }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    GoogleSignIn _googleSignIn = GoogleSignIn(
      // Optional clientId
      // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) {
          print(account?.email);
        });

    return FirebaseAuth.instance.signInWithCredential(credential);
  }
}
