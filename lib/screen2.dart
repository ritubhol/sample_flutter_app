// ignore_for_file: unnecessary_null_comparison

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class Screen2 extends StatefulWidget {
  String value;

  Screen2({Key? key, required this.value}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  late ConfettiController _controllerTopCenter;
  final String title = 'Interview Test App';
  String input = 'Your Input was:';
  String congrats = 'Congratulations, you have completed this task !';
  String errorMsg = 'Something is wrong, there is no input';
  String msg = '';

  @override
  void initState() {
    super.initState();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 1));
    (widget.value.isEmpty)
        ? _controllerTopCenter.stop()
        : _controllerTopCenter.play();
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ConfettiWidget(
              confettiController: _controllerTopCenter,
              blastDirectionality: BlastDirectionality.explosive,
              // don't specify a direction, blast randomly
              shouldLoop: true,
              // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
              // manually specify the colors to be used
              createParticlePath: drawStar,
              child: Text(
                msg = (widget.value.isEmpty) ? errorMsg : congrats,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
              width: 20.0,
            ),
            Icon(
              (widget.value.isEmpty) ? Icons.warning : Icons.done,
              size: 30.0,
            ),
            const SizedBox(
              height: 20.0,
              width: 20.0,
            ),
            Text(
              msg = (widget.value.isEmpty) ? '' : input,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 14.0,
              ),
            ),
            Text(
              widget.value,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}
