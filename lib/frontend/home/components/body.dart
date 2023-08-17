import 'package:fashionflow/frontend/components/custom_page_route.dart';
import 'package:fashionflow/frontend/home/components/product.dart';
import 'package:fashionflow/frontend/search/search.dart';
import 'package:fashionflow/size.dart';
import 'package:fashionflow/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  List<Product> products_1 = [
    Product("Anouk", 479),
    Product("IVOC", 515),
    Product("Bene Kleed", 612),
  ];
  List<Product> products_2 = [
    Product("Ketch", 505),
    Product("Here & Now", 683),
    Product("Bewakoof", 486),
  ];
  List<Product> products_3 = [
    Product("HighLander", 835),
    Product("The Souled Store", 723),
    Product("Levi's", 1826),
  ];

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    double cardWidth = 100;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: SizeConfig.width * 0.6,
                    decoration: BoxDecoration(
                      color: pallete.primaryLight.withAlpha(10),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: pallete.primaryDark.withAlpha(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getHeight(20)),
                      child: TextFormField(
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark),
                        onFieldSubmitted: (value) {
                          if (value.isNotEmpty) {
                            CustomPageRoute(context, Search(value: value));
                          }
                        },
                        keyboardType: TextInputType.text,
                        cursorRadius: const Radius.circular(10),
                        cursorColor: pallete.primary,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search for items...",
                          hintStyle: TextStyle(
                            color: pallete.primaryDark.withOpacity(0.5),
                            fontSize: getHeight(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed("/superimpose"),
                    child: Container(
                      decoration: BoxDecoration(
                          color: pallete.primaryLight.withAlpha(10),
                          shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.broken_image_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: pallete.primaryLight.withAlpha(10),
                        shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.person_rounded),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Recommended items",
                style: TextStyle(
                  color: pallete.primaryDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "RakshaBandhan is on its way",
                style: TextStyle(
                  color: pallete.primaryDark,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                      3,
                      (index) => CardItem(
                            index: index,
                            length: 2,
                            title: products_1[index].title,
                            width: cardWidth,
                            folder: "products_1",
                            price: products_1[index].price,
                          )),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Because you recently bought:",
                style: TextStyle(
                  color: pallete.primaryDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "White Joggers",
                style: TextStyle(
                  color: pallete.primaryDark,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                      3,
                      (index) => CardItem(
                            index: index,
                            length: 2,
                            title: products_1[index].title,
                            width: cardWidth,
                            folder: "products_2",
                            price: products_1[index].price,
                          )),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Blue Sweatshirt",
                style: TextStyle(
                  color: pallete.primaryDark,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                      3,
                      (index) => CardItem(
                            index: index,
                            length: 2,
                            title: products_1[index].title,
                            width: cardWidth,
                            folder: "products_3",
                            price: products_1[index].price,
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.width,
    required this.index,
    required this.length,
    required this.title,
    required this.folder,
    required this.price,
    this.subtitle,
  });
  final int index, length;
  final double width;
  final String title, folder;
  final double price;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Padding(
      padding:
          index < length ? const EdgeInsets.only(right: 10) : EdgeInsets.zero,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed("/details"),
        child: Container(
          decoration: BoxDecoration(
              color: pallete.primaryDark.withAlpha(10),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: pallete.primaryDark.withAlpha(20))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/$folder/image-${index + 1}.png",
                    width: width,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 100,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: pallete.primaryDark,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      color: pallete.primaryLight.withAlpha(200),
                      fontSize: 12,
                    ),
                  ),
                Text(
                  "Rs. $price",
                  style: TextStyle(
                    color: pallete.primaryDark,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
