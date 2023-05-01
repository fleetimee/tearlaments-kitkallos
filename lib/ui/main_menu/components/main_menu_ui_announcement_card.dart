import 'package:fleetime_invitation/common/constant/color_constant.dart';
import 'package:flutter/material.dart';

class MainMenuAnnouncementCard extends StatelessWidget {
  const MainMenuAnnouncementCard({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Container(
        // make outline border around the container
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstant.borderColor,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Text(
              'Khitanan'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Nicky Akbar Dwi Cahyo'.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 35.0,
                  color: ColorConstant.appBarFont,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.calendar_today,
                  color: ColorConstant.appBarFont,
                ),
                SizedBox(width: 10.0),
                Text(
                  'Minggu, 7 Mei 2023',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 20.0,
                    color: ColorConstant.appBarFont,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.access_time,
                  color: ColorConstant.appBarFont,
                ),
                SizedBox(width: 10.0),
                Text(
                  '10.00 - Selesai',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 20.0,
                    color: ColorConstant.appBarFont,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 250,
                  child: Text(
                    'Primavera Residence Blok G5/No 22 Bojong, Klapanunggal, Cilengsi',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            // Button to switch to the first page
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the first index pageview
                pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: ColorConstant.appBarFont,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Lihat Lokasi'),
            ),
          ],
        ),
      ),
    );
  }
}
