import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Buttons extends StatelessWidget {
  final buttontext;
  final buttoncolor;
  final buttontxtclr;
  final buttonpress;
  Buttons(
      {this.buttoncolor, this.buttontext, this.buttontxtclr, this.buttonpress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: GestureDetector(
        onTap: buttonpress,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: buttoncolor,
            child: Center(
              child: Text(
                buttontext,
                style: TextStyle(fontSize: 20, color: buttontxtclr),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
