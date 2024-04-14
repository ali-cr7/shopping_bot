import 'package:flutter/material.dart';

import 'package:shopping_bot/feauters/data/books_sites.dart';


class HomePage extends StatelessWidget {
   final List<Book> books;
  HomePage({Key? key, required List<Book> this.books}) : super(key: key);

  
  Book getCheapestBook() {
    Book cheapest = books[0];
    for (int i = 1; i < books.length; i++) {
      if (books[i].price < cheapest.price) {
        cheapest = books[i];
      }
    }
    return cheapest;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookstore',
        style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),),
        actions: [

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(books[index].image),
                    title: Text(books[index].siteName),
                    subtitle: Text(
                        'title: ${books[index].title}\n${books[index].author}\nPrice: \$${books[index].price}'),
                  ),
                );
              },
            ),
          ),  
          Card(
            // Card for cheapest book
            child: ListTile(
              leading: Image.network(getCheapestBook().image),
              title: Text('The Cheapest Book',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),),
              subtitle: Text(
                  '${getCheapestBook().title} from ${getCheapestBook().siteName}\nauthor: ${getCheapestBook().author}\nPrice: \$${getCheapestBook().price}'),
            ),
          ),
        ],
      ),
    );
  }
}










            