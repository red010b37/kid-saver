// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom widget code

import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:forge2d/forge2d.dart' as fge;

// Begin custom widget code
class KidsHomeMasonLayout extends StatefulWidget {
  const KidsHomeMasonLayout({
    Key key,
    this.width,
    this.height,
    this.minRadius,
    this.buckets,
  }) : super(key: key);

  final double width;
  final double height;
  final double minRadius;
  final List<BucketsRecord> buckets;

  @override
  _KidsHomeMasonLayoutState createState() => _KidsHomeMasonLayoutState();
}

class _KidsHomeMasonLayoutState extends State<KidsHomeMasonLayout>
    with TickerProviderStateMixin {
  BallCage bc;
  bool bucketsBuilt = false;

  List<BucketDisplay> buckets = [];

  Timer _stateTimer;

  // final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 1),
  //   vsync: this,
  // )..forward();

  @override
  void initState() {
    super.initState();

    bc = BallCage();

    _stateTimer = Timer.periodic(
        const Duration(milliseconds: 30),
        (Timer timer) => setState(() {
              if (buckets.length != 0) {
                buckets[0].setRadius(buckets[0].radius + .1);
              }
            }));
  }

  void buildBuckets(double width, double height) {
    for (var b in widget.buckets) {
      buckets.add(BucketDisplay(
          bc: bc,
          x: (Random().nextDouble() * 10),
          y: (Random().nextDouble() * 10),
          color: Colors.pink));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;

    if (!bucketsBuilt) {
      buildBuckets(sizeW, sizeH);
      bucketsBuilt = true;
    }

    bc.setBoundries(sizeW, sizeH);

    return Container(
      alignment: Alignment.center,
      width: sizeW,
      height: sizeH,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        for (var b in buckets) b.buildCircle(context)
        // buildCircle(context, Colors.cyanAccent, 30/2),
        // MyStatefulWidget(xPos: xPos, yPos: yPos, lastxPos: lastXPos, lastyPos: lastYPos),
      ]),
    );
  }

  @override
  void dispose() {
    // _controller.dispose();

    _stateTimer.cancel();
    bc.dispose();
    bc = null;
    super.dispose();
  }
}

class BucketDisplay {
  Color color;
  double radius;

  BallCage bc;

  BallData ballData;

  BucketDisplay({this.bc, double x = 0, double y = 0, this.color}) {
    radius = Random().nextDouble() * 100;
    ballData = bc.createBody(radius, x, y);
  }

  double get xPos {
    return ballData.body.position.x;
  }

  double get yPos {
    return ballData.body.position.y;
  }

  void setRadius(double r) {
    ballData = bc.updateBody(ballData, r);
    radius = r;
  }

