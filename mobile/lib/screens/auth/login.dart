import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../../utility/apiservice.dart';
import '../../utility/style.dart';

BoxDecoration styleInputContainerDecor = BoxDecoration(
    color: grayColor,
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    border: Border.all(width: 0, color: Colors.white));

InputDecoration styleInputDecor = const InputDecoration(
    border: InputBorder.none,
    labelText: '-',
    labelStyle: TextStyle(
        fontFamily: 'Poppins',
        color: grayTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w500));

var txtEditEmail = TextEditingController();
var txtEditPwd = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _showPassword;

  @override
  void initState() {
    _showPassword = false;
    super.initState();
  }

  void _validateInputs() {
    if (txtEditEmail.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              "Email tidak boleh kosong!",
              style: TextStyle(fontSize: 16),
            )),
      );
      return;
    }
    if (txtEditPwd.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              "Password tidak boleh kosong!",
              style: TextStyle(fontSize: 16),
            )),
      );
      return;
    }
    doLogin(txtEditEmail.text, txtEditPwd.text);
  }

  doLogin(email, password) async {
    // final GlobalKey<State> _keyLoader = GlobalKey<State>();
    // Dialogs.loading(context, _keyLoader, "Proses ...");
    try {
      final response =
          await http.post(Uri.parse("https://pltu.online/api/login"),
              headers: {
                // "Accept": "application/json",
                "Content-Type": "application/x-www-form-urlencoded"
              },
              // encoding: Encoding.getByName("utf-8"),
              body: ({
                "email": email,
                "password": password,
              }));

      final output = jsonDecode(response.body);
      String message = "Tidak ada tindakan";

      if (response.statusCode == 200) {
        Color bgSnack = dangerColor;
        if (output['status'] == "success") {
          message = "Login berhasil";
          bgSnack = successColor;
          var account = output['data']['user'];
          var token = output['data']['token'];
          var sessionManager = SessionManager();
          await sessionManager.set("userName", account['name']);
          await sessionManager.set("userId", account['id']);
          await sessionManager.set("userEmail", account['email']);
          await sessionManager.set("isLoggedIn", true);
          await sessionManager.set("token", token);
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/main', (route) => false);
        } else {
          message = output['message'];
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: bgSnack,
              content: Text(
                message,
                style: const TextStyle(fontSize: 16),
              )),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: dangerColor,
              content: Text(
                "Akses ditolak!",
                style: TextStyle(fontSize: 16),
              )),
        );
      }
    } catch (e) {
      // Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              e.toString() != ""
                  ? e.toString()
                  : "Terjadi kesalahan mendapatkan data server from " +
                      ApiService().baseUrl,
              style: const TextStyle(fontSize: 16),
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 60),
              Center(
                child: Image.asset(
                  'assets/pln-logo.png',
                  height: 80,
                ),
              ),
              const SizedBox(height: 60),
              Form(
                  // key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16.0),
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10.0),
                          decoration: styleInputContainerDecor,
                          child: TextFormField(
                            controller: txtEditEmail,
                            decoration:
                                styleInputDecor.copyWith(labelText: "Email"),
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 14),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String? value) {},
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10.0),
                          decoration: styleInputContainerDecor,
                          child: TextFormField(
                            controller: txtEditPwd,
                            obscureText: !_showPassword,
                            decoration: styleInputDecor.copyWith(
                                labelText: "Password",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  child: Icon(
                                    _showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                )),
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 14),
                            keyboardType: TextInputType.visiblePassword,
                            onSaved: (String? value) {},
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          height: 48.0,
                          width: double.maxFinite,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: primaryColor, // background
                                onPrimary: whiteColor, // foreground
                              ),
                              onPressed: () {
                                // Navigator.of(context).pushNamedAndRemoveUntil(
                                //     '/main', (route) => false);
                                _validateInputs();
                              },
                              child: const Text('Log in')),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            print('lupa password');
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 38),
                        Center(
                          child: Image.asset(
                            'assets/upkngr.png',
                            width: 180,
                          ),
                        ),
                      ])))
            ],
          )),
    );
  }
}
