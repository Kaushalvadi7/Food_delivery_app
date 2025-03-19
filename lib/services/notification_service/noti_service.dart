import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotiService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // INITIALIZED
  Future<void> initNotification() async {
    if (_isInitialized) return; //prevent re-initialization


    // notification icon
    const initSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    // init settings
    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
    );
    // finally initialize the  plugin
    await notificationsPlugin.initialize(initSettings);
    _isInitialized = true;

    await requestPermission();
  }
  // Request notification permission (Android 13+)

  Future<void> requestPermission() async {
    var status = await Permission.notification.status;

    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.notification.request();
    }
  }

  // NOTIFICATION DETAILS SETUP
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Order Notification',
        channelDescription: "Your Order has been Placed!",
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }

  // SHOW NOTIFICATION
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    // Check permission before showing notification
    if (await Permission.notification.isGranted) {
      await notificationsPlugin.show(
        id,
        title ?? 'ZaikIt Notification',
        body ?? 'Your order has been placed successfully!',
        notificationDetails(), // Use the correct method
      );
    } else {
      print('Notification permission not granted.');
      await requestPermission(); // Request permission if not granted
    }
    // await notificationsPlugin.show(
    //   id,
    //   title,
    //   body,
    //   notificationDetails(), // Use the correct method
    // );
  }

}