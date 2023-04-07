import 'dart:convert';
import 'package:http/http.dart' as http;
import 'employees_list.dart';

class BooksApi {
  static Future<List<Book>> getBooks(String query) async {
    final baseUrl = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      final List books = json.decode(response.body);

      return books.map((json) => Book.fromJson(json)).where((book) {
        final titleLower = book.name?.toLowerCase();
        final authorLower = book.email?.toLowerCase();
        final searchLower = query.toLowerCase().trim();

        return titleLower!.contains(searchLower) ||
            authorLower!.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
