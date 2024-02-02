import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/register_screen.dart';

class PrePayScreen extends StatelessWidget {
  PrePayScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
              width: 200,
              child: MyTextFeild(
                controller: controller,
                validator: (v) {},
                hint: 'Amount',
                type: TextInputType.number,
              )),
          BigBtn(title: 'B1',onTap: (){},),
          BigBtn(title: 'B2',onTap: (){},)
        ],
      ),
    ));
  }
}
