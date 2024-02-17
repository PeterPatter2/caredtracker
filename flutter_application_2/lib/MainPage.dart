import 'package:flutter/material.dart';
import 'package:flutter_application_2/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_2/newUser.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
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
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.0), // Adjust the height as needed
          child: AppBar(
            title: Container(
              padding: EdgeInsets.only(top: 13),
            ),
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/AppBarMainPage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ProfileWidget(),
      ),
      routes: {
        '/home': (context) => home(),
      },
    );
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.start,
      children: [
        // Previous User Profile
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(
                      'assets/images/UserProfile1.jpg'), // Add your user profile image
                ),
                SizedBox(height: 12),
                Text(
                  'ออสก้า', // Add your user name
                  style: TextStyle(
                    color: Colors.lightBlue[300],
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Add Button
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => newUser()));
          },
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/AddLogo.png'),
                  backgroundColor: Colors.grey[300],
                ),
                SizedBox(height: 12),
                Text(
                  'เพื่มบุคคล',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
