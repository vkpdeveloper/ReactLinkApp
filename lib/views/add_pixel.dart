import 'package:flutter/material.dart';
import 'package:react_link_app/models/pixel.dart';
import 'package:react_link_app/utils/http_utils.dart';
import 'package:react_link_app/views/tracking_pixels.dart';
import 'package:react_link_app/widget/drawer.dart';

extension StringLibrary on String {
  String makeFirstLetterCapital() {
    String firstLetter = this[0];
    String leftString = this.substring(1, this.length);
    return "${firstLetter.toUpperCase()}$leftString";
  }
}

class AddPixel extends StatefulWidget {
  final Pixel editModel;
  

  const AddPixel({Key key, this.editModel}) : super(key: key);

  @override
  _AddPixelState createState() => _AddPixelState();
}

class _AddPixelState extends State<AddPixel> {
  TextEditingController _name = TextEditingController();
  TextEditingController _tag = TextEditingController();
  String id;
  bool _isLoading = false;
  String _value = "Facebook";
  List _listitems = [
    "Facebook",
    "Twitter ",
    "Linkedin",
    "Quora",
    "Snapchat",
    "Adwords",
    "Adroll"
  ];

  @override
  void initState() {
    if (widget.editModel != null) {
      _name.text = widget.editModel.name;
      _tag.text = widget.editModel.tag;
      id = widget.editModel.sId;
      _value = widget.editModel.provider.makeFirstLetterCapital();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerOnly(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20),
                    child: Text(
                      "Add Pixel",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20, right: 10),
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
              Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: Text(
                  "You can add your pixels here and can integrate with your links.",
                  style: TextStyle(color: Colors.black45, fontSize: 14),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 50,
                child: TextFormField(
                  controller: _name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter name",
                    hintStyle: TextStyle(color: Colors.black38),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Provider ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
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
                    ),
                  ))
                ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Tag ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 50,
                child: TextFormField(
                  controller: _tag,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "123456789",
                    hintStyle: TextStyle(color: Colors.black38),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(color: Colors.grey[200]),
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
                      minWidth: MediaQuery.of(context).size.width - 20,
                      height: 45,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.deepPurpleAccent,
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        if (widget.editModel != null) {
                          await HttpUtils.editPixel(
                              name: _name.text,
                              tag: _tag.text,
                              provider: _value,
                              id: id);
                        } else {
                          await HttpUtils.addPixel(
                              name: _name.text,
                              tag: _tag.text,
                              provider: _value);
                        }
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        widget.editModel != null ? "Edit Pixel" : "Add Pixel",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
