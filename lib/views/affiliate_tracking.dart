import 'package:flutter/material.dart';
import 'package:react_link_app/views/addBrand.dart';
import 'package:react_link_app/widget/drawer.dart';

class AffiliateTracking extends StatefulWidget {
  AffiliateTracking({Key key}) : super(key: key);

  @override
  _AffiliateTrackingState createState() => _AffiliateTrackingState();
}

class _AffiliateTrackingState extends State<AffiliateTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddBrand()));
        },
        backgroundColor: Colors.deepPurpleAccent,
        label: Text("Add Brand", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      appBar: AppBar(
        title: Text(
          "Affiliate Brands",
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
              top: 10,
            ),
            child: Text(
              "Affiliate Brands",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Divider(),
          Text(
            "No brands found.Add one",
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
