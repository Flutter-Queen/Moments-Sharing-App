import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vids_app/Models/user_model.dart';
import 'package:vids_app/Screens/profile_screen.dart';
import 'package:vids_app/Widgets/custom_bottom.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    List<UserModel> users = UserModel.users;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          'Discover',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(routeName: routeName),
      body: MasonryGridView.count(
        shrinkWrap: true,
        itemCount: users.length,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProfileScreen.routeName,
                  arguments: users[index]);
            },
            child: Stack(
              children: [
                Container(
                  height: (index == 0) ? 250 : 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(users[index].imagePath),
                        fit: BoxFit.cover),
                  ),
                ),
                const Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.4, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(users[index].imagePath),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            users[index].userName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2 min ago',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
