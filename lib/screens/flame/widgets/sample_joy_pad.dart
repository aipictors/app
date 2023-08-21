import 'dart:math';

import 'package:aipictors/screens/flame/models/direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SampleJoyPad extends HookConsumerWidget {
  const SampleJoyPad({
    Key? key,
    required this.onDirectionChanged,
  }) : super(key: key);

  final ValueChanged<Direction> onDirectionChanged;

  @override
  Widget build(context, ref) {
    final direction = useState(Direction.none);

    final delta = useState(Offset.zero);

    void updateDelta(Offset nextDelta) {
      final newDirection = getDirectionFromOffset(nextDelta);
      if (newDirection != direction.value) {
        direction.value = newDirection;
        onDirectionChanged(direction.value);
      }
      delta.value = nextDelta;
    }

    void calculateDelta(Offset offset) {
      final newDelta = offset - const Offset(60, 60);
      final draftDelta = Offset.fromDirection(
        newDelta.direction,
        min(30, newDelta.distance),
      );
      updateDelta(draftDelta);
    }

    return SizedBox(
      height: 128,
      width: 128,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(64),
        ),
        child: GestureDetector(
          onPanDown: (d) {
            calculateDelta(d.localPosition);
          },
          onPanUpdate: (d) {
            calculateDelta(d.localPosition);
          },
          onPanEnd: (d) {
            updateDelta(Offset.zero);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(64),
            ),
            child: Center(
              child: Transform.translate(
                offset: delta.value,
                child: SizedBox(
                  height: 64,
                  width: 64,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Direction getDirectionFromOffset(Offset offset) {
    if (offset.dx > 20) {
      return Direction.right;
    } else if (offset.dx < -20) {
      return Direction.left;
    } else if (offset.dy > 20) {
      return Direction.down;
    } else if (offset.dy < -20) {
      return Direction.up;
    }
    return Direction.none;
  }
}
