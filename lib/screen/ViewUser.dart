import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/function/function.dart';
import 'package:whatsapp/screen/editUser.dart';
import 'package:whatsapp/screen/homeScreen.dart';
import 'package:whatsapp/screen/wigetss/widgets.dart';

class Viewuser extends StatelessWidget {
  String? name;
  int? phoneNumber;
  int index;
  Viewuser(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0b141b),
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 27,
      ),
      backgroundColor: const Color(0xff0b141b),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onLongPress: () {
                showAlertBox(context, index);
              },
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => EditUser(
                            name: name, phone: phoneNumber, index: index)));
              },
              child: SizedBox(
                height: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xff627885),
                          radius: 70,
                          child: Icon(
                            Icons.person,
                            size: 100,
                            color: Colors.white70,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          name.toString(),
                          style: const TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          phoneNumber.toString(),
                          style: const TextStyle(fontSize: 20, color: Colors.white60),
                        ),
                        const Gap(15),
                        Row(
                          children: [
                            rowForIocns(
                                giveIconName: Icons.call, textforThat: 'Audio'),
                            const Gap(10),
                            rowForIocns(
                                giveIconName: Icons.videocam,
                                textforThat: 'Video'),
                            const Gap(10),
                            rowForIocns(
                                giveIconName: Icons.currency_rupee_sharp,
                                textforThat: 'Pay'),
                            const Gap(10),
                            rowForIocns(
                                giveIconName: Icons.search,
                                textforThat: 'Search'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 10,
              color: Colors.black,
            ),
            listTileFOr2(
                giveIconName: Icons.notifications,
                textforThat: 'Notifications'),
            const Gap(10),
            listTileFOr2(
                giveIconName: Icons.image, textforThat: 'Media Visibility'),
            const Gap(15),
            const Divider(
              thickness: 10,
              color: Colors.black,
            ),
            listTileFOrAlsoTitle(
                giveIconName: Icons.lock,
                textforThat: 'Encryption',
                subtit:
                    'Message and calls are end-to-end\nencrypted.Tap to verify'),
            const Gap(10),
            listTileFOrAlsoTitle(
                giveIconName: Icons.speed,
                textforThat: 'Disappearing messages',
                subtit: 'Off'),
            const Gap(10),
            listTileFOrAlsoTitle(
                giveIconName: Icons.speaker_notes_off,
                textforThat: 'Chat lock',
                subtit: 'Lock and hide this chat on this \ndevice'),
          ],
        ),
      ),
    );
  }
}

void showAlertBox(BuildContext context, index) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Do you want to delete this contact'),
        actions: [
          TextButton(
              onPressed: () {
                deleteUser(index);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => const HomeScreen()));
              },
              child: const Text('Ok'))
        ],
      );
    },
  );
}
