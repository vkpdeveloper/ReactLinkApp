import 'package:flutter/material.dart';
import 'package:react_link_app/widget/drawer.dart';

import 'new_link_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewLink()));
            },
            backgroundColor: Colors.deepPurpleAccent,
            label:
                Text("New Link", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          appBar: AppBar(
            //  automaticallyFImplyLeading: false,
            // leading: IconButton(
            //     icon: Icon(Icons.arrow_back),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     }),
            title: Text(
              "ReactLink",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Container(
                  margin: EdgeInsets.only(right: 5),
                  child: IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: Searchitem());
                      },
                      icon: Icon(
                        Icons.search,
                      )))
            ],
            backgroundColor: Colors.deepPurpleAccent,
          ),
          drawer: DrawerOnly(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Divider(
                color: Colors.black38,
              )
            ],
          )),
    );
  }
}

class Searchitem extends SearchDelegate {
  final searchitems = [
    "Tanisha",
    "Dandona",
    "Tanisha",
    "Dandona",
    "Tanisha",
    "Dandona",
    "Tanisha",
    "Dandona",
    "Tanisha",
    "Jovvy",
    "Vaibhav",
    "Dandona",
  ];
  final recentsearch = [
    "Tanisha",
    "Jovvy",
    "Vaibhav",
    "Dandona",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return Card(
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion = query.isEmpty
        ? recentsearch
        : searchitems.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestion.length,
      itemBuilder: (context, index) {
        return ListTile(
            onTap: () {
              showResults(context);
            },
            title: RichText(
                text: TextSpan(
                    text: suggestion[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: suggestion[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ])));
      },
    );
  }
}
