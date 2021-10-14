class Post {
  int id;
  String category;
  String subreddit;
  String title;
  int upvotes;
  String url;

  Post(this.id,
      {this.category = "Standard",
      this.subreddit = "ImaginarySomething",
      this.title = "Really Really Cool stuff, like super duper cool, trust me, it's really something",
      this.upvotes = 68,
      this.url = "placeholder.jpg"});
}