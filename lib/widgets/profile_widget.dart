
import 'package:antello/widgets/photo_chart.dart';
import 'package:antello/widgets/send_message_buton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/app_user.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final user = AppUser(
        kullaniciadi: "demir",
        ad: "Seyit",
        soyad: "Demir",
        bio: "",
        cinsiyet: "erkek",
        dogumtarihi: DateTime.now(),
        sifre: 123);
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Center(
        child: Column(
          children: [
            const PhotoChart(),
            const SizedBox(
              height: 15,
            ),
            Text(user.ad + " " + user.soyad),
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color:  Color(0xFFF7DF1E),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF26235C),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            const SendMessage(),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50, right: 50),
                              child: Text(
                                user.bio,
                                style: GoogleFonts.raleway(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50, right: 50),
                              child: Text(
                                user.cinsiyet,
                                style: GoogleFonts.raleway(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50, right: 50),
                              child: Text(
                                "${user.dogumtarihi!.day}/${user.dogumtarihi!.month}/${user.dogumtarihi!.year}",
                                style: GoogleFonts.raleway(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
