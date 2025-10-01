import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_provider.dart';

class AddDataPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Enter your title',
                labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              maxLines: 4,
              controller: descController,
              decoration: InputDecoration(
                hintText: 'Enter your desc',
                labelText: "Desc",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  if(titleController.text.isNotEmpty && descController.text.isNotEmpty) {
                    context.read<ListProvider>().addData({
                      "title": titleController.text,
                      "desc": descController.text
                    });
                    Navigator.pop(context);
                  }
                }, child: Text('Add')),
                SizedBox(
                  width: 11,
                ),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Cancel')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
