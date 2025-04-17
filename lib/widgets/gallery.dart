import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:ui';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:mochung/widgets/imagePage.dart';

class Gallery extends StatefulWidget {
  final List<ImageProvider> imagePaths = [
    //AssetImage('assets/images/white_0.JPG'),
    AssetImage('assets/images/1.jpeg'),
    AssetImage('assets/images/2.jpeg'),
    AssetImage('assets/images/3.jpeg'),
    AssetImage('assets/images/4.jpeg'),
    AssetImage('assets/images/5.jpeg'),
    AssetImage('assets/images/6.jpeg'),
    AssetImage('assets/images/7.jpeg'),
    AssetImage('assets/images/8.jpeg'),
    AssetImage('assets/images/9.jpeg'),
    AssetImage('assets/images/10.jpeg'),
    AssetImage('assets/images/11.jpeg'),
    AssetImage('assets/images/12.jpeg'),
    AssetImage('assets/images/13.jpeg'),
    AssetImage('assets/images/14.jpeg'),
    AssetImage('assets/images/15.jpeg'),
    AssetImage('assets/images/16.jpeg'),
    AssetImage('assets/images/17.jpeg'),
    AssetImage('assets/images/18.jpeg'),
    AssetImage('assets/images/19.jpeg'),
    AssetImage('assets/images/20.jpeg'),
    AssetImage('assets/images/21.jpeg'),
  ];
  
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      margin: const EdgeInsetsDirectional.all(20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 한 행에 표시할 썸네일 수
        ),
        itemCount: widget.imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => ImagePage(
                    initialIndex: index,
                    imageProviders: widget.imagePaths,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(4.0),
              child: Image(
                image: widget.imagePaths[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
