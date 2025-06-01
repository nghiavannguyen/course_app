import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  static final _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  static int _notificationId = 0;

  static const String _androidChannelId = 'default_notification_channel_id';

  static Future<void> init() async {
    if (Platform.isAndroid) {
      await _localNotifications
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
    if (Platform.isIOS) {
      NotificationSettings settings = await _messaging.requestPermission(
        announcement: true,
        alert: true,
        badge: true,
        sound: true,
      );

      debugPrint('🔔 iOS Notification permission: ${settings.authorizationStatus}');
    }

    final token = await _messaging.getToken();
    debugPrint('✅ FCM Token: $token');

    await _initLocalNotification();
    listenForegroundMessages();
    listenOpenedAppMessages();
    listenTerminatedApp();
  }

  static void listenForegroundMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final title = notification?.title ?? 'Thông báo';
      final body = notification?.body ?? 'Nội dung thông báo';

      _showLocalNotification(title: title, body: body);
    });
  }

  static void listenOpenedAppMessages() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('📬 Notification clicked: ${message.data}');
    });
  }

  static void listenTerminatedApp() {
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        debugPrint('💡 App opened from terminated via notification');
        debugPrint('🔸 Data: ${message.data}');
      }
    });
  }

  static Future<void> _initLocalNotification() async {
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const iosSettings = DarwinInitializationSettings(requestProvisionalPermission: true);
    const initSettings = InitializationSettings(iOS: iosSettings, android: androidInit);
    await _localNotifications.initialize(initSettings);

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _androidChannelId,
      'Thông báo',
      description: 'Kênh thông báo',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static Future<void> _showLocalNotification({
    required String title,
    required String body,
  }) async {
    const NotificationDetails platformDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        _androidChannelId,
        'Thông báo quan trọng',
        channelDescription: 'Kênh thông báo ưu tiên cao',
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _localNotifications.show(_notificationId++, title, body, platformDetails);
  }
}
