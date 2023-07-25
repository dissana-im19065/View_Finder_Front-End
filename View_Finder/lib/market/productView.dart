import 'package:flutter/material.dart';

class productView extends StatefulWidget {
  const productView({super.key});

  @override
  State<productView> createState() => _productViewState();
}

class _productViewState extends State<productView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        shadowColor: Color.fromARGB(192, 0, 0, 0),
        title: Text('Product Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 0, 0, 0),
            height: 400,
            child: Expanded(
              child: PageView(
                children: [
                  Image.network(
                    'https://images.pexels.com/photos/196661/pexels-photo-196661.jpeg?auto=compress&cs=tinysrgb&w=800',
                  ),
                  Image.network(
                    'https://images.pexels.com/photos/288479/pexels-photo-288479.jpeg?auto=compress&cs=tinysrgb&w=800',
                  ),
                  Image.network(
                    'https://images.pexels.com/photos/802255/pexels-photo-802255.jpeg?auto=compress&cs=tinysrgb&w=800',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Item Name'),
                Text('Item Description'),
                Text('Location'),
                Row(
                  children: [
                    Text('Contact: '),
                    IconButton(
                      icon: Icon(Icons.chat),
                      onPressed: () {
                        // TODO: Implement WhatsApp chat functionality
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
