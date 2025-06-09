import 'package:bookara/core/utils/notification_utils.dart';
import 'package:firebase_database/firebase_database.dart';

void listenToRealtimeDatabase() {
  FirebaseDatabase.instance.ref().child('notifications').onChildAdded.listen((
    event,
  ) {
    final data = event.snapshot.value;

    if (data is Map && data['message'] != null) {
      NotificationUtils.showNotification(
        title: "Thông báo mới",
        body: data['message'],
      );
    }
  });
}
