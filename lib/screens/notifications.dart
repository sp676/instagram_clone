// import 'package:flutter/material.dart';

// class NotificationPage extends StatelessWidget {
//   const NotificationPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications'),
//       ),
//       body: ListView(
//         children: const [
//           NotificationItem(
//             username: 'user',
//             notificationText: 'liked your photo',
//             notificationTime: '2 hours ago',
//             profileImage: AssetImage('assets/user_profile.jpg'), key: ObjectKey(1),
//           ),
//           NotificationItem(
//             username: 'admin',
//             notificationText: 'commented on your post',
//             notificationTime: '5 hours ago',
//             profileImage: AssetImage('assets/admin_profile.jpg'), key: ObjectKey(2),
//           ),
//           // Add more NotificationItems as needed
//         ],
//       ),
//     );
//   }
// }

// class NotificationItem extends StatelessWidget {
//   final String username;
//   final String notificationText;
//   final String notificationTime;
//   final ImageProvider profileImage;

//   const NotificationItem({
//     required Key key,
//     required this.username,
//     required this.notificationText,
//     required this.notificationTime,
//     required this.profileImage,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundImage: profileImage,
//       ),
//       title: Text(
//         '$username $notificationText',
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       subtitle: Text(notificationTime),
//       onTap: () {
//         // Handle notification item tap
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    configureFirebaseMessaging();
  }

  void configureFirebaseMessaging() {
    _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: $message");
      // Parse the message and handle notifications
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp: $message");
      // Handle notification when app is in background or terminated
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        children: const [
          NotificationItem(
            username: 'john_doe',
            notificationText: 'liked your photo',
            notificationTime: '2 hours ago',
            profileImage: AssetImage('assets/john_doe_profile.jpg'),
          ),
          NotificationItem(
            username: 'jane_smith',
            notificationText: 'commented on your post',
            notificationTime: '5 hours ago',
            profileImage: AssetImage('assets/jane_smith_profile.jpg'),
          ),
          // Add more NotificationItems as needed
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String username;
  final String notificationText;
  final String notificationTime;
  final ImageProvider profileImage;

  const NotificationItem({
    Key? key,
    required this.username,
    required this.notificationText,
    required this.notificationTime,
    required this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: profileImage,
      ),
      title: Text(
        '$username $notificationText',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(notificationTime),
      onTap: () {
        // Handle notification item tap
      },
    );
  }
}
