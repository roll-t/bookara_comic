class CarModel {
  final int id;
  final String brand;
  final String color;
  final String des;
  final String name;
  final String plate;
  final String product;
  final String status;
  final String type;
  final String releaseYear;
  final String isDeleted;
  final String deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? importDate;
  final DateTime? soldDate;
  final double importCost;
  final double importPrice;
  final double soldCost;
  final double soldPrice;
  final double price;
  final double profit;
  final String soldDes;

  CarModel({
    required this.id,
    required this.brand,
    required this.color,
    required this.des,
    required this.name,
    required this.plate,
    required this.product,
    required this.status,
    required this.type,
    required this.releaseYear,
    required this.isDeleted,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.importDate,
    required this.soldDate,
    required this.importCost,
    required this.importPrice,
    required this.soldCost,
    required this.soldPrice,
    required this.price,
    required this.profit,
    required this.soldDes,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] ?? 0,
      brand: json['brand'] ?? '',
      color: json['color'] ?? '',
      des: json['des'] ?? '',
      name: json['name'] ?? '',
      plate: json['plate'] ?? '',
      product: json['product'] ?? '',
      status: json['status'] ?? '',
      type: json['type'] ?? '',
      releaseYear: json['release_year'] ?? '',
      isDeleted: json['isDeleted'] ?? '',
      deletedAt: json['deletedAt'] ?? '',
      createdAt: json['createdAt'] != null && json['createdAt'] != ''
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null && json['updatedAt'] != ''
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      importDate: json['import_date'] != null && json['import_date'] != ''
          ? DateTime.tryParse(json['import_date'])
          : null,
      soldDate: json['sold_date'] != null && json['sold_date'] != ''
          ? DateTime.tryParse(json['sold_date'])
          : null,
      importCost: (json['import_cost'] ?? 0).toDouble(),
      importPrice: (json['import_price'] ?? 0).toDouble(),
      soldCost: (json['sold_cost'] ?? 0).toDouble(),
      soldPrice: (json['sold_price'] ?? 0).toDouble(),
      price: (json['price'] ?? 0).toDouble(),
      profit: (json['profit'] ?? 0).toDouble(),
      soldDes: json['sold_des'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'color': color,
      'des': des,
      'name': name,
      'plate': plate,
      'product': product,
      'status': status,
      'type': type,
      'release_year': releaseYear,
      'isDeleted': isDeleted,
      'deletedAt': deletedAt,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'import_date': importDate?.toIso8601String(),
      'sold_date': soldDate?.toIso8601String(),
      'import_cost': importCost,
      'import_price': importPrice,
      'sold_cost': soldCost,
      'sold_price': soldPrice,
      'price': price,
      'profit': profit,
      'sold_des': soldDes,
    };
  }
}
