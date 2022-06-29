class TextValue {
  final String id;
  final String title;
  final String name;
  final int description;

  const TextValue(
      {required this.id,
      required this.title,
      required this.name,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'name': name,
      'description': description,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'text_value{id: $id, title: $title, name: $name, description: $description}';
  }
}
