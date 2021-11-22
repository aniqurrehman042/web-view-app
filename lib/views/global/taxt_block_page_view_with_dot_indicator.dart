import 'package:appd/data/models/text_block.dart';
import 'package:appd/theme/app_colors.dart';
import 'package:appd/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TextBlockPageViewWithDotIndicator extends StatefulWidget {
  const TextBlockPageViewWithDotIndicator({
    Key? key,
    required this.textBlocks,
    this.height,
    this.width,
  }) : super(key: key);

  final List<TextBlock> textBlocks;
  final double? height;
  final double? width;

  @override
  State<TextBlockPageViewWithDotIndicator> createState() =>
      _TextBlockPageViewWithDotIndicatorState();
}

class _TextBlockPageViewWithDotIndicatorState
    extends State<TextBlockPageViewWithDotIndicator> {
  final PageController splashImagesController = PageController();

  var activeScrollIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: widget.textBlocks.length,
              controller: splashImagesController,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Text(
                      widget.textBlocks[index].title,
                      style: AppTextStyles.blackS5W4,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      widget.textBlocks[index].description,
                      style: AppTextStyles.blackS3W4,
                    ),
                  ],
                ),
              ),
              onPageChanged: (index) {
                setState(() {
                  activeScrollIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 8.0),

          // Row for scroll indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.textBlocks.length; i++)

                // Tap Detector for Indicator
                GestureDetector(
                  onTap: () {
                    splashImagesController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linear,
                    );
                  },
                  // Scroll Indicator
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: activeScrollIndex == i
                          ? AppColors.darkGreen
                          : AppColors.gray,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
