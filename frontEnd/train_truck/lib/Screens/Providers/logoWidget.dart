import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child:
        Image.asset("assets/images/logo.png"),
    );
  }
}
