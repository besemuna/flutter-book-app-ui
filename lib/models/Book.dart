class Book {
  String title;
  String cover;
  String category;

  Book({this.title, this.cover, this.category});
}

final List<Book> mainBooks = [
  Book(
    title: "Six of crows",
    category: "Classic",
    cover: "assets/images/asset-5.png",
  ),
  Book(
    title: "Time of Witches",
    category: "Analogy",
    cover: "assets/images/asset-1.png",
  ),
  Book(
    title: "Infinite futures",
    category: "Mystery",
    cover: "assets/images/asset-2.png",
  ),
  Book(
    title: "Sun of the moon",
    category: "Romance",
    cover: "assets/images/asset-3.png",
  ),
  Book(
    title: "Dancing with tiger",
    category: "comic",
    cover: "assets/images/asset-4.png",
  ),
];
