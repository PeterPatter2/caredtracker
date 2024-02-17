import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_application_2/notification.dart';
import 'package:flutter/material.dart';

class notificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification
  ) async {

  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification
  ) async {
    
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
    ReceivedNotification receivedNotification
  ) async {
    
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
    ReceivedNotification receivedNotification
  ) async {
    
  }
}

class notificationList extends StatefulWidget {
  final List<notification> listItems;
  notificationList(this.listItems);

  @override
  State<notificationList> createState() => _notificationListState();
}

class _notificationListState extends State<notificationList> {
 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listItems.length,
        itemBuilder: (context, index) {
          var notis = widget.listItems[index];
          return Card(
              child: Row(children: <Widget>[
            Expanded(
                child: ListTile(
              title: Text(notis.title),
              subtitle: Text(notis.body),
            )),
            
          ]));
        });
  }
}