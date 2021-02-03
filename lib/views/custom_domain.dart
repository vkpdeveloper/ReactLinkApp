import 'package:flutter/material.dart';
import 'package:react_link_app/models/domain.dart';
import 'package:react_link_app/utils/http_utils.dart';
import 'package:react_link_app/widget/drawer.dart';

class CustomDomain extends StatefulWidget {
  CustomDomain({Key key}) : super(key: key);

  @override
  _CustomDomainState createState() => _CustomDomainState();
}

class _CustomDomainState extends State<CustomDomain> {
  List<Domain> allDomains;

  Future<bool> getDomain() async {
    allDomains = await HttpUtils.getDomains();
    setState(() {});
    return true;
  }

  bool _isLoading = false;

  bool isEditing = false;

  @override
  void initState() {
    getDomain();
    super.initState();
  }

  Container buildname(String name) {
    return Container(
      margin: EdgeInsets.only(left: 5, top: 10, bottom: 8),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          name,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }

  TextEditingController _domainname = TextEditingController();
  TextEditingController _defaulturl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerOnly(),
      appBar: AppBar(
        title: Text("Custom Domain"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
            barrierDismissible: false,
            barrierColor: Colors.black12,
            transitionDuration: Duration(milliseconds: 200),
            context: context,
            pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation) =>
                Material(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                  ),
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height - 350,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 6),
                            child: Text(
                              "Add custom Domain",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.all(6),
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.exit_to_app,
                                  color: Colors.black,
                                ),
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                            "you can add your own domain and use for your  URL's",
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            )),
                      ),
                      buildname("Domain"),
                      Container(
                        width: 250,
                        height: 50,
                        child: TextFormField(
                          controller: _domainname,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Enter Domain",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      buildname("Default URL"),
                      Container(
                        width: 250,
                        height: 50,
                        child: TextFormField(
                          controller: _defaulturl,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Enter long URL",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _isLoading
                          ? CircularProgressIndicator()
                          : MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Add Domain",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                bool isSubmitted = await HttpUtils.addDomain(
                                    domain: _domainname.text,
                                    domainUrl: _defaulturl.text);
                                getDomain();
                                print(isSubmitted);
                                setState(() {
                                  _isLoading = false;
                                });
                                Navigator.pop(context);
                              },
                              minWidth: MediaQuery.of(context).size.width - 60,
                              color: Colors.deepPurpleAccent,
                              height: 50,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
          print("button pressed");
        },
        child: Text(
          "+",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: allDomains != null
          ? allDomains.isNotEmpty
              ? ListView.builder(
                  itemCount: allDomains.length,
                  itemBuilder: (context, index) {
                    Domain model = allDomains[index];
                    return ListTile(
                      title: Text(model.domain),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              _defaulturl.text = model.defaultUrl;
                              _domainname.text = model.domain;
                              showGeneralDialog(
                                barrierDismissible: false,
                                barrierColor: Colors.black12,
                                transitionDuration: Duration(milliseconds: 200),
                                context: context,
                                pageBuilder: (BuildContext context,
                                        Animation animation,
                                        Animation secondaryAnimation) =>
                                    Material(
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        //border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                5.0) //                 <--- border radius here
                                            ),
                                      ),
                                      width: MediaQuery.of(context).size.width -
                                          50,
                                      height:
                                          MediaQuery.of(context).size.height -
                                              350,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 6),
                                                child: Text(
                                                  "Add custom Domain",
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.all(6),
                                                  child: CircleAvatar(
                                                    child: Icon(
                                                      Icons.exit_to_app,
                                                      color: Colors.black,
                                                    ),
                                                    backgroundColor:
                                                        Colors.grey,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Divider(),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                                "you can add your own domain and use for your  URL's",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 15,
                                                  decoration:
                                                      TextDecoration.none,
                                                )),
                                          ),
                                          buildname("Domain"),
                                          Container(
                                            width: 250,
                                            height: 50,
                                            child: TextFormField(
                                              controller: _domainname,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                hintText: "Enter Domain",
                                                border: new OutlineInputBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          5.0),
                                                  borderSide: new BorderSide(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          buildname("Default URL"),
                                          Container(
                                            width: 250,
                                            height: 50,
                                            child: TextFormField(
                                              controller: _defaulturl,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                hintText: "Enter long URL",
                                                border: new OutlineInputBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          5.0),
                                                  borderSide: new BorderSide(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          _isLoading
                                              ? CircularProgressIndicator()
                                              : MaterialButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Text(
                                                    "Edit Domain",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      _isLoading = true;
                                                    });
                                                    bool isSubmitted =
                                                        await HttpUtils
                                                            .editDomain(
                                                                domain:
                                                                    _domainname
                                                                        .text,
                                                                domainUrl:
                                                                    _defaulturl
                                                                        .text);
                                                    getDomain();
                                                    print(isSubmitted);
                                                    setState(() {
                                                      _isLoading = false;
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  minWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          60,
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                  height: 50,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),
                          model.isDeleteLoading
                              ? Container(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator())
                              : IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      model.isDeleteLoading = true;
                                    });
                                    await HttpUtils.deleteDomain(
                                        domain: model.domain);
                                    await getDomain();
                                    setState(() {
                                      model.isDeleteLoading = false;
                                    });
                                  },
                                  icon: Icon(Icons.delete),
                                )
                        ],
                      ),
                    );
                  })
              : Center(
                  child: Text("No domains found. Add one"),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
