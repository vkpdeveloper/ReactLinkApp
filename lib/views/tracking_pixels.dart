import 'package:flutter/material.dart';
import 'package:react_link_app/models/pixel.dart';
import 'package:react_link_app/utils/http_utils.dart';
import 'package:react_link_app/views/add_pixel.dart';
import 'package:react_link_app/widget/drawer.dart';

import 'homescreen.dart';

class TrackingPixel extends StatefulWidget {
  @override
  _TrackingPixelState createState() => _TrackingPixelState();
}

class _TrackingPixelState extends State<TrackingPixel> {
  List<Pixel> allPixels;

  Future<bool> getPixel() async {
    allPixels = null;
    allPixels = await HttpUtils.getPixels();
    setState(() {});
    return true;
  }

  @override
  void initState() {
    getPixel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerOnly(),
        appBar: AppBar(
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            var data = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddPixel()));
            getPixel();
          },
          backgroundColor: Colors.deepPurpleAccent,
          label: Text(
            "Add Pixel",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       margin: EdgeInsets.only(left: 12, top: 8, bottom: 10),
        //       child: Text(
        //         "Pixels",
        //         style: TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //     Divider(
        //       color: Colors.black38,
        //     ),
        //     Align(
        //       alignment: Alignment.center,
        //       child: Text(
        //         "No pixel found .Add one!",
        //         style: TextStyle(color: Colors.black54, fontSize: 16),
        //       ),
        //     )
        //   ],
        // ),

        body: allPixels != null
            ? allPixels.isNotEmpty
                ? ListView.builder(
                    itemCount: allPixels.length,
                    itemBuilder: (context, index) {
                      Pixel model = allPixels[index];
                      return ListTile(
                        title: Text(model.name),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                var data = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddPixel(
                                              editModel: model,
                                            )));
                                getPixel();
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
                                      await HttpUtils.deletePixel(
                                          id: model.sId);
                                      await getPixel();
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
                    child: Text("no pixel found"),
                  )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
