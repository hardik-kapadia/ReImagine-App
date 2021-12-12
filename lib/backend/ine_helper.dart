import 'dart:async';
import 'package:draw/draw.dart';
import '../model/post.dart';

class RedditHelper {
  late Reddit reddit;

  RedditHelper() {
    init();
  }

  Future<void> init() async {
    this.reddit = await Reddit.createReadOnlyInstance(
      clientId: "5vV9qWUV_xz2VxAhBcT5sw",
      clientSecret: "k708ngBEUrc8RET4k0ghWigSopV6TA",
      userAgent: "reIne",
    );
  }

  var allSubreddits = {
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
    'friends': {
      'AdorableDragons',
      'AlternativeArt',
      'ApocalypsePorn',
      'ArmoredWomen',
      'ArtPorn',
      'BadAssDragons',
      'ImpracticalArmour',
      'INEGentlemanBoners',
      'Isometric',
      'Moescape',
      'mtgporn',
      'PopArtNouveau',
      'Pulp',
      'Raining',
      'ReasonableFantasy',
      'SpecArt',
      'StarshipPorn',
      'SuperStructures',
      'SympatheticMonsters',
      'UnusualArt',
      'Wallpapers',
      'ZodiacArt',
    }
  };

  Future<List<Post>> getNewPostsFromCategory(String category, int limit) async {
    Set<String>? subs = allSubreddits[category];


    if (subs == null) throw NullThrownError();

    
    int n = (limit/ subs.length).round();
    n = n == 0?1:n;


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



    int i = 0;

    List<Submission> submissions = [];

    await for (var uc in post) {
      // print("$i -> ${uc.toString()}");
      submissions.add(await (uc as SubmissionRef).populate());
      i++;
    }

    i = 0;
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
      someName.add(post);
      i++;
    }
    return someName;
  }
}
