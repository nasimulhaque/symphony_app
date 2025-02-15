import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:symphony_app/app/GlobalBackground.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:symphony_app/app/screens/lso_screen.dart';
import 'package:symphony_app/app/screens/service_center_screen.dart';
import 'package:symphony_app/app/screens/specification_screen.dart';

class CheckSupportScreen extends StatelessWidget {
  const CheckSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool themeIsLight = MediaQuery.of(context).platformBrightness == Brightness.light;
    return GlobalBackground(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Check Support",
            style: GoogleFonts.urbanist(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios, // Custom icon
              color: Theme.of(context).colorScheme.secondary, // Custom color
            ),
            onPressed: () {
              // Handle back button press
              Navigator.of(context).pop();
            },
          ),
          titleSpacing: 0,
        ),
        body: GridView.extent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.4,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            item(context, title: "Hotline", asset:  "assets/vectors/hotline${themeIsLight ? "" : "-dark"}.svg"),
            item(context, title: "Service Center", asset:  "assets/vectors/service-center${themeIsLight ? "" : "-dark"}.svg", page: ServiceCenterScreen()),
            item(context, title: "LSO Query", asset:  "assets/vectors/lso${themeIsLight ? "" : "-dark"}.svg", page: LsoScreen()),
            item(context, title: "Feedback", asset:  "assets/vectors/feedback${themeIsLight ? "" : "-dark"}.svg"),
            item(context, title: "Specification", asset:  "assets/vectors/specification${themeIsLight ? "" : "-dark"}.svg", page: SpecificationScreen()),
            item(context, title: "Book An Appointment", asset:  "assets/vectors/booking${themeIsLight ? "" : "-dark"}.svg"),
          ],
        ),
      ),
    );
  }

  Widget item(BuildContext context, {required String asset, required String title, Widget? page}) {
    return InkWell(
      onTap: page == null ? null : () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        height: 100,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(asset),
            Text(
              title,
              style: GoogleFonts.urbanist(
                textStyle: Theme.of(context).textTheme.labelMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
