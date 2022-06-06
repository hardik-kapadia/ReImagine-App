import 'dart:async';
import 'package:draw/draw.dart';
import 'package:re_imagine/model/subreddit_category.dart';
import '../model/post.dart';

class RedditHelper {
  late Reddit reddit;

  RedditHelper() {
    init();
  }

  Future<void> init() async {
    this.reddit = await Reddit.createReadOnlyInstance(
      clientId: "",//CLIENT_ID
      clientSecret: "",//CLIENT_SECRET
      userAgent: "reIne",
    );
  }

  Map<String, dynamic> allSubreddits = {
    'characters': {
      'ImaginaryArchers',
      'ImaginaryAssassins',
      'ImaginaryAstronauts',
      'ImaginaryBoners',
      'ImaginaryKnights',
      'ImaginaryLovers',
      'ImaginaryMythology',
      'ImaginaryNobles',
      'ImaginaryScholars',
      'ImaginarySoldiers',
      'ImaginaryWarriors',
      'ImaginaryWitches',
      'ImaginaryWizards',
    },
    'races': {
      'ImaginaryAngels',
      'ImaginaryDwarves',
      'ImaginaryElves',
      'ImaginaryFaeries',
      'ImaginaryHumans',
      'ImaginaryImmortals',
      'ImaginaryMerfolk',
      'ImaginaryOrcs',
    },
    'lands': {
      'ImaginaryBattlefields',
      'ImaginaryCityscapes',
      'ImaginaryHellscapes',
      'ImaginaryMindscapes',
      'ImaginaryPathways',
      'ImaginarySeascapes',
      'ImaginarySkyscapes',
      'ImaginaryStarscapes',
      'ImaginaryWastelands',
      'ImaginaryWeather',
      'ImaginaryWildlands',
      'ImaginaryWorlds',
    },
    'architecture': {
      'ImaginaryArchitecture',
      'ImaginaryCastles',
      'ImaginaryDwellings',
      'ImaginaryInteriors',
      'ImaginaryLibraries',
    },
    'monsters': {
      'ImaginaryBeasts',
      'ImaginaryBehemoths',
      'ImaginaryCarnage',
      'ImaginaryDemons',
      'ImaginaryDragons',
      'ImaginaryElementals',
      'ImaginaryHorrors',
      'ImaginaryHybrids',
      'ImaginaryLeviathans',
      'ImaginaryMonsterGirls',
      'ImaginaryUndead',
      'ImaginaryWorldEaters',
    },
    'technology': {
      'ImaginaryArmor',
      'ImaginaryCybernetics',
      'ImaginaryCyberpunk',
      'ImaginaryFutureWar',
      'ImaginaryFuturism',
      'ImaginaryMechs',
      'ImaginaryPortals',
      'ImaginaryRobotics',
      'ImaginaryStarships',
      'ImaginarySteampunk',
      'ImaginaryVehicles',
      'ImaginaryWarships',
      'ImaginaryWeaponry',
    },
    'fandoms': {
      'ImaginaryAzeroth',
      'ImaginaryDarkSouls',
      'ImaginaryFallout',
      'ImaginaryJedi',
      'ImaginaryKanto',
      'ImaginaryMarvel',
      'ImaginaryMiddleEarth',
      'ImaginaryNecronomicon',
      'ImaginaryOverwatch',
      'ImaginaryTamriel',
      'ImaginaryWarhammer',
      'ImaginaryWesteros',
      'ImaginaryWitcher',
    },
    'misc': {
      'ImaginaryNetwork',
      'ImaginaryBestOf',
      'ImaginaryAww',
      'ImaginaryColorscapes',
      'ImaginaryFeels',
      'ImaginaryMaps',
      'ImaginaryUnofficial',
      'ImaginaryPets',
      'ImaginarySliceOfLife',
      'ImaginaryTurtleWorlds',
      'ImaginaryWTF',
    },
  };

  final List<SubredditCategory> allCategories = [
    SubredditCategory(1, "characters"),
    SubredditCategory(2, "races"),
    SubredditCategory(3, "lands"),
    SubredditCategory(4, "architechture"),
    SubredditCategory(5, "monsters"),
    SubredditCategory(6, "technology"),
    SubredditCategory(7, "fandoms"),
    SubredditCategory(8, "misc")
  ];

  List<String> getSubreddits(String category) {
    List<String>? subs = allSubreddits[category]?.toList();
    return subs as List<String>;
  }

  Future<List<Post>> getNewPostsFromCategory(String category, int limit) async {
    Set<String>? subs = allSubreddits[category];

    if (subs == null) throw NullThrownError();

    int n = (limit / subs.length).round();
    n = n == 0 ? 1 : n;

    print('Category: $category');

    List<Post> allPosts = [];

    for (var sub in subs) {
      List<Post> temp = await getNewPosts(sub, n);
      print('${temp.length} posts pulled from $sub');
      allPosts.addAll(temp);
    }

    return allPosts;
  }

  Future<List<Post>> getNewPosts(String name, int limit) async {
    print('pulling from: $name');

    Subreddit sub = await reddit.subreddit(name).populate();

    Stream<UserContent> post = sub.newest(limit: limit);

    List<Submission> submissions = [];

    await for (var uc in post) {
      // print("$i -> ${uc.toString()}");
      submissions.add(await (uc as SubmissionRef).populate());
    }

    List<Post> someName = [];
    for (var submission in submissions) {
      String title = submission.title;
      String author = submission.author;
      String imageUrl = submission.url.toString();
      int upvotes = submission.upvotes;
      String subreddit = submission.subreddit.displayName;
      String id = submission.id as String;
      bool nsfw = submission.over18;
      String url = submission.shortlink.toString();

      Post post = Post(
        id: id,
        title: title,
        subreddit: subreddit,
        imageUrl: imageUrl,
        upvotes: upvotes,
        user: author,
        nsfw: nsfw,
        url: url,
      );
      if (check(imageUrl) && !nsfw) {
        someName.add(post);
      } else {
        print("something is filtered");
      }
    }
    return someName;
  }

  bool check(String ur) {
    return ur.contains(".jpeg") || ur.contains(".jpg") || ur.contains(".png");
  }
}
