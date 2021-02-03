import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:react_link_app/utils/localstorage_utils.dart';
import 'package:react_link_app/views/homescreen.dart';
import 'login_screen.dart';

import 'provider/plan_provider.dart';
import 'provider/userprovider.dart';
import 'utils/http_utils.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'utils/models/userprofile.dart';

class SignUpScreen extends StatefulWidget {
  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  var hostURL = HttpUtils.hostURL;
  UserProvider _userProvider;

  Future<bool> register() async {
    String endPoint = "/user/register";
    final res = await http.post("$hostURL$endPoint",
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "fname": _firstname.text,
          "lname": _lastname.text,
          "password": _password.text,
          "email": _email.text,
          "plan": _planProvider.getSelectedPlan
        }));
    if (res.statusCode == 200) {
      var loginResponse = await login();
      return loginResponse;
    } else {
      return false;
    }
  }

  Future<bool> login() async {
    var loginStatus =
        await HttpUtils.login(email: _email.text, password: _password.text);
    _userProvider.init();

    return loginStatus;
  }

  TextEditingController _firstname = TextEditingController();
  String message = '';
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  PlanProvider _planProvider;

  @override
  void initState() {
    super.initState();
    _planProvider = Provider.of<PlanProvider>(context, listen: false);
    _userProvider = Provider.of(context, listen: false);
    getAllPlans();
  }

  getAllPlans() async {
    var plans = await HttpUtils.getPlans();
    if (plans.isNotEmpty) {
      _planProvider.setPlans(plans);
      _planProvider.setSelectedPlan(plans[0].sId);
    }
  }

  //String Registration;

  // void getRegistration(String fname,String lname,String password) async {}

  Container buildcontainer(String name) {
    return Container(
      margin: EdgeInsets.only(left: 18, top: 10, bottom: 8),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          name,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    _planProvider = Provider.of<PlanProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "User SignUp",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 14, bottom: 8, top: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "First Name ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8, bottom: 8, top: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Last Name ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      child: TextFormField(
                        controller: _firstname,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "First name",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      child: TextFormField(
                        controller: _lastname,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Last name",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildcontainer("Email"),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 46,
                child: TextFormField(
                  validator: (val) =>
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val)
                          ? "error"
                          : null,
                  controller: _email,
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
              buildcontainer("Plan"),
              // Dropbutton(),
              _planProvider.getPlans.length > 0
                  ? DropdownButtonHideUnderline(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(left: 14, right: 5),
                        padding: EdgeInsets.only(left: 8),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.black38,
                          onChanged: (value) =>
                              _planProvider.setSelectedPlan(value),
                          value: _planProvider.getSelectedPlan,
                          items: _planProvider.getPlans
                              .map((e) => DropdownMenuItem(
                                    child: Text(e.name),
                                    value: e.sId,
                                  ))
                              .toList(),
                        ),
                      ),
                    )
                  : Text("loading..."),
              buildcontainer("Password"),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 46,
                child: TextFormField(
                  validator: (val) =>
                      val.length < 8 ? "enter valid password" : null,
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  final bool signUp = await register();
                  UserProfile userProfile =
                      await Provider.of<UserProvider>(context, listen: false)
                          .init();
                  if (signUp && userProfile != null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                minWidth: MediaQuery.of(context).size.width - 20,
                color: Colors.deepPurpleAccent,
                height: 50,
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                elevation: 10,

                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                child: Text(
                  "Already have an account? Login",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                minWidth: MediaQuery.of(context).size.width - 20,
                // color: Colors.deepPurpleAccent,

                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
