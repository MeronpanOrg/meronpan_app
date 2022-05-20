enum statusEnum {
  unknown,
  ongoing,
  completed,
  licensed,
  publishingFinished,
  cancelled,
  onHiatus,
}

class Manga {
  final String url;
  final String title;
  String artist;
  String author;
  String description;
  String genre;
  statusEnum status;
  String thumbnailUrl;
  bool initialized;

  Manga({
    required this.url,
    required this.title,
    this.artist = '',
    this.author = '',
    this.description = '',
    this.genre = '',
    this.status = statusEnum.unknown,
    this.thumbnailUrl = '',
    this.initialized = false,
  });

  void copyFrom(Manga other) {
    if (other.author != '') {
      author = other.author;
    }

    if (other.artist != '') {
      artist = other.artist;
    }

    if (other.description != '') {
      description = other.description;
    }

    if (other.genre != '') {
      genre = other.genre;
    }

    if (other.thumbnailUrl != '') {
      thumbnailUrl = other.thumbnailUrl;
    }

    status = other.status;

    if (!initialized) {
      initialized = other.initialized;
    }
  }
}
