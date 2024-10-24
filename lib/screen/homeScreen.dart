import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/function/function.dart';
import 'package:whatsapp/screen/selectContact.dart';
import 'package:whatsapp/screen/userChat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    viewAlluser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff21c063),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => const SelectContact()));
        },
        child: const Icon(Icons.chat),
      ),
      backgroundColor: const Color(0xff0b141b),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b141b),
        title: const Text(
          'WhatsApp',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Icon(
                  Icons.qr_code_scanner,
                  color: Colors.white,
                ),
                Gap(20),
                Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                ),
                Gap(20),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: 'Ask Meta AI or Search..',
                    hintStyle: const TextStyle(color: Colors.white38),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.radio_button_unchecked,
                      color: Color(0xff0989e4),
                    ),
                    fillColor: const Color(0xff242b31),
                    border: const OutlineInputBorder()),
              ),
            ),
            const Gap(10),
            Expanded(
                child: ValueListenableBuilder(
              valueListenable: whatsappListener,
              builder: (context, data, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final saveData = data[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => UserChat(
                                      images: saveData.image,
                                      name: saveData.name,
                                      index: index,
                                      phoneNumber: saveData.phoneNumber,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: GestureDetector(
                          onLongPress: () {
                            deleteUser(index);
                          },
                          child: ListTile(
                            leading: SizedBox(
                              width: 70,
                              // height: 70,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: saveData.image != null
                                    ? FileImage(saveData.image)
                                    : const AssetImage('asset/personicon.png')
                                        as ImageProvider,
                              ),
                            ),
                            trailing: Column(
                              children: [
                                const Text(
                                  '8/10/24',
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 13),
                                ),
                                const Gap(5),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.green[300],
                                  child: const Text(
                                    '4',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                            subtitle: const Text(
                              'dfdfd',
                              style: TextStyle(color: Colors.white38),
                            ),
                            title: Text(
                              saveData.name.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
