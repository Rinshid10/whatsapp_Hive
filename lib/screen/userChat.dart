import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/screen/ViewUser.dart';

class UserChat extends StatefulWidget {
  String? name;
  int index;
  int? phoneNumber;
  String? images;
  UserChat(
      {super.key,
      required this.name,
      required this.index,
      this.phoneNumber,
      this.images});

  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff09141a),
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageIcon(
              AssetImage(widget.images ?? 'asset/personicon.png'),
              size: 50,
            ),
            const Gap(10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => Viewuser(
                              name: widget.name,
                              phoneNumber: widget.phoneNumber,
                              index: widget.index,
                            )));
              },
              child: Text(
                widget.name.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ],
        ),
        // leading: Row(
        //   mainAxisSize: MainAxisSize.min,

        //   children: [
        //     Container(
        //       child: ImageIcon(
        //         size: 55,
        //         AssetImage('asset/personicon.png'),
        //         color: Colors.white,
        //       ),
        //     ),
        //   ],
        // ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff191f26),
        // title: GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (ctx) => EditUser(
        //                 name: widget.name, phoneNumber: widget.phoneNumber)));
        //   },
        //   child: Text(
        //     widget.name.toString(),
        //     style: TextStyle(color: Colors.white, fontSize: 20),
        //   ),
        // ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Icon(
                  Icons.videocam,
                  color: Colors.white,
                ),
                Gap(15),
                Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                Gap(15),
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
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            bottom: 10,
                          ),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              filled: true,
                              fillColor: const Color(0xff242b31),
                              prefixIcon:
                                  const Icon(Icons.mood, color: Colors.white54),
                              hintText: 'Message',
                              hintStyle: const TextStyle(color: Colors.white54),
                              suffixIcon: Container(
                                width: 96,
                                margin: const EdgeInsets.only(right: 10),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.attach_file,
                                        color: Colors.white54),
                                    Gap(10),
                                    Icon(Icons.currency_rupee_sharp,
                                        color: Colors.white54),
                                    Gap(10),
                                    Icon(Icons.photo_camera,
                                        color: Colors.white54),
                                  ],
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 10,
                          bottom: 10,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff25c46a),
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.mic,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
