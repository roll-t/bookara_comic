class ComicArgument {
  String? slug;
  String? name;
  ComicArgument({this.slug, this.name});

  factory ComicArgument.fromJson(Map<String, dynamic> json) {
    return ComicArgument(
      slug: json['slug'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
    };
  }
}
