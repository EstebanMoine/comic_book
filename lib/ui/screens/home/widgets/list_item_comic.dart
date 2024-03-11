import 'package:comic_book/models/remote/issues/comic_model.dart';
import 'package:comic_book/ui/screens/detail/detail_screen.dart';
import 'package:comic_book/ui/shared/custom_network_image.dart';
import 'package:comic_book/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';

class ListItemComic extends StatelessWidget {
  final Comic comic;

  const ListItemComic({
    super.key,
    required this.comic,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(issue: comic))),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  CustomNetworkImage(height: 300, width: 200, url: comic.comicImage.originalUrl),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: 300,
                    child: Column(
                      children: [
                        CustomText(
                          text: comic.getNameToShow(),
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: comic.getDateAdded(),
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
