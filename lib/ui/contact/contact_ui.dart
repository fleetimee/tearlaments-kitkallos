import 'package:fleetime_invitation/common/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
        vertical: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/images/flower.png',
              fit: BoxFit.contain,
              height: 100,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(height: 10.0),
          const Center(
            child: Text(
              'Contact Kami',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w200,
                letterSpacing: 4.0,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Jika ada pertanyaan, silahkan hubungi kami di:',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.montaga().fontFamily,
            ),
          ),
          const SizedBox(height: 20.0),
          ListView.builder(
            itemCount: myContact.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey[200],
                elevation: 1.0,
                child: ListTile(
                  horizontalTitleGap: 0.0,
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.person),
                    ],
                  ),
                  title: Text(
                    myContact[index].name,
                    style: const TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  subtitle: Text(
                    myContact[index].phoneNumber,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.appBarFont,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ContactCard {
  final String name;
  final String phoneNumber;

  ContactCard({
    required this.name,
    required this.phoneNumber,
  });
}

final List<ContactCard> myContact = [
  ContactCard(
    name: 'Maryana',
    phoneNumber: '+6287880024433',
  ),
  ContactCard(
    name: 'Novian Andika',
    phoneNumber: '+6283840663610',
  ),
];
