import 'package:flutter/material.dart';

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  bool _enabled = false;
  String _msg1 = '';
  String _msg2 = '';
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    Object onPressed1() {
      if (_enabled) {
        print('onPressed1 returning address of anon func but NOT running it');
        return () {
          _count += 1;
          print('Button Pressed $_count');
          //Because there are no () this anonymous function
          //is NOT called but the address of it is returned to who ever
          //called onPressed1.
          //This means that the button will now appear and only
          //when the button is pressed will this anonymous function
          //run.
        };
      } else {
        print('onPressed1 returning NULL');
        return null;
      }
    }

    Object onPressed2() {
      if (_enabled) {
        print('onPressed1 returning address of anon func but NOT running it');
        return () {
          _count = 0;
          print('Button Pressed $_count');
        };
      } else {
        print('onPressed1 returning NULL');
        return null;
      }
    }

    print('The build is being RUN');

    return Scaffold(
      appBar: AppBar(
        title: Text('Button Functionality Demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('enable functionality'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      print('onChangedValue is $onChangedValue');
                      _enabled = onChangedValue;
                      //When the state of _enabled is changed
                      //we must update the Text of the buttons
                      //separately so the text will appear if
                      //_enabled is true, and disappear if
                      //_enabled is false.
                      setState(() {
                        if (_enabled) {
                          _msg1 = 'Click Me';
                          _msg2 = 'Reset';
                          print('_enabled is true');
                        } else {
                          _msg1 = '';
                          _msg2 = '';
                          print('_enabled is false');
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    //onPressed1 is run every time the build is run,
                    //because of the ().
                    //If _enabled is true onPressed1 will return
                    //the address of an anonymous function that
                    //will only run when the button is pressed.
                    //At this time the button will appear and be enabled.
                    //If _enabled is false onPressed1 will return
                    //null and the button will disappear and be disabled.
                    onPressed: onPressed1(),

                    //If we call onPressed2 instead of onPressed1 the
                    //anonymous function will run but the button
                    //will NOT appear, THIS DOES NOT WORK.
                    //onPressed: onPressed2(),

                    //The text of the button works separately from the button
                    //itself so we must update it when the switch is changed.
                    child: Text(_msg1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.white,
                    color: Colors.lightBlue,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    //onPressed1 is run every time the build is run,
                    //because of the ().
                    //If _enabled is true onPressed1 will return
                    //the address of an anonymous function that
                    //will only run when the button is pressed.
                    //At this time the button will appear and be enabled.
                    //If _enabled is false onPressed1 will return
                    //null and the button will disappear and be disabled.
                    onPressed: onPressed2(),

                    //If we call onPressed2 instead of onPressed1 the
                    //anonymous function will run but the button
                    //will NOT appear, THIS DOES NOT WORK.
                    //onPressed: onPressed2(),

                    //The text of the button works separately from the button
                    //itself so we must update it when the switch is changed.
                    child: Text(_msg2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
