import "package:equatable/equatable.dart";

class ProductModel extends Equatable {
  final String uid;
  final String productId;
  final String name;
  final String description;
  // final List<CategoryModel> categories;
  // final List<MediaModel> media;

  const ProductModel({
    required this.uid,
    required this.productId,
    required this.name,
    required this.description,
    // required this.categories,
    // required this.media,
  });

  ProductModel copyWith({
    String? uid,
    String? productId,
    String? name,
    String? description,
    // List<CategoryModel>? categories,
    // List<MediaModel>? media,
  }) {
    return ProductModel(
      uid: uid ?? this.uid,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      description: description ?? this.description,
      // categories: categories ?? this.categories,
      // media: media ?? this.media,
    );
  }

  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ProductModel(
        uid: json["uid"],
        productId: json["productId"],
        name: json["name"],
        description: json["description"],
        // categories: json["categories"],
        // media: json["media"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "productId": productId,
        "name": name,
        "description": description,
        // "categories": categories,
        // "media": media,
      };

  @override
  List<Object> get props => [
        uid,
        productId,
        name,
        description,
        // categories,
        // media,
      ];
}
