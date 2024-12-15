import 'package:flutter/material.dart';
import 'package:hive_provider/model/associate.dart';

class AssociateEditPage extends StatefulWidget {
  final Associate currentAssociate;
  const AssociateEditPage({super.key, required this.currentAssociate});

  @override
  State<AssociateEditPage> createState() => _AssociateEditPageState();
}

class _AssociateEditPageState extends State<AssociateEditPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
