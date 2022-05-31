import 'package:antello/classes/app_user.dart';
import 'package:antello/themes/app_colors.dart';
import 'package:antello/widgets/photo_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserChart extends StatelessWidget {
  final AppUser appuser;

  const UserChart({Key? key, required this.appuser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.only(top: 8),
        height: 215,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  height: 30,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 4, right: 4, bottom: 8),
                    child: Container(
                      constraints: BoxConstraints(maxHeight: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PhotoChart(),
                  Text(
                    appuser.ad + " " + appuser.soyad,
                    style: GoogleFonts.oswald(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      appuser.bio,
                      style: GoogleFonts.oswald(fontWeight: FontWeight.w100),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
