import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';

class RatingApp extends StatelessWidget {
  const RatingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Rate the App",
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      trailing: Icon(
        Icons.star_outline_rounded,
        color: Theme.of(context).colorScheme.onSurface,
        size: 22,
      ),
      onTap: () async {
        final InAppReview inAppReview = InAppReview.instance;

        if (await inAppReview.isAvailable()) {
          inAppReview.requestReview();
        } else {
          inAppReview.openStoreListing(
            appStoreId: 'YOUR_APP_STORE_ID',
          );
        }
      },
    );
  }
}
