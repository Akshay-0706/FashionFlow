import 'package:fashionflow/frontend/home/components/product.dart';
import 'package:fashionflow/size.dart';
import 'package:fashionflow/theme.dart';
import 'package:flutter/material.dart';

import '../home/components/body.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Product> products = [
    Product("H&M", 1724),
    Product("Allen Solly", 2276),
    Product("Thomas Scott", 609),
    Product("H&M", 2299),
    Product("Arrow", 1399),
    Product("English Navy", 498),
  ];

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: SizeConfig.width * 0.72,
                      decoration: BoxDecoration(
                        color: pallete.primaryLight.withAlpha(10),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: pallete.primaryDark.withAlpha(20),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: getHeight(20)),
                        child: TextFormField(
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark),
                          onFieldSubmitted: (value) {
                            if (value.isNotEmpty) {}
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
                  "Search results",
                  style: TextStyle(
                    color: pallete.primaryDark,
                    fontSize: 16,
                  ),
                ),
                ...List.generate(
                  3,
                  (index) => Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CardItem(
                            index: index * 2,
                            length: 0,
                            title: products[index * 2].title,
                            folder: "search",
                            width: 140,
                            price: products[index * 2].price,
                          ),
                          CardItem(
                            index: index * 2 + 1,
                            length: 0,
                            title: products[index * 2 + 1].title,
                            folder: "search",
                            width: 140,
                            price: products[index * 2 + 1].price,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
