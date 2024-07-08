import 'package:aipictors/widgets/flame/widgets/sample_game.dart';
import 'package:aipictors/widgets/flame/widgets/sample_joy_pad.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecretScreen extends HookConsumerWidget {
  const SecretScreen({super.key});

  @override
  Widget build(context, ref) {
    final game = SampleGame();

    return Scaffold(
      appBar: AppBar(title: const Text('ロゴの裏側')),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          GameWidget(game: game),
          Positioned(
            right: 64,
            bottom: 128,
            child: SampleJoyPad(
              onDirectionChanged: game.onJoyPadDirectionChanged,
            ),
          )
        ],
      ),
    );
  }
}
