import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talam/features/auth/presentation/providers/auth_controller.dart';
import 'package:talam/features/auth/presentation/providers/current_user.dart';
import 'package:talam/features/common/provider/theme_notifier.dart';
import 'package:talam/features/fav/presentation/screen/fav.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,

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
                          child: Text(user?.fullName ?? "User"),
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
                SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.bookmarks_rounded,
                          color: const Color.fromARGB(221, 35, 34, 34),
                        ),
                        Text("Saved"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FavScreen()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color.fromARGB(221, 35, 34, 34),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: const Text('Dark Mode'),
                  trailing: Switch(
                    value: isDark,
                    onChanged: (_) => ref.read(themeProvider.notifier).toggle(),
                  ),
                ),
              ],
            ),
            OutlinedButton(
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
          ],
        ),
      ),
    );
  }
}
