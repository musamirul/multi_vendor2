import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../screens/landing_screen.dart';


class VendorAuthScreen extends StatefulWidget {
  const VendorAuthScreen({super.key});

  @override
  State<VendorAuthScreen> createState() => _VendorAuthScreenState();
}

class _VendorAuthScreenState extends State<VendorAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
            ],
          );
        }
        //RENDER YOUR APPLICATION IF AUTHENTICATED
        return LandingScreen();
        // return VendorRegistrationScreen();
        // return LandingScreen();
        // return Center(
        //   child: ElevatedButton(onPressed: () async{
        //     await FirebaseAuth.instance.signOut();
        //   }, child: Text('Sign Out')),
        // );
      },
    );
  }
}
