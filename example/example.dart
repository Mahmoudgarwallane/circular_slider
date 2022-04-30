import 'package:flutter/material.dart';
import 'package:circular/circular.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(body: Center(child: Home())),
  ));
}
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int angle = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xffEEEEEE),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 200, //! this should not be less than
                height: 200,
                child: CircularSlider(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(-10, -10),
                            color: Colors.white,
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            offset: Offset(10, 10),
                            color: Color.fromARGB(255, 158, 158, 158),
                            blurRadius: 20,
                            spreadRadius: 1)
                      ]),
                  maxValue: 100,
                  radius:
                      100, //! this one multiplied by 2  ( sized box width and height >= radius * 2)
                  child: Text(
                    angle.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  color: const Color(0xffEEEEEE),
                  sliderColor: const Color(0xff62CBDA),
                  unSelectedColor: const Color(0xffD7DEE7),
                  onDrag: (angle) {
                    setState(() {
                      this.angle = angle;
                    });
                  },
                ),
              ),
              CircularViewer(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(-10, -10),
                          color: Colors.white,
                          blurRadius: 20,
                          spreadRadius: 1),
                      BoxShadow(
                          offset: Offset(10, 10),
                          color: Color.fromARGB(255, 158, 158, 158),
                          blurRadius: 20,
                          spreadRadius: 1)
                    ]),
                value: 50,
                maxValue: 100,
                radius: 100,
                textStyle: const TextStyle(fontSize: 30),
                color: const Color(0xffEEEEEE),
                sliderColor: const Color(0xff62CBDA),
                unSelectedColor: const Color(0xffD7DEE7),
              )
            ],
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
