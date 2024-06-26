import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_provider.g.dart';

@riverpod
AudioPlayer audio(AudioRef ref) {
  final config = AudioContextConfig(
    stayAwake: true,
    respectSilence: true,
  );

  final context = config.build();

  AudioPlayer.global.setAudioContext(context);

  return AudioPlayer();
}
