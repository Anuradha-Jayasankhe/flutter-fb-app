import 'package:fbapp/models/models.dart';
import 'package:flutter/material.dart';

class Postcontainer extends StatelessWidget {
  final Post post;
  const Postcontainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.red,
    );
  }
}
