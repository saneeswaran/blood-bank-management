import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/widgets/custom_icon_button.dart';
import 'package:blood_bank/core/widgets/custom_search_form_field.dart';
import 'package:blood_bank/features/search/view/search_page.dart';
import 'package:flutter/material.dart';

class SearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: maxExtent,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: topPadding + 16, left: 16, right: 16),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  navigateTo(context: context, route: const SearchPage());
                },
                child: const Hero(
                  tag: "search",
                  child: AbsorbPointer(child: CustomSearchFormField()),
                ),
              ),
            ),
            const SizedBox(width: 10),
            CustomIconButton(
              icon: const Icon(Icons.filter, color: Colors.white),
              onPressed: () {
                navigateTo(
                  context: context,
                  route: const SearchPage(isFilter: true),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent {
    final topPadding = WidgetsBinding.instance.window.viewPadding.top;
    return 90 + topPadding;
  }

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
