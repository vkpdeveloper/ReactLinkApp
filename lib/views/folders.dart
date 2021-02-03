import 'package:flutter/material.dart';
import 'package:react_link_app/models/folder.dart';
import 'package:react_link_app/utils/http_utils.dart';
import 'package:react_link_app/utils/models/folder.dart';
import 'package:react_link_app/views/add_folder.dart';
import 'package:react_link_app/widget/drawer.dart';

class FolderPage extends StatefulWidget {
  @override
  _FolderPageState createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  List<Folders> allFolders;

  Future<bool> getFolder() async {
    allFolders = null;
    allFolders = await HttpUtils.getFolders();
    setState(() {});
    return true;
  }

  @override
  void initState() {
    getFolder();
    super.initState();
  }

  @override
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
        title: Text("Folders"),
      ),
      floatingActionButton: FloatingActionButton(
         onPressed: () async {
            var data = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddFolderPage()));
            getFolder();
          },
        child: Text(
          "+",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: allFolders != null
          ? allFolders.isNotEmpty
              ? ListView.builder(
                  itemCount: allFolders.length,
                  itemBuilder: (context, index) {
                    Folders model = allFolders[index];
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
                                        builder: (context) => AddFolderPage(
                                            editModel: model,
                                            )));
                                getFolder();
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
                                    await HttpUtils.deleteFolders(
                                        id: model.sId);
                                    await getFolder();
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
                  child: Text("No folder found"),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
