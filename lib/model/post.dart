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
  late bool bookmarked;

  Post(
      {required this.id,
      this.user = "Hardik",
      this.category = "Standard",
      this.subreddit = "ImaginarySomething",
      this.title =
          "Really Really Cool stuff, like super duper cool, trust me, it's really something",
      this.upvotes = 68,
      this.url = "placeholder.jpg",
      this.imageUrl =
          "https://preview.redd.it/o29ixwordi481.jpg?width=1920&format=pjpg&auto=webp&s=b804fa96849b373ccfa53b094edf20b86f0ce66f",
      this.nsfw = false,
      this.bookmarked = false});

  factory Post.fromJson(Map json) {
    return Post(
        id: json['id'],
        category: json['category'],
        subreddit: json['subreddit'],
        title: json['title'],
        upvotes: json['upvotes'],
        url: json['url'],
        imageUrl: json['imageUrl'],
        user: json['user'],
        nsfw: json['nsfw'] == 1 ? true : false,
        bookmarked: json['bookmarked'] == 1 ? true : false);
  }

  void bookmark() {
    this.bookmarked = !this.bookmarked;
  }

  bool get isBookmarked => this.bookmarked;

  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'category': category.toString(),
      'subreddit': subreddit.toString(),
      'title': title.toString(),
      'upvotes': upvotes.abs(),
      'url': url.toString(),
      'user': user.toString(),
      'imageUrl': imageUrl.toLowerCase(),
      'nsfw': nsfw ? 1.abs() : 0.abs(),
      'bookmarked': bookmarked ? 1.abs() : 0.abs()
    };
  }

  @override
  String toString() {
    return this.title + " -> " + this.imageUrl;
  }
}
