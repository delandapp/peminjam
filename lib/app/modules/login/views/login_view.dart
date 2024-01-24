import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Stembook'),
        centerTitle: true,
      ),
      body: Container(
          child: Form(
        key: controller.formKey,
        child: Column(

          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              child: Text("Username", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(hintText: 'Masukan username',  border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'username wajib di isi';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              child: Text("Password", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(hintText: 'Masukan password', border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password wajib di isi';
                  }
                  return null;
                },
              ),
            ),
            Obx(() => controller.loadingLogin.value
                ? CircularProgressIndicator()
                :  Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: ElevatedButton(

                  onPressed: () {
                    controller.login();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text('Login'),
                  ),
            ),
            ),
            ),
          ],
        ),
      )),
    );
  }
}
