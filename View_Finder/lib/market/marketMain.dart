// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_add_to_cart_button/flutter_add_to_cart_button.dart';

import 'package:login/News_feed/home_screen.dart';
import 'package:login/login_page.dart';
import 'package:login/market/add_item.dart';
import 'package:login/market/productView.dart';

class Market extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Market> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Product 1',
      'image':
          'https://images.pexels.com/photos/11681844/pexels-photo-11681844.jpeg?auto=compress&cs=tinysrgb&w=800',
      'price': 10.0,
    },
    {
      'name': 'Product 2',
      'image':
          'https://images.pexels.com/photos/5828579/pexels-photo-5828579.jpeg?auto=compress&cs=tinysrgb&w=800',
      'price': 20.0,
    },
  ];

  List<String> categoryItems = <String>[
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
  ];

  List<String> locationAreaItems = <String>[
    'Location Area 1',
    'Location Area 2',
    'Location Area 3',
    'Location Area 4',
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Map<String, dynamic>> cart = [];

  void addToCart(int index) {
    // setState(() {
    //
    // });
    cart.add(products[index]);
  }

  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 144, 143, 143),
      appBar: AppBar(
        title: Text('Market Place',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 191, 191, 191),
            )),
        flexibleSpace: Container(),
        backgroundColor: Color.fromARGB(255, 90, 90, 90),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              // Handle menu item selection
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'category',
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.category,
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5)),
                      SizedBox(width: 8.0),
                      Text('Select Category'),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                for (String categoryItem in categoryItems)
                  PopupMenuItem<String>(
                    value: categoryItem,
                    child: Text(categoryItem),
                  ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  value: 'location',
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on,
                          color: Colors.black.withOpacity(0.5)),
                      SizedBox(width: 8.0),
                      Text('Select Location Area'),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                for (String locationAreaItem in locationAreaItems)
                  PopupMenuItem<String>(
                    value: locationAreaItem,
                    child: Text(locationAreaItem),
                  ),
              ];
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart,
                color: Color.fromARGB(255, 208, 207, 207).withOpacity(0.8)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: cart),
                ),
              );
            },
          ),
        ],
      ),

      ///////////////////////main///////////////////////////////////////////////////

      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 15),
                Container(
                  height: 45,
                  width: 400,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 226, 225, 225),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 91, 91, 91)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(20.0),
                        //   topRight: Radius.circular(20.0),
                        //   bottomLeft: Radius.circular(20.0),
                        // ),
                        // image: DecorationImage(
                        //   image: AssetImage('images/666.jpg'),
                        //   fit: BoxFit.cover,
                        //   colorFilter: ColorFilter.mode(
                        //       Colors.black.withOpacity(1.0), BlendMode.dstATop),
                        // ),
                        ),
                    child: GridView.builder(
                      padding: EdgeInsets.all(2),
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 0.55,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, i) => ProductItem(
                        name: products[i]['name'],
                        image: products[i]['image'],
                        price: products[i]['price'],
                        addToCart: () => addToCart(i),
                        formKey: formKey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 340, top: 730),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => addItem()),
                  );
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final Function addToCart;
  final GlobalKey<FormState> formKey;

  ProductItem({
    required this.name,
    required this.image,
    required this.price,
    required this.addToCart,
    required this.formKey,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  AddToCartButtonStateId stateId = AddToCartButtonStateId.idle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => productView()),
        );
      },
      child: Card(
        color: Color.fromARGB(255, 255, 255, 255),
        elevation: 5,
        child: Column(
          children: [
            Image.network(
              widget.image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 3),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '\$${widget.price}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 0),
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: 100,
                      height: 30,
                      child: AddToCartButton(
                        trolley: Image.asset(
                          'images/cc.png',
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                        text: Text(
                          'Whishlist',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                        check: SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(24),
                        backgroundColor: Color.fromARGB(255, 65, 65, 65),
                        onPressed: (id) {
                          if (id == AddToCartButtonStateId.idle) {
                            //handle logic when pressed on idle state button.
                            setState(() {
                              stateId = AddToCartButtonStateId.loading;
                              Future.delayed(Duration(seconds: 3), () {
                                setState(() {
                                  stateId = AddToCartButtonStateId.done;
                                });
                              });
                            });
                          } else if (id == AddToCartButtonStateId.done) {
                            //handle logic when pressed on done state button.
                            setState(() {
                              stateId = AddToCartButtonStateId.idle;
                            });
                          }
                        },
                        stateId: stateId,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cart;

  CartPage({required this.cart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalAmount {
    var total = 0.0;
    for (var i = 0; i < widget.cart.length; i++) {
      total += widget.cart[i]['price'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cart.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(widget.cart[i]['image']),
                  ),
                  title: Text(widget.cart[i]['name']),
                  subtitle: Text('\$${widget.cart[i]['price']}'),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Total: \$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement payment options here
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
