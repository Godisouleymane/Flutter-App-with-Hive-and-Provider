import 'package:flutter/material.dart';
import 'package:hive_provider/associateData.dart';
import 'package:hive_provider/widgets/associateTile.dart';
import 'package:provider/provider.dart';

class AssociateList extends StatelessWidget {
  const AssociateList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<AssociateData>(context).associateCount,
      padding: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 4.0),
      itemBuilder: (context, index) {
      return AssociateTile(
        tileIndex: index
      );
    }
  ,
  );
  }
}
