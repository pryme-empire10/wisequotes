import 'package:flutter_tts/flutter_tts.dart';

import '../consts/app_strings.dart';

class SpeakText {
  FlutterTts flutterTts = FlutterTts();
  Future<void> speakText(String content, String author) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.45);

    String contentAuthor = "$content - ${AppStrings.kVoice} $author";
    await flutterTts.speak(contentAuthor);
  }
}
