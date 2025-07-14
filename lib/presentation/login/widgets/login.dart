import 'package:flutter_application_1/controllers/controllers.dart' as c;
import 'package:flutter_application_1/core/common.dart';
import 'package:flutter_application_1/presentation/screens.dart' as s;
import 'package:flutter_application_1/widgets/input/password.dart';
import 'package:flutter_application_1/widgets/input/simple.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.cnt});
  final c.LoginController cnt;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Form(
          key: cnt.key,
          child: Column(children: [
            InputSimple(
              lable: "Email address",
              hintText: "Your email",
              validator: InputValidator.email,
              controller: cnt.email,
              border: true,
              keyboardType: TextInputType.emailAddress,
            ),
            hsBox20,
            InputPassword(
              label: "Password",
              controller: cnt.password,
            ),
          ])),
      hsBox30,
      buttons.elevate("Log In", onTap: () {
        print("Clicked.....");
        if (cnt.key.currentState?.validate() == true) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => s.HomePageScreen()));
        }
      }),
      hsBox30,
      Text(
        "Other Log In options",
        style: textMediumw500.fntColor(HexColor("#ACB5BD")).fntSize(17),
      ),
      hsBox12,
      Wrap(
        spacing: k10,
        children: [image.iconFacebook, image.iconGoogle, image.iconApple]
            .map((e) => InkWell(
                  onTap: () {
                    print("Login to ${e.split("/").last}");
                  },
                  child: Container(
                    width: k55,
                    height: k55,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: HexColor("#D8DADC"), width: 0.5)),
                    child: Center(
                      child: Image.asset(
                        e,
                        width: k22,
                        height: k22,
                      ),
                    ),
                  ),
                ))
            .toList(),
      )
    ]);
  }
}
