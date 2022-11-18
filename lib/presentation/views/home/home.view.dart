import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_ui/app/shared/colors.dart';
import 'package:instagram_ui/app/shared/dimensions.dart';
import 'package:instagram_ui/cubit/theme/cubit/theme_cubit.dart';
import 'package:instagram_ui/presentation/views/home/components/story_block.dart';
import 'components/post_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeNotifier(bool renderUI) =>
        BlocProvider.of<ThemeCubit>(context, listen: renderUI);
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              vSizedBox1,
              Row(
                children: [
                  hSizedBox1,
                  themeNotifier(true).isDark
                      ? Image.asset("assets/images/logo.png", scale: 12)
                      : Image.asset("assets/images/logo_white.png", scale: 7),
                  const Spacer(),
                  Icon(Icons.add_box_outlined,
                      color: KConstantColors.conditionalColor(context: context),
                      size: 28),
                  hSizedBox3,
                  Icon(FontAwesomeIcons.facebookMessenger,
                      color: KConstantColors.conditionalColor(context: context),
                      size: 24),
                  hSizedBox3,
                  Icon(EvaIcons.shareOutline,
                      color: KConstantColors.conditionalColor(context: context),
                      size: 24),
                  hSizedBox3,
                ],
              ),
              vSizedBox2,
              StoryBlock(),
              Divider(
                  color: KConstantColors.conditionalColor(context: context),
                  thickness: 0.1),
              const Feed()
            ],
          ),
        ),
      ),
    );
  }
}

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List postData = [
      {
        "caption": "Amazing weather",
        "dp": "assets/images/p_2.jpeg",
        "name": "Sara",
        "image": "assets/images/fp_1.jpg",
        "location": "Amsterdam",
      },
      {
        "caption": "Amazing weather",
        "dp": "assets/images/p_1.jpeg",
        "name": "Sara",
        "image": "assets/images/fp_2.jpeg",
        "location": "Paris",
      }
    ];

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: postData.length,
        itemBuilder: (BuildContext context, int index) {
          return PostBlock(data: postData[index]);
        },
      ),
    );
  }
}
