import 'package:flutter/material.dart';

class ProfileSetting extends StatefulWidget {
  ProfileSetting({Key key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  TextEditingController _lastname = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 14, top: 20),
              child: Text(
                "Profile ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 14),
              child: Text(
                "Update your profile details from here.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                  
                ),
              ),
            ),
            Divider(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 9),
              width: MediaQuery.of(context).size.width - 22,
              height: 50,
              child: TextFormField(
                controller: _email,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
            ),
            Divider(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: MaterialButton(
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                minWidth: MediaQuery.of(context).size.width - 50,
                onPressed: () {
                  print("upgrade plan pressed");
                },
                color: Colors.deepPurpleAccent,
                child: Text(
                  "Upgrade Plan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
