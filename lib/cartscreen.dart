import 'package:ecommapp/cartproducts.dart';
import 'package:ecommapp/homepage.dart';
import 'package:ecommapp/payment.dart';
import 'package:ecommapp/screens/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:ecommapp/cartproducts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("CartScreen"),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => PaymentPage())));
              }),
              icon: Icon(Icons.search)),
        ],
      ),
      body: CartProducts(),
    );
  }
}
