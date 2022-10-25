import 'package:flutter/material.dart';

class Custom_TextField extends StatelessWidget {
  String label;
  FormFieldValidator<String> callBack;

  Custom_TextField({Key? key, required this.label,required this.textController,
    required this.callBack}) : super(key: key);
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30,right: 30),
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: textController,
        validator: callBack,
        style: const TextStyle(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          color: Colors.black,
          fontSize: 22,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.black54),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 1.0),
          ),
          contentPadding: const EdgeInsets.all(8.0),
          hintText: label,
          hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}

class SiteField extends StatelessWidget {

  SiteField({Key? key, required this.textController, }) : super(key: key);
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5,right: 5),
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        readOnly: true,
        controller: textController,
        style: const TextStyle(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.black54),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 1.0),
          ),
          contentPadding: EdgeInsets.all(8.0),
          hintStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
