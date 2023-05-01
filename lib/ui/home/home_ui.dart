import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:fleetime_invitation/common/constant/color_constant.dart';
import 'package:fleetime_invitation/ui/contact/contact_ui.dart';
import 'package:fleetime_invitation/ui/gallery/gallery_ui.dart';
import 'package:fleetime_invitation/ui/main_menu/main_menu_ui.dart';
import 'package:fleetime_invitation/ui/maps/maps_ui.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String? nama;

  const Home({
    super.key,
    this.nama,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController(initialPage: 2);

  int maxCount = 5;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      const MapsPage(),
      GalleryPage(),
      MainMenuPage(
        pageController: _pageController,
        nama: widget.nama,
      ),
      const ContactPage(),
      const Page5(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nicky'.toUpperCase(),
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w200,
            letterSpacing: 2.0,
            color: ColorConstant.appBarFont,
          ),
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              pageController: _pageController,
              color: Theme.of(context).primaryColor,
              showLabel: false,
              notchColor: ColorConstant.appBarFont,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.location_on_sharp,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.location_on_sharp,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.photo,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.photo,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 2',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.contact_support,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.contact_support,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 5',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 4',
                ),
              ],
              onTap: (index) {
                /// control your animation using page controller
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  // curve like iOS
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              },
            )
          : null,
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'About',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: ColorConstant.appBarFont,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'fleetime invitation app',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w200,
                letterSpacing: 2.0,
                color: ColorConstant.appBarFont,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w200,
                letterSpacing: 2.0,
                color: ColorConstant.appBarFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
