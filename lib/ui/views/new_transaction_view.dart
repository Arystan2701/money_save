import 'package:flutter/material.dart';
import 'package:money_save/core/viewmodels/new_transcation_model.dart';
import 'package:money_save/ui/shared/ui_helpers.dart';
import 'package:money_save/ui/views/base_view.dart';
import 'package:money_save/ui/widgets/new_transaction_view_widget/transaction_type_spinner.dart';

class NewTransactionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<NewTransactionModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: TransactionTypeSpinner(
              model.selectedCategory, model.changeSelectedItem),
        ),
        body: SafeArea(
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.2,
            children: model
                .loadCategoriesIcons()
                .map((e) => Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("inserttransaction",
                            arguments: [e, model.selectedCategory]);
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(e.name),
                            UIHelper.verticalSpaceSmall(),
                            CircleAvatar(
                              radius: 30,
                              child: Center(
                                child: Icon(
                                  e.icon,
                                  size: 25,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )))
                .toList(),
          ),
        ),
      ),
    );
  }
}
