import 'package:antello/widgets/photo_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/chat_messages.dart';

class ChatCard extends StatelessWidget {
  final Chat yazisma;
  final VoidCallback bas;
  const ChatCard({Key? key, required this.yazisma, required this.bas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: bas,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Stack(
              children: [
                const PhotoChart(),
                if (yazisma.isActive)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3)),
                    ),
                  )
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    yazisma.isim,
                    style: GoogleFonts.raleway(
                      color: const Color(0xFF26235C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Opacity(
                      opacity: 0.75,
                      child: Text(
                        yazisma.son_mesaj,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ),
            )),
            Column(children: [
              Opacity(opacity: 0.75, child: Text(yazisma.zaman)),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 30,
                width: 30,
                child: Center(child: Text("${yazisma.okunmamis_mesaj}",style:GoogleFonts.raleway(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),)),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
