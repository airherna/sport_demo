import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';
import 'package:sport/domain/body_weights/body_weight.dart';

class WeightChart extends StatelessWidget {
  final List<BodyWeight> weightList;
  final bool animate;
  final _monthDayFormat = DateFormat('dd-MM-yyyy');

  WeightChart(this.weightList, {required this.animate, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chart(
      data: weightList,
      variables: {
        'time': Variable(
          accessor: (BodyWeight weight) => weight.date,
          scale: TimeScale(
            formatter: (time) => _monthDayFormat.format(time),
          ),
        ),
        'sales': Variable(
          accessor: (BodyWeight weight) => weight.weight,
        ),
      },
      elements: [
        LineElement(
          color: ColorAttr(value: Colors.yellowAccent),
          shape: ShapeAttr(value: BasicLineShape()),
          selected: {
            'touchMove': {1}
          },
        )
      ],
      coord: RectCoord(color: Colors.transparent),
      axes: [
        Defaults.horizontalAxis,
        Defaults.verticalAxis,
      ],
      selections: {
        'touchMove': PointSelection(
          on: {
            GestureType.scaleUpdate,
            GestureType.tapDown,
            GestureType.longPressMoveUpdate
          },
          dim: Dim.x,
        )
      },
      tooltip: TooltipGuide(
        followPointer: [false, true],
        align: Alignment.topLeft,
        offset: const Offset(-20, -20),
      ),
      crosshair: CrosshairGuide(followPointer: [false, true]),
    );
  }
}
