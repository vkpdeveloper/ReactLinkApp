import 'package:flutter/material.dart';

import 'package:react_link_app/views/custom.dart';
import 'package:react_link_app/widget/drawer.dart';
import 'package:react_link_app/views/template.dart';

class CtaBox extends StatefulWidget {
  @override
  _CtaBoxState createState() => _CtaBoxState();
}

class _CtaBoxState extends State<CtaBox> {
  int selected;
  @override
  void initState() {
    selected = null;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerOnly(),
        appBar: AppBar(
          title: Text("CTA Box"),
          automaticallyImplyLeading: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showGeneralDialog(
              barrierDismissible: false,
              barrierColor: Colors.black12,
              transitionDuration: Duration(milliseconds: 200),
              context: context,
              pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) =>
                  Material(
                child: Container(
                    margin: EdgeInsets.only(left: 5, top: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5, top: 40),
                              child: Text(
                                "Add CTA",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, right: 5),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  child: Icon(
                                    Icons.exit_to_app,
                                    color: Colors.black,
                                  ),
                                  backgroundColor: Colors.grey[300],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              hoverColor: Colors.blueGrey[100],
                              splashColor: Colors.blueGrey[100],
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TemplateOption()));
                                print("object one");
                              },
                              child: Container(
                                height: 70,
                                margin: EdgeInsets.only(left: 5, top: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26)),
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 8, top: 8),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "Template",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 5),
                                      child: Text(
                                          "Create CTA box using our CTA builder"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              hoverColor: Colors.blueGrey,
                              splashColor: Colors.blueGrey,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CustomOption()));
                                print("object tanu");
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5, top: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26)),
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 8),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "Custom",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 8, top: 5),
                                      child: Text(
                                        "Put your custom script of CTA  box",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            );
          },
          backgroundColor: Colors.deepPurpleAccent,
          label: Text("Add CTA", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "CTA Boxes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "No CTA box found.Add one!",
                  style: TextStyle(color: Colors.black45),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircularAvatar extends StatelessWidget {
  const CircularAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Add CTA");
  }
}
