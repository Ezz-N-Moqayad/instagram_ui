import 'package:flutter/material.dart';
import 'package:instagram_ui/app/shared/textstyles.dart';
import 'package:sizer/sizer.dart';

class StoryBlock extends StatelessWidget {
  const StoryBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List storyData = [
      {"image": "assets/images/p_1.jpeg", "name": "Sara"},
      {"image": "assets/images/p_2.jpeg", "name": "William"},
      {"image": "assets/images/p_3.jpeg", "name": "Michael"},
      {"image": "assets/images/p_4.jpeg", "name": "Lily"},
      {"image": "assets/images/p_5.jpeg", "name": "Rohann"},
      {"image": "assets/images/p_6.jpeg", "name": "_Mina"},
      {"image": "assets/images/p_7.jpeg", "name": "Anthony12"},
    ];

    _storyBlock({required String name, required String image}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF3366FF),
                      Color(0xFF00CCFF),
                    ]),
                    shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CircleAvatar(
                      radius: 26, backgroundImage: AssetImage(image)),
                )),
            SizedBox(height: 0.3.h),
            Text(name, style: KCustomTextStyle.kMedium(context, 8))
          ],
        ),
      );
    }

    return SizedBox(
      height: 10.h,
      width: 100.w,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: storyData.length,
        itemBuilder: (BuildContext context, int index) {
          return _storyBlock(
              name: storyData[index]['name'], image: storyData[index]['image']);
        },
      ),
    );
  }
}
