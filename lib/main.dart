import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/user_provider.dart';
import 'view/home.dart';
import 'view/login.dart';
import 'view/spalsh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) =>UserProvider()),
                
      ],
      child: MaterialApp(
        title: 'Mind Craft',
    
       routes: {
        '/':(content)=>const Splash(),
        '/login':(context)=>const Login(),
            '/home':(context)=>const HomeScreen()

       
       },
      ),
    );
  }
}
