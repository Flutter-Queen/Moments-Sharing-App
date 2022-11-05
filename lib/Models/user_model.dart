// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String id;
  final String userName;
  final String imagePath;
  final int followers;
  final int following;
  final int likes;
  UserModel({
    required this.id,
    required this.userName,
    required this.imagePath,
    this.followers = 0,
    this.following = 0,
    this.likes = 0,
  });
  static List<UserModel> users = [
    UserModel(
        id: '1',
        userName: 'Mishal',
        imagePath: 'assets/images/image1.jpg',
        followers: 100,
        following: 110,
        likes: 50),
    UserModel(
        id: '2',
        userName: 'Sunny',
        imagePath: 'assets/images/image2.jpg',
        followers: 150,
        following: 100,
        likes: 150),
    UserModel(
        id: '3',
        userName: 'Fahad',
        imagePath: 'assets/images/image3.jpg',
        followers: 200,
        following: 210,
        likes: 30),
    UserModel(
        id: '4',
        userName: 'Ayesha',
        imagePath: 'assets/images/image4.jpg',
        followers: 500,
        following: 320,
        likes: 70),
    UserModel(
        id: '5',
        userName: 'Massimo',
        imagePath: 'assets/images/image1.jpg',
        followers: 500,
        following: 400,
        likes: 250),
    UserModel(
        id: '6',
        userName: 'Horrain',
        imagePath: 'assets/images/image2.jpg',
        followers: 560,
        following: 160,
        likes: 79),
    UserModel(
        id: '7',
        userName: 'Momal',
        imagePath: 'assets/images/image3.jpg',
        followers: 360,
        following: 179,
        likes: 560),
    UserModel(
        id: '8',
        userName: 'Shumaila',
        imagePath: 'assets/images/image4.jpg',
        followers: 690,
        following: 170,
        likes: 90),
  ];
}
