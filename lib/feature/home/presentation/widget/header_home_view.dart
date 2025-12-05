import 'package:flutter/material.dart';

import 'package:hungry_app/core/constants/app_colors.dart';


class HeaderHomeView extends StatelessWidget {
  final String? userImage;

  const HeaderHomeView({super.key, this.userImage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SvgPicture.asset(
        //   Assets.svgTextSplashImage,
        //   // ignore: deprecated_member_use
        //   color: AppColors.primaryColor,
        // ),
        Text(
          'BurgerHub',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        Spacer(),
        CircleAvatar(
          radius: 30,
          backgroundImage: userImage != null && userImage!.isNotEmpty
              ? NetworkImage(userImage!)
              : const AssetImage('assets/images/sonic_image.png')
                    as ImageProvider,
          backgroundColor: Colors.grey[200],
        ),
      ],
    );
  }
}
