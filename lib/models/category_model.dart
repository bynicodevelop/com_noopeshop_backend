import "package:equatable/equatable.dart";

class CategoryModel extends Equatable {
  final String uid;
  final String name;
  final String description;

  const CategoryModel({
    required this.uid,
    required this.name,
    required this.description,
  });

  CategoryModel copyWith({
    String? uid,
    String? name,
    String? description,
  }) =>
      CategoryModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        uid: json["uid"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "description": description,
      };

  @override
  List<Object> get props => [
        uid,
        name,
        description,
      ];
}
