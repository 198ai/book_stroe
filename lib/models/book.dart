class Book {
  String id;
  String title;
  String author;
  String imageUrl;
  bool isBorrowed;

  Book(
      {required this.id,
      required this.title,
      required this.author,
      this.isBorrowed = false,
      required this.imageUrl});
}
