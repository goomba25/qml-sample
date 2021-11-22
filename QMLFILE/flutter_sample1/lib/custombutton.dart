import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double? width;
  final double? height;
  final Image? image;
  final Image? imageDown;

  const CustomButton({
    Key? key,
    this.width,
    this.height,
    this.image,
    this.imageDown,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool checkble = true;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: widget.image,
      ),
    );
  }
}
