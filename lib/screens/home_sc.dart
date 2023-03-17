import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_login/widgets/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
          middle: Text(
        'Productos',
        style: TextStyle(color: Colors.white),
      )),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext ctx, i) => const ProductCard(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hi');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
