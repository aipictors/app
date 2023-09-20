import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_provider.g.dart';

@riverpod
AudioPlayer audio(AudioRef ref) {
  return AudioPlayer();
}
