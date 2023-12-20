import 'package:fbapp/models/models.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  const Stories({super.key, required this.currentUser, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.purple,
      child: ListView.builder(
        itemCount: 1 + stories.length,
        itemBuilder: ((context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: const Image(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1498307833015-e7b400441eb8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80',
                      ),
                      height: double.infinity,
                      width: 110.0,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: const Image(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1498307833015-e7b400441eb8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80'),
                    height: 100,
                    width: 110.0,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

// class StoryCard extends StatelessWidget {
//   final bool isAddStory;
//   final User currentUser;
//   final Story story;

//   const StoryCard(
//       {super.key,
//       this.isAddStory = false,
//       required this.story,
//       required this.currentUser});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12.0),
//           child: Image(
//             image: NetworkImage(
//               story.imageUrl,
//             ),
//             height: double.infinity,
//             width: 110.0,
//             fit: BoxFit.cover,
//           ),
//         )
//       ],
//     );
//   }
// }
