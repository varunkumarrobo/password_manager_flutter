
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
// import 'package:mini_app/screens/home_screen.dart';
import '../models/modelsdb.dart';
import '../services/addservice.dart';
import '../utilites/passwordEncry.dart';

class AddSite extends StatefulWidget {
  String appBarText;
  Site? site;
  int userid;
  AddSite({Key? key, required this.appBarText,this.site,required this.userid}) : super(key: key);
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
  bool _enable = true;

  @override
  void initState() {
    super.initState();
    if (widget.site != null) {
      _enable = false;

      uRlController.text = widget.site!.url;
      siteNameController.text = widget.site!.siteName;
      siteNameController.text = widget.site!.siteName;
      sectorController.dropDownValue = DropDownValueModel(
          name: widget.site!.sector, value: widget.site!.sector);
      socialMediaController.dropDownValue = DropDownValueModel(
          name: widget.site!.socialMedia, value: widget.site!.socialMedia);
      userNameController.text = widget.site!.username;
      passwordController.text = Crypt.decryptePassword(widget.site!.password);
      notesController.text = widget.site!.notes;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllers = [
      uRlController,
      siteNameController,
      userNameController,
      passwordController,
      notesController
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${widget.appBarText}"),
            Visibility(
              visible: widget.site != null && _enable == false,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _enable = true;
                      widget.appBarText = 'Edit';
                    });
                  },
                  child: const Text('Edit'),
                ),),
          ],
        ),
        backgroundColor: const Color(0xFF0E85FF),
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
                            enabled: _enable,
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
                            enabled: _enable,
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
                            isEnabled: _enable,
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
                                  name: 'Social media', value: "Social media"),
                              DropDownValueModel(name: 'Bank', value: "Bank"),
                              DropDownValueModel(
                                  name: 'Personal', value: "Personal"),
                              DropDownValueModel(
                                  name: 'E-Commerce', value: "E-Commerce"),
                              DropDownValueModel(
                                  name: 'Others', value: "Others"),
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
                            isEnabled: _enable,
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
                            enabled: _enable,
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
                            enabled: _enable,
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
                            enabled: _enable,
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
                    widget.site == null
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .499,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(1)))),
                            onPressed: () {
                              controllers.forEach((element) => element.clear());
                              // uRlController.text = '';
                              // siteNameController.text = '';
                              // userNameController.text = '';
                              // passwordController.text = '';
                              // notesController.text = '';
                            },
                            child: const Text("Reset"),
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
                              // setState(() {
                                DatabaseService.instance.createSite({
                                  "url": uRlController.text,
                                  "userid": widget.userid,
                                  "siteName": siteNameController.text,
                                  "sector": sectorController.dropDownValue!.value,
                                  "socialMedia": socialMediaController.dropDownValue!.value,
                                  "username": userNameController.text,
                                  "password": Crypt.encryptPassword(
                                      passwordController.text),
                                  "notes": notesController.text,
                                });
                                DatabaseService.instance.getAllSite(widget.userid!);
                              // });
                             Navigator.pop(context);
                            },
                            child: const Text("Save"),
                          ),
                        ),
                      ],
                    ):Visibility(
                      visible: _enable,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                              onPressed: (){
                            setState(() {
                              DatabaseService.instance.updateSite({
                                "id": widget.site!.id,
                                "userid": widget.userid,
                                "url": uRlController.text,
                                // "userid": widget.userid,
                                "siteName": siteNameController.text,
                                "sector": sectorController
                                    .dropDownValue!.value,
                                "socialMedia": socialMediaController
                                    .dropDownValue!.value,
                                "username": userNameController.text,
                                "password": Crypt.encryptPassword(
                                    passwordController.text),
                                "notes": notesController.text,
                              });
                              Navigator.pop(context);
                            });
                          }, child: const Text("update")),
                        ))
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
