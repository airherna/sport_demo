import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sport/common/date_utils/day_of_week.dart';
import 'package:sport/domain/days/day.dart';
import 'package:sport/domain/exercises/exercise.dart';
import 'package:sport/presentation/common/utils/custom_textfield.dart';
import 'package:sport/presentation/routines/create_day/create_exercise/create_add_exercise.dart';
import 'package:weekday_selector/weekday_selector.dart';

class CreateDayPage extends HookWidget {
  const CreateDayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final dayState = useState(List.filled(7, false));
    final exercisesState = useState<List<Exercise>>(List.empty(growable: true));

    void createdExerciseCallback(Exercise exercise) {
      debugPrint("$exercise");
      exercisesState.value.add(exercise);
      exercisesState.value = List.from(exercisesState.value);
    }

    List<DayOfWeek> getWeekDays() {
      return dayState.value
          .asMap()
          .entries
          .where((element) => element.value)
          .map((entry) {
        return DayOfWeek.withIndex(entry.key);
      }).toList();
    }

    void createDay() {
      final day = Day(nameController.text, exercisesState.value, getWeekDays());
      Navigator.of(context).pop(day);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new day"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(nameController, 'Name', '', TextInputType.name),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Days of the week",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              WeekdaySelector(
                  shortWeekdays: const [
                    "Su",
                    "Mo",
                    "Tu",
                    "We",
                    "Th",
                    "Fr",
                    "Sa",
                  ],
                  onChanged: (day) {
                    int dayIndex = day % 7;
                    dayState.value[dayIndex] = !dayState.value[dayIndex];
                    dayState.value = List.from(dayState.value);
                  },
                  values: dayState.value),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Exercises",
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) =>
                                CreateAddExercise(createdExerciseCallback)))
                        .then((exercise) {
                      if (exercise != null) createdExerciseCallback(exercise);
                    }),
                    icon: const Icon(
                      Icons.add_rounded,
                      size: 25,
                      color: Colors.yellowAccent,
                    ),
                    splashRadius: 15,
                  )
                ],
              ),
              (exercisesState.value.isEmpty)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text("No exercises added yet")])
                  : ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: ((context, index) => ListTile(
                            title: Text(exercisesState.value[index].name),
                            leading: Text("${index + 1}."),
                            trailing: Text(
                                "${exercisesState.value[index].weight} KG"),
                            subtitle: Text(
                                "${exercisesState.value[index].sets} sets of ${exercisesState.value[index].repetitions} repetitions"),
                          )),
                      separatorBuilder: (context, index) => const Divider(
                            color: Colors.white54,
                          ),
                      itemCount: exercisesState.value.length),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: createDay,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text("Create"),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
