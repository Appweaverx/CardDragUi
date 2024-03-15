import 'dart:math';

import 'package:animate_container/custom_icons.dart';
import 'package:animate_container/magazine.dart';
import 'package:animate_container/magazine_cover_image.dart';
import 'package:animate_container/menu_button.dart';
import 'package:animate_container/ui_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.enableEntryAnimation = false,
    this.initialIndex = 0,
  });

  final bool enableEntryAnimation;
  final int initialIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<Magazine> magazines = Magazine.fakeMagazinesValues;
  late int currentIndex;
  Offset _offset = const Offset(0, 0);
  static const double threshold = 100.0; // Set your threshold value here

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  // void openMagazineDetail(
  //   BuildContext context,
  //   int index
  // ) {
  //   setState(() => currentIndex = index);
  //   MagazinesDetailsScreen.push(
  //     context,
  //     magazines: magazines,
  //     index: currentIndex,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: UiConsts.gradientDecoration,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _AppBar(),
        body: Column(
          children: [
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.black26,
                  prefixIcon: Icon(CustomIcons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(-70, 30),
                    child: Transform.scale(
                      scale: 0.5,
                      child: Transform.rotate(
                        angle: -pi * 0.1,
                        child: MagazineCoverImage(
                            magazine: magazines[currentIndex + 2]),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(70, 30),
                    child: Transform.scale(
                      scale: 0.5,
                      child: Transform.rotate(
                        angle: pi * 0.1,
                        child: MagazineCoverImage(
                            magazine: magazines[currentIndex + 1]),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        _offset += Offset(details.delta.dx, details.delta.dy);
                      });
                    },
                    onHorizontalDragEnd: (details) {
                      double distance =
                          sqrt(pow(_offset.dx, 2) + pow(_offset.dy, 2));
                      if (details.primaryVelocity != 0 ||
                          distance >= threshold) {
                        setState(() {
                          magazines.removeAt(currentIndex);
                          _offset = const Offset(0, 0);
                        });
                      } else {
                        setState(() {
                          _offset = Offset(0, _offset.dy);
                        });
                      }
                    },
                    // onPanUpdate: (details) {
                    //   setState(() {
                    //     _offset += details.delta;
                    //   });
                    // },
                    // onHorizontalDragEnd: (details) {
                    //   if (_offset.dx.abs() >= threshold) {
                    //     setState(() {
                    //       magazines.removeAt(currentIndex);
                    //       _offset = Offset(0, 0);
                    //     });
                    //   }
                    // },
                    child: Transform.scale(
                      scale: 0.6,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1),
                        transform: Matrix4.translationValues(
                            _offset.dx, _offset.dy, 0),
                        child: MagazineCoverImage(
                            magazine: magazines[currentIndex]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'ALL PORTFOLIO COVER IMAGE ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: magazines.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final magazine = magazines[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              magazine.assetImage,
                              fit: BoxFit.contain,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CustomIcons.home),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CustomIcons.settings),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CustomIcons.share),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CustomIcons.heart),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSize {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      actions: const [
        MenuButton(),
      ],
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
