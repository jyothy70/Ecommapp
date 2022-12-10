import 'package:ecommapp/cartscreen.dart';
import 'package:ecommapp/screens/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:ecommapp/widgets/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Shopping App"),
        actions: [
          // IconButton(onPressed: (() {}), icon: Icon(Icons.search)),
          IconButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => CartScreen())));
              }),
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      drawer: Drawer(
        child: ListView(children: [
          UserAccountsDrawerHeader(
            accountName: Text("Name"),
            accountEmail: Text("Email"),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("HomePage"),
              leading: Icon(Icons.home),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("My Account"),
              leading: Icon(Icons.person),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("My Orders"),
              leading: Icon(Icons.shopping_basket),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CartScreen())));
            },
            child: ListTile(
              title: Text("Shopping Cart"),
              leading: Icon(Icons.shopping_cart),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("About"),
              leading: Icon(Icons.help),
            ),
          ),
        ]),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                      "https://images.news18.com/ibnlive/uploads/2021/05/1620542541_redmi_note_10_pro.jpg?impolicy=website&width=510&height=356"),
                  Image.network(
                      "https://media.gettyimages.com/photos/empty-sofa-against-white-background-picture-id1190374388?s=612x612")
                ],
              ),
            ),
          ),

          //Grid view
          Container(height: 450, child: Products()),
        ],
      ),
    );
  }
}
