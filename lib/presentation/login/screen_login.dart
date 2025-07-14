import 'package:flutter_application_1/core/common.dart';
import 'package:flutter_application_1/controllers/controllers.dart' as c;
import 'package:flutter_application_1/presentation/login/widgets/login.dart';
import 'package:flutter_application_1/presentation/login/widgets/register.dart';
import 'package:flutter_application_1/presentation/screens.dart' as s;
import 'package:flutter_application_1/widgets/input/password.dart';
import 'package:flutter_application_1/widgets/input/simple.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final cnt = c.LoginController();
  @override
  void dispose() {
    cnt.key.currentState?.dispose();
    cnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: margin10all,
        child: Column(children: [
          hsBox50,
          hsBox50,
          hsBox30,
          Image.asset(image.logo, width: 120.fem, height: k80),
          hsBox50,
          hsBox30,
          Container(
            // height: k40,
            decoration: BoxDecoration(
              color: cgrey300,
              borderRadius: borderRadius15,
            ),
            child: AnimatedBuilder(
              animation: cnt.selectButton,
              builder: (context, child) => Row(
                children: cnt.buttons
                    .map(
                      (v) => Expanded(
                        child: InkWell(
                          onTap: () {
                            cnt.selectButton.value = v;
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: cnt.selectButton.value == v
                                  ? cwhiteText
                                  : null,
                              borderRadius: borderRadius10,
                            ),
                            margin: margin5all,
                            padding: margin83,
                            child: Text(
                              v,
                              style: textBoldw700,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          hsBox30,
          if (cnt.selectButton.value == cnt.buttons.first)
            LoginScreen(cnt: cnt),
          if (cnt.selectButton.value == cnt.buttons.last)
            RegisterPage(cnt: cnt),
        ]),
      ),
    );
  }
}
