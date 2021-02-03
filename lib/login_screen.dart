import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:react_link_app/provider/userprovider.dart';
import 'package:react_link_app/signup.dart';
import 'package:react_link_app/utils/http_utils.dart';
import 'package:react_link_app/views/homescreen.dart';
import './signup.dart';
import 'utils/models/userprofile.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/user/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserProvider _userProvider;
  Future<bool> login() async {
    var loginStatus = await HttpUtils.login(
        email: _emailadress.text, password: _password.text);
    _userProvider.init();

    return loginStatus;
  }

  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of(context, listen: false);
  }

  TextEditingController _emailadress = TextEditingController();
  TextEditingController _password = TextEditingController();

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "User Login",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "E-mail Adress ",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  child: TextFormField(
                    controller: _emailadress,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter email",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password ",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  child: TextFormField(
                    controller: _password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: new BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    final bool isLoggedIn = await login();
                    UserProfile userProfile =
                        await Provider.of<UserProvider>(context, listen: false)
                            .init();
                    if (isLoggedIn && userProfile != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    } else {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text("Login Unsuccessful"),
                        duration: const Duration(seconds: 3),
                      ));
                    }
                  },
                  minWidth: MediaQuery.of(context).size.width - 20,
                  color: Colors.deepPurpleAccent,
                  height: 50,
                ),
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  elevation: 20,

                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: Text(
                    "New to us? Signup",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  minWidth: MediaQuery.of(context).size.width - 20,
                  // color: Colors.deepPurpleAccent,

                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
