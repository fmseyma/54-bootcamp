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
        padding: const EdgeInsets.only(top: 8),
        constraints: const BoxConstraints(maxHeight: 250),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                )),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                print("Pressed on widget");
              },
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.purple,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    height: 50,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                      child: Container(
                        constraints: const BoxConstraints(maxHeight: 10),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                      ),
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const PhotoChart(),
                  InkWell(
                    onTap: () {
                      print("pressed on name");
                    },
                    child: Text(
                      appuser.ad + " " + appuser.soyad,
                      style: GoogleFonts.oswald(fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("pressed on bio text");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      child: Text(
                        "    " + appuser.bio,
                        style: GoogleFonts.oswald(fontWeight: FontWeight.w100),
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        print("pressed on close");
                      },
                      icon: Icon(Icons.close),
                    ),
                    IconButton(
                      onPressed: () {
                        print("pressed on information");
                      },
                      icon: Icon(Icons.info),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
