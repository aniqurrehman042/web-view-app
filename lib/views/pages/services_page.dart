import 'package:appd/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: const [
                SizedBox(height: 20.0),
                Text(
                  'Our Services',
                  style: AppTextStyles.blackS5W4,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Need a Website? Not all websites are built the same. Let us build you a beautiful responsive website for your business or personal use. We provide Design, and even content creation so you won’t have to worry about a thing. We will benchmark your competitor’s websites and create a site that is not only aesthetically pleasing but also multiplatform functional. Your website will be optimized for Desktop, Tablet & Mobile. As a bonus, you will receive 50% off your purchase to convert your newly built website into your very own Mobile App.',
                  style: AppTextStyles.blackS3W4,
                ),
                SizedBox(height: 10.0),
                Text(
                  'How it Works',
                  style: AppTextStyles.blackS4W4,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Once you submit your app, our team will review your website to assure that it meets all of the guidelines needed to get you approved by the Apple App Store & Google Play Store. We will then work with developer support directly to fix and correct any issues in the approval process. (We may reach out to you for help getting some of these items corrected.) This process can take anywhere from 2 to 15 days depending on the complexity of issues & changes needed to get your app qualified for approved. Once your app is approved you will be notified by email. At this stage your app will be available for download on the Apple App Store & Google Play Store. Note: App’d relies on your website to retrieve and display content. Some native app functions may not be available depending on your website’s capabilities',
                  style: AppTextStyles.blackS3W4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
