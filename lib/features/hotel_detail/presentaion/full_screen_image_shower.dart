
import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImageShower extends StatefulWidget {
  final String myImageUrl;

  const FullScreenImageShower({super.key, required this.myImageUrl});

  @override
  State<FullScreenImageShower> createState() => _FullScreenImageShowerState();
}

class _FullScreenImageShowerState extends State<FullScreenImageShower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // این خط عملیات بازگشت را انجام می‌دهد
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: PhotoView(
            enableRotation: false,
            initialScale: PhotoViewComputedScale.contained * 1,
            backgroundDecoration: BoxDecoration(color: Colors.black),
            imageProvider: NetworkImage(networkUrl(widget.myImageUrl))),
      ),
    );
  }
}