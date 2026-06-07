import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsofService extends StatelessWidget {
  const TermsofService({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Terms of Service',
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      trailing: const Icon(Icons.open_in_new, size: 18),
      onTap: () {
        launchUrl(
          Uri.parse(
            'https://ismailabdirahman.github.io/talam-legal/terms.html',
          ),
          mode: LaunchMode.externalApplication,
        );
      },
    );
  }
}
