import 'package:antello/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../classes/app_user.dart';

class PhotoChart extends StatefulWidget {
  final AppUser appUser;
  final double maxsize;
  const PhotoChart({Key? key, required this.appUser, this.maxsize =100}) : super(key: key);

  @override
  State<PhotoChart> createState() => _PhotoChartState();
}

class _PhotoChartState extends State<PhotoChart> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(widget.appUser.url !=""){setState(() {
      
    });}
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:  BoxConstraints(maxHeight: widget.maxsize, maxWidth: widget.maxsize),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100))),
            ),
          ),
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.hardEdge,
              child:  FittedBox(
                  child:    true ? Icon(Icons.person, size: 162,):
              Image.network(
             widget. appUser.url
            
              , 
             
              loadingBuilder:(context, child, loadingProgress) => const LinearProgressIndicator(),
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return const Text("Frame builder");
              },
              errorBuilder: (context, error, stackTrace) {
               return  Text(error.toString() + " stack "+  stackTrace.toString(), textAlign: TextAlign.center,) ;
              },

              )
            
              
              )),
          Transform.rotate(
              angle: -3.14 / 6,
              child: Container(
                constraints: const BoxConstraints.expand(),
                child: const CircularProgressIndicator(
                  value: 0.65,
                  color: AppColors.yellow,
                  strokeWidth: 2,
                ),
              )),
        ],
        alignment: Alignment.center,
      ),
    );
  }
}

class Intrins {}

class SideArrowClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double startMargin = size.width / 2;
    final double s1 = size.height * 0.5;
    final double s2 = size.height * 0.6;
    print('S1:$s1 SH:${size.height / 2} S2:$s2');
    path.lineTo(startMargin, 0);
    path.lineTo(startMargin, s1);
    path.lineTo(s1, size.height);
    // path.lineTo(0, size.height / 2);
    // path.lineTo(startMargin, s2);
    // path.lineTo(startMargin, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
