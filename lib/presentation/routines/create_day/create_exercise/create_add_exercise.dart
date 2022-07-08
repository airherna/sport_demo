import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sport/domain/exercises/exercise.dart';
import 'package:sport/presentation/common/utils/custom_textfield.dart';

class CreateAddExercise extends HookWidget {
  final Function(Exercise) createdExerciseCallback;

  const CreateAddExercise(this.createdExerciseCallback, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final setNumberController = useTextEditingController();
    final repetitionsController = useTextEditingController();
    final weightController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Add exercise")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomTextField(nameController, 'Name', '', TextInputType.name),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomTextField(
                        setNumberController, 'Sets', '', TextInputType.number),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomTextField(repetitionsController, 'Repetitions',
                        '', TextInputType.number),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomTextField(
                        weightController, 'Weight', 'KG', TextInputType.number),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(Exercise(
                        nameController.text,
                        int.parse(setNumberController.text),
                        double.parse(weightController.text),
                        int.parse(repetitionsController.text)));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("Create new exercise"),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                child: const Text(
                  "Recent exercises",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
