import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:mochung/widgets/welcome.dart';
import 'package:mochung/widgets/invitation.dart';
import 'package:mochung/widgets/gallery.dart';
import 'package:mochung/widgets/map.dart';
import 'package:mochung/widgets/guide.dart';
import 'package:mochung/widgets/agenda.dart';
import 'package:mochung/widgets/bankAccount.dart';
import 'package:mochung/widgets/developedBy.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = ConfettiController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack (
    alignment: Alignment.topCenter,
    children: [
      Scaffold (
        body: SingleChildScrollView (
          child: Column (
            children: [
              Welcome(),
              Invitation(),
              const SizedBox(height: 10),
              Guide(),
              const SizedBox(height: 10),
              Map(),
              const SizedBox(height: 20),
              Agenda(),
              const SizedBox(height: 20),
              Gallery(),
              const SizedBox(height: 20),
              BankAccount(),
              DevelopedBy(),
            ],
          ),
        ),
      ),
      
      ConfettiWidget(
        confettiController: controller,
        shouldLoop: false,

        blastDirectionality: BlastDirectionality.explosive,
        emissionFrequency: 0.05,
        numberOfParticles: 1,
        gravity: 0.1,

        createParticlePath: (size) {
          final path = Path();
          path.addRect(Rect.fromPoints(Offset(-5, -5), Offset(10, 1)));
          //path.addOval(Rect.fromCircle(center: Offset.zero, radius: 5));
          return path;
        },
      )
      
    ],
  );
}