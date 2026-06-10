import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talam/features/notification/notification_service.dart';

class DailyReminderSection extends ConsumerWidget {
  const DailyReminderSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(notificationSettingsProvider);

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
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              trailing: Switch(
                value: settings.enabled,
                onChanged: (value) async {
                  final notifier =
                      ref.read(notificationSettingsProvider.notifier);
                  if (value) {
                    await notifier.enable(settings.hour, settings.minute);
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
                    color: Theme.of(context).colorScheme.onSurface,
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
                          .read(notificationSettingsProvider.notifier)
                          .updateTime(time.hour, time.minute);
                    }
                  },
                  child: Text(
                    timeLabel,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
