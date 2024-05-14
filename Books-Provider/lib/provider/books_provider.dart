import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:Books_Provider/model/books.dart';
import 'package:http/http.dart' as http;

class BooksDataProvider with ChangeNotifier {
  String url = "https://fakerestapi.azurewebsites.net/api/v1/Books";
  List<Books> _booksProvider = [];

  List<Books> get booksData => _booksProvider;

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> booksData = jsonDecode(response.body);
        _booksProvider = booksData.map((book) => Books.fromJson(book)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
