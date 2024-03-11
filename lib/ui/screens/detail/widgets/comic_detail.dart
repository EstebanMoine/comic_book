import 'package:comic_book/models/remote/detail/volume_detail_model.dart';
import 'package:comic_book/ui/screens/detail/widgets/item_credit.dart';
import 'package:comic_book/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';

class CreditsView extends StatelessWidget {
  final String title;
  final String noItemsMessage;
  final List<Volume> items;

  const CreditsView({
    super.key,
    required this.title,
    required this.items,
    required this.noItemsMessage,
  });

  @override
  Widget build(BuildContext context) {
    String titleToShow = items.isNotEmpty ? title : noItemsMessage;

    List<Widget> widgets = [];
    for (Volume element in items) {
      widgets.add(
        ItemCredit(element: element),
      );
    }

    return Column(
      children: [
        CustomText(
          text: titleToShow,
          fontWeight: FontWeight.bold,
        ),
        Wrap(
          children: widgets,
        ),
        const Divider(),
      ],
    );
  }
}
