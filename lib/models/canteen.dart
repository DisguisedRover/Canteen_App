import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:test01/models/cart_item.dart';
import 'package:test01/models/food.dart';

class Canteen extends ChangeNotifier {
  static final Canteen _instance = Canteen._internal();

  factory Canteen() {
    return _instance;
  }

  Canteen._internal();

  /*
  operations

  */
  //user cart
  final List<CartItem> _cart = [];

//list of food menu
  final List<Food> _menu = [
    //lunch
    Food(
      name: "Chowmein",
      description: "Stir-fried noodles with vegetables or chicken ",
      imagePath: "lib/images/chowmin.jpeg",
      price: 40,
      category: FoodCategory.lunch,
      availableAddons: [
        Addon(name: "Chicken", price: 60),
      ],
    ),

    Food(
      name: "Momo",
      description: "Steamed filled dumplings with vegetables or chicken ",
      imagePath: "lib/images/momo.jpeg",
      price: 40,
      category: FoodCategory.lunch,
      availableAddons: [
        Addon(name: "Chicken", price: 60),
      ],
    ),
    Food(
        name: "Parautha",
        description: "Flatbread, subcontinental flat bread ",
        imagePath: "lib/images/parautha.jpeg",
        price: 40,
        category: FoodCategory.lunch,
        availableAddons: List.empty()),
    Food(
      name: "Samosa",
      description:
          "A fried South Asian pastry with a savoury filling, including ingredients such as spiced potatoes, onions, peas ",
      imagePath: "lib/images/samosa.jpeg",
      price: 20,
      category: FoodCategory.lunch,
      availableAddons: List.empty(),
    ),

    //protein
    Food(
      name: "Chana Aanda",
      description: "Stir-fried chickpea with hardboiled eggs",
      imagePath: "lib/images/chanaAanda.jpeg",
      price: 50,
      category: FoodCategory.protein,
      availableAddons: List.empty(),
    ),
    Food(
      name: "Chana",
      description: "Stir-fried chickpea ",
      imagePath: "lib/images/chana.jpeg",
      price: 30,
      category: FoodCategory.protein,
      availableAddons: List.empty(),
    ),
    Food(
      name: "Aanda",
      description: "Hardboiled eggs",
      imagePath: "lib/images/eggs.jpeg",
      price: 25,
      availableAddons: List.empty(),
      category: FoodCategory.protein,
    ),
    //coldDrinks
    Food(
      name: "Coke",
      description: "Refreshing bottle of Coca-Cola",
      imagePath: "lib/images/coke.jpeg",
      price: 50,
      availableAddons: List.empty(),
      category: FoodCategory.Cold_Drinks,
    ),
    Food(
      name: "Fanta",
      description: "Refreshing bottle of Fanta",
      imagePath: "lib/images/fanta.jpeg",
      price: 50,
      availableAddons: List.empty(),
      category: FoodCategory.Cold_Drinks,
    ),
    Food(
      name: "Sprite",
      description: "Refreshing bottle of Sprite",
      imagePath: "lib/images/sprite.jpeg",
      price: 50,
      availableAddons: List.empty(),
      category: FoodCategory.Cold_Drinks,
    ),
    //hotDrinks
    Food(
      name: "Coffee",
      description: "Beverage brewed from roasted coffee beans ",
      imagePath: "lib/images/blackCoffee.jpeg",
      price: 40,
      availableAddons: List.empty(),
      category: FoodCategory.Hot_Drinks,
    ),
    Food(
      name: "Milk Tea",
      description: "Beverage brewed from tea leaves with milk ",
      imagePath: "lib/images/milkTea.jpeg",
      price: 20,
      availableAddons: List.empty(),
      category: FoodCategory.Hot_Drinks,
    ),
    Food(
      name: "Black Tea",
      description: "Beverage brewed from tea leaves ",
      imagePath: "lib/images/blackTea.jpeg",
      price: 15,
      availableAddons: List.empty(),
      category: FoodCategory.Hot_Drinks,
    ),
    Food(
      name: "Lemon Tea",
      description: "Beverage brewed from tea leaves with lemons",
      imagePath: "lib/images/lemonTea.jpeg",
      price: 15,
      availableAddons: List.empty(),
      category: FoodCategory.Hot_Drinks,
    ),
  ];

  /*
  getters

  */
  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //if items aleady exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFormCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //get total num of items on cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart
  void cleanCart() {
    _cart.clear();
    notifyListeners();
  }

  //generate receipt
  String displayCartReceipt() {
    final StringBuffer receipt = StringBuffer();
    receipt.writeln("Here is your receipt: ");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(" Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  /*
  helpers

  */

  //format double value into money
  String _formatPrice(double price) {
    return "Rs ${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
  // mailer

  Future<void> sendMail(
      String recipientEmail, String subject, String body) async {
    const String username = 'nirajan.ngm99@gmail.com';
    const String password = 'dbas izrs dsfi aley';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = const Address(username, 'Jasmin Nasta Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = subject
      ..text = body;

    try {
      await send(message, smtpServer);
      if (kDebugMode) {
        print("Message sent to $recipientEmail");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Failed to send message: $e");
      }
    }
  }

  void sendMailCard() async {
    final user = FirebaseAuth.instance.currentUser!;

    // creating sender and receiver for owner
    String recipientEmail = 'bishnu.bgb99@gmail.com';
    String username = 'nirajan.ngm99@gmail.com';
    String password = 'dbas izrs dsfi aley';
    String receipt = Canteen().displayCartReceipt();

    //

    final smtpServer = gmail(username, password);
// creating message
    final message = Message()
      ..from = Address(username, 'Jasmin Nasta Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Order Received... :o from ${user.email}\n *Card_Payment*'
      ..text =
          'Heads up!! Order received...  from ${user.email}\n \n$receipt\n';

    try {
      await send(message, smtpServer);
      if (kDebugMode) {
        print("message sent");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> sendMailCash() async {
    final user = FirebaseAuth.instance.currentUser!;

    // creating sender and receiver for owner
    String recipientEmail = 'bishnu.bgb99@gmail.com';
    String username = 'nirajan.ngm99@gmail.com';
    String password = 'dbas izrs dsfi aley';
    String receipt = Canteen().displayCartReceipt();

    final smtpServer = gmail(username, password);
// creating message
    final message = Message()
      ..from = Address(username, 'Jasmin Nasta Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Order Received... :o from ${user.email}\n *Cash_Payment*'
      ..text =
          'Heads up!! Order received...  from ${user.email}\n \n$receipt\n';

    try {
      await send(message, smtpServer);
      if (kDebugMode) {
        print("message sent");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> sendMailC() async {
    // creating sender and receiver for customer
    final user = FirebaseAuth.instance.currentUser!;

    String recipientEmail = user.email!;
    String username = 'nirajan.ngm99@gmail.com';
    String password = 'dbas izrs dsfi aley';
    String receipt = Canteen().displayCartReceipt();

    final smtpServer = gmail(username, password);
// creating message
    final message = Message()
      ..from = Address(username, 'Jasmin Nasta Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Thank you for ordering... :) '
      ..text =
          'Here is your receipt $receipt\n *Note: please have your receipt until you get your order*\n';

    try {
      await send(message, smtpServer);
      if (kDebugMode) {
        print("message sent");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
