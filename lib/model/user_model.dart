class UserModel {
  final String? email;
  final String? name;
  final String? id;
  final PictureModel? pictureModel;
  const UserModel({this.email, this.name, this.id, this.pictureModel});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      id: json['id'],
      pictureModel: PictureModel.fromJson(json['picture']['data']),
    );
  }
}

class PictureModel {
  final String? url;
  final int? width;
  final int? height;
  const PictureModel({this.url, this.width, this.height});

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }
}
