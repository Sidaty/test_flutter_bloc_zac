import 'package:flutter/material.dart';
import 'package:testflutterbloczac/@app.dart';

class ArticleCatalogueList extends StatelessWidget {
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
      padding: const EdgeInsets.only(bottom: 80.0),
      itemBuilder: (context, index) {
        return ArticleListTile(article: articles[index]);
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 70.0, right: 20),
          child: Divider(),
        );
      },
    );
  }

}

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
    final articles = state.selectedArticles;
    return ListView.separated(
      itemCount: articles.length,
      padding: const EdgeInsets.only(bottom: 80.0),
      itemBuilder: (context, index) {
        return ArticleListTile(article: articles[index]);
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 70.0, right: 20),
          child: Divider(),
        );
      },
    );
  }

}
