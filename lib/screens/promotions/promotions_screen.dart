import 'package:aipictors/graphql/__generated__/promotions.req.gql.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/screens/loading_screen.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/container/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/container/error/data_not_found_error_container.dart';
import 'package:aipictors/widgets/list_tile/promotion_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// プロモーションの一覧
class PromotionsScreen extends HookConsumerWidget {
  const PromotionsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GPromotionsReq((builder) {
      return builder
        ..vars.limit = 64
        ..vars.offset = 0;
    });

    return Scaffold(
      appBar: AppBar(title: const Text('イベント')),
      body: OperationBuilder(
        client: client.value!,
        operationRequest: request,
        builder: (context, response) {
          final promotionList = response.data?.promotions;
          if (promotionList == null) {
            return const DataNotFoundErrorContainer();
          }
          if (promotionList.isEmpty) {
            return const DataEmptyErrorContainer();
          }
          return ListView.builder(
            itemCount: promotionList.length,
            itemBuilder: (context, index) {
              final promotion = promotionList[index];
              return PromotionListTile(
                title: promotion.title,
                description: promotion.description,
                pageURL: promotion.pageURL,
                imageURL: promotion.imageURL,
                startDateTime: promotion.startDateTime,
                endDateTime: promotion.endDateTime,
              );
            },
          );
        },
      ),
    );
  }
}
