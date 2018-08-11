library loading;

import 'dart:math';

import 'package:flutter/material.dart';


/// LoadingCard displays lines with opacity moving up and down
/// Specify the number of loading lines to display

class LoadingCard extends StatefulWidget {
  final numberOfLines;
  final padding;
  LoadingCard({this.numberOfLines, this.padding});
  LoadingCardState createState() => LoadingCardState(numberOfLines: numberOfLines, padding: padding);
}

class LoadingCardState extends State<LoadingCard>
    with SingleTickerProviderStateMixin {
  AnimationController _loadingOpacity;
  Animation _opacity;
  Random _rand;
  double _divideFactor;
  int numberOfLines;
  final padding;
  LoadingCardState({this.padding, this.numberOfLines});

  @override
  void initState() {
    _rand = Random();
    _divideFactor = (_rand.nextInt(5) + 1.4);
    _loadingOpacity = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _opacity = Tween(begin: 0.4, end: 1.0).animate(_loadingOpacity)
      ..addListener(() {
        setState(() {});
      });
    _animateForward();
    super.initState();
  }

  @override
  void dispose() {
    _loadingOpacity.dispose();
    super.dispose();
  }

  void _animateForward() async {
    await _loadingOpacity.forward().then((_) {
      _animateReverse();
    });
  }

  void _animateReverse() async {
    await _loadingOpacity.reverse().then((_) {
      _animateForward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(const Radius.circular(7.5)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 2.5,
                offset: Offset(0.0, 2.5))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Container(
                    height: 13.0,
                    width: MediaQuery.of(context).size.width / _divideFactor,
                    // constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        color: Colors.grey[350].withOpacity(_opacity.value),
                        borderRadius: BorderRadius.circular(6.5)),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: numberOfLines,
                itemBuilder: (context, index) {
                  return Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Container(
                  height: 13.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[350].withOpacity(_opacity.value),
                      borderRadius: BorderRadius.circular(6.5)),
                ),
              );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
