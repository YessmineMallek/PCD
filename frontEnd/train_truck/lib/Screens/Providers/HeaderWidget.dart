import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
        Image.asset("assets/images/entete.png"),

        Container(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: IconButton(onPressed: (){
              Navigator.pop(context);

            },
                icon: Icon(Icons.arrow_back_ios_new_sharp,
                          color: Colors.black,)))
    ]);
  }
}
