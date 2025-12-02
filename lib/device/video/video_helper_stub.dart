import 'dart:typed_data';
import 'package:video_player/video_player.dart';

class VideoHelper {
  static Future<VideoPlayerController> fromBytes(Uint8List bytes) {
    throw UnsupportedError("fromBytes is only supported on Web");
  }
}
