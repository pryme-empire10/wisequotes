import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts/app_strings.dart';
import '../consts/colors.dart';
import '../provider/quote_provider.dart';
import '../utils/sizebox.dart';
import '../utils/speak_text.dart';

class QuoteButtons extends StatelessWidget {
  const QuoteButtons({
    super.key,
    required this.speakText,
    required this.getQuoteHeight,
    required this.getQuoteWidth,
    required this.voiceHeight,
    this.voiceWidth,
    required this.style,
    this.iconSize,
    required TextEditingController contentController,
    required TextEditingController authorController,
  })  : _contentController = contentController,
        _authorController = authorController;

  final SpeakText speakText;
  final TextEditingController _contentController;
  final TextEditingController _authorController;
  final double getQuoteHeight;
  final double getQuoteWidth;
  final double voiceHeight;
  final double? voiceWidth;
  final TextStyle style;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, quote, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: voiceHeight,
              width: voiceWidth,
              child: FloatingActionButton(
                isExtended: true,
                backgroundColor: AppColors.kPrimaryColor,
                onPressed: () {
                  speakText.speakText(
                    _contentController.text = quote.content,
                    _authorController.text = quote.author,
                  );
                },
                child: Icon(
                  Icons.keyboard_voice,
                  color: AppColors.kWhiteColor,
                  size: iconSize,
                ),
              ),
            ),
            buildSizedBox(0, 15),
            SizedBox(
              height: getQuoteHeight,
              width: getQuoteWidth,
              child: FloatingActionButton.extended(
                backgroundColor: AppColors.kPrimaryColor,
                isExtended: true,
                label: Text(
                  AppStrings.kGetQuote,
                  style: style,
                ),
                onPressed: () {
                  quote.randomQuote();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
