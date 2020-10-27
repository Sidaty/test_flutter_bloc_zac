import 'package:flutter/material.dart';
import 'package:testflutterbloczac/@app.dart';

class ArticlesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogue'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticlesShoppingCardPage(),
                ),
              );
            },
            child: ArticleShoppingCardCount(),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ArticleCatalogueList(),
          Positioned(
            right: 20.0,
            bottom: 30.0,
            child: ArticleShoppingCardAmount(),
          ),
        ],
      ),
    );
  }
}
