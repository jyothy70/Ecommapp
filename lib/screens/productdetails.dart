import 'package:ecommapp/cartproducts.dart';
import 'package:ecommapp/cartscreen.dart';
import 'package:ecommapp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:ecommapp/payment.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_image;
  final product_details_quantity;
  final product_details_price;

  const ProductDetails(
      {super.key,
      this.product_details_name,
      this.product_details_image,
      this.product_details_quantity,
      this.product_details_price});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => HomePage())));
            },
            child: Text("DetailScreen")),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => CartScreen())));
              }),
              icon: Icon(Icons.search)),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.grey,
                child: Image.asset(widget.product_details_image),
              ),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    widget.product_details_name,
                    style: TextStyle(fontSize: 15),
                  ),
                  title: Row(
                    children: [
                      Expanded(child: Text("${widget.product_details_price}"))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              //  BUTTONS    //

              Expanded(
                  child: MaterialButton(
                onPressed: (() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Size"),
                          content: Text("Choose the Size"),
                          actions: [
                            MaterialButton(
                              onPressed: (() {
                                Navigator.of(context).pop(context);
                              }),
                              child: Text("Close"),
                            )
                          ],
                        );
                      });
                }),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(child: Text("Size")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: (() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Color"),
                          content: Text("Choose the color"),
                          actions: [
                            MaterialButton(
                              onPressed: (() {
                                Navigator.of(context).pop(context);
                              }),
                              child: Text("Close"),
                            )
                          ],
                        );
                      });
                }),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(child: Text("Color")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: (() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Qty"),
                          content: Text("Choose the Qty"),
                          actions: [
                            MaterialButton(
                              onPressed: (() {
                                Navigator.of(context).pop(context);
                              }),
                              child: Text("Close"),
                            )
                          ],
                        );
                      });
                }),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(child: Text("Qty")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              ))
            ],
          ),
          Row(
            children: [
              //  BUTTONS    //

              Expanded(
                child: MaterialButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PaymentPage())));
                    }),
                    color: Colors.red,
                    child: Text("Buy Now")),
              ),
              IconButton(
                  onPressed: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return CartScreen();
                    })));
                  }),
                  icon: Icon(Icons.add_shopping_cart)),
              IconButton(
                  onPressed: (() {}), icon: Icon(Icons.favorite_outline)),
            ],
          ),
          Divider(),
          ListTile(
            title: Text("Product Details"),
            subtitle: Text(""),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Name"),
              ),
            ],
          ),

          //  fill in brand and material  //
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Brand"),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Material"),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Similar Products"),
          ),

          //  Similar Products //
          Container(
            height: 350,
            child: SimilarProducts(),
          ),
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  const SimilarProducts({super.key});

  @override
  State<SimilarProducts> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var products_list = [
    {"name": "Bag", "image": "assets/bag1.jpg", "quantity": 1, "price": 500},
    {
      "name": "Dress",
      "image": "assets/dress2.jpg",
      "quantity": 1,
      "price": 500
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
          return Similar_single_prod(
            prod_name: products_list[index]["name"],
            prod_image: products_list[index]["image"],
            prod_quantity: products_list[index]["quantity"],
            prod_price: products_list[index]["price"],
          );
        });
  }
}

class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_image;
  final prod_quantity;
  final prod_price;

  Similar_single_prod({
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
