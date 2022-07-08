import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sport/domain/days/day.dart';
import 'package:sport/domain/routines/routine.dart';
import 'package:sport/presentation/controllers/days_controller.dart';
import 'package:sport/presentation/routines/create_day/create_day_form.dart';

class RoutineHome extends HookWidget {
  final Routine routine;

  const RoutineHome(this.routine, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DaysController daysController = DaysController();
    final future =
        useMemoized(() => daysController.getDaysFromRoutine(routine.id));
    final snapshot = useFuture(future, initialData: null);
    final daysState = useState<List<Day>>(List.empty());

    void createDay(Day? day) {
      if (day != null) {
        daysController.createDay(day);
      }
    }

    useEffect(() {
      final days = snapshot.data;
      if (days == null) {
        debugPrint("$days");
        return;
      }
      debugPrint("After $days");
      daysState.value = List.from(days);
    }, [snapshot.data]);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Active Routine",
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            routine.name,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 1.5,
            color: Colors.white54,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Days",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          (daysState.value.isNotEmpty)
              ? const Text("There are days")
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) => const CreateDayPage()))
                          .then((value) => createDay(value)),
                      label: const Text("Add new day"),
                      icon: const Icon(Icons.add_rounded),
                    )
                  ],
                )
        ]),
      ),
    );
  }
}
