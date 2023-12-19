import 'package:fbapp/config/palette.dart';
import 'package:fbapp/data/data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(currentUser.imageUrl),
                      ),
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
              color: Colors.orange,
              child: ListView.builder(itemCount: 1+onlineUsers.length,itemBuilder:BuildContext context,int index),
            ),
          ),
        ],
      ),
    );
  }
}
