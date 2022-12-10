import 'package:flutter/material.dart';
import 'package:ecommapp/cartscreen.dart';
import 'package:provider/provider.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({super.key});

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var Products_in_the_cart = [
    {
      "name": "Bag",
      "image": "assets/bag1.jpg",
      "quantity": 1,
      "price": 500,
      "Size": "small",
      "color": "yellow"
    },
    {
      "name": "Dress",
      "image": "assets/dress2.jpg",
      "quantity": 1,
      "price": 500,
      "Size": "M",
      "color": "Green"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_in_the_cart.length,
        itemBuilder: ((context, index) {
          return Single_cart_product(
            cart_prod_name: Products_in_the_cart[index]["name"],
            cart_prod_image: Products_in_the_cart[index]["image"],
            cart_prod_quantity: Products_in_the_cart[index]["quantity"],
            cart_prod_price: Products_in_the_cart[index]["price"],
            cart_prod_size: Products_in_the_cart[index]["size"],
            cart_prod_color: Products_in_the_cart[index]["color"],
          );
        }));
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_image;
  final cart_prod_quantity;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;

  Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_image,
      this.cart_prod_quantity,
      this.cart_prod_price,
      this.cart_prod_size,
      this.cart_prod_color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Image.asset(cart_prod_image, width: 80.0, height: 80.0),
          title: Text(cart_prod_name)),
    );
  }
}
