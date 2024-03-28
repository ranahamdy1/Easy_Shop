import 'package:easy_shop/features/test/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Build Item', style: TextStyle(color: Colors.white)),
      ),
      body: const HomePageBody(),
    );
  }
}

