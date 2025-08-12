class Item {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  }) {
    if (id <= 0) {
      throw ArgumentError('ID must be positive');
    }
    if (name.trim().isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }
    if (price < 0) {
      throw ArgumentError('Price cannot be negative');
    }
    if (imageUrl.trim().isEmpty) {
      throw ArgumentError('Image URL cannot be empty');
    }
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Item(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
