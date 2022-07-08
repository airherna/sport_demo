import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:sport/domain/body_weights/body_weight.dart';
import 'package:sport/domain/user/user.dart';
import 'package:sport/presentation/body_weight/body_weight_chart.dart';
import 'package:sport/presentation/body_weight/body_weight_form.dart';
import 'package:sport/presentation/controllers/body_weight_controller.dart';
import 'package:sport/presentation/controllers/user_controller.dart';

class WeightPage extends HookWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BodyWeightController bodyWeightController = BodyWeightController();
    final future = useMemoized(() => UserController().getUser());
    final snapshot = useFuture(future, initialData: null);
    final userState = useState<User?>(null);
    final weightState = useState<List<BodyWeight>>(List.empty(growable: true));
    final dateFormat = DateFormat("dd-MM-yyyy");

    void addedBodyWeightCallback(BodyWeight bodyWeight) {
      bodyWeightController.writeWeight(bodyWeight);
      weightState.value.add(bodyWeight);
      weightState.value = List.from(weightState.value.reversed);
    }

    useEffect(() {
      final user = snapshot.data;
      if (user == null) {
        return;
      }
      userState.value = user;
      weightState.value = user.weightHistory;
    }, [snapshot.data]);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            const Text("Objective Weight",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15)),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit_rounded,
                                color: Colors.yellowAccent,
                              ),
                              iconSize: 17,
                              splashRadius: 15,
                            )
                          ],
                        ),
                        (userState.value != null)
                            ? Text("${userState.value!.objectiveWeight} KG",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15))
                            : Container()
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text("Current weight",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                        (weightState.value.isNotEmpty)
                            ? Text("${weightState.value.first.weight} KG",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15))
                            : Container()
                      ]),
                ],
              )),
          (weightState.value.isNotEmpty)
              ? SizedBox(
                  height: 200,
                  child: WeightChart(weightState.value, animate: true))
              : Container(),
          BodyWeightForm(addedBodyWeightCallback),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text(
                "History",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              )),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: weightState.value.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text("${weightState.value[index].weight} KG"),
                trailing:
                    Text(dateFormat.format(weightState.value[index].date)),
              );
            }),
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 1,
                indent: 15,
                endIndent: 15,
                color: Colors.white30,
              );
            },
          )
        ],
      ),
    );
  }
}
