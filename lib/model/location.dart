class Location {
  final String? country;
  final String? name;
  final String? region;

  Location({this.country, this.name, this.region});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      name: json['name'],
      region: json['region'],
    );
  }
}
