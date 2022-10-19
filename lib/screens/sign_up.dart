
import 'package:flutter/material.dart';
import '../services/db_service.dart';
import '../utilites/custom_button.dart';
import '../utilites/textfield_validation.dart';
import '../utilites/validator.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with UserValidation {
  final formKey = GlobalKey<FormState>();
   TextEditingController mobileController = TextEditingController();
  TextEditingController mPinController = TextEditingController();
  TextEditingController remPinController = TextEditingController();
  DatabaseManager sqliteService = DatabaseManager();
  bool  _passwordVisible = false;

   @override
  void initState() {
    // TODO: implement initState
     sqliteService = DatabaseManager();
     sqliteService.initDb().whenComplete(() async{
       setState(() {});
     });
    super.initState();
  }

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
                hintText: 'Re-Enter 4 digit MPin',
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
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 13),
            child: CustomButton(
                text: "SIGN UP",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    sqliteService
                        .insertModel(UserModel(
                        mobile: mobileController.text,
                        mPin: mPinController.text))
                        .whenComplete(() =>
                        ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Congrats!!! Success signin to access the vault')),
                    ));
                  }
                },
            ),
          ),
        ],
      ),
    );
  }
}
