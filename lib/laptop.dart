class Laptop {
  final String id;
  final String name;
  final String description;
  final double price;
  final String cpu;
  final String ram;
  final String storage;
  final String imageUrl;

  Laptop({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.cpu,
    required this.ram,
    required this.storage,
    required this.imageUrl,
  });

  // --- FIX STARTS HERE ---

  // 1. Converts a Laptop object into a Map (for sending to Firebase)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'cpu': cpu,
      'ram': ram,
      'storage': storage,
      'imageUrl': imageUrl,
    };
  }

  // 2. Creates a Laptop object from a Map (when reading from Firebase)
  factory Laptop.fromMap(Map<String, dynamic> map) {
    return Laptop(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      // Handle price carefully: Firebase might return it as int or double
      price: (map['price'] is int)
          ? (map['price'] as int).toDouble()
          : (map['price'] ?? 0.0).toDouble(),
      cpu: map['cpu'] ?? '',
      ram: map['ram'] ?? '',
      storage: map['storage'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}