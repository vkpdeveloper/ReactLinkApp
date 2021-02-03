import 'package:flutter/material.dart';
import 'package:react_link_app/config/countries.dart';
import 'package:react_link_app/enums/selected_link_type.dart';

class NewLink extends StatefulWidget {
  @override
  _NewLinkState createState() => _NewLinkState();
}

class _NewLinkState extends State<NewLink> {
  @override
  String selected;
  List<String> _countries = [];
  String _selectedCountry = "India";
  var _selectedLinkType = SelectedLinkType.direct;

  void initState() {
    super.initState();
    codes.forEach((code) => _countries.add(code['name']));
    selected = textEditingController.text;
  }

  TextEditingController _enterLongUrl = TextEditingController();
  TextEditingController _longurl = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController _fallbackUrl = TextEditingController();
  TextEditingController _shortenlinkController = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController _choosedomain = TextEditingController();
  TextEditingController _utmSource = TextEditingController();
  TextEditingController _utmMedium = TextEditingController();
  TextEditingController _utmName = TextEditingController();
  TextEditingController _utmTerm = TextEditingController();
  TextEditingController _utmContent = TextEditingController();
  TextEditingController _templateName = TextEditingController();
  DateTime _date = DateTime.now();
  String _value;
  List _listitems = [
    "iPad",
    "iPhone ",
    "Android",
    "BlackBerry",
  ];

