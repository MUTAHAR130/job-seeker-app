import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomValueDisplaySlider extends StatelessWidget {
  final double min;
  final double max;
  final bool? showMin;
  final String valuePrefix;
  final String valueSuffix;
  final double currentSliderValue;
  final Function onChange;
  final bool roundOff;

  const CustomValueDisplaySlider({
    super.key,
    this.showMin,
    required this.min,
    required this.max,
    required this.valuePrefix,
    required this.valueSuffix,
    required this.onChange,
    required this.currentSliderValue,
    required this.roundOff,
  });

  @override
  Widget build(BuildContext context) {
    const Color trackColor = Color(0xFFC7B199);
    const Color thumbColor = Color(0xFF997A59);

    return Row(
      children: [
        showMin == true
            ? Container(
                width: 60,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8.0),
                  border: BoxBorder.all(color: Get.theme.colorScheme.outline),
                ),
                child: Text(
                  '$valuePrefix${roundOff ? min.round() : min}$valueSuffix',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF385764),
                  ),
                ),
              )
            : SizedBox(),

        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 6.0,
              activeTrackColor: trackColor,
              inactiveTrackColor: Colors.white,
              thumbColor: thumbColor,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
              showValueIndicator: ShowValueIndicator.never,
            ),
            child: Slider(
              value: currentSliderValue,
              min: min,
              max: max,
              label: roundOff
                  ? currentSliderValue.round().toString()
                  : currentSliderValue.toString(),
              onChanged: (double value) {
                onChange(value);
              },
            ),
          ),
        ),

        const SizedBox(width: 10.0),

        Container(
          width: 60,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8.0),
            border: BoxBorder.all(color: Get.theme.colorScheme.outline),
          ),
          child: Text(
            '$valuePrefix${roundOff ? currentSliderValue.round() : currentSliderValue.toStringAsFixed(2)}$valueSuffix',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF385764),
            ),
          ),
        ),
      ],
    );
  }
}
