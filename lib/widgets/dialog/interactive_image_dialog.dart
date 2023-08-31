import 'package:aipictors/providers/interactive_image_dialog_matrix4_provider.dart';
import 'package:aipictors/screens/error/unexpected_error_screen.dart';
import 'package:aipictors/widgets/container/loading_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InteractiveImageDialog extends HookConsumerWidget {
  const InteractiveImageDialog(this.imageURL, {Key? key}) : super(key: key);
  final String imageURL;

  @override
  Widget build(context, ref) {
    //バツボタンの表示・非表示切り替え時などに、位置がリセットされないようにProviderを使用
    final position = ref.watch(interactiveImageDialogMatrix4Provider);
    final notifier = ref.read(interactiveImageDialogMatrix4Provider.notifier);
    final closeButton = useState(true);
    final isDismissible = useState(true);

    TransformationController controller = TransformationController(position);
    AnimationController animationController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    Matrix4? zoomingMatrix;
    Matrix4 startingMatrix = Matrix4.identity();

    // アニメーションの更新
    void updateMatrix(Animation<double> animation) {
      if (zoomingMatrix != null) {
        notifier.update(Matrix4Tween(
          begin: startingMatrix,
          end: zoomingMatrix,
        ).transform(animation.value));
      }
    }

    animationController.addListener(() {
      updateMatrix(animationController);
    });

    controller.addListener(() {
      notifier.update(controller.value);
      if (controller.value[0] > 1.0) {
        isDismissible.value = false;
      } else {
        isDismissible.value = true;
      }
    });

    return SafeArea(
        child: GestureDetector(
      //画面をワンタップでバツボタンを表示・非表示
      onTap: () {
        closeButton.value = !closeButton.value;
      },
      //ダブルタップで拡大縮小
      onDoubleTapDown: (details) {
        final Offset tapPos = details.localPosition;
        final double scale =
            controller.value.getMaxScaleOnAxis() > 1.0 ? 1.0 : 2.0;

        final Matrix4 matrix = Matrix4.identity()
          ..translate(tapPos.dx, tapPos.dy)
          ..scale(scale, scale)
          ..translate(-tapPos.dx, -tapPos.dy);
        startingMatrix = controller.value;
        zoomingMatrix = matrix;

        animationController.reset();
        startingMatrix = controller.value;
        animationController.forward();
      },
      child: Dismissible(
          //ズーム中はスワイプされても閉じない
          direction: isDismissible.value
              ? DismissDirection.vertical
              : DismissDirection.none,
          key: const Key(''),
          onDismissed: (_) {
            Navigator.of(context).pop();
          },
          child: Stack(
            children: [
              InteractiveViewer(
                minScale: 0.8,
                maxScale: 5,
                transformationController: controller,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: CachedNetworkImage(
                      imageUrl: imageURL,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      progressIndicatorBuilder: (_, __, ___) {
                        return const LoadingContainer();
                      },
                      errorWidget: (context, uri, error) {
                        return const UnexpectedErrorScreen();
                      },
                    ),
                  ),
                ),
              ),
              if (closeButton.value)
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
            ],
          )),
    ));
  }
}