  Widget buildCircle(BuildContext context) {
    return Transform.translate(
      offset: Offset(xPos, yPos),
      child: Container(
        alignment: Alignment.center,
        width: radius * 2,
        height: radius * 2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: SimpleCirclePainter(
                radius: radius,
                backgroundColor: color,
                // circleWidth: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    '\$20.00',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    minFontSize: 3,
                    maxFontSize: 40,
                  ),
                  AutoSizeText(
                    'This is a sub line',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    minFontSize: 3,
                    maxFontSize: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SimpleCirclePainter extends CustomPainter {
  SimpleCirclePainter({
    this.radius,
    // this.circleWidth,
    this.backgroundColor,
  }) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.fill;
    // _paintBackground.strokeWidth = circleWidth!;
    // _paintLine.style = PaintingStyle.stroke;
    // _paintLine.strokeWidth = circleWidth!;
  }

  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();

  // final double? circleWidth;
  final double radius;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final child = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(child, radius, _paintBackground);
  }

  double radians(double degrees) => degrees * (3.141592 / 180.0);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class BallData {
  fge.Body body;
  fge.CircleShape circle;

  BallData({this.body, this.circle});
}

class BallCage {
  /// All of the bodies in a simulation.
  List<fge.Body> bodies = <fge.Body>[];

  Stopwatch _stopwatch;

  /// The timestep and iteration numbers.
  static const double timeStep = 1 / 60;

  /// Starting position of ball cage in the world.
  static const double startX = 0.0;
  static const double startY = 0.0;

  /// The gravity vector's y value.
  static const double _gravity = 0.0;

  /// The physics world.
  fge.World world;

  /// Microseconds for world step update
  int elapsedUs = 0;

  fge.Body leftSide;
  fge.Body rightSide;
  fge.Body top;
  fge.Body bottom;

  Timer worldTimer;

  /// Constructs a new BallCage.
  BallCage() {
    initialize();

    world.setAllowSleep(true);

    worldTimer = Timer.periodic(const Duration(milliseconds: 16), (Timer t) {
      step();
    });
  }

  void step() {
    world.stepDt(timeStep);
  }

  void setBoundries(double width, double height) {
    top.setTransform(fge.Vector2(0, (height / 2) * -1), 0);
    bottom.setTransform(fge.Vector2(0, height / 2), 0);

    leftSide.setTransform(fge.Vector2((width / 2) * -1, 0), 0);
    rightSide.setTransform(fge.Vector2((width / 2), 0), 0);
  }

  void initialize() {
    world = fge.World(fge.Vector2(0.0, _gravity));

    final shape = fge.PolygonShape();
    shape.setAsBoxXY(1000.0, 10.0);

    final bodyDef = fge.BodyDef()
      ..type = fge.BodyType.static
      ..position = fge.Vector2(0.0, -10.0);
    bottom = world.createBody(bodyDef);
    bodies.add(bottom);

    final fixtureDef = fge.FixtureDef(shape)..friction = 1.0;
    bottom.createFixture(fixtureDef);

    // Walls
    shape.setAsBoxXY(3.0, 1000.0);
    final wallDef = fge.BodyDef()..position = fge.Vector2(100, 0);
    rightSide = world.createBody(wallDef);
    bodies.add(rightSide);
    rightSide.createFixtureFromShape(shape);

    wallDef.position = fge.Vector2(-100, 0);
    leftSide = world.createBody(wallDef);
    bodies.add(leftSide);
    leftSide.createFixtureFromShape(shape);

    // // Corners
    // final cornerDef = fge.BodyDef();
    // shape.setAsBoxXY(20.0, 3.0);
    // cornerDef.angle = -pi / 4.0;
    // cornerDef.position = fge.Vector2(-35.0, 8.0);
    // var myBod = world.createBody(cornerDef);
    // bodies.add(myBod);
    // myBod.createFixtureFromShape(shape);
    // cornerDef.angle = pi / 4.0;
    // cornerDef.position = fge.Vector2(35.0, 8.0);
    // myBod = world.createBody(cornerDef);
    // bodies.add(myBod);
    // myBod.createFixtureFromShape(shape);

    // top
    shape.setAsBoxXY(1000, 10.0);
    final topDef = fge.BodyDef()
      ..type = fge.BodyType.static
      ..angle = 0.0
      ..position = fge.Vector2(0.0, 100);

    top = world.createBody(topDef);
    bodies.add(top);
    fixtureDef.shape = shape;
    fixtureDef.friction = 1.0;
    top.createFixture(fixtureDef);

    // final circleFixtureDef = fge.FixtureDef(circleShape)
    //   ..friction = .9
    //   ..restitution = 1.0;
    //
    //
    // // Create a body def.
    // final circleBodyDef = fge.BodyDef();
  }

  BallData createBody(double ballRadius, double x, double y,
      {fge.Vector2 linearVelocity}) {
    var lv = linearVelocity ?? fge.Vector2(0.0, 0.0);

    // Create a bouncing ball.
    final bouncingCircle = fge.CircleShape()..radius = ballRadius + 5;

    // Create fixture for that ball shape.
    final activeFixtureDef = fge.FixtureDef(bouncingCircle)
      ..restitution = 1.0
      ..friction = .1
      ..density = ballRadius;

    // Create the active ball body.
    final activeBodyDef = fge.BodyDef();
    activeBodyDef.linearVelocity = lv;
    activeBodyDef.position = fge.Vector2(x, y);
    activeBodyDef.type = fge.BodyType.dynamic;
    activeBodyDef.bullet = true;
    final activeBody = world.createBody(activeBodyDef);

    bodies.add(activeBody);
    activeBody.createFixture(activeFixtureDef);

    return BallData(body: activeBody, circle: bouncingCircle);
  }

  updateBody(BallData data, double radius) {
    bodies.remove(data.body);
    world.destroyBody(data.body);

    return createBody(radius, data.body.position.x, data.body.position.y,
        linearVelocity: data.body.linearVelocity);
  }

  dispose() {
    worldTimer.cancel();
    world = null;
  }
}
