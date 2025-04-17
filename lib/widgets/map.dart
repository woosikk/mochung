import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui;

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final API_KEY = "AIzaSyDi487TiU4-Z1hHrrkO935zKke3G3KwF94";

  Widget getMap() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = 'https://www.google.com/maps/embed/v1/place?key=$API_KEY&q=레이저앤피직스(주)/부설연구소';
      iframe.style.border = 'none';
      return iframe;
    });

    return const HtmlElementView(viewType: 'iframe');
  }

  @override
  Widget build(BuildContext context) {
  return Center(
    child: Container(
      margin: EdgeInsetsDirectional.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 500,
            height: 300,
            child: getMap(),
          ),
          const SizedBox(height: 10),
          Container (
            height: 310.0,
            child: Image.asset(
              'assets/images/map.png',
              fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

