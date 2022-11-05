import 'package:vids_app/Models/user_model.dart';

enum PostType { image, video, audio }

class PostModel {
  final String id;
  final UserModel userModel;
  final PostType type;
  final String caption;
  final String assetPath;
  PostModel({
    required this.id,
    required this.userModel,
    required this.type,
    required this.caption,
    required this.assetPath,
  });
  static List<PostModel> posts = [
    PostModel(
        id: '1',
        userModel: UserModel.users[0],
        type: PostType.video,
        caption:
            'Slow down to the pace of nature.I am a Tree hugging, flower sniffing, nature lover Keep close to nature’s heart You are never alone when you are connected with nature Listening to nature At peace in nature',
        assetPath: 'assets/videos/vid1.mp4'),
    PostModel(
        id: '2',
        userModel: UserModel.users[1],
        type: PostType.video,
        caption:
            'See the wonder of nature around you Stop. Look. Listen. Breathe.Surround yourself with nature. Never spend too much time away from nature Nature amazes at every turn. Listen and delight in the soulful sounds of nature. I live to explore nature',
        assetPath: 'assets/videos/vid2.mp4'),
    PostModel(
        id: '3',
        userModel: UserModel.users[2],
        type: PostType.video,
        caption: 'Just look at the beauty around you.',
        assetPath: 'assets/videos/vid3.mp4'),
    PostModel(
        id: '4',
        userModel: UserModel.users[0],
        type: PostType.video,
        caption:
            'Look deep into nature, and then you will understand everything better.',
        assetPath: 'assets/videos/vid4.mp4'),
    PostModel(
        id: '5',
        userModel: UserModel.users[4],
        type: PostType.video,
        caption: 'Nature speaks softly. You have to listen to it carefully.',
        assetPath: 'assets/videos/vid5.mp4'),
    PostModel(
        id: '6',
        userModel: UserModel.users[0],
        type: PostType.video,
        caption: 'Don’t Just Exist, Live.',
        assetPath: 'assets/videos/vid6.mp4'),
    PostModel(
        id: '7',
        userModel: UserModel.users[6],
        type: PostType.video,
        caption: 'In all things of nature there is something of the marvelous.',
        assetPath: 'assets/videos/vid7.mp4'),
    PostModel(
        id: '8',
        userModel: UserModel.users[0],
        type: PostType.video,
        caption: 'In all things of nature there is something of the marvelous.',
        assetPath: 'assets/videos/vid8.mp4'),
    PostModel(
        id: '9',
        userModel: UserModel.users[3],
        type: PostType.video,
        caption:
            'You must go on adventures to find out where you truly belong.',
        assetPath: 'assets/videos/vid9.mp4'),
    PostModel(
        id: '10',
        userModel: UserModel.users[0],
        type: PostType.video,
        caption: 'Stay close to what keeps you feeling alive.',
        assetPath: 'assets/videos/vid10.mp4'),
  ];
}
