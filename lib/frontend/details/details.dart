import 'package:fashionflow/frontend/components/primary_btn.dart';
import 'package:fashionflow/frontend/components/secondary_btn.dart';
import 'package:fashionflow/frontend/home/components/body.dart';
import 'package:fashionflow/frontend/home/components/product.dart';
import 'package:fashionflow/size.dart';
import 'package:fashionflow/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Details extends StatelessWidget {
  Details({super.key});

  List<Product> products_1 = [
    Product("HighLander", 399),
    Product("H&M", 1549),
    Product("Fossil", 2199),
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

  List<String> folderNames = [
    "product_pairs",
    "products_2",
    "products_3",
  ];

  @override
  Widget build(BuildContext context) {
    List<List<Product>> products = [
      products_1,
      products_2,
      products_3,
    ];
    Pallete pallete = Pallete(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const FaIcon(Icons.arrow_back_ios_new_rounded)),
                  const SizedBox(width: 20),
                  Text(
                    "H&M",
                    style: TextStyle(
                      color: pallete.primaryDark,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/image-0.png",
                      width: SizeConfig.width * 0.7,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "H&M",
                style: TextStyle(
                  color: pallete.primaryDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Men Straight Raised Jeans",
                style: TextStyle(
                  color: pallete.primaryDark,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Rs. 2699",
                style: TextStyle(
                  color: pallete.primaryDark,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PrimaryBtn(
                    primaryColor: Colors.blueAccent,
                    secondaryColor: Colors.blue,
                    padding: 0.0,
                    title: "Add to Bag",
                    tap: () {},
                    titleColor: Colors.white,
                    hasIcon: false,
                  ),
                  SecondaryBtn(
                    color: pallete.background,
                    padding: 0.0,
                    title: "Add to Bag",
                    tap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Pair it with:",
                style: TextStyle(
                  color: pallete.primaryDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 500,
                child: ListView.builder(
                  itemCount: 3,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, indexOuter) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Container(
                        height: 235,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, indexInner) => CardItem(
                            index: indexInner,
                            length: 2,
                            title: products[indexOuter][indexInner].title,
                            subtitle: products[indexOuter][indexInner].subtitle,
                            folder: folderNames[indexOuter],
                            width: 120,
                            price: 479,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
