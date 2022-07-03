class TextValue {
  final int? id;
  final String? title;
  final String? name;
  final String? description;

  TextValue({this.id, this.title, this.name, this.description});

  factory TextValue.fromJson(Map<String, dynamic> json) {
    return TextValue(
      id: json['id'] as int,
      title: json['title'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}
