class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  final List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });

  Food copyWith({
    String? name,
    String? description,
    String? imagePath,
    double? price,
    FoodCategory? category,
    List<Addon>? availableAddons,
  }) {
    return Food(
      name: name ?? this.name,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      category: category ?? this.category,
      availableAddons: availableAddons ?? this.availableAddons,
    );
  }

  @override
  String toString() {
    return 'Food(name: $name, price: $price, category: ${category.displayName})';
  }
}

enum FoodCategory {
  lunch,
  protein,
  coldDrinks,
  hotDrinks;

  String get displayName {
    switch (this) {
      case FoodCategory.lunch:
        return "Lunch";
      case FoodCategory.protein:
        return "Protein";
      case FoodCategory.coldDrinks:
        return "Cold Drinks";
      case FoodCategory.hotDrinks:
        return "Hot Drinks";
    }
  }
}

class Addon {
  final String name;
  final double price;

  Addon({
    required this.name,
    required this.price,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Addon && other.name == name && other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;

  @override
  String toString() => 'Addon(name: $name, price: $price)';

  Addon copyWith({
    String? name,
    double? price,
  }) {
    return Addon(
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }
}
