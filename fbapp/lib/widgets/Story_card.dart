import 'package:fbapp/models/models.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final bool isAddStory = false;
  final User currentUser;
  final Story story;

  const StoryCard(
      {super.key,
      required isAddStory,
      required this.currentUser,
      required this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: NetworkImage(
            isAddStory ? currentUser.imageUrl : story.imageUrl,
          ),
          height: double.infinity,
          width: 110.0,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
