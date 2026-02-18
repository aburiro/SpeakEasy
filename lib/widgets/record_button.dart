import 'package:flutter/material.dart';
import 'package:record/record.dart';
import '../services/api_service.dart';

class RecordButton extends StatefulWidget {
  final Function(String) onComplete;

  const RecordButton({required this.onComplete});

  @override
  _RecordButtonState createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  final recorder = AudioRecorder();
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isRecording) {
          final path = await recorder.stop();
          setState(() => isRecording = false);

          if (path != null) {
            String result = await ApiService.transcribe(path);
            widget.onComplete(result);
          }
        } else {
          // ✅ FIX HERE: pass RecordConfig
          await recorder.start(
            const RecordConfig(
              encoder: AudioEncoder.aacLc, // good default
              bitRate: 128000,
              sampleRate: 44100,
            ),
            path: '${DateTime.now().millisecondsSinceEpoch}.m4a',
          );
          setState(() => isRecording = true);
        }
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: isRecording ? Colors.red : Colors.green,
        child: Icon(
          isRecording ? Icons.stop : Icons.mic,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
