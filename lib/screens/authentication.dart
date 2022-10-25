
import 'package:flutter/material.dart';
import 'package:mini_app/screens/sign_in.dart';
import 'package:mini_app/screens/sign_up.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final formKey = GlobalKey<FormState>();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(70, 184, 252, 1),
            Color.fromRGBO(30, 136, 252, 1)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/page1/logo.png"),
                  const SizedBox(
                    height: 40
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: const Text("SIGN IN",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )
                                  // Theme.of(context).textTheme.headline6,
                              ),
                              onTap: () {
                                setState(() {
                                  index = 0;
                                });
                              },
                            ),
                            GestureDetector(
                              child: const Text("SIGN UP",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  ),
                              onTap: () {
                                setState(() {
                                  index = 1;
                                });
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 3.5,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: index == 0
                                    ? const Color(0xFFFFA222)
                                    : Colors.transparent,
                              ),
                            ),
                            Container(
                              height: 3.5,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: index == 1
                                    ? const Color(0xFFFFA222)
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.white30,
                        ),
                        IndexedStack(
                          index: index,
                          children: [SignIn(), SignUp()],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
