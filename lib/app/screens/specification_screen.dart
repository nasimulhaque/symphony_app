import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SpecificationScreen extends StatelessWidget {

  const SpecificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Specification",
          style: GoogleFonts.urbanist(
            textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 16.0,
            bottom: 40.0
          ),
          child: Column(
            children: [
              item1(),
              16.verticalSpace,
              customGrid()
            ],
          ),
        ),
      ),
    );
  }

  Widget item1() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Powered by",
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(color: Colors.white70, fontSize: 12, letterSpacing: .2, fontWeight: FontWeight.w500),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Android',
                        style: GoogleFonts.urbanist(
                          textStyle: TextStyle(color: Color(0xFF34A853), fontSize: 20, letterSpacing: .2, fontWeight: FontWeight.w500),
                        )
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: Offset(0.0, -10.0),
                          child: Text(
                            '™',
                            style: GoogleFonts.urbanist(
                              textStyle: TextStyle(color: Color(0xFF34A853), fontSize: 10, letterSpacing: .2, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' 14',
                        style: GoogleFonts.urbanist(
                          textStyle: TextStyle(color: Color(0xFF34A853), fontSize: 20, letterSpacing: .2, fontWeight: FontWeight.w500),
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 56.h,
              child: Image.asset("assets/images/android_icon.png")
            )
          )
        ],
      ),
    );
  }

  Widget squareItem({required String icon, required String title, required String description}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon),
          8.verticalSpace,
          Text(
            title,
            style: GoogleFonts.urbanist(
              textStyle: TextStyle(color: Colors.white54, fontSize: 12, letterSpacing: .2, fontWeight: FontWeight.w500),
            ),
          ),
          2.verticalSpace,
          Text(
            description,
            style: GoogleFonts.urbanist(
              textStyle: TextStyle(color: Colors.white, fontSize: 14, letterSpacing: .2, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget customGrid() {
    return Container(
      color: Colors.black,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: squareItem(icon: "assets/vectors/cpu.svg", title: "Processor", description: "MediaTek Helio G99 6nm 2.2GHz Octa Core"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: squareItem(icon: "assets/vectors/folder-file-storage.svg", title: "Storage", description: "ROM 128GB"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: squareItem(icon: "assets/vectors/square-arrow-diagonal-02.svg", title: "Display", description: '6.7" FHD+ AMOLED GG5 120Hz\nPunch Hole'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: squareItem(icon: "assets/vectors/chip2.svg", title: "Ram", description: '16GB (8GB Expandable RAM)'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: squareItem(icon: "assets/vectors/simcard-dual.svg", title: "Sim Card", description: 'Nano+Nano/Micro TF Card'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: squareItem(icon: "assets/vectors/camera-01.svg", title: "Camera", description: '64MP + 2MP Macro Rear & 32MP Super Selfie with Display Flash'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: squareItem(icon: "assets/vectors/cellular-network.svg", title: "Network", description: '4G, 3G, 2G'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: squareItem(icon: "assets/vectors/battery-full.svg", title: "Battery", description: '5000mAH'),
          ),
        ],
      ),
    );
  }
}
