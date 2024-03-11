import 'package:comic_book/models/remote/detail/volume_detail_model.dart';
import 'package:flutter/material.dart';

class ItemCredit extends StatelessWidget {
  const ItemCredit({
    super.key,
    required this.element,
  });

  final Volume element;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      height: 30,
      child: Text(
        '* ${element.name}',
      ),
    );
  }
}
