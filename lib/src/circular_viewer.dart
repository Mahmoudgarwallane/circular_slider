part of circular_slider;

class CircularViewer extends StatefulWidget {
  final Color color;
  final Color sliderColor;
  final Color unSelectedColor;
  final double value;
  final double radius;
  final double maxValue;
  final TextStyle textStyle;
  final BoxDecoration? decoration;
  const CircularViewer(
      {Key? key,
      required this.maxValue,
      this.textStyle = const TextStyle(fontSize: 20),
      this.decoration,
      required this.radius,
      required this.color,
      required this.value,
      required this.sliderColor,
      required this.unSelectedColor})
      : super(key: key);

  @override
  State<CircularViewer> createState() => _CircularViewerState();
}

class _CircularViewerState extends State<CircularViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  int animatedValue = 0;
  late Animation<int> animation;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = IntTween(begin: 0, end: widget.value.toInt()).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    controller.repeat();
    animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: widget.decoration,
          width: widget.radius * 2,
          height: widget.radius * 2,
          child: CustomPaint(
            painter: Circle(
                angle: animation.value.toDouble() * 360 / widget.maxValue,
                color: widget.color,
                unSelectedColor: widget.unSelectedColor,
                sliderColor: widget.sliderColor),
          ),
        ),
        Text(
          animation.value.toString(),
          style: widget.textStyle,
        )
      ],
    );
  }
}
