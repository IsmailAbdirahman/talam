import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  static const String channelKey = 'daily_ayah_channel';
  static const String channelName = 'Daily Ayah Reminder';

  static const _enabledKey = 'notifications_enabled';
  static const _hourKey = 'notifications_hour';
  static const _minuteKey = 'notifications_minute';

  Future<void> init() async {
    await AwesomeNotifications().initialize(
      null, // null = use app icon
      [
        NotificationChannel(
          channelKey: channelKey,
          channelName: channelName,
          channelDescription: 'Daily reminder to read your Quran verses',
          defaultColor: const Color(0xFF11133F),
          importance: NotificationImportance.High,
          channelShowBadge: true,
        ),
      ],
      debug: false,
    );
  }

  Future<bool> requestPermission() async {
    final isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      return await AwesomeNotifications()
          .requestPermissionToSendNotifications();
    }
    return true;
  }

  Future<void> scheduleDaily({required int hour, required int minute}) async {
    // Cancel previous schedule
    await AwesomeNotifications().cancelAll();

    // Schedule new daily notification
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: channelKey,
        title: 'Your daily ayah is ready 🌅',
        body: 'Open Talam to read today\'s verses',
        notificationLayout: NotificationLayout.Default,
      ),
      schedule: NotificationCalendar(
        hour: hour,
        minute: minute,
        second: 0,
        millisecond: 0,
        repeats: true,
        preciseAlarm: true,
      ),
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_enabledKey, true);
    await prefs.setInt(_hourKey, hour);
    await prefs.setInt(_minuteKey, minute);
  }

  Future<void> cancelAll() async {
    await AwesomeNotifications().cancelAll();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_enabledKey, false);
  }

  Future<({bool enabled, int hour, int minute})> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return (
      enabled: prefs.getBool(_enabledKey) ?? false,
      hour: prefs.getInt(_hourKey) ?? 8,
      minute: prefs.getInt(_minuteKey) ?? 0,
    );
  }
}

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

class NotificationSettings {
  final bool enabled;
  final int hour;
  final int minute;
  const NotificationSettings({
    required this.enabled,
    required this.hour,
    required this.minute,
  });
}

class NotificationSettingsNotifier extends AsyncNotifier<NotificationSettings> {
  @override
  Future<NotificationSettings> build() async {
    final service = ref.read(notificationServiceProvider);
    final settings = await service.loadSettings();
    return NotificationSettings(
      enabled: settings.enabled,
      hour: settings.hour,
      minute: settings.minute,
    );
  }

  Future<void> enable(int hour, int minute) async {
    final service = ref.read(notificationServiceProvider);
    final granted = await service.requestPermission();
    if (!granted) return;

    await service.scheduleDaily(hour: hour, minute: minute);
    state = AsyncData(
      NotificationSettings(enabled: true, hour: hour, minute: minute),
    );
  }

  Future<void> disable() async {
    final service = ref.read(notificationServiceProvider);
    await service.cancelAll();
    final current = state.value;
    state = AsyncData(
      NotificationSettings(
        enabled: false,
        hour: current?.hour ?? 8,
        minute: current?.minute ?? 0,
      ),
    );
  }

  Future<void> updateTime(int hour, int minute) async {
    final service = ref.read(notificationServiceProvider);
    await service.scheduleDaily(hour: hour, minute: minute);
    state = AsyncData(
      NotificationSettings(enabled: true, hour: hour, minute: minute),
    );
  }
}

final notificationSettingsProvider =
    AsyncNotifierProvider<NotificationSettingsNotifier, NotificationSettings>(
      NotificationSettingsNotifier.new,
    );
