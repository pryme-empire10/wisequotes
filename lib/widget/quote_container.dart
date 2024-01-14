import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts/colors.dart';
import '../provider/quote_provider.dart';
import '../utils/sizebox.dart';

class QuoteContainer extends StatelessWidget {
  const QuoteContainer({
    super.key,
    required this.quoteContainerHeight,
    required this.width,
    required this.onPressed,
    required this.padding,
    required this.contentStyle,
    required this.authorStyle,
    this.circleAvaterRadius,
    this.circleAvaterIconSize,
  });

  final double quoteContainerHeight;
  final double width;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final TextStyle contentStyle;
  final TextStyle authorStyle;
  final double? circleAvaterRadius;
  final double? circleAvaterIconSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, quote, child) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 10,
                top: MediaQuery.of(context).orientation == Orientation.portrait
                    ? 30
                    : 0,
                right: 10,
              ),
              padding: padding,
              decoration: BoxDecoration(
                color: AppColors.kblackColor.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              height: quoteContainerHeight,
              width: width,
              child: quote.isLoading
                  ? Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          quote.content,
                          style: contentStyle,
                          textAlign: TextAlign.center,
                        ),
                        buildSizedBox(80, 0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            ' -   ${quote.author}',
                            style: authorStyle,
                          ),
                        ),
                      ],
                    ),
            ),
            Positioned(
              left: 20,
              bottom: 15,
              child: CircleAvatar(
                backgroundColor: AppColors.kPrimaryColor,
                radius: circleAvaterRadius,
                child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.share,
                    color: AppColors.kWhiteColor,
                    size: circleAvaterIconSize,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
