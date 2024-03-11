import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final double width;
  final double height;
  final String url;

  const CustomNetworkImage({
    super.key,
    required this.width,
    required this.url,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.contain,
      //Con el loading builder demora
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Message(
            width: width,
            height: height,
            text: 'Loading image...',
          );
        }
      },
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Message(
          width: width,
          height: height,
          text: 'No image found',
        );
      },
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    super.key,
    required this.width,
    required this.height,
    required this.text,
  });

  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
