import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:mini_app/screens/edit_screen.dart';
import '../models/modelsdb.dart';
import '../utilites/textfield_validation.dart';
import '../utilites/validator.dart';


class SiteDetails extends StatefulWidget {
    SiteDetails({Key? key, required this.site}) : super(key: key);
  Site? site;
  @override
  State<SiteDetails> createState() => _SiteDetailsState();
}

class _SiteDetailsState extends State<SiteDetails> with UserValidation {
  final _formKey = GlobalKey<FormState>();
  TextEditingController uRlController = TextEditingController();
  TextEditingController siteNameController = TextEditingController();
  SingleValueDropDownController sectorController =
      SingleValueDropDownController();
  SingleValueDropDownController socialMediaController =
      SingleValueDropDownController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.site != null) {
      uRlController.text = widget.site!.url;
      siteNameController.text = widget.site!.siteName;
      userNameController.text = widget.site!.username;
      passwordController.text = widget.site!.password;
      notesController.text = widget.site!.notes;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Site Details"),
            GestureDetector(
              child: const Text("Edit"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  EditScreen()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'URL',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SiteField(textController: uRlController),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Site Name',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SiteField(
                        textController: siteNameController),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Sector/Folder',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropDownTextField(
                      controller: sectorController,
                      listSpace: 5,
                      listPadding: ListPadding(top: 20),
                      enableSearch: false,
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownList: const [
                        DropDownValueModel(
                            name: 'Social media', value: "value1"),
                        DropDownValueModel(name: 'Bank', value: "value2"),
                        DropDownValueModel(name: 'Personal', value: "value3"),
                        DropDownValueModel(name: 'E-Commerce', value: "value4"),
                        DropDownValueModel(name: 'Others', value: "value5"),
                      ],
                      dropDownItemCount: 5,
                      onChanged: (val) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'User Name',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SiteField(
                        textController: userNameController),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Site Password',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: const TextStyle(color: Colors.black54),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12, width: 1.0),
                        ),
                        contentPadding: const EdgeInsets.all(8.0),
                        //hintText: label,
                        hintStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Notes',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      readOnly: true,
                      maxLines: 3,
                      controller: notesController,
                      style: const TextStyle(
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.black54),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12, width: 1.0),
                        ),
                        contentPadding: EdgeInsets.all(8.0),
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
//site_details
