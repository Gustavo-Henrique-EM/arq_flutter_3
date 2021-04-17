import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ClipPath(
        clipper: HeaderColor(),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              Image(
//                height: MediaQuery.of(context).size.height * 0.25,
//                image: AssetImage('assets/flutterlogo.png'),
//              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Arquitetura',
                style: TextStyle(
                  letterSpacing: 5,
                  color: Colors.grey,
                  fontSize: 43,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderColor extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height),
        radius: Radius.elliptical(50, 10));
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
