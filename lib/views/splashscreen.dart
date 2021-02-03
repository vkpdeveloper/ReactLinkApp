import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:react_link_app/login_screen.dart';
import 'package:react_link_app/provider/userprovider.dart';
import 'package:react_link_app/utils/localstorage_utils.dart';
import 'package:react_link_app/utils/models/userprofile.dart';
import 'package:react_link_app/views/homescreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocalStorageUtils _localStorageUtils = LocalStorageUtils();
  UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    checkLoginAndGetProfile();
  }

  checkLoginAndGetProfile() async {
    Timer(Duration(seconds: 2), () async {
      if (_localStorageUtils.isUserLoggedIn()) {
        UserProfile userProfile = await _userProvider.init();
        if (userProfile == null) {
          LocalStorageUtils().clearStorage();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        } else {
          Timer(Duration(seconds: 1), () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          });
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "React Link",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
