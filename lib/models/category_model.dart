import "package:equatable/equatable.dart";

class CategoryModel extends Equatable {
  final String uid;
  final String name;

  const CategoryModel({
    required this.uid,
    required this.name,
  });

  CategoryModel copyWith({
    String? uid,
    String? name,
  }) {
    return CategoryModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        uid: json["uid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
      };

  @override
  List<Object> get props => [
        uid,
        name,
      ];
}
