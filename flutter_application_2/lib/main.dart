import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/notificationPage.dart';
import 'package:flutter_application_2/stats.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'MainPage.dart';
import 'package:flutter_application_2/settingPage.dart';
import 'notificationList.dart';

void main() async {
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'channelKey',
        channelName: 'channelName',
        channelDescription: 'channelDescription',
        channelGroupKey: 'group_key')
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'group_key', channelGroupName: 'channelGroupName')
  ]);
  bool notificationAllowed =
      await AwesomeNotifications().isNotificationAllowed();
  if (!notificationAllowed) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontFamily: 'hind'),
          // Add other text styles as needed
        ),
      ),
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  stats s = stats();
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: notificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            notificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            notificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            notificationController.onActionReceivedMethod);
            if (s.getBpm() > 90){
      AwesomeNotifications().createNotification(
                      content: NotificationContent(
                          id: 1,
                          channelKey: 'channelKey',
                          title: "แจ้งเตือน",
                          body: "อัตราการเต้นของหัวใจผิดปกติ"));
    }
    
    if (s.getTemp() > 40){
      AwesomeNotifications().createNotification(
                      content: NotificationContent(
                          id: 1,
                          channelKey: 'channelKey',
                          title: "แจ้งเตือน",
                          body: "อุณหภูมิร่างกายสูงกว่าปกติ"));
    }
    if (s.getO2() < 70){
      AwesomeNotifications().createNotification(
                      content: NotificationContent(
                          id: 1,
                          channelKey: 'channelKey',
                          title: "แจ้งเตือน",
                          body: "ปริมาณออกซิเจนในเลือดต่ำกว่าปกติ"));
    }
    super.initState();
  }
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    Main(),
    home(),
    notificationPage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToProfilePage() {
    setState(() {
      _selectedIndex = 1; // Index of the profile page in the _pages list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blue,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home),
                label: 'หน้าหลัก',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user),
                label: 'โปรไฟล์',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bell),
                label: 'แจ้งเตือน',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.cog),
                label: 'ตั้งค่า',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedFontSize: 22,
            unselectedFontSize: 22,
            selectedItemColor: Colors.blue[200],
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
