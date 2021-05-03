import 'package:flutter/material.dart';
import 'package:money_save/core/database/moor_database.dart';
import 'package:money_save/login.dart';
import 'package:money_save/sign_up.dart';
import 'package:money_save/start.dart';
import 'package:money_save/ui/views/details_view.dart';
import 'package:money_save/ui/views/edit_view.dart';
import 'package:money_save/ui/views/home_page.dart';
import 'package:money_save/ui/views/insert_transaction_view.dart';
import 'package:money_save/ui/views/new_transaction_view.dart';
import 'package:money_save/ui/views/piechart_view.dart';
import 'package:money_save/ui/views/reminder_view.dart';
import 'package:money_save/ui/views/splash_view.dart';

const String initialRoute = "login";

class BaseRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashView());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case 'edit':
        var transaction = settings.arguments as Transaction;
        return MaterialPageRoute(builder: (_) => EditView(transaction));
      case 'chart':
        return MaterialPageRoute(builder: (_) => PieChartView());
      case 'newtransaction':
        return MaterialPageRoute(builder: (_) => NewTransactionView());
      case 'inserttransaction':
        var args = settings.arguments as List<dynamic>;
        return MaterialPageRoute(
            builder: (_) =>
                InsertTranscationView(args.elementAt(0), args.elementAt(1)));
      case 'details':
        var transaction = settings.arguments as Transaction;
        return MaterialPageRoute(builder: (_) => DetailsView(transaction));
      case 'reminder':
        return MaterialPageRoute(builder: (_) => ReminderView());
      case 'login':
        return MaterialPageRoute(builder: (_) => Login());
      case 'sign_up':
        return MaterialPageRoute(builder: (_) => SignUp());
      case 'start':
        return MaterialPageRoute(builder: (_) => Start());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
