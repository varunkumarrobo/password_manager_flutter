
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:mini_app/screens/home_screen.dart';
import '../services/addservice.dart';

class AddSite extends StatefulWidget {
  String appBarText;
  AddSite({Key? key, required this.appBarText}) : super(key: key);
  @override
  State<AddSite> createState() => _AddSiteState();
}

class _AddSiteState extends State<AddSite> {
  final formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  TextEditingController uRlController = TextEditingController();
  TextEditingController siteNameController = TextEditingController();
  SingleValueDropDownController sectorController =
  SingleValueDropDownController();
  SingleValueDropDownController socialMediaController =
  SingleValueDropDownController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  bool _passwordVisible = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.appBarText}"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
                          ),
                          const Text(
                            "URL",
                            style: TextStyle(color: Colors.black26,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          TextFormField(
                            controller: uRlController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          const Text(
                            "Site Name",
                            style: TextStyle(color: Colors.black26,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          TextFormField(
                            controller: siteNameController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          const Text(
                            "Sector/Folder",
                            style: TextStyle(color: Colors.black26,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
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
                              DropDownValueModel(
                                  name: 'Personal', value: "value3"),
                              DropDownValueModel(
                                  name: 'E-Commerce', value: "value4"),
                              DropDownValueModel(
                                  name: 'Others', value: "value5"),
                            ],
                            dropDownItemCount: 5,
                            onChanged: (val) {},
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          const Text(
                            "Social Media",
                            style: TextStyle(color: Colors.black26,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          DropDownTextField(
                            controller: socialMediaController,
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
                                  name: 'Facebook', value: "Facebook"),
                              DropDownValueModel(
                                  name: 'Instagram', value: "Instagram"),
                              DropDownValueModel(
                                  name: 'Youtube', value: "Youtube"),
                              DropDownValueModel(
                                  name: 'Twitter', value: "Twitter"),
                              DropDownValueModel(
                                  name: 'Pinterest', value: "Pinterest"),
                            ],
                            dropDownItemCount: 5,
                            onChanged: (val) {},
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          const Text(
                            "User Name",
                            style: TextStyle(color: Colors.black26,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          TextFormField(
                            controller: userNameController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          const Text(
                            "Site Password",
                            style: TextStyle(color: Colors.black26,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          TextFormField(
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          const Text(
                            "Notes",
                            style: TextStyle(color: Colors.black26,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          TextFormField(
                            maxLines: 3,
                            controller: notesController,
                            //validator: callBack,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .499,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(1))
                              ),
                            ),
                            onPressed: () {
                              uRlController.text = '';
                              siteNameController.text = '';
                              userNameController.text = '';
                              passwordController.text = '';
                              notesController.text = '';
                            },
                            child: const Text("Clear"),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .499,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(1))
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                DatabaseService.instance.createSite({
                                  "url": uRlController.text,
                                  "siteName": siteNameController.text,
                                  "sector": sectorController.dropDownValue!.value,
                                  "socialMedia": socialMediaController.dropDownValue!.value,
                                  "username": userNameController.text,
                                  "password": passwordController.text,
                                  "notes": notesController.text,
                                });
                                DatabaseService.instance.getAllSite();
                              });
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context)=> const HomeScreen()));
                            },
                            child: const Text("Submit"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
