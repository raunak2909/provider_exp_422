import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exp_422/count_provider.dart';

class AddCountPage extends StatelessWidget {
  const AddCountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Count')),
      body: Center(
        child: IconButton(
          onPressed: () {
            Provider.of<CounterProvider>(
              context,
              listen: false,
              ).incrementCount();
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
