import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exp_422/list_provider.dart';

import 'add_data_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    //List<Map<String, dynamic>> mData = Provider.of<ListProvider>(context).getData();
    //List<Map<String, dynamic>> mData = context.watch<ListProvider>().getData();

    print("build called");

    return Scaffold(
      appBar: AppBar(title: Text('List Page')),
      body: Consumer<ListProvider>(
        builder: (c, provider, child) {
          print("consumer build called");
          //List<Map<String, dynamic>> mData = c.watch<ListProvider>().getData();
          List<Map<String, dynamic>> mData = provider.getData();
          return mData.isNotEmpty
              ? ListView.builder(
                  itemCount: mData.length,
                  itemBuilder: (_, index) {
                    return Card(
                      child: ListTile(
                        title: Text(mData[index]["title"]),
                        subtitle: Text(mData[index]["desc"]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                ///read (listen is False)
                                ///watch (listen is True)

                                context.read<ListProvider>().updateData({
                                  "title": "updated title",
                                  "desc": "updated desc",
                                }, index);

                                /* Provider.of<ListProvider>(context, listen: false).updateData({
                    "title" : "updated title",
                    "desc" : "updated desc"
                  }, index);*/
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                Provider.of<ListProvider>(
                                  context,
                                  listen: false,
                                ).deleteData(index);
                              },
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(child: Text('No Data Found'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDataPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
