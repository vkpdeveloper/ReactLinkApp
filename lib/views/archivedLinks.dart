import 'package:flutter/material.dart';
import 'package:react_link_app/widget/drawer.dart';

class ArchivedLink extends StatefulWidget {
  ArchivedLink({Key key}) : super(key: key);

  @override
  _ArchivedLinkState createState() => _ArchivedLinkState();
}

class _ArchivedLinkState extends State<ArchivedLink> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Archived Links",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        drawer: DrawerOnly(),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                "Archived Links",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Divider(
              height: 10,
            ),
            Text("No links found",
                style: TextStyle(
                  fontSize: 14,
                ))
          ],
        ),
      ),
    );
  }
}
