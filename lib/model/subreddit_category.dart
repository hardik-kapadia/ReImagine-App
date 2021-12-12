
class SubredditCategory {
  int id;
  String name;

  SubredditCategory(this.id, this.name);

  String get() => name;

  @override
  String toString() {
    return '$id -> $name';
  }
}