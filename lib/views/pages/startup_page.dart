import 'package:appd/data/models/text_block.dart';
import 'package:appd/views/global/app_button.dart';
import 'package:appd/views/global/taxt_block_page_view_with_dot_indicator.dart';
import 'package:appd/views/pages/home_page.dart';
import 'package:appd/views/pages/services_page.dart';
import 'package:flutter/material.dart';

class StartupPage extends StatelessWidget {
  StartupPage({Key? key}) : super(key: key);

  final List<TextBlock> textBlocks = [
    TextBlock(
      title: 'Our Services',
      description:
          'We offer website to mobile app conversion services from development to publishing to the stores.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextBlockPageViewWithDotIndicator(textBlocks: textBlocks),
          const SizedBox(height: 20.0),
          AppButton(
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage())),
            text: 'Home',
          ),
          const SizedBox(height: 10.0),
          AppButton(
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ServicesPage())),
            text: 'Services',
          ),
        ],
      ),
    );
  }
}
