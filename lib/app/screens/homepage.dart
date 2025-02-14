import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:symphony_app/app/GlobalBackground.dart';

import '../data/constants.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBackground(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              children: [
                header(),
                24.verticalSpace,
                Image.asset("assets/images/hero_image.png"), // Hero section
                24.verticalSpace,
                support(context),
                24.verticalSpace,
                trending(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'My Symphony',
          style: GoogleFonts.urbanist(
            textStyle: TextStyle(color: Colors.black, fontSize: 18, letterSpacing: .2, fontWeight: FontWeight.w700),
          ),
        ),
        SvgPicture.asset("assets/vectors/menu.svg")
      ],
    );
  }

  Widget support(BuildContext context) {
    return Container(
      width: 344.w,
      height: 128.h,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.cover,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/vectors/headphone_icon.svg"),
              8.horizontalSpace,
              Text(
                "Need Help",
                style: GoogleFonts.urbanist(
                  textStyle: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: .2, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              "Check Support",
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(color: Colors.black, fontSize: 16, letterSpacing: .2, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget trending() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trending Items',
          style: GoogleFonts.urbanist(
            textStyle: TextStyle(color: Colors.black, fontSize: 18, letterSpacing: .2, fontWeight: FontWeight.w700),
          ),
        ),
        16.verticalSpace,
        SizedBox(
          width: double.infinity,
          height: 130.h,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Container(
              width: 103.w,
              height: 126.h,
              padding: EdgeInsets.only(
                top: 10.h,
                left: 6.h,
                right: 6.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    trending_items[index]["name"],
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(color: Colors.black, fontSize: 16, letterSpacing: 0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  4.verticalSpace,
                  SizedBox(
                    height: 90,
                    child: Image.asset(trending_items[index]["image"], fit: BoxFit.contain)
                  )
                ],
              ),
            ),
            separatorBuilder: (_, __) => 16.horizontalSpace,
            itemCount: trending_items.length
          ),
        ),
      ],
    );
  }
}
