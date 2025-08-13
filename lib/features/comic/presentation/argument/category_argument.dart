class CategoryArgument {
  String? slug;
  String? name;
  CategoryArgument({
    this.slug,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
    };
  }
}
