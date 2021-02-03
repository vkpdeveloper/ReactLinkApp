import 'package:flutter/material.dart';

class AddBrand extends StatefulWidget {
  AddBrand({Key key}) : super(key: key);

  @override
  _AddBrandState createState() => _AddBrandState();
}

class _AddBrandState extends State<AddBrand> {
  String _value;
  String _val = "India";

  TextEditingController _brandName = TextEditingController();
  List _listitems = [
    "Australia",
    "Brazil",
    "Canada",
    "China",
    "France",
    "Germany",
    "Italy",
    "India",
    "Japan",
    "Mexico",
    "Netherlands",
    "Singapore",
    "Spain",
    "United Arab Emirates",
    "United Kingdom",
    "United States"
  ];
  List _listProvider = [
    "Amazon",
  ];
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
                      "Add Brand",
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
                  "You can add your Amazon tracking ID here.",
                  style: TextStyle(color: Colors.black45, fontSize: 14),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Provider",
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
                      items: _listProvider.map((value) {
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
                    "Brand name ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 50,
                child: TextFormField(
                  controller: _brandName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter your brand name",
                    hintStyle: TextStyle(color: Colors.black38),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Text("Country")),
                  Container(
                      child: Text(
                    "Tag ID",
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: DropdownButton(
                        value: _val,
                        onChanged: (value) {
                          print("object");
                          setState(() {
                            _val = value;
                          });
                        },
                        elevation: 3,
                        underline: Container(),
                        isExpanded: true,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.black38,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: _listitems.map((value) {
                          print(value);
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _brandName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Enter your brand name",
                          hintStyle: TextStyle(color: Colors.black38),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
