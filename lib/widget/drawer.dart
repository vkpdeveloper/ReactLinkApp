import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:react_link_app/login_screen.dart';
import 'package:react_link_app/provider/userprovider.dart';
import 'package:react_link_app/utils/localstorage_utils.dart';
import 'package:react_link_app/utils/models/userprofile.dart';
import 'package:react_link_app/views/affiliate_tracking.dart';
import 'package:react_link_app/views/archivedLinks.dart';
import 'package:react_link_app/views/paymentSetting.dart';
import 'package:react_link_app/views/profileSetting.dart';
import 'package:react_link_app/views/tracking_pixels.dart';

import '../views/cta_box.dart';
import '../views/custom_domain.dart';
import '../views/folders.dart';
import '../views/homescreen.dart';

class DrawerOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);
    UserProfile profile = userProvider.userProfile;
    return Drawer(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 18, left: 10),
                child: CircleAvatar(
                  radius: 25,
                  // backgroundColor: whiteColor,
                  child: Text(
                    profile.fname[0].toUpperCase(),
                    style: TextStyle(
                        // color: appBarColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(profile.fname),
                    margin: EdgeInsets.only(top: 18),
                  ),
                  Text(profile.email)
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
              leading: Icon(Icons.blur_circular),
              title: Text("DashBoard"),
              onTap: () {
                print("dashboard");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomDomain()));
            },
            leading: Icon(Icons.blur_circular),
            title: Text("Custom Domain"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TrackingPixel()));
            },
            leading: Icon(Icons.graphic_eq),
            title: Text("Tracking Pixels"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AffiliateTracking()));
            },
            leading: Icon(Icons.compare_arrows),
            title: Text("Affiliate Tracking"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CtaBox()));
            },
            leading: Icon(Icons.bookmark),
            title: Text("CTA Box"),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("Folders"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FolderPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile Setting"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileSetting()));
            },
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentSetting()));
            },
            leading: Icon(Icons.person),
            title: Text("Payment Setting"),
          ),
          ListTile(
            leading: Icon(Icons.query_builder),
            title: Text("Archived Links"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ArchivedLink()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () async {
              await LocalStorageUtils().clearStorage();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
