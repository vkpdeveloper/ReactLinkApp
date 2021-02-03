import 'package:flutter/material.dart';
import 'package:react_link_app/widget/drawer.dart';

class TemplateOption extends StatefulWidget {
  @override
  _TemplateOptionState createState() => _TemplateOptionState();
}

class _TemplateOptionState extends State<TemplateOption> {
  String _value;
  List _listitems = [
    "Bottom left",
    "Bottom right ",
    "Top left",
    "Top right",
  ];
  TextEditingController _name=TextEditingController();
  TextEditingController _title=TextEditingController();
  TextEditingController _message=TextEditingController();
  TextEditingController _btnLink=TextEditingController();
  TextEditingController _buttontext=TextEditingController();
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
                  buildcontainer("Position"),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 60,
                    width: MediaQuery.of(context).size.width - 24,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(children: <Widget>[
                      DropdownButtonHideUnderline(
                          child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: DropdownButton(
                          value: _value,
                          onChanged: (value) {
                            print("object");
                            setState(() {
                              _value = value;
                            });
                          },
                          elevation: 3,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.black38,
                          icon: Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          items: _listitems.map((value) {
                            print(value);
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                          hint: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              ("Botton left"),
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black38),
                            ),
                          ),
                        ),
                      ))
                    ]),
                  ),
                  buildcontainer("Title"),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 46,
                    child: TextFormField(
                      controller: _title,
                      decoration: InputDecoration(
                        hintText: "Enter Boxlabel",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                  ),
                  buildcontainer("Message"),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 100,
                    child: TextFormField(
                      //  maxLength: 50,
                      maxLines: 15,
                      controller: _message,
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter CTA Box Message",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  buildcontainer("Button Text"),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 46,
                    child: TextFormField(
                      controller: _buttontext,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter CTA Box Message",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                  ),
                  buildcontainer("Button Link"),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 46,
                    child: TextFormField(
                      controller: _btnLink,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter CTA Box Message",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
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
        ),
      ),
    );
  }
}
