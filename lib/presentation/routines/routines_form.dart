import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sport/domain/routines/routine.dart';
import 'package:sport/presentation/common/utils/custom_textfield.dart';

class NewRoutineForm extends HookWidget {
  final Function(String) newRoutineCallback;

  const NewRoutineForm(this.newRoutineCallback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routineNameTextField = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Create new routine",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(routineNameTextField, 'Enter the routine name', '',
              TextInputType.name),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => newRoutineCallback(routineNameTextField.text),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("Create"),
              ))
        ],
      ),
    );
  }
}
