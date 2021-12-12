class Post {
  final String? id;
  final String category;
  final String subreddit;
  final String title;
  final int upvotes;
  final String url;
  final String user;
  final bool nsfw;
  final String imageUrl;
  const Post({
    required this.id,
    this.user = "Dikap",
    this.category = "Standard",
    this.subreddit = "ImaginarySomething",
    this.title =
        "Really Really Cool stuff, like super duper cool, trust me, it's really something",
    this.upvotes = 68,
    this.url = "placeholder.jpg",
    this.imageUrl =
        "https://preview.redd.it/o29ixwordi481.jpg?width=1920&format=pjpg&auto=webp&s=b804fa96849b373ccfa53b094edf20b86f0ce66f",
    this.nsfw = false,
  });

  @override
  String toString() {
    return this.title + " -> " + this.imageUrl;
  }
}
