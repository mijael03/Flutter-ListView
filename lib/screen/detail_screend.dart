import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String note;
  const DetailScreen({required this.note});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                note,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(note),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Home'),
        onPressed: () {
          Navigator.of(context).pop(false);
        },
      ),
    );
  }
}
