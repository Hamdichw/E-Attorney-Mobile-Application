import 'package:e_attorney_hub/utils/const.dart';
import 'package:flutter/material.dart';

class btn_screen4 extends StatelessWidget {
  final String text;
  final Icon icon;
  const btn_screen4({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(
                MediaQuery.of(context).size.width * 0.74,
                MediaQuery.of(context).size.height * 0.06)),
            backgroundColor: MaterialStatePropertyAll(Color(0xffe4eaf0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 8, 0), child: icon),
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Color(0xff4a5b67),
                      fontSize: MediaQuery.of(context).size.height * 0.019),
                ),
              ),
            ],
          )),
    );
  }
}
