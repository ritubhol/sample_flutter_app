import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen2.dart';

class Screen1 extends StatefulWidget {
  Screen1({Key? key}) : super(key: key);

  final String title = 'Interview Test App';

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _textController = TextEditingController();
  String userInput = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                setState(() {
                  userInput = _textController.text;
                });
              },
              controller: _textController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  hintText: 'Type in your Text...',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _textController.clear();
                        userInput = '';
                      });
                    },
                    icon: const Icon(Icons.clear),
                  )),
            ),
            const SizedBox(
              height: 20.0,
              width: 20.0,
            ),
            Text(
              'output of the text entered :',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 20.0,
              width: 20.0,
            ),
            Text(
              userInput,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
              width: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    userInput = _textController.text;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Screen2(value: userInput)));
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    backgroundColor: Colors.lightBlue,
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
