class Restaurant {
  final String id;
  final String name;
  final String cuisines;
  final String primaryCuisine;
  final String address;

  final String thumbUrl;
  final double userRating;

  Restaurant(
      {this.id,
      this.name,
      this.cuisines,
      this.primaryCuisine,
      this.address,
      this.thumbUrl,
      this.userRating});
  factory Restaurant.fromJSON(Map<String, dynamic> json) {
    return Restaurant(
        id: json['id'],
        name: json['name'],
        cuisines: json['cuisines'],
        primaryCuisine: json['cuisines'].split(',')[0],
        address: json['location']['address'],
        thumbUrl: json['featured_image'],
        userRating: double.parse(json['user_rating']['aggregate_rating']));
  }
}
