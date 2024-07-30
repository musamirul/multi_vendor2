import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor2/provider/product_provider.dart';
import 'package:multi_vendor2/vendor/views/auth/vendor_auth_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/main_vendor_screen.dart';
import 'package:multi_vendor2/views/buyers/auth/login_screen.dart';
import 'package:multi_vendor2/views/buyers/auth/register_screen.dart';
import 'package:multi_vendor2/views/buyers/main_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(MyApp());
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_){
        return ProductProvider();
      })
    ], child: MyApp()));
}



class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: VendorAuthScreen(),//LoginScreen(),
      builder: EasyLoading.init(),
    );
  }
}