import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Air Force1',
        price: '236',
        imagePath: 'lib/images/shoe2.webp',
        description: 'Premium'),
    Shoe(
        name: 'KD Tryes',
        price: '399',
        imagePath: 'lib/images/shoe9.jpg',
        description: 'Premium'),
    Shoe(
        name: 'Zoom Fresk',
        price: '345',
        imagePath: 'lib/images/shoe7.png',
        description: 'Premium'),
    Shoe(
        name: 'LeBron 14',
        price: '456',
        imagePath: 'lib/images/shoe2.webp',
        description: 'Premium')
  ];

//list of items in the cart
  List<Shoe> userCart = [];

//get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

//get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItem(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart

  void removeItem(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
