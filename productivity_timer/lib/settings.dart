import 'package:flutter/material.dart';
import 'package:productivity_timer/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextStyle textStyle = TextStyle(fontSize: 24);
  late TextEditingController txtWork;
  late TextEditingController txtShort;
  late TextEditingController txtLong;
  static const String WORKTIME = "workTime";
  static const String SHORTBREAK = "shortBreak";
  static const String LONGBREAK = "longBreak";
  int? workTime;
  int? shortBreak;
  int? longBreak;
  late SharedPreferences prefs;

  @override
  void initState() {
    txtWork = TextEditingController();
    txtShort = TextEditingController();
    txtLong = TextEditingController();
    readSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: <Widget>[
          Text(
            'Work',
            style: textStyle,
          ),
          Text(""),
          Text(""),
          SettingButton(
              Color(0xff455A64), "-", 150, -1, updateSetting, WORKTIME),
          TextField(
            controller: txtWork,
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(
              Color(0xff009688), "+", 150, 1, updateSetting, WORKTIME),
          Text(
            'Short',
            style: textStyle,
          ),
          Text(""),
          Text(""),
          SettingButton(
              Color(0xff455A64), "-", 150, -1, updateSetting, SHORTBREAK),
          TextField(
            controller: txtShort,
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(
              Color(0xff009688), "+", 150, 1, updateSetting, SHORTBREAK),
          Text(
            'Long',
            style: textStyle,
          ),
          Text(""),
          Text(""),
          SettingButton(
              Color(0xff455A64), "-", 150, -1, updateSetting, LONGBREAK),
          TextField(
            controller: txtLong,
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(
              Color(0xff009688), "+", 150, 1, updateSetting, LONGBREAK),
        ],
        padding: const EdgeInsets.all(20.0),
      ),
    );
  }

  readSettings() async {
    prefs = await SharedPreferences.getInstance();
    workTime = prefs.getInt(WORKTIME);
    if (workTime == null) {
      await prefs.setInt(WORKTIME, 1);
    }
    shortBreak = prefs.getInt(SHORTBREAK);
    if (shortBreak == null) {
      await prefs.setInt(SHORTBREAK, 1);
    }
    longBreak = prefs.getInt(LONGBREAK);
    if (longBreak == null) {
      await prefs.setInt(LONGBREAK, 1);
    }

    setState(() {
      txtWork.text = workTime.toString();
      txtShort.text = shortBreak.toString();
      txtLong.text = longBreak.toString();
    });
  }

  void updateSetting(String key, int value) {
    switch (key) {
      case WORKTIME:
        {
          int workTime = prefs.getInt(WORKTIME) as int;
          workTime += value;
          if (workTime >= 1 && workTime <= 180) {
            prefs.setInt(WORKTIME, workTime);
            setState(() {
              txtWork.text = workTime.toString();
            });
          }
        }
        break;
      case SHORTBREAK:
        {
          int shortBreak = prefs.getInt(SHORTBREAK) as int;
          shortBreak += value;
          if (shortBreak >= 1 && shortBreak <= 120) {
            prefs.setInt(SHORTBREAK, shortBreak);
            setState(() {
              txtShort.text = shortBreak.toString();
            });
          }
        }
        break;
      case LONGBREAK:
        {
          int long = prefs.getInt(LONGBREAK) as int;
          long += value;
          if (long >= 1 && long <= 180) {
            prefs.setInt(LONGBREAK, long);
            setState(() {
              txtLong.text = long.toString();
            });
          }
        }
        break;
      default:
    }
  }
}
