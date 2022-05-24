import 'package:flutter/material.dart';
import 'package:liquid_menu/core/viewmodels/home_model.dart';
import 'package:provider/provider.dart';
import '../../widgets/liquid.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding( 
        padding: const EdgeInsets.all(40.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: model.isOpening?20:0,
              child: const Text('Gandu'),
            ),
            Liquid(
              isFlipped: true,
              controller: _animationController,
            ),
            Liquid(
              isFlipped: false,
              controller: _animationController,
            ),
          ],
        ),
      ),
    );
  }
}
