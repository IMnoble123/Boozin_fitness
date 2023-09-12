import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({required this.imagePath, Key? key}) : super(key: key);
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
