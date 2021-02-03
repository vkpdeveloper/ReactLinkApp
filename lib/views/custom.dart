import 'package:flutter/material.dart';
import 'package:react_link_app/widget/drawer.dart';

class CustomOption extends StatefulWidget {
  @override
  _CustomOptionState createState() => _CustomOptionState();
}

class _CustomOptionState extends State<CustomOption> {
  TextEditingController _name;

  TextEditingController _message;

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
    return SafeArea(
        child: Scaffold(
            drawer: DrawerOnly(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              "Add CTA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: Icon(
                                  Icons.exit_to_app,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      buildcontainer("Name"),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 46,
                        child: TextFormField(
                          controller: _name,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter name",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      buildcontainer("Script"),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 100,
                        child: TextFormField(
                          //  maxLength: 50,
                          maxLines: 15,
                          controller: _message,
                          // obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Paste CTA Box Script",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        height: 40,
                        minWidth: MediaQuery.of(context).size.width - 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.deepPurpleAccent,
                        onPressed: () {},
                        child: Text(
                          "Add CTA",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )));
  }
}
