import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodybite_neo/ui/neo_bottom_nav_bar.dart';
import 'screens/home.dart';
import 'utils/constants.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        textTheme: TextTheme(
            title: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
  
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  Future _locationDetails;

  Future fetchLocationDetails() async {
    final response = await http.get(
        'https://developers.zomato.com/api/v2.1/location_details?entity_id=36&entity_type=city',
        headers: {'Content-Type': 'application/json', 'user-key': userKey});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Fetching failed');
    }
  }

  @override
  void initState() {
    super.initState();
    _locationDetails = fetchLocationDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neo_bg,
      body: SingleChildScrollView(
        child: Home(
          locationDetails: _locationDetails,
        ),
      ),
      bottomNavigationBar: NeoBottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/home.png'),
                color: inactive_color,
              ),
              activeIcon: ImageIcon(
                AssetImage('assets/images/home_selected.png'),
                color: primaryBlue,
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/favourite.png'),
                color: inactive_color,
              ),
              activeIcon: ImageIcon(
                AssetImage('assets/images/favourite_selected.png'),
                color: primaryBlue,
              ),
              title: Text('Favorite'),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/notification.png'),
                color: inactive_color,
              ),
              activeIcon: ImageIcon(
                AssetImage('assets/images/notification_selected.png'),
                color: primaryBlue,
              ),
              title: Text('Notification'),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/user.png'),
                color: inactive_color,
              ),
              activeIcon: ImageIcon(
                AssetImage('assets/images/user_selected.png'),
                color: primaryBlue,
              ),
              title: Text('User'),
            ),
          ]),
    );
  }
}
