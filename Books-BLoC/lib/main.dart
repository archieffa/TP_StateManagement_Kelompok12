import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:Books_Bloc/cubit/books_data.dart';
import 'package:Books_Bloc/pages/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<BooksList>(
            create: (_) => BooksList(),
          ),
        ],
        child: Home(), // Menghapus const di sini
      ),
    );
  }
}
