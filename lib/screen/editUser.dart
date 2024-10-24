import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/function/function.dart';
import 'package:whatsapp/modal/modalForThis.dart';
import 'package:whatsapp/screen/homeScreen.dart';

class EditUser extends StatefulWidget {
  String? name;
  int? phone;
  int index;
  EditUser({
    super.key,
    required this.name,
    required this.phone,
    required this.index,
  });

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController enterName = TextEditingController();
  TextEditingController enterPhoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    enterName = TextEditingController(text: widget.name);
    enterPhoneNumber = TextEditingController(text: widget.phone.toString());
    return Scaffold(
      backgroundColor: const Color(0xff0b141b),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff0b141b),
        title: const Text(
          'Edit Contact',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.white70,
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 280,
                    child: TextField(
                      controller: enterName,
                      style: const TextStyle(color: Colors.white70),
                      cursorColor: Colors.green,
                      decoration: const InputDecoration(
                          hintText: 'First Name',
                          hintStyle: TextStyle(color: Colors.white60),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.call,
                    color: Colors.white70,
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 280,
                    child: TextField(
                      maxLength: 10,
                      controller: enterPhoneNumber,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white70),
                      cursorColor: Colors.green,
                      decoration: const InputDecoration(
                          hintText: 'Enter Phone number',
                          hintStyle: TextStyle(color: Colors.white60),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.download,
                    color: Colors.white70,
                  ),
                  Gap(10),
                  SizedBox(
                    width: 280,
                    child: TextField(
                      style: TextStyle(color: Colors.white70),
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                          labelText: 'Save to',
                          labelStyle: TextStyle(color: Colors.green),
                          hintStyle: TextStyle(color: Colors.white60),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                  ),
                ],
              ),
              const Gap(40),
              Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Add Information',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff25c46a),
                        )),
                  )),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff25c46a),
                    minimumSize: const Size(double.infinity, 40)),
                onPressed: () {
                  forEditingUserDetails();
                },
                child: const Text('Save',
                    style: TextStyle(
                      color: Colors.black,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future forEditingUserDetails() async {
    final name = enterName.text;
    var number = enterPhoneNumber.text;
    int numberToInt = int.parse(number);
    final saved = whatsapp(name: name, subtext: '', phoneNumber: numberToInt);
    editUser(widget.index, saved);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => const HomeScreen()));
  }
}
