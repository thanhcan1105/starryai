import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:starryai/app/screens/bottom_menu/bottom_menu.dart';

GoogleSignIn googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle({
    super.key,
  });

  @override
  State<LoginWithGoogle> createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {
  GoogleSignInAccount? currentUser;
  String contactText = '';
  GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        currentUser = account;
      });
      if (currentUser != null) {
        handleGetContact(currentUser!);
      }
    });
    googleSignIn.signInSilently();
  }

  Future<void> handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      contactText = 'Loading contact info...';
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        contactText = 'People API gave a ${response.statusCode} '
            'response. Check logs for details.';
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        contactText = 'I see you know $namedContact!';
      } else {
        contactText = 'No contacts to display.';
      }
    });
  }

  String? pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  Future<void> handleSignIn() async {
    try {
      await googleSignIn.signIn();
      setState(() {
        currentUser = googleSignIn.currentUser;
      });
      if (currentUser != null) {
        print('Email: ${currentUser!.email}');
        print('Name: ${currentUser!.displayName}');
        print('Image url: ${currentUser!.photoUrl}');

        //Get token
        final GoogleSignInAuthentication auth =
            await currentUser!.authentication;
        final String accessToken = auth.accessToken!;
        print('Access Token: $accessToken');


        box.write('email', currentUser!.email);
        box.write('isLogin', true);

        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const BottomMenu()));
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleSignOut() async {
    try {
      await googleSignIn.signOut();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AuthService().signInWithGoogle();
        // controller.handleSignIn();
        handleSignOut();
        handleSignIn();
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3,
              offset: Offset(0.3, 0.3),
            )
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/icons/google-icon-1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
