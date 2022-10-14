import "package:equatable/equatable.dart";

class ProductModel extends Equatable {
  final String uid;
  final String name;
  final String description;
  // final List<CategoryModel> categories;
  // final List<MediaModel> media;

  const ProductModel({
    required this.uid,
    required this.name,
    required this.description,
    // required this.categories,
    // required this.media,
  });

  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ProductModel(
        uid: json["uid"],
        name: json["name"],
        description: json["description"],
        // categories: json["categories"],
        // media: json["media"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "description": description,
        // "categories": categories,
        // "media": media,
      };

  @override
  List<Object> get props => [
        uid,
        name,
        description,
        // categories,
        // media,
      ];
}