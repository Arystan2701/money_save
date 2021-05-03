import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_save/core/database/moor_database.dart';
import 'package:money_save/core/enums/viewstate.dart';
import 'package:money_save/core/viewmodels/home_model.dart';

import 'package:money_save/ui/views/base_view.dart';
import 'package:money_save/ui/widgets/home_view_widgets/app_drawer.dart';
import 'package:money_save/ui/widgets/home_view_widgets/app_fab.dart';
import 'package:money_save/ui/widgets/home_view_widgets/app_bar_title_widget.dart';
import 'package:money_save/ui/widgets/home_view_widgets/empty_transaction_widget.dart';
import 'package:money_save/ui/widgets/home_view_widgets/month_year_picker_widget.dart';
import 'package:money_save/ui/widgets/home_view_widgets/summary_widget.dart';
import 'package:money_save/ui/widgets/home_view_widgets/transactions_listview_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) async => await model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: buildAppBar(model.appBarTitle, model),
        drawer: AppDrawer(context),
        floatingActionButton: Visibility(
          visible: model.show,
          child: AppFAB(model.closeMonthPicker),
        ),
        body: !isloggedin
            ? CircularProgressIndicator()
            : model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SummaryWidget(
                            income: model.incomeSum,
                            expense: model.expenseSum,
                          ),
                          buildList(model.transactions, model),
                        ],
                      ),
                      model.isCollabsed
                          ? PickMonthOverlay(
                              model: model,
                              showOrHide: model.isCollabsed,
                              context: context)
                          : Container(),
                    ],
                  ),
      ),
    );
  }

  buildAppBar(String title, HomeModel model) {
    return AppBar(
      title: AppBarTitle(
        title: title,
        model: model,
      ),
      actions: [
        IconButton(
          key: const Key('homePage_logout_iconButton'),
          icon: const Icon(Icons.exit_to_app),
          onPressed: signOut,
        )
      ],
    );
  }

  buildList(List<Transaction> transactions, HomeModel model) {
    return transactions.length == 0
        ? EmptyTransactionsWidget()
        : TransactionsListView(transactions, model);
  }
}
