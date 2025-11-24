import 'package:flutter/material.dart';


class VideosScreen extends StatelessWidget {
const VideosScreen({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Videos')),
body: GridView.count(
crossAxisCount: 2,
padding: const EdgeInsets.all(12),
childAspectRatio: 0.8,
children: List.generate(8, (i) => Card(child: Column(children: [Expanded(child: Image.asset('assets/videos.png', fit: BoxFit.cover)), Padding(padding: const EdgeInsets.all(8.0), child: Text('Video ${i+1}'))]))),
),
);
}
}