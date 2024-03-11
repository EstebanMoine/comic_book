import 'package:comic_book/models/remote/detail/issue_detail_model.dart';
import 'package:comic_book/ui/screens/detail/widgets/comic_detail.dart';
import 'package:comic_book/ui/shared/custom_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class DetailView extends StatelessWidget {
  final ComicDetail issueDetail;
  const DetailView({
    super.key,
    required this.issueDetail,
  });

  @override
  Widget build(BuildContext context) {
    bool inVerticalMode = MediaQuery.of(context).size.width <= 1000;

    double imageWidth = inVerticalMode ? 300 : 500;

    CustomNetworkImage customImage = CustomNetworkImage(
      url: issueDetail.image.originalUrl,
      width: imageWidth,
      height: inVerticalMode ? 500 : double.infinity,
    );

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: imageWidth),
                child: Column(
                  children: [
                    if (inVerticalMode)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: customImage,
                      ),
                    const SizedBox(
                      height: 50,
                    ),
                    CreditsView(
                      title: 'Characters',
                      items: issueDetail.characterCredits,
                      noItemsMessage: 'No characters found',
                    ),
                    CreditsView(
                      title: 'Teams',
                      items: issueDetail.teamCredits,
                      noItemsMessage: 'No teams found',
                    ),
                    CreditsView(
                      title: 'Locations',
                      items: issueDetail.locationCredits,
                      noItemsMessage: 'No locations found',
                    ),
                    CreditsView(
                      title: 'Concepts',
                      items: issueDetail.conceptCredits,
                      noItemsMessage: 'No concepts found',
                    ),
                    HtmlWidget(
                      issueDetail.description,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (!inVerticalMode) customImage
        ],
      ),
    );
  }
}
