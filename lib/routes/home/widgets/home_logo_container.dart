import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeLogoContainer extends HookConsumerWidget {
  const HomeLogoContainer({
    super.key,
  });

  @override
  Widget build(context, ref) {
    // final state = useState(0);

    // return IconButton(
    //   icon: ImageIcon(
    //     const AssetImage('assets/images/aipictors.png'),
    //     color: Theme.of(context).colorScheme.primary,
    //     size: 32,
    //   ),
    //   onPressed: () {
    //     state.value += 1;
    //     if (state.value != 7) return;
    //     state.value = 0;
    //     context.push('/secret');
    //   },
    // );

    return ImageIcon(
      const AssetImage('assets/images/aipictors.png'),
      color: Theme.of(context).colorScheme.primary,
      size: 32,
    );
  }
}
