class ArticleModel {
  final Article article;
  int quantity;
  bool selected;

  ArticleModel(this.article, {this.selected = false, this.quantity = 0})
      : assert(article != null);

  int get amount => article.amount * quantity;

  increment() => quantity++;
  decrement() => quantity--;

  @override
  bool operator ==(other) {
    if (other is ArticleModel) return article == other.article;
    return false;
  }

  @override
  int get hashCode => article.hashCode;
}

class Article {
  final int id;
  final String title;
  final int amount;

  Article(this.id, this.title, this.amount) : assert(id != null);

  @override
  bool operator ==(other) {
    if (other is Article) return id == other.id;
    return false;
  }

  @override
  int get hashCode => id.hashCode;
}

final articleModels = articles.map((a) => ArticleModel(a)).toList();
final articles = [
  Article(1, 'Tomate', 200),
  Article(2, 'Oignon', 250),
  Article(3, 'Sel', 1000),
  Article(4, 'Riz', 300),
  Article(5, 'Banane', 500),
  Article(6, 'Ananas', 2500),
  Article(7, 'Pasteque', 2000),
];
