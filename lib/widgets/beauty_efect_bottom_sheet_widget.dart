import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_toggle_buttons.dart';

class BeautyEffectBottomSheetWidget extends StatelessWidget {
  int defaultContrast;
  double defaultSmooth;
  double defaultBrighten;
  double defaultSharpness;
  double defaultRedness;
  double textSize;
  Color inactiveColor;
  Color activeColor;
  Function(int, double, double, double, double) onBeautyEffectChange;

  var levels = ["Low", "Medium", "High"];

  BeautyEffectBottomSheetWidget({
    super.key,
    this.defaultContrast = 0,
    this.defaultSmooth = 1,
    this.defaultBrighten = 1,
    this.defaultSharpness = 1,
    this.defaultRedness = 1,
    this.textSize = 11,
    this.inactiveColor = Colors.grey,
    this.activeColor = Colors.red,
    required this.onBeautyEffectChange,
  });

  static const double _sliderValueMax = 10;
  static const double _sliderValueMin = 1;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: activeColor),
              ),
            ),

            _buildToggle("Contrast", defaultContrast, (v) {
              defaultContrast = v;
              onBeautyEffectChange(defaultContrast, defaultSmooth, defaultBrighten,
                  defaultSharpness, defaultRedness);
            }),
            _buildSlider("Smooth", defaultSmooth, (v) {
              defaultSmooth = v;
              onBeautyEffectChange(defaultContrast, defaultSmooth, defaultBrighten,
                  defaultSharpness, defaultRedness);
            }),
            _buildSlider("Brighten", defaultBrighten, (v) {
              defaultBrighten = v;
              onBeautyEffectChange(defaultContrast, defaultSmooth, defaultBrighten,
                  defaultSharpness, defaultRedness);
            }),
            _buildSlider("Sharpness", defaultSharpness, (v) {
              defaultSharpness = v;
              onBeautyEffectChange(defaultContrast, defaultSmooth, defaultBrighten,
                  defaultSharpness, defaultRedness);
            }),
            _buildSlider("Redness", defaultRedness, (v) {
              defaultRedness = v;
              onBeautyEffectChange(defaultContrast, defaultSmooth, defaultBrighten,
                  defaultSharpness, defaultRedness);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildToggle(String name, int defaultValue, Function(int) onValueChange) {
    return Row(
      children: [
        SizedBox(
            width: 74,
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold,  fontSize: textSize),
            )),
        Expanded(
          child: MyToggleButton(titles: levels,
            selectedIndex: defaultValue,
            height: 24,
            textSize: 12,
            borderRadius: 4,
            borderColor: activeColor,
            selectedBorderColor: activeColor,
            selectedFillColor: activeColor,
            onSelect: (selectedIndex){
              onValueChange.call(selectedIndex);
            },),
        ),
      ],
    );
  }

  Widget _buildSlider(
      String name, double defaultValue, Function(double) onValueChange) {
    ValueNotifier sliderValueNotifier = ValueNotifier<double>(defaultValue);
    return ValueListenableBuilder(
        valueListenable: sliderValueNotifier,
        builder: (BuildContext context, value, Widget? child) {
          return Row(
            children: [
              SizedBox(
                  width: 60,
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,  fontSize: textSize),
                  )),
              Expanded(
                child: SliderTheme(
                  data: const SliderThemeData(
                      showValueIndicator: ShowValueIndicator.always),
                  child: Slider(
                    inactiveColor: inactiveColor,
                    activeColor: activeColor,
                    secondaryActiveColor: Colors.transparent,
                    onChangeEnd: (value) {
                      double valueWith2Dec =
                          double.parse(value.toStringAsFixed(1));
                      sliderValueNotifier.value = valueWith2Dec;
                      onValueChange.call(valueWith2Dec);
                    },
                    onChanged: (value) {
                      double valueWith2Dec =
                          double.parse(value.toStringAsFixed(1));
                      sliderValueNotifier.value = valueWith2Dec;
                    },
                    max: _sliderValueMax,
                    min: _sliderValueMin,
                    value: value as double,
                  ),
                ),
              ),
              Text(
                value.toString(),
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: textSize),
              )
            ],
          );
        });
  }
}
