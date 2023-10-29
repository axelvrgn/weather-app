class Condition {
  final String? text;
  final String? icon;

  Condition({this.text, this.icon});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
    );
  }
}
