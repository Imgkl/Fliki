//Model for the RecentHistory
class Recents {
  String title;

  Recents({
    this.title,
  });

  Recents.fromMap(Map map) : this.title = map['title'];

  Map toMap() {
    return {
      'title': this.title,
    };
  }
}
