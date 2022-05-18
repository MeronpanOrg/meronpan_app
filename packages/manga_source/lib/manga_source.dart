///
/// A basic interface for creating a source repository.
/// It could be an online source, a local source, etc...
abstract class MangaSource {
  final String id;
  final String name;

  MangaSource({this.id, this.name});

  String get preferenceKey => "source_$id";
}
