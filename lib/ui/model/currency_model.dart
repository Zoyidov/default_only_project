class CurrencyModel {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;

  CurrencyModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      thumbnail: json["thumbnail"] as String? ?? "",
      shortDescription: json["short_description"] as String? ?? "",
      gameUrl: json["game_url"] as String? ?? "",
      genre: json["genre"] as String? ?? "",
      platform: json["platform"] as String? ?? "",
      publisher: json["publisher"] as String? ?? "",
      developer: json["developer"] as String? ?? "",
      releaseDate: json["release_date"] as String? ?? "",
      freetogameProfileUrl: json["freetogame_profile_url"] as String? ?? "",
    );
  }
}