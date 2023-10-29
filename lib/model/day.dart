class Day {
  final num? maxtemp_c;
  final num? mintemp_c;

  Day({this.maxtemp_c, this.mintemp_c});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtemp_c: json['maxtemp_c'],
      mintemp_c: json['mintemp_c'],
    );
  }
}
