// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:graph_ql_sample/router/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Center(
          child: Text(
            'GraphQL',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.blue,
        activeBackgroundColor: Colors.red,
        childrenButtonSize: const Size.square(70),
        // animatedIcon: AnimatedIcons.add_event,
        activeChild: const Icon(Icons.close),
        curve: Curves.fastOutSlowIn,
        gradientBoxShape: BoxShape.circle,
        child: Icon(Icons.add),
        // animationAngle:{pi / 10} ,
        direction: SpeedDialDirection.up,
        useRotationAnimation: false,
        children: [
          SpeedDialChild(
            backgroundColor: Colors.blue,
            onTap: () {
              context.router.push(ScreenProductHome());
            },
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
            backgroundColor: Colors.blue,
            onTap: () {
              context.router.push(ScreenContinent());
            },
            child: const Icon(
              Icons.flag_circle_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
