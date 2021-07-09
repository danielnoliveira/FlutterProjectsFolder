import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'auto_hide_dash.dart';
import 'dash.dart';

class HiddenWidget extends StatelessWidget {
  const HiddenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        centerTitle: true,
        title: Text('Dashes Hide Upon Tap'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: Dash.all
              .map(
                (dash) => AutoHideDash(dash: dash),
              )
              .toList(),
        ),
      ),
    );
  }
}
