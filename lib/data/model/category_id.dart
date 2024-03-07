class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  // toJson method to convert CategoryModel instance to JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  // fromJson constructor to create CategoryModel instance from JSON format
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
