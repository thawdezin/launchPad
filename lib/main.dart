import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'launchpad_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AudioPage(),
    );
  }
}

class AudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LaunchPad'),
      ),
      body: _buildGrid(context),
    );
  }

  Widget _buildGrid(BuildContext context) {
    List<Widget> rows = [];
    for (int i = 0; i < 7; i++) {
      List<Widget> buttons = [];
      for (int j = 0; j < 4; j++) {
        int index = i * 4 + j + 1;
        if (index > 28) break;
        buttons.add(Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: AudioButton(index),
          ),
        ));
      }
      rows.add(Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buttons,
        ),
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rows,
    );
  }
}

