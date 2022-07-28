// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title // description
//     importance: Importance.high,
//     playSound: true);
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('A bg message just showed up :  ${message.messageId}');
// }
// Future<void> subscribeToTopic(String id) async {
//   await FirebaseMessaging.instance.subscribeToTopic("rairplay");
//   await FirebaseMessaging.instance.subscribeToTopic(id);
//
// }
//
// Future<void> unsubscribeFromTopic(String id) async {
//   await FirebaseMessaging.instance.unsubscribeFromTopic("rairplay");
//   await FirebaseMessaging.instance.unsubscribeFromTopic(id);
// }
//
//
// FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
// await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
// await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
// alert: true,
// badge: true,
// sound: true,
// );