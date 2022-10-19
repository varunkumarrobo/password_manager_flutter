
import 'package:flutter/material.dart';
import 'package:mini_app/screens/sign_up.dart';
import '../services/db_service.dart';
import '../utilites/custom_button.dart';
import '../utilites/textfield_validation.dart';
import '../utilites/validator.dart';
import 'home_screen.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with UserValidation {
  DatabaseManager sqliteService = DatabaseManager();
  TextEditingController mobileController = TextEditingController();
  TextEditingController mPinController = TextEditingController();
  final formKey = GlobalKey<FormState>();
   bool _passwordVisible = false;

    @override
     Widget build (BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Custom_TextField(
            textController: mobileController,
              label: "Mobile Number",
              callBack: (value) {
                return mobileValidator(value);
              }),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin:  const EdgeInsets.only(left: 30,right: 30),
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: mPinController,
              obscureText: !_passwordVisible,
              validator: (value){
                return mPinValidator(value);
              },
              style: const TextStyle(
                backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                color: Colors.black,
                fontSize: 22,
              ),
              decoration:  InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelStyle: const TextStyle(color: Colors.black54),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12, width: 1.0),
                ),
                contentPadding: const EdgeInsets.all(8.0),
                hintText: 'Enter 4 digit MPin',
                hintStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                    icon: Icon(_passwordVisible? Icons.visibility: Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,),),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left:MediaQuery.of(context).size.width * 0.07,
                top: MediaQuery.of(context).size.height * 0.03),
            child: GestureDetector(
              child: const Text(
                "Forgot your password?",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: CustomButton(
                text: "SIGN IN",
                onPressed: () async {
                  bool userPresent = false;
                  List<UserModel> model = await sqliteService.getUser();
                  for (var userModel in model) {
                    if (userModel.toJson()["mobile"] ==
                        mobileController.text) {
                      userPresent = true;
                      if (userModel.toJson()["mPin"] ==
                          mPinController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('LOGIN SUCCESSFULLY')));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('INCORRECT PASSWORD')));
                      }
                    }
                  }
                  if (userPresent == false)
                    ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(content: Text('USER DOES NOT EXIST')));
                },),
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.065),
                child: Image.asset("assets/page1/fingerprinticon.png"),
              )),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height  * 0.03,
                left: MediaQuery.of(context).size.width * 0.1),
            child: Row(
              children: [
                const Text(
                  "OR",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08),
                  child: const Text(
                    "USE YOUR FINGERPRINT TO LOGIN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



