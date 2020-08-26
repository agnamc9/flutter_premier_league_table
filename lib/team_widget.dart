import 'dart:async';

import 'package:flutter/material.dart';
import 'package:premiere_league/team.dart';

class TeamWidget extends StatefulWidget {
  final int position;
  final Team prevTeam;
  final Team nextTeam;
  final double itemHeight;

  TeamWidget({
    this.position,
    this.itemHeight,
    this.prevTeam,
    this.nextTeam,
  });

  @override
  _TeamWidgetState createState() => _TeamWidgetState();
}

class _TeamWidgetState extends State<TeamWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation<double> logoSlideUp;
  Animation<double> logoSlideDown;

  Animation<double> nameSlideDown;
  Animation<double> nameSlideUp;

  Animation<double> plSlideUp;
  Animation<double> plSlideDown;

  Animation<double> gdSlideUp;
  Animation<double> gdSlideDown;

  Animation<double> ptsSlideUp;
  Animation<double> ptsSlideDown;

  bool isLogoUpdated = false;
  bool isNameUpdated = false;
  bool isPlUpdated = false;
  bool isGdUpdated = false;
  bool isPtsUpdated = false;

  String currentLogo;
  String currentName;
  @override
  void initState() {
    super.initState();

    currentName = widget.prevTeam.name;
    currentLogo = widget.prevTeam.logo;

    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..addListener(() {
            if (!isNameUpdated) {
              if (logoSlideUp.value > 0) {
                setState(() {
                  currentLogo = widget.nextTeam.logo;
                  isLogoUpdated = true;
                });
              }

              if (nameSlideUp.value > 0) {
                setState(() {
                  currentName = widget.nextTeam.name;
                  isNameUpdated = true;
                });
              }
            }
            if (!isPlUpdated) {
              if (plSlideUp.value > 0) {
                setState(() {
                  isPlUpdated = true;
                });
              }
            }
            if (!isGdUpdated) {
              if (gdSlideUp.value > 0) {
                setState(() {
                  isGdUpdated = true;
                });
              }
            }
            if (!isPtsUpdated) {
              if (ptsSlideUp.value > 0) {
                setState(() {
                  isPtsUpdated = true;
                });
              }
            }
          });

    // logo tween
    logoSlideDown = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.0,
          0.2,
        ),
      ),
    );

    logoSlideUp = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.2,
          0.4,
        ),
      ),
    );

    // name tween
    nameSlideDown = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.05,
          0.25,
        ),
      ),
    );

    nameSlideUp = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.25,
          0.45,
        ),
      ),
    );

    // point tween
    plSlideDown = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.1,
          0.3,
        ),
      ),
    );

    plSlideUp = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.3,
          0.5,
        ),
      ),
    );

    // GD tween
    gdSlideDown = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.15,
          0.35,
        ),
      ),
    );

    gdSlideUp = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.35,
          0.55,
        ),
      ),
    );

    // Pts tween
    ptsSlideDown = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.2,
          0.4,
        ),
      ),
    );

    ptsSlideUp = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.4,
          0.6,
        ),
      ),
    );

    Timer(Duration(milliseconds: 3000 + (100 * widget.position)), () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.itemHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${widget.position}',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: logoSlideUp.value <= 0
                          ? 0
                          : -widget.itemHeight +
                              (widget.itemHeight * logoSlideUp.value),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          "images/${currentLogo}",
                          width: 30,
                          height: 30,
                        ),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: widget.itemHeight * logoSlideUp.value,
                      left: 0,
                      right: 0,
                      bottom: widget.itemHeight * logoSlideDown.value,
                      child: child,
                    );
                  },
                  child: Container(
                    height: widget.itemHeight,
                    color: Colors.indigo,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: nameSlideUp.value <= 0
                          ? 0
                          : -widget.itemHeight +
                              (widget.itemHeight * nameSlideUp.value),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          currentName,
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: widget.itemHeight * nameSlideUp.value,
                      left: 0,
                      right: 0,
                      bottom: widget.itemHeight * nameSlideDown.value,
                      child: child,
                    );
                  },
                  child: Container(
                    height: widget.itemHeight,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Positioned(
                        top: plSlideUp.value <= 0
                            ? 0
                            : -widget.itemHeight +
                                (widget.itemHeight * plSlideUp.value),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              isPlUpdated ? "0" : widget.prevTeam.pl,
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    }),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: widget.itemHeight * plSlideUp.value,
                      left: 0,
                      right: 0,
                      bottom: widget.itemHeight * plSlideDown.value,
                      child: child,
                    );
                  },
                  child: Container(
                    height: widget.itemHeight,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: gdSlideUp.value <= 0
                          ? 0
                          : -widget.itemHeight +
                              (widget.itemHeight * gdSlideUp.value),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            isGdUpdated ? "0" : widget.prevTeam.gd,
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: widget.itemHeight * gdSlideUp.value,
                      left: 0,
                      right: 0,
                      bottom: widget.itemHeight * gdSlideDown.value,
                      child: child,
                    );
                  },
                  child: Container(
                    height: widget.itemHeight,
                    color: Colors.indigo,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Positioned(
                        top: ptsSlideUp.value <= 0
                            ? 0
                            : -widget.itemHeight +
                                (widget.itemHeight * ptsSlideUp.value),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              isPtsUpdated ? "0" : widget.prevTeam.pts,
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    }),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: widget.itemHeight * ptsSlideUp.value,
                      left: 0,
                      right: 0,
                      bottom: widget.itemHeight * ptsSlideDown.value,
                      child: child,
                    );
                  },
                  child: Container(
                    height: widget.itemHeight,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
