// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  String value;

  Screen2({required this.value});

  final String title = 'Interview Test App';
  String input = 'Your Input was:';
  String congrats = 'Congratulations, you have completed this task !';
  String errorMsg = 'Something is wrong, there is no input';
  String msg = '';
  //bool foo = false;
  //foo = (value == '');

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
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Text(
              msg = (value == '') ? errorMsg : congrats,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
              width: 20.0,
            ),
             Icon((value == '') ? Icons.warning: Icons.done, size: 30.0,),
            const SizedBox(
              height: 20.0,
              width: 20.0,
            ),
            Text(
              msg = (value == '') ? '' : input,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 14.0,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

showIcon(String value){

  if (value == ''){
  return Icons.warning;
}
  else {
    return Icons.done;
  }
}
