//
// import 'package:flutter/material.dart';
// import 'package:dropdown_textfield/dropdown_textfield.dart';
// import 'package:mini_app/screens/home_screen.dart';
// import 'package:mini_app/services/addservice.dart';
// import 'package:mini_app/utilites/textfield_validation.dart';
// import '../models/modelsdb.dart';
//
//
// class EditScreen extends StatefulWidget {
//   Site? site;
//   int? userid;
//    EditScreen({Key? key,this.site}) : super(key: key);
//
//   @override
//   State<EditScreen> createState() => _EditScreenState();
// }
//
// class _EditScreenState extends State<EditScreen> {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   TextEditingController uRlController = TextEditingController();
//   TextEditingController siteNameController = TextEditingController();
//   SingleValueDropDownController sectorController =
//   SingleValueDropDownController();
//   SingleValueDropDownController socialMediaController =
//   SingleValueDropDownController();
//   TextEditingController userNameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController notesController = TextEditingController();
//   bool _passwordVisible = false;
//
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   if (widget.site != null) {
//   //     uRlController.text = widget.site!.url;
//   //     siteNameController.text = widget.site!.siteName;
//   //     userNameController.text = widget.site!.username;
//   //     passwordController.text = widget.site!.password;
//   //     notesController.text = widget.site!.notes;
//   //
//   //     setState(() {});
//   //   }
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit'),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
//             child: SingleChildScrollView(
//               child: Form(
//                 key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text('URL',
//                       style: TextStyle(
//                         color: Colors.grey,fontSize: 18
//                       ),),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       SiteField(
//                           textController: uRlController),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text('Site Name',
//                       style: TextStyle(
//                         color: Colors.grey,fontSize: 18
//                       ),),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       SiteField(
//                           textController: siteNameController),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         'Sector/Folder',
//                         style: TextStyle(color: Colors.grey, fontSize: 18),
//                       ),
//                       const SizedBox(
//                         height: 10,
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
//                         dropDownList:  const [
//                           DropDownValueModel(name: 'Social media', value: "Social media"),
//                           DropDownValueModel(name: 'Bank', value: "Bank"),
//                           DropDownValueModel(name: 'Personal', value: "Personal"),
//                           DropDownValueModel(name: 'E-Commerce', value: "E-Commerce"),
//                           DropDownValueModel(name: 'Others', value: "Others"),
//                         ],
//                         dropDownItemCount: 5,
//                         onChanged: (val) {},
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         'User Name',
//                         style: TextStyle(color: Colors.grey, fontSize: 18),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       SiteField(
//                           textController: userNameController),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         'Site Password',
//                         style: TextStyle(color: Colors.grey, fontSize: 18),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: passwordController,
//                         obscureText: !_passwordVisible,
//                         //This will obscure text dynamically
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelStyle:  const TextStyle(color: Colors.black54),
//                           enabledBorder:  const OutlineInputBorder(
//                             borderSide:
//                             BorderSide(color: Colors.black12, width: 1.0),
//                           ),
//                           contentPadding: const EdgeInsets.all(8.0),
//                           hintStyle:  const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black45,
//                           ),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _passwordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: Theme.of(context).primaryColorDark,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _passwordVisible = !_passwordVisible;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         'Notes',
//                         style: TextStyle(color: Colors.grey, fontSize: 18),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         maxLines: 3,
//                         controller: notesController,
//                         style: const TextStyle(
//                           backgroundColor: Color.fromRGBO(0, 0, 0, 0),
//                           color: Colors.black,
//                           fontSize: 22,
//                         ),
//                         decoration: const InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelStyle: TextStyle(color: Colors.black54),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black12, width: 1.0),
//                           ),
//                           contentPadding: EdgeInsets.all(8.0),
//                           hintStyle: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black45,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//               ),
//             ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: Container(
//                 color: const Color.fromARGB(255, 14, 133, 255),
//                 width: MediaQuery.of(context).size.width,
//                 height: 55,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       if (widget.site != null)
//                         DatabaseService.instance.updateSite({
//                           'id': widget.site!.id,
//                           'userid': widget.userid,
//                           'url': uRlController.text,
//                           'siteName': siteNameController.text,
//                           'username': userNameController.text,
//                           'password': passwordController.text,
//                           'notes': notesController.text,
//                         });
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => const HomeScreen()));
//                     },
//                     child: Text(widget.site != null ?  "Add":"Update" )),
//               ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
