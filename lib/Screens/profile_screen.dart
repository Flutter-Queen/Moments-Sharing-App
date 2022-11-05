import 'package:flutter/material.dart';
import 'package:vids_app/Models/post_model.dart';
import 'package:vids_app/Models/user_model.dart';
import 'package:vids_app/Widgets/video_player_preview.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    //? Fetching data that we are passing from the home screen through ModelRoute we look at the settings and take those arguments
    UserModel? user = ModalRoute.of(context)!.settings.arguments as UserModel?;
//*setting up the user object as the first user if user click on the bottom app bar profile tab
    user = user ??= UserModel.users[0];

    //! filtering all the post data that we have so we will keep only post that are comming from the same user id
    List<PostModel> posts = PostModel.posts.where((post) {
      return post.userModel.id == user!.id;
    }).toList();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          user.userName,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [_ProfileInfo(users: user), _ProfileContent(posts: posts)],
      )),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({required this.posts});
  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(children: [
        const TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.grid_view_rounded),
            ),
            Tab(
              icon: Icon(Icons.favorite),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: [
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: posts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 9 / 16),
                  itemBuilder: (context, i) {
                    return VideoPlayerPreview(
                      post: posts[i],
                    );
                  }),
              const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({required this.users});
  final UserModel users;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //********** PROFILE PICTURE ************//
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(users.imagePath),
        ),
        const SizedBox(
          height: 20,
        ),
        //********** FOLLOWS ************//
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 10),
          child: Row(
            children: [
              _userInfo(context, 'Following', '${users.following}'),
              _userInfo(context, 'Followers', '${users.followers}'),
              _userInfo(context, 'Likes', '${users.likes}'),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //**********BUTTONS ************//
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[600],
                fixedSize: const Size(200, 50),
              ),
              child: Text(
                'Follow',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[600],
                  fixedSize: const Size(50, 50),
                ),
                child: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                )),
          ],
        ),
      ],
    );
  }

  Expanded _userInfo(BuildContext context, String type, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            type,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(letterSpacing: 1.5, color: Colors.grey.shade200),
          )
        ],
      ),
    );
  }
}
