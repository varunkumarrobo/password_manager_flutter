
// TextFormField(
// keyboardType: TextInputType.text,
// controller: passwordController,
// obscureText: !_passwordVisible,
// //This will obscure text dynamically
// decoration: InputDecoration(
// filled: true,
// fillColor: Colors.white,
// labelStyle: const TextStyle(color: Colors.black54),
// enabledBorder: const OutlineInputBorder(
// borderSide:
// BorderSide(color: Colors.black12, width: 1.0),
// ),
// contentPadding: const EdgeInsets.all(8.0),
// //hintText: label,
// hintStyle: const TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: Colors.black45,
// ),
// suffixIcon: IconButton(
// icon: Icon(
// // Based on passwordVisible state choose the icon
// _passwordVisible
// ? Icons.visibility
//     : Icons.visibility_off,
// color: Theme.of(context).primaryColorDark,
// ),
// onPressed: () {
// // Update the state i.e. toogle the state of passwordVisible variable
// setState(() {
// passwordVisible = !passwordVisible;
// });
// },
// ),
// ),
// ),

// class AddSite extends StatefulWidget {
//   const AddSite({Key? key}) : super(key: key);
//
//   @override
//   State<AddSite> createState() => _AddSiteState();
// }
//
// class _AddSiteState extends State<AddSite> {
//   @override
//   final formKey = GlobalKey<FormState>();
//   FocusNode searchFocusNode = FocusNode();
//   FocusNode textFieldFocusNode = FocusNode();
//   late SingleValueDropDownController _cnt;
//   late MultiValueDropDownController _cntMulti;
//   TextEditingController URlController = TextEditingController();
//   TextEditingController SiteNameController = TextEditingController();
//   SingleValueDropDownController SectorController =
//   SingleValueDropDownController();
//   SingleValueDropDownController SocialMediaController =
//   SingleValueDropDownController();
//   TextEditingController UserNameController = TextEditingController();
//   TextEditingController PasswordController = TextEditingController();
//   TextEditingController NotesController = TextEditingController();
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add Site"),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(left: 20, right: 20),
//                   // color: Colors.red,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .03,
//                       ),
//                       const Text(
//                         "URL",
//                         style: TextStyle(color: Colors.black26),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       TextFormField(
//                         controller: URlController,
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       const Text(
//                         "Site Name",
//                         style: TextStyle(color: Colors.black26),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       TextFormField(
//                         controller: SiteNameController,
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       const Text(
//                         "Sector/Folder",
//                         style: TextStyle(color: Colors.black26),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       DropDownTextField(
//                         listSpace: 5,
//                         listPadding: ListPadding(top: 20),
//                         enableSearch: false,
//                         validator: (value) {
//                           if (value == null) {
//                             return "Required field";
//                           } else {
//                             return null;
//                           }
//                         },
//                         dropDownList: const [
//                           DropDownValueModel(
//                               name: 'Social media', value: "value1"),
//                           DropDownValueModel(name: 'Bank', value: "value2"),
//                           DropDownValueModel(name: 'Personal', value: "value3"),
//                           DropDownValueModel(name: 'E-Commerce', value: "value4"),
//                           DropDownValueModel(name: 'Others', value: "value5"),
//                         ],
//                         dropDownItemCount: 5,
//                         onChanged: (val) {},
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       const Text(
//                         "Social Media",
//                         style: TextStyle(color: Colors.black26),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       DropDownTextField(
//                         listSpace: 5,
//                         listPadding: ListPadding(top: 20),
//                         enableSearch: false,
//                         validator: (value) {
//                           if (value == null) {
//                             return "Required field";
//                           } else {
//                             return null;
//                           }
//                         },
//                         dropDownList: const [
//                           DropDownValueModel(name: 'Facebook', value: "value1"),
//                           DropDownValueModel(name: 'Instagram', value: "value2"),
//                           DropDownValueModel(name: 'Youtube', value: "value3"),
//                           DropDownValueModel(name: 'Twitter', value: "value4"),
//                           DropDownValueModel(name: 'Pintrest', value: "value5"),
//                         ],
//                         dropDownItemCount: 5,
//                         onChanged: (val) {},
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       const Text(
//                         "User Name",
//                         style: TextStyle(color: Colors.black26),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       TextFormField(
//                         controller: UserNameController,
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       const Text(
//                         "Site Password",
//                         style: TextStyle(color: Colors.black26),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       TextFormField(
//                         controller: PasswordController,
//                         decoration: const InputDecoration(
//                           suffixIcon: Icon(Icons.remove_red_eye),
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       const Text(
//                         "Notes",
//                         style: TextStyle(color: Colors.black26),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                       TextFormField(
//                         controller: NotesController,
//                         maxLines: 3,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 3, color: Colors.white
//                               )
//                           ),
//                           //labelText: 'Enter your username',
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * .02,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.495,
//                       height: MediaQuery.of(context).size.height * 0.057,
//                       child: ElevatedButton(
//                         onPressed: (){
//
//                       },
//                       style: ElevatedButton.styleFrom(
//                         shadowColor: Colors.blueAccent,
//                         shape: const RoundedRectangleBorder(),
//                       ),
//                           child: const Text('Reset'),),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.495,
//                       height: MediaQuery.of(context).size.height * 0.057,
//                       child: ElevatedButton(onPressed: (){
//                         DatabaseService.instance.createSite({
//                           "url": URlController.text,
//                           "siteName": SiteNameController.text,
//                           "sector": SectorController.dropDownValue!.value,
//                           "socialMedia":
//                           SocialMediaController.dropDownValue!.value,
//                           "username": UserNameController.text,
//                           "password": PasswordController.text,
//                         });
//                         DatabaseService.instance.getAllSite();
//                       },
//                         style:ElevatedButton.styleFrom(
//                           shadowColor: Colors.blueAccent,
//                           shape: const RoundedRectangleBorder(),
//                         ),
//                           child: const Text('Save'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//
// decoration: const InputDecoration(
//   border: OutlineInputBorder(
//       borderSide: BorderSide(
//           width: 3, color: Colors.white
//       )
//   ),
//   //labelText: 'Enter your username',
// ),

// class Site_Box extends StatelessWidget {
//   Site_Box({
//     Key? key,
//     required this.logo,
//     required this.name,
//     required this.url,
//   }) : super(key: key);
//
//   String logo, name, url;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
//           height: MediaQuery.of(context).size.height / 6,
//           decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(10))),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 6 * 0.75,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Image.asset(
//                         logo,
//                         scale: 0.85,
//                         fit: BoxFit.fill,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             name,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 14, 133, 255),
//                                 fontSize: 24),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             children: const [
//                               Icon(
//                                 Icons.copy,
//                                 color: Color.fromARGB(255, 42, 142, 241),
//                               ),
//                               Text(
//                                 'Copy Password',
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 42, 142, 241),
//                                     fontSize: 18),
//                               )
//                             ],
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                     color: Color.fromARGB(26, 178, 163, 163),
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(10),
//                         bottomRight: Radius.circular(10))),
//                 height: MediaQuery.of(context).size.height / 6 * 0.25,
//                 child: Center(
//                     child: Text(
//                       url,
//                       style: const TextStyle(fontSize: 18),
//                     )),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
// class Site_Box2 extends StatelessWidget {
//   Site_Box2({
//     Key? key,
//     required this.logo,
//     required this.name,
//     required this.url,
//   }) : super(key: key);
//
//   String logo, name, url;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
//           height: MediaQuery.of(context).size.height / 6,
//           decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(10))),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 6 * 0.75,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Image.asset(
//                         logo,
//                         width: 145,
//                         height: 55,
//                         fit: BoxFit.fill,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             name,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 14, 133, 255),
//                                 fontSize: 24),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             children: const [
//                               Icon(
//                                 Icons.copy,
//                                 color: Color.fromARGB(255, 42, 142, 241),
//                               ),
//                               Text(
//                                 'Copy Password',
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 42, 142, 241),
//                                     fontSize: 18),
//                               )
//                             ],
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                     color: Color.fromARGB(26, 178, 163, 163),
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(10),
//                         bottomRight: Radius.circular(10))),
//                 height: MediaQuery.of(context).size.height / 6 * 0.25,
//                 child: Center(
//                     child: Text(
//                       url,
//                       style: const TextStyle(fontSize: 18),
//                     )),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
// Row(
// children: [
// const Text(
// 'Social Media',
// style: TextStyle(
// fontWeight: FontWeight.normal,
// color: Color(0xFF3C4857),
// fontSize: 20,
// ),
// ),
// const SizedBox(
// width: 10,
// ),
// Container(
// height: 30,
// width: 30,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// color: const Color(0xFF0E85FF),
// ),
// child: const Center(
// child: Text(
// '07',
// style: TextStyle(
// color: Colors.white,
// fontSize: 17.5,
// fontWeight: FontWeight.w500,
// ),
// ),
// ),
// ),
// const SizedBox(
// width: 10,
// ),
// GestureDetector(
// onTap: () {
// print('Drop Down Button clicked');
// },
// child: Image.asset('assets/sites/PathCopy.png'),
// ),
// ],
// ),

// GestureDetector(
//   child: Site_Box(
//     logo: 'assets/sites/Bitmapf.png',
//     name: 'Facebook',
//     url: 'www.facebook.com',
//   ),
//   onDoubleTap: () {
//     Navigator.push(context, MaterialPageRoute(
//         builder: (context) => const SiteDetails()));
//   },
// ),
// GestureDetector(
//   child: Site_Box(
//     logo: 'assets/sites/Bitmap1.png',
//     name: 'YouTube',
//     url: 'www.youtube.com/ssmraok',
//   ),
//   onDoubleTap: () {
//     Navigator.push(context, MaterialPageRoute(
//         builder: (context) => const SiteDetails()));
//   },
// ),
// GestureDetector(
//   child: Site_Box(
//     logo: 'assets/sites/BitmapCopy2.png',
//     name: 'Twitter',
//     url: 'www.twitter.com',
//   ),
//   onDoubleTap: () {
//     Navigator.push(context, MaterialPageRoute(
//         builder: (context) => const SiteDetails()));
//   },
// ),
// GestureDetector(
//   child: Site_Box2(
//     logo: 'assets/sites/Bitmap.png',
//     name: 'Instagram',
//     url: 'www.instagram.com',
//   ),
//   onDoubleTap: () {
//     Navigator.push(context, MaterialPageRoute(
//         builder: (context) => const SiteDetails()));
//   },
// ),

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:password_manage_app/utility/custom_padding.dart';
// import 'package:password_manage_app/utility/textformfield.dart';
// import 'package:password_manage_app/utility/utility.dart';
//
// import '../modelClass/user_model.dart';
// import '../utility/custom_button.dart';
// import '../utility/sqlite_service.dart';
// import 'loginScreen.dart';
//
// class RegisterScreen extends StatefulWidget {
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> with inputValidation {
//   final formKey = GlobalKey<FormState>();
//   final _phoneController = TextEditingController();
//   final _mPinController = TextEditingController();
//   final _confirmMPinController = TextEditingController();
//   DatabaseManager _sqliteService = DatabaseManager();
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     this._sqliteService = DatabaseManager();
//     this._sqliteService.initDb().whenComplete(() async {
//       // _refereshModel();
//       setState(() {});
//     });
//     super.initState();
//   }
//   // void _refereshModel() async {
//   //   final data = await _sqliteService.getUser();
//   //   setState(() {
//   //     _models = data;
//   //     counter = models.length;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [
//             Color.fromRGBO(70, 184, 252, 1),
//             Color.fromRGBO(30, 136, 252, 1)
//           ]),
//         ),
//         child: Form(
//           key: formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 MyTextFormField(
//                   null,
//                   textController: _phoneController,
//                   obscure: false,
//                   myHintText: 'Enter Mobile Number',
//                   callBack: (phone) {
//                     print("phone validator called");
//                     if (phone == null || phone.isEmpty) {
//                       return "Phone number cannot be empty";
//                     }
//                     if (isPhoneValid(phone)) {
//                       return null;
//                     } else
//                       return "Enter a valid Phone number";
//                   },
//                 ),
//                 MyTextFormField(Icons.visibility,
//                     textController: _mPinController,
//                     obscure: true,
//                     myHintText: 'Enter 4 digit MPin', callBack: (mPin) {
//                       print("mPin validator called");
//                       if (mPin == null || mPin.isEmpty) {
//                         return "MPin cannot be empty";
//                       }
//                       if (ismPinValid(mPin)) {
//                         return null;
//                       } else {
//                         return "Enter a valid Mpin";
//                       }
//                     }),
//                 MyTextFormField(Icons.visibility_off,
//                     textController: _confirmMPinController,
//                     obscure: true,
//                     myHintText: 'Re-Enter 4 digit MPin',
//                     callBack: (confirmMPin) {
//                       print("MPin validator called");
//                       if (confirmMPin == null || confirmMPin.isEmpty) {
//                         return "Password cannot be empty";
//                       }
//                       if (confirmMPin != _mPinController.text) {
//                         return "MPin is not matching";
//                       }
//                       if (ismPinValid(confirmMPin)) {
//                         return null;
//                       } else {
//                         return "Enter a MPin password";
//                       }
//                     }),
//                 CustomBtn(
//                     label: "SIGN UP",
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         _sqliteService
//                             .insertModel(UserModel(
//                             mobile: _phoneController.text,
//                             mPin: _mPinController.text))
//                             .whenComplete(() => showToast(
//                             "Congrats!!! Success signin to access the vault",
//                             Color(0xff323232)));
//                         //Navigator.of(context).pushNamed('/base');
//                       }
//                     }),
//               ],
//             ),
//           ),
//         ).paddingAll(15.0),
//       ),
//     );
//   }
// }


//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:passwordmanager/screens/utils/sqlite_services.dart';
// import '../widgets/add_site_textfield.dart';
// import 'package:dropdown_textfield/dropdown_textfield.dart';
//
// class AddSite extends StatefulWidget {
//   String appBarText;
//   AddSite({required this.appBarText});
//   @override
//   State<AddSite> createState() => _AddSiteState();
// }
//
// class _AddSiteState extends State<AddSite> {
//   @override
//   final formKey = GlobalKey<FormState>();
//   FocusNode searchFocusNode = FocusNode();
//   FocusNode textFieldFocusNode = FocusNode();
//   late SingleValueDropDownController _cnt;
//   late MultiValueDropDownController _cntMulti;
//   TextEditingController URlController = TextEditingController();
//   TextEditingController SiteNameController = TextEditingController();
//   SingleValueDropDownController SectorController =
//   SingleValueDropDownController();
//   SingleValueDropDownController SocialMediaController =
//   SingleValueDropDownController();
//   TextEditingController UserNameController = TextEditingController();
//   TextEditingController PasswordController = TextEditingController();
//   TextEditingController NotesController = TextEditingController();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.appBarText}"),
//       ),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(left: 20, right: 20),
//                       // color: Colors.red,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .03,
//                           ),
//                           const Text(
//                             "URL",
//                             style: TextStyle(color: Colors.black26),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           TextFormField(
//                             controller: URlController,
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           const Text(
//                             "Site Name",
//                             style: TextStyle(color: Colors.black26),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           TextFormField(
//                             controller: SiteNameController,
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           const Text(
//                             "Sector/Folder",
//                             style: TextStyle(color: Colors.black26),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           DropDownTextField(
//                             controller: SectorController,
//                             listSpace: 5,
//                             listPadding: ListPadding(top: 20),
//                             enableSearch: false,
//                             validator: (value) {
//                               if (value == null) {
//                                 return "Required field";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             dropDownList: const [
//                               DropDownValueModel(
//                                   name: 'Social media', value: "value1"),
//                               DropDownValueModel(name: 'Bank', value: "value2"),
//                               DropDownValueModel(
//                                   name: 'Personal', value: "value3"),
//                               DropDownValueModel(
//                                   name: 'E-Commerce', value: "value4"),
//                               DropDownValueModel(
//                                   name: 'Others', value: "value5"),
//                             ],
//                             dropDownItemCount: 5,
//                             onChanged: (val) {},
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           const Text(
//                             "Social Media",
//                             style: TextStyle(color: Colors.black26),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           DropDownTextField(
//                             controller: SocialMediaController,
//                             listSpace: 5,
//                             listPadding: ListPadding(top: 20),
//                             enableSearch: false,
//                             validator: (value) {
//                               if (value == null) {
//                                 return "Required field";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             dropDownList: const [
//                               DropDownValueModel(
//                                   name: 'Facebook', value: "value1"),
//                               DropDownValueModel(
//                                   name: 'Instagram', value: "value2"),
//                               DropDownValueModel(
//                                   name: 'Youtube', value: "value3"),
//                               DropDownValueModel(
//                                   name: 'Twitter', value: "value4"),
//                               DropDownValueModel(
//                                   name: 'Pintrest', value: "value5"),
//                             ],
//                             dropDownItemCount: 5,
//                             onChanged: (val) {},
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           const Text(
//                             "User Name",
//                             style: TextStyle(color: Colors.black26),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           TextFormField(
//                             controller: UserNameController,
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           const Text(
//                             "Site Password",
//                             style: TextStyle(color: Colors.black26),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           TextFormField(
//                             controller: PasswordController,
//                             decoration: const InputDecoration(
//                                 suffixIcon: Icon(Icons.remove_red_eye)),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           const Text(
//                             "Notes",
//                             style: TextStyle(color: Colors.black26),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                           TextFormField(
//                             controller: NotesController,
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .02,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * .07,
//                           width: MediaQuery.of(context).size.width * .499,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             child: const Text("Clear"),
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * .07,
//                           width: MediaQuery.of(context).size.width * .499,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               DatabaseService.instance.createSite({
//                                 "url": URlController.text,
//                                 "siteName": SiteNameController.text,
//                                 "sector": SectorController.dropDownValue!.value,
//                                 "socialMedia":
//                                 SocialMediaController.dropDownValue!.value,
//                                 "username": UserNameController.text,
//                                 "password": PasswordController.text,
//                               });
//                               DatabaseService.instance.getAllSite();
//                             },
//                             child: const Text("Submit"),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// CustomBtn(
// label: "SIGN IN",
// onPressed: () async {
// //if (formKey.currentState!.validate()) {
// bool userPresent = false;
// List<UserModel> model = await _sqliteService.getUser();
//
// for (var userModel in model) {
// if (userModel.toJson()["mobile"] ==
// _phoneController.text) {
// userPresent = true;
// if (userModel.toJson()["mPin"] ==
// _mPinController.text) {
// showToast(
// "Congrats!!! Success signin to access the vault",
// Color(0xff323232));
// Navigator.pushReplacement(
// context,
// MaterialPageRoute(
// builder: (context) => HomePage()));
// } else {
// showToast("Invalid Pin", Colors.red);
// }
// }
// }
// if (userPresent == false)
// showToast("User not found", Colors.red);
// //}
// }),

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:passwordmanager/Device.dart';
//
// import '../../sqlite_service.dart';
//
// class SignIn extends StatefulWidget {
//   const SignIn({super.key});
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   late SqliteService sqliteService;
//   List<Note> notes = [];
//   late int id, mpin;
//   TextEditingController inputController = TextEditingController();
//   bool hidden = true;
//   final _formKey1 = GlobalKey<FormState>();
//
//   void initState() {
//     super.initState();
//     this.sqliteService = SqliteService();
//     this.sqliteService.initializeDB().whenComplete(() async {
//       _refereshNotes();
//       setState(() {});
//     });
//   }
//
//   void _refereshNotes() async {
//     final data = await sqliteService.getItems();
//     setState(() {
//       notes = data;
//     });
//   }
//
//   void _submit() {
//     bool exists = false;
//     if (_formKey1.currentState!.validate()) {
//       FocusScope.of(context).unfocus();
//       for (int i = 0; i < notes.length; i++) {
//         if (notes[i].id == id) {
//           if (notes[i].mpin == mpin) {
//             exists = true;
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('LOGIN SUCCESSFULL')),
//             );
//             break;
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('INCORRECT PASSWORD')),
//             );
//             break;
//           }
//         } else
//           continue;
//       }
//
//       if (!exists)
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('USER DOES NOT EXIST')),
//         );
//     }
//     ;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//               Color.fromARGB(255, 53, 177, 249),
//               Color.fromARGB(255, 31, 138, 252)
//             ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//         child: Form(
//             key: _formKey1,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: deviceWidth(context) * 0.073,
//                       right: deviceWidth(context) * 0.073,
//                       top: deviceHeight(context) * 0.065),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.symmetric(
//                             vertical: 19.0, horizontal: 10.0),
//                         hintText: "Mobile Number",
//                         hintStyle: GoogleFonts.openSans(
//                             fontWeight: FontWeight.w600,
//                             color: Color.fromARGB(255, 122, 128, 142)),
//                         filled: true,
//                         fillColor: Colors.white),
//                     keyboardType: TextInputType.number,
//                     onFieldSubmitted: (value) {
//                       //Validator
//                     },
//                     validator: (value) {
//                       if (value == null ||
//                           value.isEmpty ||
//                           !RegExp(r"^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$")
//                               .hasMatch(value)) {
//                         return 'Enter a valid Mobile number!';
//                       }
//
//                       id = int.parse(value);
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: deviceWidth(context) * 0.07,
//                       right: deviceWidth(context) * 0.07,
//                       top: deviceHeight(context) * 0.040),
//                   child: TextFormField(
//                     obscureText: hidden,
//                     decoration: InputDecoration(
//                         suffix: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 hidden = !hidden;
//                               });
//                             },
//                             child: Image.asset("assets/images/eye.png")),
//                         contentPadding: const EdgeInsets.symmetric(
//                             vertical: 20.0, horizontal: 10.0),
//                         hintText: "MPin",
//                         hintStyle: GoogleFonts.openSans(
//                             fontWeight: FontWeight.w600,
//                             color: Color.fromARGB(255, 122, 128, 142)),
//                         filled: true,
//                         fillColor: Colors.white),
//                     keyboardType: TextInputType.number,
//                     onFieldSubmitted: (value) {},
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Enter an MPIN';
//                       }
//
//                       mpin = int.parse(value);
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: deviceWidth(context) * 0.07,
//                       top: deviceHeight(context) * 0.03),
//                   child: GestureDetector(
//                     child: Text(
//                       "Forgot your password?",
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: deviceWidth(context) * 0.07,
//                       top: deviceHeight(context) * 0.05),
//                   child: SizedBox(
//                       width: deviceWidth(context) * 0.36,
//                       height: deviceHeight(context) * 0.06,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white),
//                           onPressed: _submit,
//                           child: Text(
//                             "SIGN IN",
//                             style: TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 18,
//                                 letterSpacing: 1.2),
//                           ))),
//                 ),
//                 Center(
//                     child: Padding(
//                       padding: EdgeInsets.only(top: deviceHeight(context) * 0.065),
//                       child: Image.asset("assets/images/fingerprint icon.png"),
//                     )),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       top: deviceHeight(context) * 0.03,
//                       left: deviceWidth(context) * 0.1),
//                   child: Row(
//                     children: [
//                       Text(
//                         "OR",
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                       Padding(
//                         padding:
//                         EdgeInsets.only(left: deviceWidth(context) * 0.08),
//                         child: Text(
//                           "USE YOUR FINGERPRINT TO LOGIN",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.12),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             )));
//   }
// }
//
// class CustomSnack extends StatelessWidget {
//   const CustomSnack({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }