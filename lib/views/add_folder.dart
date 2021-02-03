import 'package:flutter/material.dart';
import 'package:react_link_app/models/folder.dart';

import 'package:react_link_app/utils/http_utils.dart';


extension StringLibrary on String {
  String makeFirstLetterCapital() {
    String firstLetter = this[0];
    String leftString = this.substring(1, this.length);
    return "${firstLetter.toUpperCase()}$leftString";
  }
}

class AddFolderPage extends StatefulWidget {
  final Folders editModel;

  const AddFolderPage({Key key, this.editModel}) : super(key: key);
  @override
  _AddFolderPageState createState() => _AddFolderPageState();
}

class _AddFolderPageState extends State<AddFolderPage> {
  TextEditingController _name = TextEditingController();
  String _value;
  bool _isLoading = false;
  String id;
  List _listitems = ["Private", "Public"];
  void initState() {
    if (widget.editModel != null) {
      _name.text = widget.editModel.name;
      id = widget.editModel.sId;
      _value = widget.editModel.status.makeFirstLetterCapital();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20),
                    child: Text(
                      "Add Folder",
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
                  "You can add folder  and can allot links to it.",
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
                    hintText: "Enter folder name",
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
                    "Status ",
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
                      hint: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ("Private"),
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                  ))
                ]),
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
                          await HttpUtils.editFolder(
                              name: _name.text, status: _value, id: id);
                        } else {
                          await HttpUtils.createFolder(
                              name: _name.text, status: _value);
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
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
