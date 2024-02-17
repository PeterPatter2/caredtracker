import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_application_2/notification.dart';
import 'package:flutter_application_2/notificationList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/stats.dart';


class notificationPage extends StatefulWidget {
  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  List<notification> notis = [];
  
@override
  void initState() {
     if (s.getBpm() > 90){
      newNoti('อัตราการเต้นของหัวใจผิดปกติ', 'แจ้งเตือน');
    }
    
    if (s.getTemp() > 40){
     
    }
    if (s.getO2() < 70){
     
    }
    // TODO: implement initState
    super.initState();
  }
  



  void newNoti(String header, String sub) {
    setState(() {
      notis.insert(0, notification(header, sub));
    });
  }

  int i = 0;
  stats s = stats();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Notification'), backgroundColor: Colors.blue),
        body: Column(children: <Widget>[
          Expanded(child: notificationList(notis))
        ]));
  }
}
