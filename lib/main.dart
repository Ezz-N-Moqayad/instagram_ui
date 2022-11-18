import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_ui/app/routes/app.routes.dart';
import 'package:instagram_ui/app/shared/colors.dart';
import 'package:sizer/sizer.dart';
import 'cubit/theme/cubit/theme_cubit.dart';

void main() {
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          ThemeCubit themeCubit =
              BlocProvider.of<ThemeCubit>(context, listen: true);
          return MaterialApp(
              theme: ThemeData(
                  backgroundColor: themeCubit.isDark
                      ? KConstantColors.bgColor
                      : KConstantColors.texturedWhiteColor),
              initialRoute: "/base",
              onGenerateRoute: AppRouter.generateRoute,
              debugShowCheckedModeBanner: false);
        },
      ),
    );
  }
}
