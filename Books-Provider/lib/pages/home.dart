import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:provider/provider.dart';
import '../model/books.dart';
import '../provider/books_provider.dart';
import '../widgets/CardProfile.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await Provider.of<BooksDataProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksDataProvider>(context);
    final _isLoading = booksProvider.booksData.isEmpty;
    final _products = booksProvider.booksData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 154, 218),
        title: const Text('Books Catalog'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: MasonryView(
                  listOfItem: _products,
                  numberOfColumn: 2,
                  itemBuilder: (item) {
                    return CardProfile(item: item);
                  },
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addProduct() {
    // Implement add product functionality
  }
}