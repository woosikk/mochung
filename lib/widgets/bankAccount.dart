import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

final Color indiBlueColor = Color.fromRGBO(102, 142, 170, 1.0);
final Color indiPinkColor = Color.fromRGBO(206, 131, 131, 1.0);

class BankAccount extends StatelessWidget {
  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('계좌번호가 복사되었습니다.'),
      ),
    );
  }

  Widget _buildExpansionItem(BuildContext context, String bank, String accountNumber, String owner) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // 여기를 추가하여 가운데 정렬
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bank + ' ' + accountNumber + ' (' + owner + ')    ',
                style: TextStyle(fontWeight: FontWeight.w200,)
              ),
              ElevatedButton(
                onPressed: () {
                  _copyToClipboard(accountNumber, context);
                },
                child: const Text('복사하기', style: TextStyle(
      color: Colors.white,
   )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green
                )
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      child: Column(
        children: [
          ExpansionTile(
            title: Center(
              child: Text(
                '       신랑측 마음 전하실 곳',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: indiBlueColor),
              ),
            ),
            initiallyExpanded: false,
            backgroundColor: Colors.white,
            shape: Border.all(color: Colors.transparent),
            children: <Widget>[
              _buildExpansionItem(context, '신한', '110-011-227470', '강세순'),
              const SizedBox(height: 10),
              _buildExpansionItem(context, '우리', '1002-343-669814', '강우식'),
            ]
          ),
        ],
      ),
    );
  }
}
