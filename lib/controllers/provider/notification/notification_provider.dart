import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foundr_project/model/api/notification/notification_model.dart';
import 'package:foundr_project/services/notification/notification_services.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationElement>? notificationData;
  Future<void> getAllNotificationProvider(BuildContext context) async {
    log('notification', name: 'getAllNotificationProvider');
    await NotificationServices().getAllNotificationServices().then((value) {
      notificationData = value;
    });
  }
}
