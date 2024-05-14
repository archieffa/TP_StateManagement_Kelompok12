import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Books_Bloc/cubit/books_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BooksList extends Cubit<List<BooksModel>> {
  String url = "https://fakerestapi.azurewebsites.net/api/v1/Books";

  BooksList()
      : super([
          BooksModel(title: "", description: "", pageCount: 0, excerpt: "")
        ]);

  void setFromJson(List<dynamic> json) {
    // List<BooksModel> data = json['data'];
    List<BooksModel> booksList =
        json.map((e) => BooksModel.fromJson(e)).toList();
    emit(booksList);
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
