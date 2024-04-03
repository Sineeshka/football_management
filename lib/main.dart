import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/models/user.dart';
import 'package:sample/pages/signup.dart';
import 'package:sample/pages/wrapper.dart';
import 'package:sample/services/auth.dart';
// Import the generated file
import 'firebase_options.dart';
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.android,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user, 
      initialData:null,
      child: MaterialApp(
      home:Wrapper()),);
  }
}