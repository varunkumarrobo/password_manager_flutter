
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mini_app/utilites/pawrdcrypt.dart';
import '../services/addservice.dart';
import '../utilites/custom_button.dart';
import '../utilites/textfield_validation.dart';
import '../utilites/validator.dart';
import 'authentication.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with UserValidation,Crypt {
  final formKey = GlobalKey<FormState>();
   TextEditingController mobileController = TextEditingController();
  TextEditingController mPinController = TextEditingController();
  TextEditingController remPinController = TextEditingController();
  // DatabaseManager sqliteService = DatabaseManager();
  bool  _passwordVisible = false;
  bool  passwordVisible = false;
  //  @override
  // void initState() {
  //   // TODO: implement initState
  //    sqliteService = DatabaseManager();
  //    sqliteService.initDb().whenComplete(() async{
  //      setState(() {});
  //    });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
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
              },
          ),
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
                    color: Theme.of(context).primaryColorDark,),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin:  const EdgeInsets.only(left: 30,right: 30),
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: remPinController,
              obscureText: !passwordVisible,
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
                hintText: 'Re-Enter 4 digit MPin',
                hintStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                  icon: Icon(passwordVisible? Icons.visibility: Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,),),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 13),
            child: CustomButton(
                text: "SIGN UP",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if(mPinController.text == remPinController.text){
                      if(await DatabaseService.instance.checkExistanceUser(
                          mobileController.text) == false){
                        DatabaseService.instance.createUser({
                          'phone_number': mobileController.text.trim(),
                          'password': Crypt.encryptPassword(mPinController.text),
                          //'password': mPinController.text.trim(),
                        });
                        Fluttertoast.showToast(
                          msg: "Account Created",
                          fontSize: 10,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                        );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Authentication()));
                      }
                      else {
                        Fluttertoast.showToast(
                          msg: "Mobile Number Exists",
                          fontSize: 20,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                        );
                      }
                    }
                  }
                },
            ),
          ),
        ],
      ),
    );
  }
}

//
// sqliteService
//     .insertModel(User(
// mobile: mobileController.text,
// mPin: Crypt.encryptPassword(mPinController.text)))
// .whenComplete(() =>
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(content: Text('Congrats!!! Success Sign-In to access the vault')),
// ));