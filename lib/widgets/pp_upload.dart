import 'package:antello/classes/app_user.dart';
import 'package:antello/widgets/photo_chart.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PPUpload extends StatefulWidget {
  const PPUpload({ Key? key }) : super(key: key);

  @override
  State<PPUpload> createState() => _PPUploadState();
}

class _PPUploadState extends State<PPUpload> {
  String filePath="";
  String image="";

   XFile? xFile;
     Future<String>getImage() async {
      String uint8list = await FirebaseStorage.instance.ref(filePath).getDownloadURL();   
      return uint8list;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        PhotoChart(appUser: UserMAnagement.sampleUser, maxsize:400),
     
          InkWell   (
            child: const Icon(IconData(0xee39, fontFamily: 'MaterialIcons'), color: Colors.black, size: 40,  )

        ,   onTap: () async{
            
              xFile= await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
              if (xFile ==null) return ;
              final finalPath =     FirebaseStorage.instance.ref('spotdatabase').child(DateTime.now().millisecondsSinceEpoch.toString()+".jpg");
              await finalPath.putData(await xFile!.readAsBytes());
              filePath=finalPath.fullPath;
              
              var mmm= await getImage();
                setState(() {
                                             
  UserMAnagement.sampleUser.url=mmm;
debugPrint(mmm);
                }); 
           }
             ),]
      ),
    );
  }
}