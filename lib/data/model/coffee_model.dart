import '../../utils/contants/app_constants.dart';

class CoffeeModel {
  final int? categoryId;
  final String name;
  final String description;
  final String subtitle;
  final DateTime createdAt;
  final double? rate;
  final int price;
  final String type;

  CoffeeModel({
    this.categoryId,
    required this.name,
    required this.description,
    required this.subtitle,
    required this.createdAt,
    this.rate,
    required this.price,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      '${CoffeeModelConstants.created_at}': categoryId,
      '${CoffeeModelConstants.name}': name,
      '${CoffeeModelConstants.description}': description,
      '${CoffeeModelConstants.subtitle}': subtitle,
      '${CoffeeModelConstants.created_at}': createdAt.toIso8601String(),
      '${CoffeeModelConstants.rate}': rate,
      '${CoffeeModelConstants.price}': price,
      '${CoffeeModelConstants.type}': type,
    };
  }

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      categoryId: json['category_id'],
      name: json['name'],
      description: json['description'],
      subtitle: json['subtitle'],
      createdAt: DateTime.parse(json['created_at']),
      rate: json['rate'] != null ? double.parse(json['rate']) : null,
      price: json['price'],
      type: json['type'],
    );
  }

  CoffeeModel copyWith({
    int? categoryId,
    String? name,
    String? description,
    String? subtitle,
    DateTime? createdAt,
    double? rate,
    int? price,
    String? type,
  }) {
    return CoffeeModel(
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      subtitle: subtitle ?? this.subtitle,
      createdAt: createdAt ?? this.createdAt,
      rate: rate ?? this.rate,
      price: price ?? this.price,
      type: type ?? this.type,
    );
  }

  static CoffeeModel initalValue = CoffeeModel(
    name: '',
    description: '',
    subtitle: '',
    createdAt: DateTime.now(),
    rate: 0.0,
    price: 0,
    type: '',
  );

   bool canAddToDatabase() {
    if (name.isEmpty) return false;
    if (description.isEmpty) return false;
    if (subtitle.isEmpty) return false;
    if (rate == 0.0) return false;
    if (type.isEmpty) return false;
    if (price == 0) return false;

    return true;
  }
}
