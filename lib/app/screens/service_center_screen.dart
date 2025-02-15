import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:symphony_app/app/GlobalBackground.dart';

class ServiceCenterScreen extends StatelessWidget {
  const ServiceCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBackground(
      addPadding: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Service Center",
            style: GoogleFonts.urbanist(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          titleSpacing: 0,
        ),
        body: Stack(
          children: <Widget>[
            Image.asset("assets/images/dummy_map_image.png"),
            SlidingUpPanel(
              panelBuilder: () => _buildPanelContent(context),
              color: Theme.of(context).primaryColor,
              minHeight: 0.55.sh,
              maxHeight: 1.sh,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)), // Rounded corners
            ),
          ],
        )
      ),
    );
  }

  Widget _buildPanelContent(BuildContext context) {
    bool themeIsLight = MediaQuery.of(context).platformBrightness == Brightness.light;
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 40
      ),
      child: Column(
        children: [
          Container(
            height: 5.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: themeIsLight ? Colors.black12 : Color(0xFF414243),
              borderRadius: BorderRadius.circular(8.0)
            ),
          ), // Drag handle
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return locationItem(
                  context,
                  title: "Badda (CC) - Dhaka",
                  description: "Service Touch Point, Configure Bepari Shopping\nComplex, Badda, Dhaka - 1212",
                  distance: "2.7KM",
                  themeIsLight: themeIsLight
                );
              },
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(color: themeIsLight ? Colors.black12 : Color(0xFF414243)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget locationItem(BuildContext context, {required String title, required String description, required String distance, required bool themeIsLight}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.urbanist(
            textStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 18, letterSpacing: .2, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 16),
        Text(
          description,
          style: GoogleFonts.urbanist(
            textStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 16, letterSpacing: .2, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10),
        Text(
          distance,
          style: GoogleFonts.urbanist(
            textStyle: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 16, letterSpacing: .2, fontWeight: FontWeight.w700),
          ),
        ),
      SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                textStyle: GoogleFonts.urbanist(
                  textStyle: TextStyle(color: Colors.white, fontSize: 16.0, letterSpacing: 0.2, fontWeight: FontWeight.w500),
                ), // Text style
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  SvgPicture.asset("assets/vectors/direction.svg"),
                  8.horizontalSpace,
                  Text("Direction"),
                ],
              )
            ),
            16.horizontalSpace,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Text style
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  side: BorderSide(color: themeIsLight ? Colors.black12 : Color(0xFF414243))
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  SvgPicture.asset("assets/vectors/share.svg"),
                  8.horizontalSpace,
                  Text("Share", style: GoogleFonts.urbanist(
                    textStyle: TextStyle(color: themeIsLight ? Theme.of(context).colorScheme.secondary : Colors.white, fontSize: 16.0, letterSpacing: 0.2, fontWeight: FontWeight.w500),
                  )),
                ],
              )
            )
          ],
        )
      ],
    );
  }
}
