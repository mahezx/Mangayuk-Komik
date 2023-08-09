import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'detail_screen.dart';
import 'package:mangakuy_layout/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // CAROUSEL
  List imageList = [
    {'id': 1, "image_path": 'img/solev.jpg'},
    {'id': 2, "image_path": 'img/rimuru-tensura.jpg'},
    {'id': 3, "image_path": 'img/dednot.jpg'},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.only(right: 11),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('/img/logo-app-notext.png')),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        Text(
                          'Mangayuk',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      child: Column(children: const [
                        Icon(
                          Icons.notifications,
                          color: Colors.black,
                          size: 30,
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                  height: 40,
                  width: 30,
                  child: Row(children: [
                    Text(
                      'Home',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ])),

              // CAROUSEL
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CarouselSlider(
                              items: imageList
                                  .map(
                                    (item) => Image.asset(
                                      item['image_path'],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  )
                                  .toList(),
                              carouselController: carouselController,
                              options: CarouselOptions(
                                  height: 150,
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  autoPlay: true,
                                  aspectRatio: 3,
                                  viewportFraction: 1,
                                  onPageChanged: ((index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  })),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    imageList.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: currentIndex == entry.key ? 17 : 7,
                                      height: 7.0,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 3.0,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: currentIndex == entry.key
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  );
                                }).toList()),
                          )
                        ],
                      ),
                    ],
                  )),

              // title komik favorit

              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Komik Favoritmu',
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      )
                    ],
                  )),

              // LIST VIEW KOMIK

              Container(
                height: 156,
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  separatorBuilder: (context, _) => const SizedBox(
                    width: 12,
                  ),
                  itemBuilder: (context, index) =>
                      buildCard(item: cardItems[index], index: index),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        'Komik Terpopuler',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Komik dengan jumlah pembaca terbanyak',
                        style: GoogleFonts.poppins(
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),

              // grid view
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 210,
                width: double.infinity,
                child: GridView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage('/img/op.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage('/img/blch.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage('/img/bkh.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage('/img/bruto.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 100,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(children: [
                  Row(children: [
                    Text(
                      'Update Terbaru',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    )
                  ]),
                  Row(children: [
                    Text(
                      'Baca komik yang terupdate & baru',
                      style: GoogleFonts.poppins(
                        fontSize: 9,
                      ),
                    )
                  ]),
                ]),
              ),

              const SizedBox(
                height: 25,
              ),

              Container(
                height: 474,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(children: [
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey,
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('/img/clover.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Black Clover',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Chapter 357',
                                              style: GoogleFonts.poppins(
                                                fontSize: 9,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),

                    // DUA

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(children: [
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey,
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('/img/necro.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Solo Necromancer',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Chapter 87',
                                              style: GoogleFonts.poppins(
                                                fontSize: 9,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(children: [
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey,
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('/img/estate.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(
                                                'The Greatest Estate Developer',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Chapter 94',
                                              style: GoogleFonts.poppins(
                                                fontSize: 9,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(children: [
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey,
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('/img/oshi.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Oshi No Ko',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Chapter 113',
                                              style: GoogleFonts.poppins(
                                                fontSize: 9,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(children: [
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey,
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('/img/killda.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Kill The Hero',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Chapter 132',
                                              style: GoogleFonts.poppins(
                                                fontSize: 9,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),

                    // SizedBox(height: 90,)
                  ],
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }

  // WIDGET CARD KOMIKNYA

  Widget buildCard({
    required CardItem item,
    required int index,
  }) =>
      Container(
          width: 100,
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Material(
                      child: Ink.image(
                        image: AssetImage(item.imageCard),
                        fit: BoxFit.cover,
                        child: InkWell(
                          onTap: () {
                            // Navigasi ke halaman detail dengan indeks dan daftar item sebagai parameter
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(index: index, items: cardItems),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        truncateText(item.title, 12),
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      item.chapter,
                      style: GoogleFonts.poppins(
                        fontSize: 9,
                      ),
                    )
                  ])
                ],
              )
            ],
          ));
}

String truncateText(String text, int maxChars) {
  if (text.length <= maxChars) {
    return text;
  } else {
    return text.substring(0, maxChars) + '...';
  }
}
