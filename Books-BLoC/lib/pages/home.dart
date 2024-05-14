import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import '../cubit/books_state.dart';
import '../cubit/books_data.dart';
import '../widgets/CardProfile.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BooksList>(context).fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 154, 218),
        title: const Text('Books Catalog'),
      ),
      body: ListView(
        children: [
          BlocBuilder<BooksList, List<BooksModel>>(
            builder: (context, state) {
              if (state.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: MasonryView(
                      listOfItem: state,
                      numberOfColumn: 2,
                      itemBuilder: (item) {
                        return CardProfile(item: item);
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
