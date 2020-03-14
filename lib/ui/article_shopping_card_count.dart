import 'package:flutter/material.dart';
import 'package:testflutterbloczac/@app.dart';

class ArticleShoppingCardCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticleLoadedState) {
            return Container(
              margin: const EdgeInsets.only(
                top: 20.0,
                right: 10.0,
                bottom: 5.0,
              ),
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 33.0,
                  ),
                  Positioned(
                    right: 0.0,
                    top: 5.0,
                    child: CircleAvatar(
                      radius: 10.0,
                      backgroundColor: Colors.deepOrangeAccent,
                      child: Text(
                        '${state.total}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return SizedBox();
        });
  }
}
