import 'package:flutter/material.dart';
import 'package:testflutterbloczac/@app.dart';

class ArticleShoppingCardAmount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoadedState) {
          return Hero(
            tag: 'amount',
            child: Material(
              elevation: 5.0,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SizedBox(
                height: 50.0,
                width: 150.0,
                child: Center(
                  child: Text(
                    '${state.totalAmount} FCFA',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
