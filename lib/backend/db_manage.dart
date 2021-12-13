import 'package:path/path.dart';
import 'package:re_imagine/model/post.dart';
import 'package:sqflite/sqflite.dart';

class DBManage {
  late Database database;

  Future<void> init() async {
    this.database = await openDatabase(
      join(await getDatabasesPath(), 'saved_posts_4.db'),
      version: 1,
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.

        print("creating new db: ");
        return db.execute(
          'CREATE TABLE posts(id TEXT PRIMARY KEY, category TEXT, user TEXT, subreddit TEXT, title TEXT, upvotes INTEGER, url TEXT, imageUrl TEXT, nsfw INTEGER, bookmarked INTEGER)',
        );
      },
    );
  }

  Future<void> insertPost(Post post) async {
    final db = await database;

    print('inserting into db');

    await db.insert(
      'posts',
      post.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Post>> allPosts() async {
    final db = await database;

    final List<Map<String, dynamic>> maps =
        await db.query('posts', distinct: true);

    return List.generate(maps.length, (i) {
      return Post.fromJson(maps[i]);
    });
  }

  Future<void> deletePost(String id) async {
    final db = await database;

    print('deleting from db');

    await db.delete(
      'posts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<bool> contains(String id) async {
    final db = await database;

    print('checking for: ' + id);

    final List<Map<String, dynamic>> conts = await db.query('posts',
        distinct: true,
        columns: ['id'],
        where: 'id = ?',
        whereArgs: [id],
        limit: 1);

    print('conts got: ${conts.length}');
    return conts.isNotEmpty;
  }
}
