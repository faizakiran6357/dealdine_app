// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:video_player/video_player.dart';

class VideoHelper {
  static Future<VideoPlayerController> fromBytes(Uint8List bytes) async {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    final controller = VideoPlayerController.networkUrl(Uri.parse(url));
    await controller.initialize();

    return controller;
  }
}