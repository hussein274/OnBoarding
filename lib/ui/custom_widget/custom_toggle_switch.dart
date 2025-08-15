import 'package:flutter/material.dart';

class CustomeImageToggle extends StatefulWidget {
  @override
  _CustomeImageToggleState createState() => _CustomeImageToggleState();
}

class _CustomeImageToggleState extends State<CustomeImageToggle> {
  int selectedIndex = 0;

  final List<String> images = [
    'assets/images/LR.png',
    'assets/images/EG.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(images.length, (index) {
        bool isSelected = selectedIndex == index;
        double size = isSelected ? 40 : 30; // حجم الزر كله

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                images[index],
                fit: BoxFit.cover, // تخلي الصورة تملى الزر
              ),
            ),
          ),
        );
      }),
    );
  }
}