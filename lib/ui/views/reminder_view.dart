import 'package:flutter/material.dart';
import 'package:money_save/core/enums/viewstate.dart';
import 'package:money_save/core/viewmodels/reminder_model.dart';
import 'package:money_save/ui/views/base_view.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ReminderModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Reminder')),
        body: model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Daily Reminder'),
                    subtitle: Text(model.timeText),
                    trailing: InkWell(
                      child: Icon(Icons.edit),
                      onTap: () {
                        model.pickTime(context);
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
