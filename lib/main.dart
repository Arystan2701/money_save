import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_save/home_page.dart';
import 'package:money_save/login.dart';
import 'package:money_save/sign_up.dart';
import 'package:money_save/start.dart';
import 'package:money_save/locator.dart';
import 'package:money_save/ui/base_router.dart';
import 'package:money_save/ui/shared/app_colors.dart';


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       theme: ThemeData(
//           primaryColor: Colors.orange
//       ),
//       debugShowCheckedModeBanner: false,
//       home:
//
//       HomePage(),
//
//       routes: <String,WidgetBuilder>{
//
//         "Login" : (BuildContext context)=>Login(),
//         "SignUp":(BuildContext context)=>SignUp(),
//         "start":(BuildContext context)=>Start(),
//       },
//
//     );
//   }
//
// }



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Save',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: backgroundColor,
        accentColor: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: BaseRouter.generateRoute,
    );
  }
}
