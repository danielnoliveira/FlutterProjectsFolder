import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ParalaxAppbar extends StatelessWidget {
  const ParalaxAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.orange[300],
          forceElevated: true,
          pinned: true,
          snap: false,
          floating: false,
          expandedHeight: 172,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              'Flutter',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  decoration: TextDecoration.underline),
            ),
            collapseMode: CollapseMode.parallax,
            background: Image.network(
              'https://bit.ly/3x7J5Qt',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverAppBar(
          expandedHeight: 500,
          backgroundColor: Colors.black,
        ),
        SliverAppBar(
          expandedHeight: 500,
          backgroundColor: Colors.red,
        ),
        SliverAppBar(
          expandedHeight: 500,
          backgroundColor: Colors.green,
        ),
        SliverAppBar(
          expandedHeight: 500,
          backgroundColor: Colors.blue,
        ),
        SliverAppBar(
          expandedHeight: 500,
          backgroundColor: Colors.yellow,
        ),
      ],
    ));
  }
}
