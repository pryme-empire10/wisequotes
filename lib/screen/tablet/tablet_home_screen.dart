import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wisequotes/provider/quote_provider.dart';

import '../../consts/app_strings.dart';
import '../../consts/app_styles.dart';
import '../../utils/speak_text.dart';
import '../../widget/quote_buttons.dart';
import '../../widget/quote_container.dart';

class TabletHomeScreen extends StatefulWidget {
  const TabletHomeScreen({super.key});

  @override
  State<TabletHomeScreen> createState() => _TabletHomeScreenState();
}

class _TabletHomeScreenState extends State<TabletHomeScreen> {
  final TextEditingController _contentController = TextEditingController();

  final TextEditingController _authorController = TextEditingController();

  SpeakText speakText = SpeakText();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<QuoteProvider>(context, listen: false).randomQuote();
    });
  }

  @override
  void dispose() {
    _contentController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  void xShare(String content, String author) {
    final contentAuthor = '$content - $author';
    Share.share(
      contentAuthor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final quoteContainerHeight = MediaQuery.of(context).size.height / 1.5;
    final quoteContainerwidth = MediaQuery.of(context).size.width;
    final bgContainerHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: bgContainerHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppStrings.kBackgroundImage),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  AppStrings.kHeader,
                  style: AppStyles.kHeader,
                ),
              ),
              QuoteContainer(
                padding: const EdgeInsets.only(left: 30, right: 30),
                quoteContainerHeight: quoteContainerHeight,
                width: quoteContainerwidth,
                contentStyle: AppStyles.kContent.copyWith(fontSize: 50),
                authorStyle: AppStyles.kAuthor.copyWith(fontSize: 30),
                circleAvaterRadius: 45,
                circleAvaterIconSize: 50,
                onPressed: () {
                  xShare(
                    _contentController.text =
                        Provider.of<QuoteProvider>(context, listen: false)
                            .content,
                    _authorController.text =
                        Provider.of<QuoteProvider>(context, listen: false)
                            .author,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: QuoteButtons(
        getQuoteHeight: 100,
        getQuoteWidth: 200,
        voiceHeight: 100,
        voiceWidth: 100,
        iconSize: 50,
        style: AppStyles.kGetQuote.copyWith(fontSize: 35),
        speakText: speakText,
        contentController: _contentController,
        authorController: _authorController,
      ),
    );
  }
}
