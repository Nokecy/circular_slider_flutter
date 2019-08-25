import 'dart:math';
import 'package:flutter/material.dart';
import 'basePainter.dart';
import 'indicatorPainter.dart';

class CircularSlider extends StatefulWidget {
  CircularSlider({Key key, this.value, this.onValueChange}) : super(key: key);

  int value;
  final void Function(int value) onValueChange;

  @override
  _CircularSliderState createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  double angle = 0;
  int value = 0;
  double radius = 150;

  @override
  void initState() {
    super.initState();
    var _calculatedAngle =
        widget.value / (180 / pi) / ((320 - 180) / 180) - 180;
    this.setState(() => {value = widget.value, angle = _calculatedAngle});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var _calculatedAngle =
        widget.value / (180 / pi) / ((320 - 180) / 180) - 180;
    this.setState(() => {angle = _calculatedAngle});
  }

  _identifyAndSetAngle(Offset localPosition) {
    double _calculatedAngle = _getAngle(localPosition);
    var _value =
        ((180 / pi) * _calculatedAngle * ((320 - 180) / 180) + 180).round(); //
    if (_calculatedAngle > 0) {
      if (value != _value) {
        widget.onValueChange(_value);
      }
      setState(() {
        angle = _calculatedAngle;
        value = _value;
      });
    }
  }

  _onPanUpdate(DragUpdateDetails dragUpdateDetails) {
    _identifyAndSetAngle(dragUpdateDetails.localPosition);
  }

  _onTapUp(TapUpDetails tapUpDetails) {
    _identifyAndSetAngle(tapUpDetails.localPosition);
  }

  double _getAngle(Offset position) {
    double angle = 0;
    angle = atan2(radius - position.dy, radius - position.dx);
    return angle;
  }

  Widget _buildPie() {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onTapUp: _onTapUp,
      child: CustomPaint(
        painter: BasePainter(),
        child: Container(
          child: CustomPaint(
            painter: IndicatorPainter(rotateAngle: angle, value: value),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '',
                style: TextStyle(
                    color: Color(0xff009bd9),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 300,
        width: 300,
        child: _buildPie(),
      ),
    ));
  }
}
