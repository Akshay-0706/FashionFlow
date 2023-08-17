import 'package:fashionflow/frontend/components/primary_btn.dart';
import 'package:fashionflow/size.dart';
import 'package:fashionflow/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class SuperImpose extends StatefulWidget {
  const SuperImpose({super.key});

  @override
  State<SuperImpose> createState() => _SuperImposeState();
}

class _SuperImposeState extends State<SuperImpose> {
  String img1 = 'assets/images/combo/image-1.jpg';
  String img2 = 'assets/images/combo/image-2.jpg';
  String img3 = 'assets/images/combo/image-3.jpg';

  bool oneLoaded = false,
      twoLoaded = false,
      threeLoaded = false,
      isLoading = false;

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const FaIcon(Icons.arrow_back_ios_new_rounded)),
                const SizedBox(width: 20),
                Text(
                  "Change your photos",
                  style: TextStyle(
                    color: pallete.primaryDark,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    await picker.pickImage(source: ImageSource.gallery);

                    setState(() {
                      oneLoaded = true;
                    });
                  },
                  child: Container(
                    width: SizeConfig.width * 0.4,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: pallete.primaryDark,
                        width: 2,
                      ),
                      image: oneLoaded
                          ? DecorationImage(
                              image: AssetImage(img1),
                              fit: BoxFit.contain,
                            )
                          : null,
                    ),
                    child: oneLoaded
                        ? null
                        : const Center(child: Text("Add an Image")),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    await picker.pickImage(source: ImageSource.gallery);

                    setState(() {
                      twoLoaded = true;
                    });
                  },
                  child: Container(
                    width: SizeConfig.width * 0.4,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: pallete.primaryDark,
                        width: 2,
                      ),
                      image: twoLoaded
                          ? DecorationImage(
                              image: AssetImage(img2),
                              fit: BoxFit.contain,
                            )
                          : null,
                    ),
                    child: twoLoaded
                        ? null
                        : const Center(child: Text("Add an Image")),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            SizedBox(
              width: SizeConfig.width * 0.7,
              child: PrimaryBtn(
                  primaryColor: pallete.primary,
                  secondaryColor: pallete.primary.withOpacity(0.8),
                  padding: 12,
                  title: "Superimpose Images",
                  tap: () async {
                    setState(() {
                      isLoading = true;
                    });

                    await Future.delayed(const Duration(seconds: 2));

                    setState(() {
                      isLoading = false;
                      threeLoaded = true;
                    });
                  },
                  titleColor: pallete.primaryLight,
                  hasIcon: false),
            ),
            const SizedBox(height: 30),
            Container(
              width: SizeConfig.width * 0.6,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: pallete.primaryDark,
                  width: 1,
                ),
                image: threeLoaded
                    ? DecorationImage(
                        image: AssetImage(img3),
                        fit: BoxFit.contain,
                      )
                    : null,
              ),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : threeLoaded
                      ? null
                      : const Center(child: Text("Superimposed Image")),
            ),
          ],
        ),
      )),
    );
  }
}
