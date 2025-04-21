import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget _buildTitle() {
  final dday = DateTime(2025, 6, 7);
  final today = DateTime.now();
  final difference = dday.difference(today).inDays;

  var ddayText = difference > 0 ? 'D-$difference' : '';

  return Column (
    children: [
      /*
      const Text (
        '2025년 06월 07일',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      
      const Text (
        'Wedding Day',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      */
      Container (
        height: 100.0,
        child: Image.asset(
          'assets/images/header.png',
          fit: BoxFit.fitWidth,
        ),
      ),
      /*
      const SizedBox(height: 8),
      const Text (
        'SATURDAY, 1PM',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, letterSpacing: 2.0),
      ),
      */
      //const SizedBox(height: 10),
      AutoSizeText(
        ddayText,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        textAlign: TextAlign.center,
      ),
      Container (
        height: 340.0,
        child: Image.asset(
          'assets/images/wedding_cover.jpeg',
          fit: BoxFit.fitWidth,
        ),
      ),
    ]
  );
}

Widget _buildDday() {
  final dday = DateTime(2025, 6, 7);
  final today = DateTime.now();
  final difference = dday.difference(today).inDays;

  var ddayText = difference > 0 ? 'D-$difference' : '';

  return Column (
    children: [
      const Text(
        '2025년 6월 7일 토요일 낮 1시',
        style: TextStyle(fontSize: 22),
      ),
      const SizedBox(height: 10),
      AutoSizeText(
        ddayText,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget _buildEventInfo() {
  return Column (
    children: [
      /*
      Text (
        '강우식 & 한혜원',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 20),
      Text (
        '2025년 6월 7일 토요일 낮 1시',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 2),
      ),
      Text (
        '레이저앤피직스 레이저홀',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, height: 2),
      ),
      */
      Container (
        height: 240.0,
        child: Image.asset(
          'assets/images/intro.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    ]
  );
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      child: Column (
        children: [
          const SizedBox(height: 20),
          _buildTitle(),
          const SizedBox(height: 30),
          /*
          Container (
            height: 600.0,
            child: Image.asset(
              'assets/images/0.jpeg',
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 30),
          */
          _buildEventInfo(),
        ],
      )
    );
  }
}