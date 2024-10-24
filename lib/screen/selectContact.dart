import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/function/function.dart';
import 'package:whatsapp/screen/NewContact.dart';

class SelectContact extends StatelessWidget {
  const SelectContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b141b),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff0b141b),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contact',
              style: TextStyle(fontSize: 20, color: Colors.white70),
            ),
            Text(
              '320 contacts',
              style: TextStyle(fontSize: 13, color: Colors.white60),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.white70),
                Gap(20),
                Icon(Icons.more_vert, color: Colors.white70),
              ],
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(10),
          listtileForContact(titile: 'New Group', giveName: Icons.group_add),
          const Gap(10),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => const NewContact()));
              },
              child: listtileForContact(
                  titile: 'New contact', giveName: Icons.person_add)),
          const Gap(10),
          listtileForContact(titile: 'New community', giveName: Icons.groups),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            child: const Text(
              'Contancts on Whatsapp',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: whatsappListener,
            builder: (context, contactSee, child) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final cont = contactSee[index];
                    return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                          cont.name.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        minVerticalPadding: 17,
                        subtitle: const Text(
                          'dfdfdf',
                          style: TextStyle(color: Colors.white60),
                        ));
                  },
                  itemCount: contactSee.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

Widget listtileForContact(
    {required String titile, required IconData giveName}) {
  return ListTile(
    leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: const Color(0xff25c46a), borderRadius: BorderRadius.circular(50)),
        child: Icon(
          giveName,
          color: Colors.black,
        )),
    horizontalTitleGap: 20,
    title: Text(
      titile,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
