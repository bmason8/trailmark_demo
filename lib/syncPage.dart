import 'package:flutter/material.dart';

class SyncPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Sync'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.deepPurple,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Go back to the main page',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
