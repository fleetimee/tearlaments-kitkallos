import 'package:fleetime_invitation/common/constant/string_constant.dart';
import 'package:fleetime_invitation/common/utils/countdown_timer.dart';
import 'package:fleetime_invitation/ui/main_menu/components/main_menu_ui_announcement_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({Key? key, required this.pageController, this.nama})
      : super(key: key);

  final PageController pageController;
  final String? nama;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_header2.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment(0.0, 0.3),
                  colorFilter: ColorFilter.mode(
                    Colors.black54,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  const Text(
                    'Halo',
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    nama ?? 'Guest'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 4.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 70.0),
                  const Text(
                    'Countdown Acara',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  const CountdownTimer()
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              StringConstant.greeting,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.montaga().fontFamily,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              MainMenuAnnouncementCard(
                pageController: pageController,
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.52,
                child: Image.asset(
                  'assets/images/flower.png',
                  fit: BoxFit.contain,
                  height: 100,
                  alignment: Alignment.topCenter,
                ),
              )
            ],
          ),
          const SizedBox(height: 120.0),
        ],
      ),
    );
  }
}
