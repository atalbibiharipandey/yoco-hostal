import 'package:flutter_application_1/controllers/controllers.dart' as c;
import 'package:flutter_application_1/core/common.dart';
import 'package:flutter_application_1/presentation/screens.dart' as s;
import 'package:flutter_application_1/widgets/input/password.dart';
import 'package:flutter_application_1/widgets/input/simple.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, required this.cnt});
  final c.LoginController cnt;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Form(
          key: cnt.key,
          child: Column(children: [
            InputSimple(
              lable: "Student Name",
              hintText: "Your name",
              // controller: cnt.email,
              border: true,
            ),
            hsBox20,
            InputSimple(
              lable: "Email address",
              hintText: "example@gmail.com",
              validator: InputValidator.email,
              // controller: cnt.email,
              border: true,
              keyboardType: TextInputType.emailAddress,
            ),
            hsBox20,
            InputPassword(
              label: "Password",
              controller: cnt.password,
            ),
            hsBox20,
            InputSimple(
              lable: "Enrolment No. / Reg. No. ",
              hintText: "Enter Number here",
              // controller: cnt.email,
              border: true,
              keyboardType: TextInputType.number,
            ),
            hsBox20,
            InputSimple(
              lable: "Hostel ID",
              hintText: "Enter Number here",
              // controller: cnt.email,
              border: true,
              keyboardType: TextInputType.number,
            ),
            hsBox20,
            InputSimple(
              lable: "Date of Birth",
              hintText: "YYYY-MM-dd",
              controller: cnt.dob,
              border: true,
              keyboardType: TextInputType.datetime,
              suffixIcon: InkWell(
                  onTap: () async {
                    final cDay = DateTime.now();
                    final t = await showDatePicker(
                        context: context,
                        initialDate: cDay,
                        firstDate: DateTime(1900),
                        lastDate: cDay.add(Duration(days: 1000)));
                    if (t != null) {
                      cnt.dob.text = t.toIso8601String().split("T").first;
                    }
                  },
                  child: SizedBox(
                    width: k20,
                    height: k20,
                    child: Center(
                      child: Image.asset(
                        image.iconCalender,
                        width: k25,
                        height: k25,
                      ),
                    ),
                  )),
            ),
            hsBox20,
            InputSimple(
              lable: "Mobile No.",
              hintText: "Enter Number here",
              // controller: cnt.email,
              border: true,
              keyboardType: TextInputType.phone,
            ),
          ])),
      hsBox30,
      buttons.elevate("Send for Registration", onTap: () {
        print("Clicked.....");
        if (cnt.key.currentState!.validate()) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => s.HomePageScreen()));
        }
      }),
    ]);
  }
}
