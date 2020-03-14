import 'package:flutter/material.dart';
import 'package:testflutterbloczac/@app.dart';

class ArticleShoppingCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
      if (state is ArticleLoadingState) {
        return Center(child: CircularProgressIndicator());
      } else if (state is ArticleLoadedState) {
        return buildList(context, state);
      }
      return SizedBox();
    });
  }

  Widget buildList(BuildContext context, ArticleLoadedState state) {
    final articles = state.articles.values.toList();
    return ListView.separated(
      itemCount: articles.length,
      padding: const EdgeInsets.only(bottom: 40.0),
      itemBuilder: (context, index) {
        return buildListTile(context, articles[index]);
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 70.0, right: 20),
          child: Divider(),
        );
      },
    );
  }

  Widget buildListTile(BuildContext context, ArticleModel article) {
    final id = article.article.id;
    final accentColor = Colors.deepOrangeAccent;
    final primaryColor = Theme.of(context).primaryColor;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: article.selected ? primaryColor : Colors.grey,
        child: Text(
          article.article.title.toUpperCase().substring(0, 1),
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text('${article.article.title}'),
      subtitle: Text('${article.article.amount} F'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (article.selected && article.quantity > 1)
            IconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                size: 18,
                color: Colors.red,
              ),
              onPressed: () {
                BlocProvider.of<ArticleBloc>(context).decrementArticle(id);
              },
            ),
          if (article.selected)
            Text('${article.quantity}', style: TextStyle(fontSize: 15.0)),
          if (article.selected)
            IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                size: 18,
                color: Colors.green,
              ),
              onPressed: () {
                BlocProvider.of<ArticleBloc>(context).incrementArticle(id);
              },
            ),
          if (article.selected)
            RawChip(
              label: Text(
                '${article.amount} F',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: accentColor,
            )
        ],
      ),
      onTap: () {
        if (article.selected) {
          BlocProvider.of<ArticleBloc>(context).removeArticle(id);
        } else {
          BlocProvider.of<ArticleBloc>(context).addArticle(id);
        }
      },
    );
  }
}
