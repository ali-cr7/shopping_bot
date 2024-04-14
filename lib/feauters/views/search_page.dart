
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shopping_bot/feauters/data/books_sites.dart';
import 'package:shopping_bot/feauters/data/web_scraibing.dart';
import 'package:shopping_bot/feauters/views/home_page.dart';
import 'package:shopping_bot/feauters/views/widgedts/button.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String searchQuery = ' ';

  Future<List<Book>> fetchBooks(String searchQuery) async {
    try {
      List<Book> updatedBooks = [];

      Book? newBook = await WebScraper().extractData(searchQuery);
      if (newBook != null) {
        updatedBooks.add(newBook);
      }

      Book? newBook1 = await WebScraper().extractData1(searchQuery);
      if (newBook1 != null) {
        updatedBooks.add(newBook1);
      }

      Book? newBook2 = await WebScraper().extractData2(searchQuery);
      if (newBook2 != null) {
        updatedBooks.add(newBook2);
      }

      return updatedBooks;
    } catch (e) {
      print('An error occurred: $e');
      // Handle error state or return an empty list based on the requirement
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          //           Container(
          Container(
            alignment: Alignment.center,
            // ignore: prefer_const_constructors
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            //  padding: EdgeInsets.symmetric(vertical: 20),
            // ignore: prefer_const_constructors
            child: Text(
              'Enter The Book Name',

              // ignore: prefer_const_constructors
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search for a book...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                searchQuery = value;
              },
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button(
                  text: 'search',
                  onTap: () async {
                    print(searchQuery);
                    EasyLoading.show(status: 'loading...');
                    List<Book> books = await fetchBooks(searchQuery);

                    Get.to(() => HomePage(books: books));
                    EasyLoading.dismiss();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
