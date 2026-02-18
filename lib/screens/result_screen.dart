import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String text;

  const ResultScreen({required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transcription')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
