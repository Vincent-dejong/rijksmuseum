import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/presentation/collection-list/bloc/collections_list_bloc.dart';
import 'package:rijksmuseum/presentation/collection-list/collections_list_widget.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CollectionsListBloc>(
          create: (context) => CollectionsListBloc()
            ..add(
              CollectionsListRefreshEvent(pageNumber: 1),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rijksmuseum',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            toolbarHeight: 120,
          ),
          primarySwatch: Colors.blueGrey,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          width: 200,
          image: AssetImage('assets/logo.png'),
        ),
      ),
      body: const Center(
        child: CollectionsListWidget(),
      ),
    );
  }
}
