import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:talam/features/auth/presentation/providers/auth_controller.dart';
import 'package:talam/features/auth/presentation/providers/current_user.dart';
import 'package:talam/features/common/provider/theme_notifier.dart';
import 'package:talam/features/fav/presentation/screen/fav.dart';
import 'package:talam/features/notification/notification_service.dart';
import 'package:talam/features/profile/presentation/widgets/delete_account_dialog.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final themeMode = ref.watch(themeProvider);
    final isDark = themeMode == ThemeMode.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          //   crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26, width: 2),
                            shape: BoxShape.circle,
                            color: Colors.white24,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(
                            user?.fullName ?? "User",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.read(authControllerProvider.notifier).signOut();
                      },
                      child: Icon(
                        Icons.logout_rounded,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),

                // Divider
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.15),
                  ),
                ),

                SizedBox(height: 80),

                ListTile(
                  title: Text(
                    "Favourites",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 18,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavScreen()),
                    );
                  },
                ),

                ListTile(
                  title: Text(
                    "Dark Mode",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  trailing: Switch(
                    value: isDark,
                    onChanged: (_) => ref.read(themeProvider.notifier).toggle(),
                  ),
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final settingsAsync = ref.watch(
                      notificationSettingsProvider,
                    );

                    return settingsAsync.when(
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                      data: (settings) {
                        final timeLabel =
                            '${settings.hour.toString().padLeft(2, '0')}:${settings.minute.toString().padLeft(2, '0')}';

                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Daily Reminder',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                              trailing: Switch(
                                value: settings.enabled,
                                onChanged: (value) async {
                                  final notifier = ref.read(
                                    notificationSettingsProvider.notifier,
                                  );
                                  if (value) {
                                    await notifier.enable(
                                      settings.hour,
                                      settings.minute,
                                    );
                                  } else {
                                    await notifier.disable();
                                  }
                                },
                              ),
                            ),
                            if (settings.enabled)
                              ListTile(
                                title: Text(
                                  'Time',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                                trailing: TextButton(
                                  onPressed: () async {
                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay(
                                        hour: settings.hour,
                                        minute: settings.minute,
                                      ),
                                    );
                                    if (time != null) {
                                      await ref
                                          .read(
                                            notificationSettingsProvider
                                                .notifier,
                                          )
                                          .updateTime(time.hour, time.minute);
                                    }
                                  },
                                  child: Text(
                                    timeLabel,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingApp(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => DeleteAccountDialog(),
                      );
                    },
                    child: Text(
                      "Delete Account",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
          // Fallback — open App Store directly
          inAppReview.openStoreListing(
            appStoreId: 'YOUR_APP_STORE_ID', // get this after publishing
          );
        }
      },
    );
  }
}
