import 'package:flutter/material.dart';
import 'package:book_manager_app/models/book.dart';

class BookListScreen extends StatelessWidget {
  final List<Book> books = List.generate(
    100, // Number of books
    (index) => Book(
      id: '${index + 1}', // Ensure ID starts at 1
      title: 'Book ${index + 1}',
      author: 'Author ${index + 1}',
      imageUrl:
          '', // Assuming you want to initialize with an empty string for now
    ),
  );

  BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.6,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return Column(
              mainAxisSize: MainAxisSize.min, // Use min size for column
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Align items to the start of the column
              children: [
                Container(
                  height: 150,
                  width: 110,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 8,
                      right: 8), // Adjust padding as needed
                  decoration: BoxDecoration(
                    color: Colors
                        .white, // Replace with the desired background color for the book
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.1), // Adjust color opacity as needed
                        spreadRadius: 1, // Spread radius
                        blurRadius: 6, // Blur radius
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(
                        4), // Adjust border radius as needed
                  ),
                  child: Image.network(
                    book.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      // Instead of an image, an Icon is shown if the image fails to load
                      return const Icon(Icons.question_mark,
                          size: 50, color: Colors.grey);
                    },
                  ),
                ),
                Text(
                  book.title,
                  style: const TextStyle(
                      fontSize: 16), // Adjust font size as needed
                ),
                // Assuming you have dimensions in your Book model
                Text(
                  book.author,
                  style: const TextStyle(fontSize: 16),
                ),
                // If you don't have these properties, you'll need to add them to your Book class
              ],
            );
          }),
    );
  }
}
