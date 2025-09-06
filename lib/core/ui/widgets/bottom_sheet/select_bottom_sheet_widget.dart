import 'package:auto_find/core/model/ui/item_model.dart';
import 'package:auto_find/core/extension/empty_extension.dart';
import 'package:auto_find/core/ui/styles/app_text_styles.dart';
import 'package:auto_find/core/ui/widgets/inputs/search_widget.dart';
import 'package:auto_find/core/ui/widgets/texts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectBottomSheet extends StatelessWidget {
  final String title;
  final List<ItemModel> items;
  final void Function(ItemModel item) onSelected;
  final double? height;
  final bool hasSearch;
  const SelectBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.onSelected,
    this.height,
    this.hasSearch = true,
  });

  static void show({
    required String title,
    required List<ItemModel> items,
    required void Function(ItemModel item) onSelected,
  }) {
    Get.bottomSheet(
      SelectBottomSheet(
        title: title,
        items: items,
        onSelected: onSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * .6,
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: TextWidget(
              text: title,
              textStyle: AppTextStyle.medium16,
            ),
          ),
          const SizedBox(height: 15),
          if(hasSearch)
          ...[
            const SearchWidget(height: 45),
            const SizedBox(height: 25),
          ],
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                ItemModel item = items[index];
                return ListTile(
                  title: TextWidget(text: item.title.orNA()),
                  onTap: () {
                    onSelected(item);
                    Get.back();
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
