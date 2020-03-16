import 'package:flutter/material.dart';
import 'package:testflutterbloczac/@app.dart';

class ArticlesShoppingCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
        actions: <Widget>[
          ArticleShoppingCardCount(),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ArticleShoppingCardList(),
          Positioned(
            left: 20.0,
            bottom: 30.0,
            child: ArticleShoppingCardAmount(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {},
      ),
    );
  }
}
