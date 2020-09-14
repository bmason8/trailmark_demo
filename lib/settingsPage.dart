import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Settings'),
        ),
        body: SafeArea(child: SettingsPageTest()));
  }
}

class SettingsPageTest extends StatefulWidget {
  @override
  _SettingsPageTestState createState() => _SettingsPageTestState();
}

class _SettingsPageTestState extends State<SettingsPageTest> {
  List<bool> _mapResolution = List.generate(4, (index) => false);
  bool _fetchMapTilesForOfflineUse = false;
  bool _notifications = false;
  bool _recordAndDisplayTripData = false;
  bool _sendUserLocationDataWhenConnected = false;

  void showExplainerAlert(String title, String text) {
    Alert(
            context: context,
            title: title,
            buttons: [
              DialogButton(
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
            desc: text)
        .show();
  }

  @override
  void initState() {
    super.initState();
    _mapResolution[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(hintText: 'Account'),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.info_outline,
                        ),
                        onPressed: () {
                          showExplainerAlert('Account',
                              'This is the account name you signed up with on trialmarkapp.com It is also the client name in your trailmarkapp.com URL');
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(hintText: 'Key'),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.info_outline,
                        ),
                        onPressed: () {
                          showExplainerAlert('Key',
                              'This is the 8-charater key that is assigned to you or your device. As an administrator...I didn\'t bother writing the rest');
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      DescriptionForToggleButtons(
                        buttonDescriptionText:
                            'Fetch map tiles for offline use',
                      ),
                      Expanded(
                        flex: 1,
                        child: Switch.adaptive(
                          activeColor: Colors.deepPurple,
                          onChanged: (bool value) {
                            setState(() {
                              _fetchMapTilesForOfflineUse = value;
                              print(_fetchMapTilesForOfflineUse);
                            });
                          },
                          value: _fetchMapTilesForOfflineUse,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ToggleButtons(
                            children: <Widget>[
                              ToggleButtonsContent(buttonText: 'Low'),
                              ToggleButtonsContent(buttonText: 'Medium'),
                              ToggleButtonsContent(buttonText: 'High'),
                              ToggleButtonsContent(buttonText: 'Highest'),
                            ],
                            onPressed: (int index) {
                              setState(() {
                                for (int buttonIndex = 0;
                                    buttonIndex < _mapResolution.length;
                                    buttonIndex++) {
                                  if (buttonIndex == index) {
                                    _mapResolution[buttonIndex] =
                                        !_mapResolution[buttonIndex];
                                  } else {
                                    _mapResolution[buttonIndex] = false;
                                  }
                                }
                              });
                            },
                            isSelected: _mapResolution,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DescriptionForToggleButtons(
                        buttonDescriptionText: 'Notifications',
                      ),
                      Expanded(
                        flex: 1,
                        child: Switch.adaptive(
                          activeColor: Colors.deepPurple,
                          onChanged: (bool value) {
                            setState(() {
                              _notifications = value;
                              print(_notifications);
                            });
                          },
                          value: _notifications,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DescriptionForToggleButtons(
                        buttonDescriptionText: 'Record and display trip data',
                      ),
                      Expanded(
                        flex: 1,
                        child: Switch.adaptive(
                          activeColor: Colors.deepPurple,
                          onChanged: (bool value) {
                            setState(() {
                              _recordAndDisplayTripData = value;
                              print(_recordAndDisplayTripData);
                            });
                          },
                          value: _recordAndDisplayTripData,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DescriptionForToggleButtons(
                        buttonDescriptionText:
                            'Send user location data when connected',
                      ),
                      Expanded(
                        flex: 1,
                        child: Switch.adaptive(
                          activeColor: Colors.deepPurple,
                          onChanged: (bool value) {
                            setState(() {
                              _sendUserLocationDataWhenConnected = value;
                              print(_sendUserLocationDataWhenConnected);
                            });
                          },
                          value: _sendUserLocationDataWhenConnected,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: Expanded(
                      child: RaisedButton.icon(
                        color: Colors.orange[400],
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.save),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 20.0),
                          child: Text(
                            'Save',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DescriptionForToggleButtons extends StatelessWidget {
  DescriptionForToggleButtons({@required this.buttonDescriptionText});

  String buttonDescriptionText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
        child: Text(
          buttonDescriptionText,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

class ToggleButtonsContent extends StatelessWidget {
  ToggleButtonsContent({@required this.buttonText});

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        buttonText,
        style: TextStyle(),
      ),
    );
  }
}
