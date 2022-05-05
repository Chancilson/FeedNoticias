import 'dart:ui';

import 'package:feed/feed/post_creation.dart';
import 'package:feed/helpers/help.dart';
import 'package:feed/post/post_informations.dart';
import 'package:feed/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColors.withOpacity(0.1),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(
              "assets/images/2_user.jpg",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: ()=> QuickHelp.goToNavigationScreen( const PostCreation(), context),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 5),
              child: SvgPicture.asset(
                "assets/svg/foto.svg",
                color: kGreyColors,
                height: 35,
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Expanded(
          child: GestureDetector(
            onTap: ()=> QuickHelp.goToNavigationScreen( const PostCreation(), context),
            child: Container(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, top: 15),
                child: Text(
                  "Post something...",
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: kGreyColors,
                  ),
                ),
              ),
              margin: const EdgeInsets.only(left: 5),
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: kGreyColors),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: List.generate(
          Post.users.length,
          (index) => post(
              userName: Post.users[index]["user"]["name"],
              postDate: Post.post[index]["post"]["date"],
              postText: Post.post[index]["post"]["text"],
              postImage: Post.post[index]["post"]["picture"],
              userImage: Post.users[index]["user"]["picture"]),
        ),
      ),
    );
  }

  Widget post({
    required String userImage,
    required String userName,
    required String postDate,
    required String postText,
    required String postImage,
  }) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      color: Colors.white,
      width: size.width,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    userImage,
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
                    Text(
                      userName,
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      postDate,
                      style: GoogleFonts.nunito(
                        color: kGreyColors,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 10, left: 5),
                  child: SvgPicture.asset(
                    "assets/svg/ic_settings.svg",
                    height: 35,
                    color: kGreyColors,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              postText,
              style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                width: size.width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        postImage,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: SizedBox(
                    width: size.width,
                    height: 400,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 250,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          postImage,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: size.width,
            height: 0.5,
            color: kGreyColors,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset("assets/svg/ic_post_like.svg",
                  color: kGreyColors,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '4',
                    style: GoogleFonts.nunito(
                      color: kGreyColors,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset("assets/svg/ic_post_comment.svg",
                    color: kGreyColors),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '14',
                    style: GoogleFonts.nunito(
                      color: kGreyColors,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
