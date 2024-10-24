import 'package:flutter/material.dart';
import 'package:whatsapp/call.dart';
import 'package:whatsapp/comunity.dart';
import 'package:whatsapp/screen/homeScreen.dart';
import 'package:whatsapp/statues.dart';

class BottemForWhatsApp extends StatefulWidget {
  const BottemForWhatsApp({super.key});

  @override
  State<BottemForWhatsApp> createState() => _BottemForWhatsAppState();
}

class _BottemForWhatsAppState extends State<BottemForWhatsApp> {
  int currentIndex = 0; 
  final pagesOfwhatsapp = [
    const HomeScreen(),
    const States(),
    const Comunity(),
    const Call(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesOfwhatsapp[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: const Color(0xff0b141b),
        selectedItemColor: Colors.white, 
        unselectedItemColor: Colors.grey, 
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot), label: 'States'), 
          BottomNavigationBarItem(
              icon: Icon(Icons.group), label: 'Community'), 
          BottomNavigationBarItem(
              icon: Icon(Icons.call), label: 'Calls'), 
        ],
      ),
    );
  }
}
