import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testflutterbloczac/articles_domaine.dart';

abstract class ArticleEvent {}

class LoadArticleEvent extends ArticleEvent {}

class AddArticleEvent extends ArticleEvent {
  final int id;

  AddArticleEvent(this.id);
}

class RemoveArticleEvent extends ArticleEvent {
  final int id;

  RemoveArticleEvent(this.id);
}

class IncrementArticleEvent extends ArticleEvent {
  final int id;

  IncrementArticleEvent(this.id);
}

class DecrementArticleEvent extends ArticleEvent {
  final int id;

  DecrementArticleEvent(this.id);
}

abstract class ArticleState {
  final Map<int, ArticleModel> articles;

  List<ArticleModel> get selectedArticles => articles.values.where((a) => a.selected).toList();

  ArticleState({this.articles = const {}});
}

class ArticleInitialState extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleLoadedState extends ArticleState {
  ArticleLoadedState({Map<int, ArticleModel> articles})
      : super(articles: articles);

  int get total => this
      .articles
      .values
      .where((a) => a.selected)
      .map((a) => a.quantity)
      .fold(0, (x, y) => x + y);

  int get totalAmount =>
      this.articles.values.map((a) => a.amount).fold(0, (x, y) => x + y);
}

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  @override
  ArticleState get initialState => ArticleInitialState();

  loadArticles() => add(LoadArticleEvent());
  addArticle(int id) => add(AddArticleEvent(id));
  removeArticle(int id) => add(RemoveArticleEvent(id));
  incrementArticle(int id) => add(IncrementArticleEvent(id));
  decrementArticle(int id) => add(DecrementArticleEvent(id));

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is LoadArticleEvent) {
      yield ArticleLoadingState();
      await Future.delayed(Duration(seconds: 3));
      final articleModels = articles
          .asMap()
          .map((id, article) => MapEntry(article.id, ArticleModel(article)));
      yield ArticleLoadedState(articles: articleModels);
    } else if (event is AddArticleEvent) {
      yield _addArticle(event);
    } else if (event is RemoveArticleEvent) {
      yield _removeArticle(event);
    } else if (event is IncrementArticleEvent) {
      yield _incrementArticle(event);
    } else if (event is DecrementArticleEvent) {
      yield _decrementArticle(event);
    }
  }

  ArticleLoadedState _addArticle(AddArticleEvent event) {
    final article = state.articles[event.id];
    if (article.selected) return state;

    final articles = {
      ...state.articles,
      article.article.id: article.copyWith(selected: true, quantity: 1),
    };

    return ArticleLoadedState(articles: articles);
  }

  ArticleLoadedState _removeArticle(RemoveArticleEvent event) {
    final article = state.articles[event.id];
    if (!article.selected) return state;

    final articles = {
      ...state.articles,
      article.article.id: article.copyWith(selected: false, quantity: 0),
    };

    return ArticleLoadedState(articles: articles);
  }

  ArticleLoadedState _incrementArticle(IncrementArticleEvent event) {
    final article = state.articles[event.id];
    if (!article.selected) return state;

    final articles = {
      ...state.articles,
      article.article.id: article.copyWith(quantity: article.quantity + 1)
    };

    return ArticleLoadedState(articles: articles);
  }

  ArticleLoadedState _decrementArticle(DecrementArticleEvent event) {
    final article = state.articles[event.id];
    if (!article.selected) return state;

    final articles = {
      ...state.articles,
      article.article.id: article.copyWith(quantity: article.quantity - 1)
    };

    return ArticleLoadedState(articles: articles);
  }
}
