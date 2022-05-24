import 'package:flutter/material.dart';
import 'package:liquid_menu/core/viewmodels/home_model.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
 
import '../ui/shared/globals.dart';

class Liquid extends StatelessWidget {
  final AnimationController controller;
  final bool isFlipped;
  const Liquid({Key? key, required this.controller, required this.isFlipped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Center(
        child: AnimatedContainer(
      duration: Duration(milliseconds: 2000),
      curve: Curves.elasticOut,
      transform: Matrix4.identity()
        ..translate(
            0.0, isFlipped ? -model.openValue - 100 : model.openValue + 100),
      decoration:const BoxDecoration(
        // color: Global.bgColor,
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform(
            transform: Matrix4.identity()
              ..scale(1.0, isFlipped ? -1.0 : 1.0)
              ..translate(0.0, isFlipped ? -200 * 2 + 50 : -200 + 50),
            child: Lottie.asset('data/liquid.json',
                animate: false,
                controller: controller,
                height: 200,
                delegates: LottieDelegates(values: [
                  ValueDelegate.color(const ['**', 'Rectangle 1', 'Fill 1'],
                      value: Colors.pinkAccent),
                  ValueDelegate.color(const ['**', 'Shape 1', 'Fill 1'],
                      value: Colors.pinkAccent),
                ])),
          ),
          isFlipped
              ? SizedBox()
              : GestureDetector(
                  onTap: () {
                    model.openLiquidMenu(controller);
                  },
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Neumorphic(
                      curve: Curves.bounceInOut,
                      style:  NeumorphicStyle(
                        color: Colors.pinkAccent,
                        intensity: 0.6,
                        shape: NeumorphicShape.concave,
                        // oppositeShadowLightSource: true,
                        depth:  model.isOpening?0:5,
                      ),
                      child: Icon(
                        model.isOpening?Icons.lock_open:Icons.lock,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    ));
  }
}
