import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mini_app/screens/drawer.dart';
import 'package:mini_app/screens/set_details.dart';
import '../models/modelsdb.dart';
import '../services/addservice.dart';
import '../utilites/custom.dart';
import 'add_site.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _searchDetails = false;
  String? selectedValue;
  List<String> items = [
    'Social media',
    'Bank',
    'Personal',
    'E-Commerce',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Image.asset('assets/sites/PASSMANAGER.png'),
          backgroundColor: const Color(0xFF0E85FF),
          elevation: 10,
          // leadingWidth: 30,
          leading: IconButton(onPressed: (){
            _scaffoldkey.currentState!.openDrawer();
          }, icon: Image.asset('assets/appbar/burger_menu.png'),
          ),
          actions: [
            GestureDetector(child: Image.asset('assets/appbar/search.png') ,onTap:() {
              setState(() {
                _searchDetails = !_searchDetails;
              });
            } ,),
            Image.asset('assets/appbar/sync_icn.png'),
            Image.asset('assets/appbar/profile.png'),
          ],
        ),
        drawer:  DrawerPage(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _searchDetails
                    ? Container(
                     padding: const EdgeInsets.all(5),
                     height: 59,
                     color: Colors.grey.shade200,
                     child: Row(
                      children: <Widget>[
                       Expanded(
                         child: TextField(
                           onSubmitted: (value) {},
                           decoration: const InputDecoration(
                               border: InputBorder.none,
                               contentPadding:
                               EdgeInsets.symmetric(horizontal: 15),
                               hintText: "Type Keywords to search"),
                         ),
                       ),
                       IconButton(
                           onPressed: () {},
                           icon: const Icon(Icons.arrow_forward,
                               color: Color(0xFF0E85FF)))
                     ],
                    ),
                  ) : const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:   [
                          const Text(
                            'Sites',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3C4857),
                                fontSize: 30),
                          ),
                          Container(
                            height: 4,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFFFA222),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownButton2(
                      hint: Text(
                        'Select Category',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map(
                            (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ).toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      buttonHeight: 60,
                      buttonWidth: 200,
                      itemHeight: 40,
                    ),
                  ],
                ),
                FutureBuilder(
                  future: DatabaseService.instance.getAllSite(),
                  builder: (
                      BuildContext context,
                      AsyncSnapshot<List<Site>> snapshot,
                      ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text('Error ${snapshot.error.toString()}');
                      } else if (snapshot.hasData) {
                        List<Site> site = snapshot.data!;
                        return site.length > 0
                            ? Container(
                              height: MediaQuery.of(context).size.height - 198,
                              child: ListView.builder(
                              itemCount: site.length,
                              itemBuilder: (context, i) {
                                print(site[i]);
                                return InkWell(
                                    child: CustomCard(site: site[i]),
                                onTap: (){
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context)=>
                                          SiteDetails(
                                            site: site[i],
                                          ),
                                          ),
                                      );
                                },);
                              }),
                        ) : const Text("nothing to show here");
                      } else {
                        return const Center(child: Text('Empty data'));
                      }
                    } else {
                      return Text('State: ${snapshot.connectionState}');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) =>
                AddSite(appBarText: 'Add Site',)));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
