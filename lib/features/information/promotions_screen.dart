import 'package:aipictors/features/home/widgets/loading_screen.dart';
import 'package:aipictors/features/information/__generated__/promotions.req.gql.dart';
import 'package:aipictors/features/information/widgets/promotion_list_tile.dart';
import 'package:aipictors/providers/client_provider.dart';
import 'package:aipictors/providers/config_provider.dart';
import 'package:aipictors/widgets/builder/operation_builder.dart';
import 'package:aipictors/widgets/error/data_empty_error_container.dart';
import 'package:aipictors/widgets/error/data_not_found_error_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// プロモーションの一覧
class PromotionsScreen extends HookConsumerWidget {
  const PromotionsScreen({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final config = ref.watch(configProvider);

    final client = ref.watch(clientProvider);

    if (client.value == null) {
      return const LoadingScreen();
    }

    final request = GPromotionsReq((builder) {
      builder
        ..vars.limit = config.graphqlQueryLimit
        ..vars.offset = 0;
    });

    return RefreshIndicator(
      onRefresh: () async {
        final req = request.rebuild((builder) {
          builder
            ..vars.limit = config.graphqlQueryLimit
            ..vars.offset = 0;
        });
        client.value?.requestController.add(req);
        await Future.delayed(const Duration(seconds: 2));
      },
      child: OperationBuilder(
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
          return ListView.separated(
            padding: const EdgeInsets.only(top: 8),
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: promotionList.length,
            itemBuilder: (context, index) {
              final promotion = promotionList[index];
              return PromotionListTile(promotion: promotion);
            },
          );
        },
      ),
    );
  }
}
