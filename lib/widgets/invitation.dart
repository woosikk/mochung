import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';

final Color indiBlueColor = Color.fromRGBO(102, 142, 170, 1.0);
final Color indiPinkColor = Color.fromRGBO(206, 131, 131, 1.0);

Widget _buildName(String father, mother, relation, name) {
  return Center (
    child: Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$father · $mother', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(' 의 $relation ', style: TextStyle(fontSize: 13)),
        Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    )
  );
}

void _launchPhoneCall(String phoneNumber) async {
  final uri = Uri.parse('tel:$phoneNumber');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw '전화를 걸 수 없습니다: $uri';
  }
}

void _sendSms(String phoneNumber) async {
  final uri = Uri.parse('sms:$phoneNumber');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw '문자를 보낼 수 없습니다: $uri';
  }
}

Widget _buildContactInfo(String who, name, number, Color color) {
  return Row (
    children: [
      Expanded(
        flex: 2,
        child: Align(
          alignment: Alignment.center,
          child: Text('$who', style: TextStyle(color: color)),
        ),
      ),
      Expanded(
        flex: 2,
        child: Align(
          alignment: Alignment.center,
          child: Text('$name', style: TextStyle(color: Colors.grey[700])),
        ),
      ),
      Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () { _launchPhoneCall(number); },
            child: Icon(Icons.phone, color: color, size: 24.0),
          )
        ),
      ),
      Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () { _sendSms(number); },
            child: Icon(Icons.email, color: color, size: 24.0),
          )
        ),
      ),
    ],
  );
}

Widget _buildPopUpContent() {
  return Container(
    width: 500.0,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildContactInfo('신랑', '강우식', '010-2773-1274', indiBlueColor),
        const SizedBox(height: 1),
        _buildContactInfo('신랑 아버지', '강세순', '010-4530-1839', indiBlueColor),
        const SizedBox(height: 1),
        _buildContactInfo('신랑 어머니', '한서윤', '010-5530-1839', indiBlueColor),

        const SizedBox(height: 10),
        Divider(thickness: 1, height: 1,),
        const SizedBox(height: 10),

        _buildContactInfo('신부', '한혜원', '010-8920-9366', indiPinkColor),
        const SizedBox(height: 1),
        _buildContactInfo('신부 아버지', '한기관', '010-8703-9366', indiPinkColor),
        const SizedBox(height: 1),
        _buildContactInfo('신부 어머니', '김은희', '010-4878-2913', indiPinkColor),
      ],
    ),
  );
}


Widget _buildContactButton(BuildContext context) {
  return OutlinedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              /*child: Text('연락하기', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))*/),
            content: _buildPopUpContent(),
          );
        },
      );
    },
    child: Text(
      '                 📞 연락하기                  ',
      style: TextStyle(color: Color.fromRGBO(41, 82, 56, 100), fontWeight: FontWeight.w600)
    ),
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.all(16.0),
      backgroundColor: const Color(0xFFFFFFFF),
      side: BorderSide(width: 0.5, color: Color.fromRGBO(41, 82, 56, 100))
    ),
  );
}

class Invitation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      width: 500.0,
      margin: const EdgeInsetsDirectional.all(20.0),
      child: Column (
        children: [
          Container (
            height: 350.0,
            child: Image.asset(
              'assets/images/invitation.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 40),
          _buildContactButton(context),
        ],
      )
    );
  }
}