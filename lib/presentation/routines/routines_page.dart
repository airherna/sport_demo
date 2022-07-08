import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sport/domain/routines/routine.dart';
import 'package:sport/presentation/controllers/routine_controller.dart';
import 'package:sport/presentation/routines/routine_home.dart';
import 'package:sport/presentation/routines/routines_form.dart';

class RoutinesPage extends HookWidget {
  const RoutinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RoutineController routineController = RoutineController();
    final reloadKey = useState(UniqueKey());
    final future = useMemoized(
        () => routineController.getActiveRoutine(), [reloadKey.value]);
    final snapshot = useFuture(future, initialData: null);
    final routineState = useState<Routine?>(null);

    void newRoutineCallback(String name) {
      routineController.createDefaultRoutine(name);
      reloadKey.value = UniqueKey();
    }

    useEffect(() {
      final routine = snapshot.data;
      if (routine == null) {
        debugPrint("$routine");
        return;
      }
      debugPrint("After $routine");
      routineState.value = routine;
    }, [snapshot.data]);

    return (routineState.value == null)
        ? NewRoutineForm(newRoutineCallback)
        : RoutineHome(routineState.value!);
  }
}
