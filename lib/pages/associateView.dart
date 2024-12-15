import 'package:flutter/material.dart';
import 'package:hive_provider/associateData.dart';
import 'package:hive_provider/main.dart';
import 'package:hive_provider/model/associate.dart';
import 'package:hive_provider/pages/associateEdit.dart';
import 'package:hive_provider/utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AssociateView extends StatelessWidget {
  const AssociateView({super.key});

  @override
  Widget build(BuildContext context) {
    void _deleteConformation(currentAssociate) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                'Are you sure ?',
                style: TextStyle(color: Colors.black),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('You are about to delete ${currentAssociate.name}'),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('This action cannot be undone'),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Log.d("Deleting ${currentAssociate.name}");
                      Provider.of<AssociateData>(context, listen: false)
                          .deleteAssociate(currentAssociate.key);
                      Navigator.popUntil(context,
                          ModalRoute.withName(Navigator.defaultRouteName));
                    },
                    child: Text(
                      'DELETE',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () {
                      Log.d("Canceling");
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            );
          });
    }

    return Consumer<AssociateData>(builder: (context, associateData, child) {
      Associate currrentAssociate = associateData.getActiveAssociate();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 10.0,
          title: Text(
            currrentAssociate.name,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Log.d("Selectec to edit");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AssociateEditPage(
                        currentAssociate: currrentAssociate);
                  }));
                },
                icon: Icon(Icons.create, size: 24.0, color: Colors.white)),
            IconButton(
                onPressed: () {
                  Log.d("Selection for deletion");
                  _deleteConformation(currrentAssociate);
                },
                icon: Icon(
                  Icons.delete,
                  size: 24.0,
                  color: Colors.red,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 36,
                  color: Colors.grey.shade300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Phone',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Text(
                        currrentAssociate.phone.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 36,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Text(
                        currrentAssociate.age.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 36,
                  color: Colors.grey.shade300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Join Date',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Text(
                        DateFormat("yyyy-MM-dd")
                            .format(currrentAssociate.joinDate),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 36,
                  color: Colors.grey.shade300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Senior',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Switch(
                        activeTrackColor: Colors.black,
                        value: currrentAssociate.isSenior,
                        onChanged: (bool value){

                        })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
