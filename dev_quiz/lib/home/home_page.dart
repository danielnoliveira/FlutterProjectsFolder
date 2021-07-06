import 'package:dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(
                  label: 'Facil',
                ),
                LevelButtonWidget(
                  label: 'Medio',
                ),
                LevelButtonWidget(
                  label: 'Dificil',
                ),
                LevelButtonWidget(
                  label: 'Perito',
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
                child: GridView.count(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              children: [QuizCardWidget(), QuizCardWidget(), QuizCardWidget()],
            )),
          ],
        ),
      ),
    );
  }
}
