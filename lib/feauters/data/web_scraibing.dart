// ignore_for_file: body_might_complete_normally_nullable, unnecessary_null_comparison, unused_local_variable

import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'books_sites.dart';

class WebScraper {
  final String url = 'https://www.thriftbooks.com/browse/?b.search';
  final String url1 = 'https://www.powells.com/searchresults?keyword';
  final String url2 ='https://www.biblio.com/search.php?stage=1&result_type=works&keyisbn=';
  Future<Book?> extractData(String searchQuery) async {
    http.Response response = await http.get(Uri.parse('$url=$searchQuery'));
    print('$url1=$searchQuery');
    if (response.statusCode == 200) {
      final html = parser.parse(response.body);
      final container =
          html.querySelector(".SearchContentResults-tilesContainer")!.children;

//     for (var child in container) {
//   print(child.innerHtml);
// }
      if (container != null) {
        // Only process the first book
        try {
          final element = container.first;
          final divs = element
              .getElementsByClassName("AllEditionsItem-tile Recipe-default");

          // print(element.innerHtml);

          final div = element;
          // print(div.innerHtml);
          final image = div.querySelector("img")?.attributes["src"];
          print(image);
          String priceText = div
                  .querySelector(
                      ".SearchResultListItem-price .SearchResultListItem-dollarAmount")
                  ?.text ??
              '';

          String cleanedPriceText = priceText.replaceAll(RegExp(r'[^\d.]'), '');
          double price = double.parse(cleanedPriceText);

          String title =
              div.querySelector(".AllEditionsItem-tileTitle a")?.text ?? '';

          String author =
              div.querySelector(".SearchResultListItem-subheading a")?.text ??
                  '';
          // print(author);
          String siteName =
              'ThriftBooks'; // Assuming the site name is fixed for this scraper
          return Book(
              title: title,
              siteName: siteName,
              author: author,
              price: price,
              image: image ?? '');
        } catch (e) {
          print(e);
        }
      }
      return null;
    }
  }

  Future<Book?> extractData1(String searchQuery) async {
    http.Response response = await http.get(Uri.parse('$url1=$searchQuery'));
    print('$url1=$searchQuery');
    if (response.statusCode == 200) {
      final html = parser.parse(response.body);
      final container = html.querySelector(".booklist")!.children;

      // for (var child in container) {
      //   print(child.innerHtml);
      // }
      if (container != null) {
        // Only process the first book
        try {
          final element = container.first;
          // final divs = element
          //     .getElementsByClassName("ui-sortable");

          // print(element.innerHtml);

          final div = element;
          // print(div.innerHtml);
          final image = div.querySelector("img")?.attributes["src"];
          print(image);
          String priceText =
              div.querySelector(".book-price .reg-price")?.text ?? '';
          String cleanedPriceText = priceText.replaceAll(RegExp(r'[^\d.]'), '');
          double price = double.parse(cleanedPriceText);
          print("zzczczcz");
          print(priceText);
          String title =
              div.querySelector(".book-title-wrapper h3 a")?.text ?? '';

          String author = div.querySelector(".book-author")?.text ?? '';
          // print(author);
          String siteName =
              'Powells'; // Assuming the site name is fixed for this scraper
          return Book(
              title: title,
              siteName: siteName,
              author: author,
              price: price,
              image: image ?? '');
        } catch (e) {
          print(e);
        }
      }
      return null;
    }
  }

  Future<Book?> extractData2(String searchQuery) async {
    http.Response response = await http.get(Uri.parse('$url2$searchQuery'));
    print('$url2=$searchQuery');

    print(response.statusCode);
    if (response.statusCode == 200) {
      final html = parser.parse(response.body);
      // print(response.body);
      final container = html.querySelectorAll(".results .item");

      // final div1 = divs.getElementsByClassName(".results summary");

      // for (var child in container) {
      //   print(child.innerHtml);
      // }

      if (container != null) {
 
        // Only process the first book
        try {
          final div = container.first;
          print(div.innerHtml);
          final image = div.querySelector("img")?.attributes["src"];
          print(image);
          String priceText = div
                  .querySelector(".pricing .price-wrap .price .item-price")
                  ?.text ??
              '';
          priceText = priceText.replaceAll(
              new RegExp(r'[^0-9.]'), ''); // Remove non-digit characters
          double price = double.parse(priceText);
          print(price);
          String title =
              div.querySelector(".basic-info .item-title h2 a")?.text ?? '';
          print(title);
          String author =
              div.querySelector(".basic-info .item-title h3 ")?.text ?? '';
          print(author);
          String siteName =
              'Biblio'; // Assuming the site name is fixed for this scraper
          return Book(
              title: title,
              siteName: siteName,
              author: author,
              price: price,
              image: image ?? '');
        } catch (e) {
          print(e);
        }
      }
      return null;
    }
  }
}
