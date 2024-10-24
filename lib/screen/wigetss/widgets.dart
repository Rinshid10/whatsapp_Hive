import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget rowForIocns(
    {required IconData giveIconName, required String textforThat}) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(30),
    child: Container(
      height: 70,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff0b141b),
          border: Border.all(color: Colors.white24)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            giveIconName,
            color: Colors.green,
            size: 30,
          ),
          const Gap(3),
          Text(
            textforThat,
            style: const TextStyle(fontSize: 13, color: Colors.white),
          )
        ],
      ),
    ),
  );
}

Widget listTileFOr2(
    {required IconData giveIconName, required String textforThat}) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(30),
    child: Container(
      margin: const EdgeInsets.only(left: 15),
      child: ListTile(
        leading: Icon(
          giveIconName,
          color: Colors.white70,
        ),
        horizontalTitleGap: 30,
        title: Text(
          textforThat,
          style: const TextStyle(fontSize: 17, color: Colors.white),
        ),
      ),
    ),
  );
}

Widget listTileFOrAlsoTitle(
    {required IconData giveIconName,
    required String textforThat,
    required String subtit}) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(30),
    child: Container(
      margin: const EdgeInsets.only(left: 15),
      child: ListTile(
        leading: Icon(
          giveIconName,
          color: Colors.white70,
        ),
        horizontalTitleGap: 30,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            textforThat,
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
        subtitle: Text(
          subtit,
          style: const TextStyle(fontSize: 15, color: Colors.white60),
        ),
      ),
    ),
  );
}
