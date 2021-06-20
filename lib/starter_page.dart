import 'package:flutter/material.dart';
import 'package:flutterui3/animations/fade_animation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutterui3/home_page.dart';

class StarterPage extends StatefulWidget {
  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  bool _textVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);
    super.initState();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });
    _animationController.forward().then((f) => Navigator.push(context,
        PageTransition(child: HOmePage(), type: PageTransitionType.fade)));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/1.jpg'),
        )),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.2),
            ],
          )),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  1,
                  Text(
                    'Taking order For Faster Delivery',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20.0),
                FadeAnimation(
                  1,
                  Text(
                    'See Restaurant Nearly By \n Adding Your Location',
                    style: TextStyle(
                        color: Colors.white, height: 1.4, fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                FadeAnimation(
                  1.5,
                  ScaleTransition(
                    scale: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orange])),
                      child: AnimatedOpacity(
                          opacity: _textVisible ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 50),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            onPressed: () => _onTap(),
                            child: Text(
                              'Start',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                FadeAnimation(
                  1.4,
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 50),
                    opacity: _textVisible ? 1.0 : 0.0,
                    child: Align(
                      child: Text(
                        'Now Delinver to Your Door  24/7 ',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
