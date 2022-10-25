
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mini_app/screens/authentication.dart';
import 'package:mini_app/utilites/pawrdcrypt.dart';
import '../services/addservice.dart';
import '../utilites/custom_button.dart';
import '../utilites/textfield_validation.dart';
import '../utilites/validator.dart';
import 'home_screen.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with UserValidation ,Crypt{
  // DatabaseManager sqliteService = DatabaseManager();
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
                "Forgot your password? ",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
              onTap: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) => const Authentication()));
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: CustomButton(
                text: "SIGN IN",
                onPressed: () async {
                  if(formKey.currentState!.validate()){
                    String response = await DatabaseService.instance.getUserByData(
                        mobileController.text,
                        Crypt.encryptPassword(mPinController.text));
                    if(response == '404'){
                      Fluttertoast.showToast(msg: 'User Does Not Exist',
                      fontSize: 20,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb:  5,
                      );
                    }else if(response == '200'){
                      Fluttertoast.showToast(msg: 'Login SuccessFull',
                      fontSize: 20,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      );
                      int userid =
                      await DatabaseService.instance.getUserByMoblie(mobileController.text);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>   HomeScreen(userid: userid,)));
                    } else if (response == '401'){
                      Fluttertoast.showToast(
                        msg: "Incorrect Password",
                        fontSize: 20,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                      );
                    }
                  }
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

// bool userPresent = false;
// List<User> model = await sqliteService.getUser();
// for (var userModel in model) {
// if (userModel.toJson()["mobile"] ==
// mobileController.text) {
// userPresent = true;
// if (userModel.toJson()["mPin"] == Crypt.encryptPassword(
// mPinController.text)) {
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(content: Text('LOGIN SUCCESSFULLY')));
// Navigator.pushReplacement(
// context,
// MaterialPageRoute(
// builder: (context) => HomeScreen()));
// } else {
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(content: Text('INCORRECT PASSWORD')));
// }
// }
// }
// if (userPresent == false)
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(content: Text('USER DOES NOT EXIST')));

