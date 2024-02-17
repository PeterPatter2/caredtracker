import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_application_2/notification.dart';
import 'package:flutter_application_2/notificationList.dart';
import 'package:flutter/material.dart';

class notificationPage extends StatefulWidget {
  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  List<notification> notis = [];



  void newNoti(String header, String sub) {
    setState(() {
      notis.insert(0, notification(header, sub));
    });
  }

  int i = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Notification Test'), backgroundColor: Colors.blue),
        body: Column(children: <Widget>[
          Expanded(child: notificationList(notis)), FloatingActionButton(onPressed: () {
            if (i >= 4){
AwesomeNotifications().createNotification(
                      content: NotificationContent(
                          id: 1,
                          channelKey: 'channelKey',
                          title: "แจ้งเตือน",
                          body: "อุณหภูมิร่างกายสูงกว่าปกติ"));
            }
            
           if (i >= 4){
             newNoti('อุณหภูมิร่างกายสูงกว่าปกติ' , 'แจ้งเตือน');
           }  i++;
          })
        ]));
  }
}
