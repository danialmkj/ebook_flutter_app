class NewImage {
  final String? id;
  final String? id_num;
  final String? img_num;

  NewImage({
    this.id,
    this.id_num,
    this.img_num,
  });

  factory NewImage.fromJson(Map<String, dynamic> json) {
    return NewImage(
      id: json['id'],
      id_num: json['id_num'],
      img_num: json['img_num'],
    );
  }
}
