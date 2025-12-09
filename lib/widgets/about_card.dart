import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_styles.dart';
import 'package:portfolio/themes/card_styles.dart';
import 'package:portfolio/themes/font_styles.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutCard extends StatelessWidget {
  final String bio;

  const AboutCard({super.key, required this.bio});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: Decorations.cardDecoration,

        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section title
              Text(
                'About Me',
                style: FontStyles.titleStyle(context),
              ),

              // Underline
              AppStyles.titleUnderline(),

              // Bio text
              Text(
                bio,
                style:FontStyles.bodyStyle(context),
              ),

              ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse(
                    'https://shannaw04.github.io/portfolio/projects/color_sort/index.html',
                  ));
                },
                child: Text("Play Color Sort!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
