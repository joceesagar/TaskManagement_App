import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Task"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: const Column(
        children: [
          //date selecter
        ],
      ),
    );
  }
}
