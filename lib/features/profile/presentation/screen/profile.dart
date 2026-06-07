import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talam/features/auth/presentation/providers/auth_controller.dart';
import 'package:talam/features/auth/presentation/providers/current_user.dart';
import 'package:talam/features/common/provider/theme_notifier.dart';
import 'package:talam/features/fav/presentation/screen/fav.dart';
import 'package:talam/features/profile/presentation/widgets/daily_reminder_section.dart';
import 'package:talam/features/profile/presentation/widgets/delete_button.dart';
import 'package:talam/features/profile/presentation/widgets/privacy_policy.dart';
import 'package:talam/features/profile/presentation/widgets/rating_app.dart';
import 'package:talam/features/profile/presentation/widgets/terms_of_service.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final themeMode = ref.watch(themeProvider).asData?.value ?? ThemeMode.light;
    final isDark = themeMode == ThemeMode.dark;
    final avatarUrl = user?.avatarUrl;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 36,
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.1),
                          backgroundImage: avatarUrl != null
                              ? NetworkImage(avatarUrl)
                              : null,
                          child: avatarUrl == null
                              ? Icon(
                                  Icons.person,
                                  size: 36,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withValues(alpha: 0.5),
                                )
                              : null,
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

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.15),
                  ),
                ),

                const SizedBox(height: 80),

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
                    onChanged: (_) =>
                        ref.read(themeProvider.notifier).toggle(),
                  ),
                ),

                const DailyReminderSection(),
              ],
            ),

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrivacyPolicy(),
                TermsofService(),
                RatingApp(),
                DeleteButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
