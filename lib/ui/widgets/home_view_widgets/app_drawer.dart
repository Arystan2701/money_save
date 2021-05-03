import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_save/ui/shared/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer(BuildContext context, {
    Key key,
  }) : super(key: key);

  signOut() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset(
              'assets/icons/wallet.png',
              width: 100,
              height: 100,
              alignment: Alignment.centerLeft,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
          ),
          ListTile(
            title: Text('Chart'),
            leading: Icon(Icons.pie_chart),
            onTap: () {
              Navigator.of(context).pushNamed("chart");
            },
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('Reminder'),
            leading: Icon(Icons.notifications),
            onTap: () {
              Navigator.of(context).pushNamed("reminder");
            },
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('Quit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              signOut();
              Navigator.of(context).pushNamed("start");
            },
          ),
        ],
      ),
    );
  }
}
