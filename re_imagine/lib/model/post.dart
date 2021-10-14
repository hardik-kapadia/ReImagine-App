class Post {
  final int id;
  final String category;
  final String subreddit;
  final String title;
  final int upvotes;
  final String url;
  final String user;
  const Post(
      {required this.id,
      this.user = "Dikap",
      this.category = "Standard",
      this.subreddit = "ImaginarySomething",
      this.title =
          "Really Really Cool stuff, like super duper cool, trust me, it's really something",
      this.upvotes = 68,
      this.url = "placeholder.jpg"});
}
