import 'package:flutter/material.dart';
import '../widgets/record_button.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? transcription;

  void updateTranscription(String text) {
    setState(() {
      transcription = text;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ResultScreen(text: text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SpeakEasy'), centerTitle: true),
      body: Center(child: RecordButton(onComplete: updateTranscription)),
    );
  }
}
