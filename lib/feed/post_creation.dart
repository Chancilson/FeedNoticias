import 'package:feed/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCreation extends StatefulWidget {
  const PostCreation({Key? key}) : super(key: key);

  @override
  State<PostCreation> createState() => _PostCreationState();
}

class _PostCreationState extends State<PostCreation> {

  final _globalKey = GlobalKey<FormState>();
  final _postTextController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.2,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black,),
        centerTitle: false,
        title: Text(
          "Create post",
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black
          ),
        ),
        actions: [
          TextButton(
              onPressed: (){},
              child: Text(
                "Publish",
                style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                ),
              ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset("assets/images/2_user.jpg",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Chancilson Smart Lion",
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.public,
                            color: kGreyColors,
                            size: 18,
                          ),
                          Text("Share with the public",
                            style: GoogleFonts.nunito(
                              color: kGreyColors,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 3),
              width: size.width,
              height: 0.5,
              color: kGreyColors.withOpacity(0.3),
            ),
            Container(
              width: size.width,
              height: 90,
              color: kGreyColors.withOpacity(0.15),
              child: Form(
                key: _globalKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _postTextController,
                    maxLines: 5,
                    minLines:1,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "What are you thinking?",
                      hintStyle: GoogleFonts.nunito(
                        color: kGreyColors,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 5),
                    child: SvgPicture.asset(
                      "assets/svg/foto.svg",
                      color: kGreyColors,
                      height: 35,
                    ),
                  ),
                  Text(
                      "Picture",
                    style: GoogleFonts.nunito(color: kGreyColors, fontSize: 20)
                  ),
                ]
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: size.width,
              height: 0.5,
              color: kGreyColors.withOpacity(0.3),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              width: size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: (){},
                child: Text(
                    "Publish",
                    style: GoogleFonts.nunito(color: Colors.white, fontSize: 20)
                ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
