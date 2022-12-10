import 'package:ecommapp/screens/productdetails.dart';
import 'package:ecommapp/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products_list = [
    {"name": "Bag", "image": "assets/bag1.jpg", "quantity": 1, "price": 500},
    {
      "name": "Dress",
      "image": "assets/dress2.jpg",
      "quantity": 1,
      "price": 500
    },
    {
      "name": " Greydress",
      "image": "assets/dress1.jpg",
      "quantity": 1,
      "price": 700
    },
    {
      "name": "Reddress",
      "image": "assets/dress3.jpg",
      "quantity": 1,
      "price": 750
    },
    {
      "name": "BlackBag",
      "image": "assets/bag2.jpg",
      "quantity": 1,
      "price": 600
    },
    {"name": "Shoe", "image": "assets/shoe.jpg", "quantity": 1, "price": 1000},
    {
      "name": "Kurti",
      "image": "assets/dress2.jpg",
      "quantity": 1,
      "price": 500
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Single_prod(
            prod_name: products_list[index]["name"],
            prod_image: products_list[index]["image"],
            prod_quantity: products_list[index]["quantity"],
            prod_price: products_list[index]["price"],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_image;
  final prod_quantity;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_image,
    this.prod_quantity,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              //passing images to product details screen //

              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => ProductDetails(
                        product_details_name: prod_name,
                        product_details_image: prod_image,
                        product_details_price: prod_price,
                        product_details_quantity: prod_quantity,
                      )))),
              child: GridTile(
                footer: Container(
                    color: Colors.white70,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            prod_name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ),
                        Text("\$$prod_price"),
                      ],
                    )),
                child: Image.asset(
                  prod_image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}


                  // ListTile(
                  //   leading: Text(prod_name),
                  //   title: Text("\$$prod_price"),
                  // ),