# Circular

<p>
 <a href="https://flutter.dev/">
 <img src ="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white">
</img>
 </a>
<a href="https://github.com/Mahmoudgarwallane/circular_slider">
 <img src ="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white">
</img>
</a>
  </p>

<img width=300 src ="https://user-images.githubusercontent.com/68555232/166114114-d7e47d13-3d8c-49ee-af62-c89da85764ec.gif">
</img>

## Features

- picking values in specific range
- displaying values in a a circular slider
## Getting started

#### add the package
```bash
flutter pub add circular
```
#### import the package

```bash
import 'package:circular/circular.dart';
```

## Usage

#### Circular slider

```dart
CircularSlider(
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
radius:100, 
child: Text(
  value.toString(),
  style: TextStyle(fontSize: 30),
),
color: Color(0xffEEEEEE),
sliderColor: Color(0xff62CBDA),
unSelectedColor: Color(0xffD7DEE7),
onDrag: (value) {
  setState(() {
    this.value = value;
  });
},
),
```
#### Circular Viewer
```dart
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
  textStyle: TextStyle(fontSize: 30),
  color: Color(0xffEEEEEE),
  sliderColor: Color(0xff62CBDA),
  unSelectedColor: Color(0xffD7DEE7),
)
```

check out the [full example](https://github.com/Mahmoudgarwallane/circular_slider/blob/master/example/example.dart)

## Additional information
### story 
after I made the [the magic circle ](https://github.com/Mahmoudgarwallane/Magic-circle) I decided to make it useful so I made this package 

### Contributing
Contributions are always welcome!
### License
[MIT LICENSE](LICENSE)
