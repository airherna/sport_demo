import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sport/domain/body_weights/body_weight.dart';
import 'package:sport/presentation/common/utils/custom_textfield.dart';

class BodyWeightForm extends HookWidget {
  final Function(BodyWeight) addedWeightCallback;

  const BodyWeightForm(this.addedWeightCallback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodyWeightTextController = useTextEditingController();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
              child: CustomTextField(
                  bodyWeightTextController,
                  'Insert your current body weight',
                  'KG',
                  TextInputType.number)),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {
              BodyWeight bodyWeight = BodyWeight.fromWeight(
                  double.parse(bodyWeightTextController.text));
              addedWeightCallback(bodyWeight);
              bodyWeightTextController.clear();
            },
            child: const Text("Register"),
          )
        ],
      ),
    );
  }
}
