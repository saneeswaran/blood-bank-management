import 'package:blood_bank/core/constants/navigation.dart';
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
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          navigateTo(context: context, route: const SearchPage());
        },
        child: const Hero(
          tag: "search",
          child: AbsorbPointer(child: CustomSearchFormField()),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 90;

  @override
  double get minExtent => 90;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
