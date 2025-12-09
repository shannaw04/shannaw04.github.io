import 'package:flutter/material.dart';
import 'package:portfolio/themes/card_styles.dart';
import 'package:portfolio/themes/font_styles.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/header_info.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: Decorations.cardDecoration,

        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, c) {
              final isStacked = c.maxWidth < 720;

              // Headshot
              final headshot = ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    header.headshotUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              );

              // Header text (your details)
              final textColumn = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    header.name,
                    style: FontStyles.titleStyle(context),
                  ),

                  const SizedBox(height: 4),

                  // Specialties / key skills
                  Text(
                    header.specialties,
                    style: FontStyles.subtitleStyle(context),
                  ),

                  const SizedBox(height: 12),

                  // Contact info
                  Wrap(
                    spacing: 16,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _InfoInline(
                        icon: Icons.place_outlined,
                        text: header.location,
                      ),
                      _LinkInline(
                        icon: Icons.mail_outline,
                        label: header.email,
                        uri: 'mailto:${header.email}',
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Website links
                  Wrap(
                    spacing: 16,
                    children: header.links.entries
                        .map(
                          (e) => InkWell(
                            onTap: () => _launch(e.value),
                            child: Text(
                              e.key,
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.indigo,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              );

              final content = isStacked
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 140,
                          height: 140,
                          child: headshot,
                        ),
                        const SizedBox(height: 16),
                        textColumn,
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 160,
                          child: headshot,
                        ),
                        const SizedBox(width: 20),
                        Expanded(child: textColumn),
                      ],
                    );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main content (headshot + text)
                  content,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _InfoInline extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoInline({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.blueGrey[600]),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}

class _LinkInline extends StatelessWidget {
  final IconData icon;
  final String label;
  final String uri;
  const _LinkInline({
    required this.icon,
    required this.label,
    required this.uri,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launch(uri),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.blueGrey[600]),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launch(String url) async {
  final uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  }
}
