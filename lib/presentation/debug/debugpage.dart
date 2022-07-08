import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:sport/persistence/tables/tables.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: const Text("View db"),
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DriftDbViewer(GetIt.I<MyDatabase>()))),
    ));
  }
}
