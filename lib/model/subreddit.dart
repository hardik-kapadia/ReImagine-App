import 'package:draw/draw.dart';

class SubredditPODO {
  String name;
  late Uri url;
  late Uri banner;
  Subreddit subreddit;

  Subreddit get() => subreddit;

  SubredditPODO(this.name, {required String banner, required this.subreddit}) {
    this.url = Uri.parse("https://www.reddit.com/r/$name");
    this.banner = Uri.parse(banner);
  }
}
