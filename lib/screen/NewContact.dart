import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/function/function.dart';
import 'package:whatsapp/modal/modalForThis.dart';
import 'package:whatsapp/screen/homeScreen.dart';

class NewContact extends StatefulWidget {
  const NewContact({super.key});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  final name = TextEditingController();

  final number = TextEditingController();

  final sublist = TextEditingController();
  File? addImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b141b),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff0b141b),
        title: const Text(
          'New contact',
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
                      style: const TextStyle(color: Colors.white70),
                      cursorColor: Colors.green,
                      controller: name,
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
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white70),
                      cursorColor: Colors.green,
                      controller: number,
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
              // GestureDetector(
              //   onTap: () {
              //     takeImage();
              //   },
              //   child: CircleAvatar(
              //     radius: 50,
              //     backgroundImage: addImage != null
              //         ? FileImage(addImage!)
              //         : AssetImage('asset/personicon.png') as ImageProvider,
              //   ),
              // ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff25c46a),
                    minimumSize: const Size(double.infinity, 40)),
                onPressed: () {
                  addUserDetails();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const HomeScreen()));
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

  Future<void> addUserDetails() async {
    final username = name.text;
    final numNumber = number.text;
    final subtitle = sublist.text;

    int numbers = int.parse(numNumber);
    final save = whatsapp(
        name: username,
        subtext: subtitle,
        phoneNumber: numbers,
        image: addImage);
    addUser(save);
  }

  Future takeImage() async {
    final addimg = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (addimg == null) {
      return;
    } else {
      setState(() {
        addImage = File(addimg.path);
      });
    }
  }
}
