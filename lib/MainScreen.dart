import 'package:flutter/material.dart';
import 'db_helper.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DBHelper dbHelper = DBHelper();
  late User? userData;

  @override
  void initState() {
    super.initState();
    print('Fetching user information...');
    getUserInfo();
  }

  void getUserInfo() async {
    User? user = await dbHelper.getUserData();
    if (user != null) {
      print('User information retrieved: $user');
      setState(() {
        userData = user;
      });
    } else {
      print('No user information found.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: userData != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username: ${userData!.username}'),
                Text('Phone: ${userData!.phone}'),
                Text('Address: ${userData!.address}'),
                Text('Email: ${userData!.email}'),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
