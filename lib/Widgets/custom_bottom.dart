import 'package:flutter/material.dart';
import 'package:vids_app/Screens/profile_screen.dart';
import 'package:vids_app/Screens/search_screen.dart';

import '../Screens/home_screen.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 75,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
            },
            icon: const Icon(Icons.home),
            color: Colors.white,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, SearchScreen.routeName);
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle),
            color: Colors.white,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            color: Colors.white,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, ProfileScreen.routeName);
            },
            icon: const Icon(Icons.person),
            color: Colors.white,
            iconSize: 30,
          ),
        ]),
      ),
    );
  }
}
