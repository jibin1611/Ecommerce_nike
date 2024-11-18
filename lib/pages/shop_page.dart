// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addItem(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItem(shoe);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Item added to cart"),
        content: Text("Check your cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //search bar
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search",
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          //message
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              "Everyone flies, some fly longer than the others..",
              style: TextStyle(color: Color.fromARGB(255, 88, 88, 88)),
            ),
          ),

          //hot picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hot Picks🔥",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text("See All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue))
              ],
            ),
          ),

          //empty space

          const SizedBox(
            height: 10,
          ),

          //card
          Expanded(
              child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              //create a shoe
              Shoe shoe = value.getShoeList()[index];
              return ShoeTile(
                shoe: shoe,
                onTap: () => addItem(shoe),
              );
            },
          )),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
