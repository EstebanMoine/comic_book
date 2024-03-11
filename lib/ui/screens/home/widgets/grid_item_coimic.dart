import 'package:comic_book/models/remote/issues/comic_model.dart';
import 'package:comic_book/ui/screens/detail/detail_screen.dart';
import 'package:comic_book/ui/shared/custom_network_image.dart';
import 'package:comic_book/ui/shared/custom_text.dart';
import 'package:flutter/material.dart';

class GridItemComic extends StatelessWidget {
  final Comic issue;

  const GridItemComic({
    super.key,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double width = screenWidth < 600 ? screenWidth / 2 : 300;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(issue: issue))),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              CustomNetworkImage(
                height: 100,
                width: 100,
                url: issue.comicImage.originalUrl,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: issue.getNameToShow(),
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    CustomText(
                      text: issue.getDateAdded(),
                      color: Colors.black87,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