  Future<Null> _selectdate(BuildContext context) async {
    DateTime _dateTime = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1950),
        lastDate: DateTime(2030));
    if (_dateTime != null && _dateTime != _date) {
      setState(() {
        _dateTime = _date;
        textEditingController.value = TextEditingValue(text: _date.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 20, bottom: 5),
                child: Text(
                  "Create Link",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 5),
                child: Text(
                  "Wohoo! Great to see you creating a new link",
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  " Long URL",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 8, top: 5),
                child: Text(
                  "Place the long URL that you wish to shorten",
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 10),
                width: MediaQuery.of(context).size.width - 10,
                height: 46,
                child: TextFormField(
                  controller: _longurl,
                  decoration: InputDecoration(
                    hintText: "Paste Long Url",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  " Choose Type",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 8, top: 2),
                child: Text(
                  "choose the redirection type of shorten link",
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Direct  button");
                      setState(() {
                        _selectedLinkType = SelectedLinkType.direct;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      height: 90,
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: Column(
                        children: [
                          Text("Direct",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          Text(
                              "This will directly land your user to your long URL",
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  _selectedLinkType == SelectedLinkType.direct
                                      ? Theme.of(context).primaryColor
                                      : Colors.black38),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedLinkType = SelectedLinkType.iFrame;
                      });
                    },
                    child: Container(
                      height: 90,
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: Column(
                        children: [
                          Text("iFrame",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          Text("Your Link will be shown in iFrame",
                              style: TextStyle(fontSize: 12))
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  _selectedLinkType == SelectedLinkType.iFrame
                                      ? Theme.of(context).primaryColor
                                      : Colors.black38),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedLinkType = SelectedLinkType.ctaBox;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      height: 90,
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: Column(
                        children: [
                          Text("CTA Box",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          Text("You can select CTA while link in iFrame",
                              style: TextStyle(fontSize: 12))
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  _selectedLinkType == SelectedLinkType.ctaBox
                                      ? Theme.of(context).primaryColor
                                      : Colors.black38),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  top: 20,
                ),
                child: Text(
                  " Choose Domain",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  bottom: 5,
                  top: 2,
                ),
                child: Text(
                  "choose the domain that you want to use with redirection",
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 45,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  " Settings",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 5, top: 2, right: 2),
                child: Text(
                  "configure basic settings for your link.",
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, top: 2, right: 2),
                child: Text(
                  "choose custom alias for your shorten link",
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 50,
                margin: EdgeInsets.only(left: 10, top: 10),
                child: TextFormField(
                  controller: _shortenlinkController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: " name",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 8),
                child: Text(
                  "enter password to protect your link else leave empty",
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 8),
                width: MediaQuery.of(context).size.width - 20,
                height: 50,
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordcontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 8),
                child: Text(
                  "Set experience date of your link,its optional",
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width - 20,
                child: TextFormField(
                  onTap: () {
                    _selectdate(context);
                  },
                  readOnly: true,
                  controller: nameEditingController,
                  decoration: InputDecoration(
                    hintText: _date.toString(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 8),
                child: Text(
                  "Enter password to protect your link else leave empty",
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 8),
                width: MediaQuery.of(context).size.width - 20,
                height: 50,
                child: TextFormField(
                  controller: _fallbackUrl,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Fallback URL",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    ExpansionTile(
                      trailing: MaterialButton(
                        color: Colors.deepPurpleAccent,
                        highlightColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: null,
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UTM Builder",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "You can use below settings to pass UTM parameters to your link",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black38),
                          ),
                        ],
                      ),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Source "),
                            Text("Medium"),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2, bottom: 8),
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: 50,
                              child: TextFormField(
                                controller: _utmSource,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "UTM Source",
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, bottom: 8),
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: 50,
                              child: TextFormField(
                                controller: _utmMedium,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "UTM Medium",
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Name "),
                            Text("Term"),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2, bottom: 8),
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: 50,
                              child: TextFormField(
                                controller: _utmName,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "UTM Name",
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, bottom: 8),
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: 50,
                              child: TextFormField(
                                controller: _utmTerm,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "UTM Term",
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                    borderSide: new BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text("Content"),
                        Container(
                          margin: EdgeInsets.only(left: 2, bottom: 8),
                          width: MediaQuery.of(context).size.width - 20,
                          height: 50,
                          child: TextFormField(
                            controller: _utmContent,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Utm Content here..",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width - 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {},
                          child: Text(
                            "Select UTM template",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.deepPurpleAccent,
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width - 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {},
                          child: Text(
                            "Add to templates",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.deepPurpleAccent,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                width: MediaQuery.of(context).size.width - 10,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    ExpansionTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Device  Targeting",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "You can redirect users based on device",
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.black38),
                          ),
                        ],
                      ),
                      children: <Widget>[
                        Wrap(
                          runSpacing: 10,
                          spacing: 10,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              minWidth: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text(
                                      "Save as Device Targeting Template",
                                    ),
                                    content: Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 10),
                                        child: Column(
                                          children: [
                                            Divider(),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 8, top: 8),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  "Template Name",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5, left: 2, bottom: 8),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  20,
                                              height: 50,
                                              child: TextFormField(
                                                controller: _templateName,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      "Enter Template Name",
                                                  border:
                                                      new OutlineInputBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(5.0),
                                                    borderSide:
                                                        new BorderSide(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            MaterialButton(
                                              minWidth: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  20,
                                              onPressed: () {},
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                              color: Colors.deepPurpleAccent,
                                            )
                                          ],
                                        )),
                                  ),
                                );
                              },
                              child: Text(
                                "Save as Template",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.deepPurpleAccent,
                            ),
                            MaterialButton(
                              minWidth: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text(
                                      "Select Device Targeting Template",
                                      maxLines: 2,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                "Select from Template",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.deepPurpleAccent,
                            ),
                            MaterialButton(
                              minWidth: 20,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => StatefulBuilder(
                                    builder: (context, _setState) =>
                                        AlertDialog(
                                      content: Material(
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 5, top: 40),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5, top: 40),
                                                      child: Text(
                                                        "Add device targeting ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 20, right: 5),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: CircleAvatar(
                                                          radius: 20,
                                                          child: Icon(
                                                            Icons.exit_to_app,
                                                            color: Colors.black,
                                                          ),
                                                          backgroundColor:
                                                              Colors.grey[300],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 8, top: 8),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "The selected device will redirect user to your long URL below.",
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 8, top: 8),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "Device",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 5),
                                                  height: 60,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      24,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black38),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child:
                                                      Column(children: <Widget>[
                                                    DropdownButtonHideUnderline(
                                                        child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: DropdownButton(
                                                        value: _value,
                                                        onChanged: (value) {
                                                          print("object");
                                                          _setState(() {
                                                            _value = value;
                                                          });
                                                        },
                                                        elevation: 3,
                                                        iconEnabledColor:
                                                            Colors.black,
                                                        iconDisabledColor:
                                                            Colors.black38,
                                                        icon: Icon(Icons
                                                            .keyboard_arrow_down),
                                                        isExpanded: true,
                                                        items: _listitems
                                                            .map((value) {
                                                          print(value);
                                                          return DropdownMenuItem(
                                                              value: value,
                                                              child:
                                                                  Text(value));
                                                        }).toList(),
                                                        hint: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            ("Select device"),
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black38),
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                                  ]),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 8, top: 8),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "Long URL",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5,
                                                      left: 2,
                                                      bottom: 8),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      20,
                                                  height: 50,
                                                  child: TextFormField(
                                                    controller: _enterLongUrl,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          "Enter long URL",
                                                      border:
                                                          new OutlineInputBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(5.0),
                                                        borderSide:
                                                            new BorderSide(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                MaterialButton(
                                                  minWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          20,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Save",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.deepPurpleAccent,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                width: MediaQuery.of(context).size.width - 10,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    ExpansionTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Geo Targeting",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "You can redirect users based on country",
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.black38),
                          ),
                        ],
                      ),
                      children: <Widget>[
                        Wrap(
                          runSpacing: 10,
                          spacing: 10,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              minWidth: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Container(
                                      margin: EdgeInsets.only(left: 5, top: 40),
                                      child: Text(
                                        "Save as Geo Targeting Template",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    content: Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 5),
                                        child: Column(
                                          children: [
                                            Divider(),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 8, top: 8),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  "Template Name",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5, left: 2, bottom: 8),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  20,
                                              height: 50,
                                              child: TextFormField(
                                                controller: _templateName,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      "Enter Template Name",
                                                  border:
                                                      new OutlineInputBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(5.0),
                                                    borderSide:
                                                        new BorderSide(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            MaterialButton(
                                              minWidth: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  20,
                                              onPressed: () {},
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                              color: Colors.deepPurpleAccent,
                                            )
                                          ],
                                        )),
                                  ),
                                );
                              },
                              child: Text(
                                "Save as Template",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.deepPurpleAccent,
                            ),
                            MaterialButton(
                              minWidth: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => StatefulBuilder(
                                    builder: (context, _setState) =>
                                        AlertDialog(
                                      title: Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 10),
                                        child: Text(
                                          "Select Geo Targeting Template",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      content: Material(
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(left: 5, top: 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                "Select from Template",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.deepPurpleAccent,
                            ),
                            MaterialButton(
                              minWidth: 20,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => StatefulBuilder(
                                    builder: (context, _setState) =>
                                        AlertDialog(
                                      title: Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 40),
                                        child: Text(
                                          "Add device targeting ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      content: Material(
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: 5, top: 10),
                                            child: Column(
                                              children: [
                                                Divider(),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 8, top: 8),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "The selected country users will be redirected to below long URL.",
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 8, top: 8),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "Device",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 5),
                                                  height: 60,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      24,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black38),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child:
                                                      Column(children: <Widget>[
                                                    DropdownButtonHideUnderline(
                                                        child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: DropdownButton(
                                                        value: _selectedCountry,
                                                        onChanged: (value) {
                                                          print("object");
                                                          _setState(() {
                                                            _selectedCountry =
                                                                value;
                                                          });
                                                        },
                                                        elevation: 3,
                                                        iconEnabledColor:
                                                            Colors.black,
                                                        iconDisabledColor:
                                                            Colors.black38,
                                                        icon: Icon(Icons
                                                            .keyboard_arrow_down),
                                                        isExpanded: true,
                                                        items: _countries
                                                            .map((value) {
                                                          print(value);
                                                          return DropdownMenuItem(
                                                              value: value,
                                                              child:
                                                                  Text(value));
                                                        }).toList(),
                                                        hint: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            ("Select device"),
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black38),
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                                  ]),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 8, top: 8),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "Long URL",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5,
                                                      left: 2,
                                                      bottom: 8),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      20,
                                                  height: 50,
                                                  child: TextFormField(
                                                    controller: _enterLongUrl,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          "Enter long URL",
                                                      border:
                                                          new OutlineInputBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(5.0),
                                                        borderSide:
                                                            new BorderSide(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                MaterialButton(
                                                  minWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          20,
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Add Country",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.deepPurpleAccent,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Create link",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  height: 45,
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  minWidth: MediaQuery.of(context).size.width - 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
