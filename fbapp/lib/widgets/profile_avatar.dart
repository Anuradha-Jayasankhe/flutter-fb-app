import 'package:fbapp/config/palette.dart';
import 'package:flutter/material.dart';

class Profieavatar extends StatelessWidget {
  final String imageUrl;
  final bool isactive = false;
  const Profieavatar({super.key, required this.imageUrl, required isactive});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(imageUrl),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            height: 15.0,
            width: 15.0,
            decoration: BoxDecoration(
                color: palette.online,
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.white)),
          ),
        )
      ],
    );
  }
}
