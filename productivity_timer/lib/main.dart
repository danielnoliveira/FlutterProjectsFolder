import 'package:flutter/material.dart';
import 'package:productivity_timer/timermodel.dart';
import 'package:productivity_timer/widgets.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:percent_indicator/percent_indicator.dart';
import './timer.dart';
import './settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Work Timer',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: TimerHomePage());
  }
}

void emptyMethod() {}

final double defaultPadding = 5.0;

class TimerHomePage extends StatelessWidget {
  final CountDownTimer timer = CountDownTimer();
  final Padding dPadding = Padding(padding: EdgeInsets.all(defaultPadding));
  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> menuItems = <PopupMenuItem<String>>[];
    menuItems.add(PopupMenuItem(
      child: Text('Settings'),
      value: 'Settings',
    ));
    timer.startWork();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Work Timer'),
          actions: [
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return menuItems.toList();
              },
              onSelected: (s) {
                if (s == 'Settings') {
                  goToSettings(context);
                }
              },
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double availableWidth = constraints.maxWidth;
            return Column(
              children: [
                Row(
                  children: [
                    dPadding,
                    Expanded(
                        child: ProductivityButton(
                      color: Color(0xff009688),
                      text: 'Work',
                      onPressed: timer.startWork,
                      size: 150,
                    )),
                    dPadding,
                    Expanded(
                        child: ProductivityButton(
                      color: Color(0xff607D8B),
                      text: 'Short Break',
                      onPressed: () => timer.startBreak(true),
                      size: 150,
                    )),
                    dPadding,
                    Expanded(
                        child: ProductivityButton(
                      color: Color(0xff455A64),
                      text: 'Long Break',
                      onPressed: () => timer.startBreak(false),
                      size: 150,
                    )),
                    dPadding,
                  ],
                ),
                Expanded(
                    child: StreamBuilder(
                  initialData: TimerModel('00:00', 1.0),
                  stream: timer.stream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    TimerModel timer = snapshot.data;
                    return Container(
                      child: CircularPercentIndicator(
                        radius: availableWidth / 2,
                        lineWidth: 10.0,
                        percent: timer.percent,
                        center: Text(
                          timer.time,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        progressColor: Color(0xff009688),
                      ),
                    );
                  },
                )),
                Row(
                  children: [
                    dPadding,
                    Expanded(
                        child: ProductivityButton(
                      color: Color(0xff212121),
                      text: 'Stop',
                      onPressed: timer.stopTimer,
                      size: 150,
                    )),
                    dPadding,
                    Expanded(
                        child: ProductivityButton(
                      color: Color(0xff009688),
                      text: 'Restart',
                      onPressed: timer.startTimer,
                      size: 150,
                    )),
                    dPadding
                  ],
                )
              ],
            );
          },
        ));
  }

  void goToSettings(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsScreen()));
  }
}
