import 'package:adventure/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit_state.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with TickerProviderStateMixin {
  List images = [
    ["hikinge.png", "Hikinge"],
    ["snorkling.png", "Snorkling"],
    ["baaloning.png", "Balloning"],
    ["hking.png", "kayaking"],
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: SafeArea(child: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state) {
          if (state is loadedState) {
            var info = state.places;
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // sized box Will make a espace to make the row come down
                Row(
                  // row with icon list and container with img symbole
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.menu,
                      size: 40,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 280,
                    ),
                    Container(
                      // container with the img symbole and her decoration
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: const DecorationImage(
                              image: AssetImage("img/homme.png"))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // row of the word discover
                Row(children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Discover",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )
                ]),
                const SizedBox(
                  height: 30,
                ),

                // ignore: avoid_unnecessary_containers
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: circleindicatortab(
                            color: Colors.deepPurple[300]!, radius: 4),
                        tabs:
                            //the number of tabs in the tab bar must be the same number
                            // of widget in the tabview  and you must add a tabcontroller
                            const [
                          Tab(
                            text: "Places",
                          ),
                          Tab(
                            text: "Inscpiration",
                          ),
                          Tab(
                            text: "Emotions",
                          )
                        ]),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                      controller: _tabController,
                      //the number of childreen in the tabbarview must be the same number
                      // of tabs in the tabbar and you must add a tabcontroller
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: info.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                               onTap : (){
                             BlocProvider.of<AppCubit>(context).detailspage(info[index]) ;
                             },
                             
                              child: Container(
                                margin: const EdgeInsets.only(right: 15, top: 10),
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "http://mark.bslmeiyu.com/uploads/" +
                                                info[index].img),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          },
                        ),
                        Text("there"),
                        Text("bye"),
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Explore more",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Text("See all",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image:
                                            AssetImage("img/${images[index][0]}"))),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                child: Text(
                                  images[index][1],
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      )),
    );
  }
}

class circleindicatortab extends Decoration {
  final Color color;
  double radius;
  circleindicatortab({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _circlepainter(color: color, radius: radius);
  }
}

class _circlepainter extends BoxPainter {
  final Color color;
  double radius;
  _circlepainter({required this.color, required this.radius});
  @override
  //this class is to paint the circle indicator in the tabview with color and radius
  // that given in the constructor of super class circle indicatortab
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset offsett = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius - radius);

    canvas.drawCircle(offset + offsett, radius, paint);
  }
}
