part of circular_slider;

class CircularSlider extends StatefulWidget {
  final Function(int value) onDrag;
  final Color color;
  final Widget child;
  final Color sliderColor;
  final Color unSelectedColor;
  final double radius;
  final double maxValue;
  final BoxDecoration? decoration;
  //! parent size must be equal or higher than radius * 2

  const CircularSlider(
      {Key? key,
      required this.maxValue,
      this.decoration,
      required this.radius,
      required this.onDrag,
      required this.child,
      required this.color,
      required this.sliderColor,
      required this.unSelectedColor})
      : super(key: key);

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  double angle = 0;
  void onPanUpdate(DragUpdateDetails details) {
    Offset coordinates = details.localPosition;

    setState(() {
      var center = (widget.radius * 2) / 2;
      Offset pureCoordinates = Offset(((coordinates.dx - center) / center),
          ((coordinates.dy - center) / center) * -1);
      var angleTan = (pureCoordinates.dy.abs()) / (pureCoordinates.dx.abs());

      (pureCoordinates.toString());
      double minValue =
          sqrt((pow(pureCoordinates.dx, 2) + pow(pureCoordinates.dy, 2)));

      if ((minValue > 0.6)) {
        angle = atan(angleTan) * 180 / pi;
        angle = angle.roundToDouble();
        if (pureCoordinates.dx.isNegative && !pureCoordinates.dy.isNegative) {
          angle = 90 - angle;
          angle += 90;
        }
        if (pureCoordinates.dx.isNegative && pureCoordinates.dy.isNegative) {
          angle += 180;
        }
        if (!pureCoordinates.dx.isNegative && pureCoordinates.dy.isNegative) {
          angle = 90 - angle;
          angle += 270;
        }
      }

      widget.onDrag(
        angle * widget.maxValue ~/ 360,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: widget.radius * 2,
          height: widget.radius * 2,
          decoration: widget.decoration ,
          child: GestureDetector(
            onPanUpdate: onPanUpdate,
            child: CustomPaint(
              painter: Circle(
                  angle: angle,
                  color: widget.color,
                  unSelectedColor: widget.unSelectedColor,
                  sliderColor: widget.sliderColor),
            ),
          ),
        ),
        widget.child
      ],
    );
  }
}
