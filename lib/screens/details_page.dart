import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String body;
  const DetailsPage({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Details Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(body),
      ),
    );
  }
}
