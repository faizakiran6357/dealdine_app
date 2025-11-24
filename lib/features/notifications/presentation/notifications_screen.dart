import 'package:flutter/material.dart';


class NotificationsScreen extends StatelessWidget {
const NotificationsScreen({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Notifications')),
body: ListView.builder(
padding: const EdgeInsets.all(12),
itemCount: 10,
itemBuilder: (context, i) => ListTile(
leading: const Icon(Icons.notifications),
title: Text('Notification ${i+1}'),
subtitle: const Text('A short message'),
),
),
);
}
}

