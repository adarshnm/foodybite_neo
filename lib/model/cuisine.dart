class Cuisine {
  final String id;
  final String name;

  Cuisine({this.id, this.name});
  factory Cuisine.fromJSON(Map<String, dynamic> json) {
    return Cuisine(id: json['cuisine_id'], name: json['cuisine_name']);
  }
}
