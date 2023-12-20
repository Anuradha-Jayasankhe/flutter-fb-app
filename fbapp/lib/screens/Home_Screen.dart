import 'package:fbapp/config/palette.dart';
import 'package:fbapp/data/data.dart';
import 'package:fbapp/models/models.dart';
import 'package:fbapp/widgets/wigets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'facebook',
              style: TextStyle(
                color: palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.grey[200], shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  iconSize: 30.0,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.grey[200], shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.messenger_outline_rounded),
                  iconSize: 30.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Profieavatar(
                          imageUrl: currentUser.imageUrl, isactive: false),
                      const SizedBox(
                        width: 8,
                      ),
                      const Expanded(
                          child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'what\'s on your mind?'),
                      ))
                    ],
                  ),
                  const Divider(
                    height: 10.0,
                    thickness: 0.5,
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.videocam,
                            color: Colors.red,
                          ),
                        ),
                        const Text('live'),
                        const VerticalDivider(
                          width: 8.0,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.image,
                            color: Colors.green,
                          ),
                        ),
                        const Text('Image'),
                        const VerticalDivider(
                          width: 8.0,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.video_call,
                            color: Colors.red,
                          ),
                        ),
                        const Text('Room'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
              height: 60,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1 + onlineUsers.length,
                itemBuilder: ((context, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CreateRoomButton(),
                    );
                  }
                  final User user = onlineUsers[index - 1];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Profieavatar(
                      imageUrl: user.imageUrl,
                      isactive: true,
                    ),
                  );
                }),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                color: Colors.white,
                child: ListView.builder(
                    itemCount: 1 + stories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                image: NetworkImage(currentUser.imageUrl),
                                height: double.infinity,
                                width: 110.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: 110.0,
                              decoration: BoxDecoration(
                                  gradient: palette.storyGradient,
                                  borderRadius: BorderRadius.circular(12.0)),
                            ),
                            Positioned(
                              top: 7.0,
                              left: 7.0,
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: palette.facebookBlue,
                                ),
                              ),
                            ),
                          ]),
                        );
                      }
                      final Story story = stories[index - 1];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image(
                              image: NetworkImage(story.imageUrl),
                              height: double.infinity,
                              width: 110.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            width: 110.0,
                            decoration: BoxDecoration(
                                gradient: palette.storyGradient,
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                          Positioned(
                            top: 7.0,
                            left: 7.0,
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: palette.facebookBlue,
                              child: CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.grey,
                                backgroundImage:
                                    NetworkImage(story.user.imageUrl),
                              ),
                            ),
                          ),
                        ]),
                      );
                    }),
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return Postcontainer(post: post);
          }))
        ],
      ),
    );
  }
}

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('create room'),
      child: const Row(
        children: [
          Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.blueAccent,
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            'create\nRoom',
          ),
        ],
      ),
    );
  }
}

class Postcontainer extends StatelessWidget {
  final Post post;
  const Postcontainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Postheader(
            post: post,
          ),
        ],
      ),
    );
  }
}

class Postheader extends StatelessWidget {
  final Post post;
  const Postheader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Profieavatar(imageUrl: post.user.imageUrl, isactive: false),
        const SizedBox(
          width: 8.0,
        ),
        Column(
          children: [
            Text(post.user.name),
            Row(
              children: [
                Text('${post.timeAgo}  . '),
                Icon(
                  Icons.public,
                  color: Colors.grey[600],
                  size: 12.0,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
