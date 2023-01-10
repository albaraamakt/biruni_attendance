import 'package:flutter/material.dart';

import '../widgets/custom_shake_widget.dart';
import 'qrpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late GlobalKey<FormState> _formKey;
  late GlobalKey<CustomShakeWidgetState> _emailIDState;
  late GlobalKey<CustomShakeWidgetState> _passwordState;
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;
  late AnimationController _animationController;
  late Animation _animation;
  List<String> users = ['Öğrenci', 'Akadmesiyen'];
  var selectedUser = 'Öğrenci';

  @override
  void initState() {
    _formKey = GlobalKey();
    _emailIDState = GlobalKey();
    _passwordState = GlobalKey();
    _emailEditingController = TextEditingController(text: "");
    _passwordEditingController = TextEditingController(text: "");
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 100));
    _animation = Tween(begin: 0.0, end: 15.0).animate(_animationController);
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _emailIDState.currentState?.dispose();
    _passwordState.currentState?.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Column(
              children: const [
                Text("Biruni Üniversitesi"),
                Text(
                  "Yoklama Sistemi",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromRGBO(29, 79, 145, 1),
            centerTitle: true,
            toolbarHeight: 140,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(100, 15),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _animation.value,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              "lib/assets/ZQkhbLET_400x400.jpg",
                              height: 300,
                              width: 350,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 8.0),
                            child: DropdownButtonFormField<String>(
                                items: users
                                    .map<DropdownMenuItem<String>>((users) {
                                  return DropdownMenuItem(
                                      value: users, child: Text(users));
                                }).toList(),
                                value: selectedUser,
                                onChanged: (newUser) {
                                  selectedUser = newUser!;
                                }),
                          ),
                          CustomShakeWidget(
                            key: _emailIDState,
                            duration: const Duration(milliseconds: 800),
                            shakeCount: 4,
                            shakeOffset: 10,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 8, 0.0, 8.0),
                              child: TextFormField(
                                controller: _emailEditingController,
                                decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromRGBO(
                                              137, 137, 137, 1)), //<-- SEE HERE
                                    ),
                                    labelText: "Öğrenci Numarası",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromRGBO(
                                              137, 137, 137, 1)), //<-- SEE HERE
                                    ),
                                    prefixIcon: Icon(IconData(0xf522,
                                        fontFamily: 'MaterialIcons'))),
                                validator: (value) {
                                  if (value?.isNotEmpty == true) {
                                    return "Öğrenci Numarası geçersizdir";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ),
                          CustomShakeWidget(
                            key: _passwordState,
                            duration: const Duration(milliseconds: 800),
                            shakeCount: 4,
                            shakeOffset: 10,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                              child: TextFormField(
                                controller: _passwordEditingController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromRGBO(
                                              137, 137, 137, 1)), //<-- SEE HERE
                                    ),
                                    labelText: "Şifre",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromRGBO(
                                              137, 137, 137, 1)), //<-- SEE HERE
                                    ),
                                    prefixIcon: Icon(IconData(0xe47a,
                                        fontFamily: 'MaterialIcons'))),
                                validator: (value) {
                                  if (value?.isNotEmpty == true) {
                                    return "Şifre yanlıştır";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(29, 79, 145, 1),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 20),
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                _formKey.currentState?.validate();
                                if (_emailEditingController.text !=
                                        '200404902' ||
                                    _passwordEditingController.text !=
                                        '12345') {
                                  _emailIDState.currentState?.shake();
                                  _passwordState.currentState?.shake();
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const QRPage()),
                                  );
                                }
                              },
                              child: const Text("Otrum aç"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
