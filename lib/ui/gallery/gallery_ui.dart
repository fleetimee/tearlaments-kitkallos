import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({Key? key}) : super(key: key);

  final List<String> imagePath = [
    'assets/images/gallery_image1.jpg',
    'assets/images/gallery_image2.jpg',
    'assets/images/gallery_image3.jpg',
    'assets/images/gallery_image4.jpg',
    'assets/images/gallery_image5.jpg',
    'assets/images/gallery_image6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gallery',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w200,
              letterSpacing: 4.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: GridView.builder(
              itemCount: imagePath.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(imagePath[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
