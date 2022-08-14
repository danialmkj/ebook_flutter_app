class MyImage {
  final int? id;
  final int? id_num;
  final int? img_num;

  MyImage({
    this.id,
    this.id_num,
    this.img_num,
  });

  factory MyImage.fromJson(Map<String, dynamic> json) {
    return MyImage(
      id: json['id'],
      id_num: json['id_num'],
      img_num: json['img_num'],
    );
  }
}
