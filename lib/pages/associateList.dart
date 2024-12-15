import 'package:flutter/material.dart';
import 'package:hive_provider/associateData.dart';
import 'package:hive_provider/widgets/associateList.dart';
import 'package:provider/provider.dart';

class AssociateListPage extends StatelessWidget {
  const AssociateListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final associates =
        Provider.of<AssociateData>(context, listen: false).getAssociates();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10.0,
        title: Text(
          'Associates',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Expanded(child: AssociateList())],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, '/AddAssociatePage');
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}
