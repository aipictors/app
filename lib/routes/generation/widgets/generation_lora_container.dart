import 'package:aipictors/default.i18n.dart';
import 'package:aipictors/graphql/generation/__generated__/image_lora_models.data.gql.dart';
import 'package:aipictors/widgets/list_tile/work_info_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenerationLoraContainer extends HookConsumerWidget {
  const GenerationLoraContainer({
    super.key,
    required this.lora,
    required this.value,
    required this.onValueChanged,
    required this.onValueInputted,
  });

  final GImageLoraModelsData_imageLoraModels lora;

  final double value;

  final Function(double value) onValueChanged;

  final Function(double value) onValueInputted;

  @override
  Widget build(context, ref) {
    final focusNode = useFocusNode();
    final controller = useTextEditingController(text: value.toString());
    final sliderValue = useState(0.0);

    double getSliderValue(double input) {
      if (-1 > value) {
        return -1;
      } else if (value > 1) {
        return 1;
      } else {
        return value;
      }
    }

    sliderValue.value = getSliderValue(value);

    useEffect(() {
      // 入力中にカーソルが最後尾へ移動しないように、入力欄にフォーカスがある時は何もしない
      if (focusNode.hasFocus) {
        return null;
      }
      controller.text = value.toString();
      sliderValue.value = getSliderValue(value);
      return null;
    }, [value]);

    return WorkInfoListTile(
        thumbnailImageURL: lora.thumbnailImageURL ?? '',
        title: '${lora.name} (${lora.description})',
        body: Row(children: [
          SizedBox(
            width: 40,
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: controller,
              focusNode: focusNode,
              onChanged: (value) {
                onValueInputted(double.parse(value));
              },
              validator: (value) {
                if (value == null || value == '') {
                  return 'Loraの強度は空にできません'.i18n;
                }
                return null;
              },
              onTapOutside: (event) {
                focusNode.unfocus();
              },
            ),
          ),
          Expanded(
            child: Slider(
              value: sliderValue.value,
              min: -1.0,
              max: 1.0,
              onChanged: (value) {
                onValueChanged(value);
              },
            ),
          ),
        ]),
        onTap: () {});
  }
}
