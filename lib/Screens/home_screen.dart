import 'package:flutter/material.dart';
import 'package:vids_app/Models/post_model.dart';

import '../Widgets/custom_bottom.dart';
import '../Widgets/custom_videoplayer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    List<PostModel> posts = PostModel.posts;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const _CustomAppBar(),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const CustomBottomAppBar(routeName: routeName),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: posts.map((post) {
            return CustomVideoPlayer(
              post: post,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildButton(context, 'For You'),
        _buildButton(context, 'Following'),
      ]),
    );
  }

  TextButton _buildButton(BuildContext context, String text) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(fixedSize: const Size(100, 50)),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
