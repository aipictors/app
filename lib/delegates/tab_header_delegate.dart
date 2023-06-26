import 'package:flutter/material.dart';

class TabHeaderDelegate extends SliverPersistentHeaderDelegate {
  const TabHeaderDelegate({required this.tabBar});

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(TabHeaderDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
