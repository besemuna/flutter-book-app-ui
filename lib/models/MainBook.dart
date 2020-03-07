class MainBook {
  String title;
  String category;
  String about;
  String cover;
  int stars;

  MainBook({this.title, this.category, this.about, this.cover, this.stars});
}

final List<MainBook> mainBooks = [
  MainBook(
      title: "The little mermaid",
      category: "Fairy Tales",
      about:
          '“The Little Mermaid” is a fairy tale written by the Danish author Hans Christian Andersen.',
      stars: 5,
      cover: "assets/images/one.png"),
  MainBook(
      title: "Willows Of Fate",
      category: "Drama",
      about:
          "Is there room in the hands of fate for free will?All her life, Desdemona has seen things others haven’t.",
      stars: 4,
      cover: "assets/images/two.png"),
];
