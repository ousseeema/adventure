import 'package:adventure/cubit/app_cubit.dart';
import 'package:adventure/cubit/app_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class detailspage extends StatefulWidget {
  const detailspage({super.key});

  @override
  State<detailspage> createState() => _detailspageState();
}

// ignore: camel_case_types
class _detailspageState extends State<detailspage> {
  int selectedindex = -1;
  int stars = 4;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,CubitStates>(builder:(context,state){
      detailsState detail = state as detailsState;
      return Scaffold(
      body: SafeArea(
        // ignore: sized_box_for_whitespace
        child:  Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  height: 400,
                  width: double.maxFinite,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.places.img),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                left: 20,
                top: 20,
                child: Row(children: [
                  IconButton(
                      onPressed: () {
                       BlocProvider.of<AppCubit>(context).gohome();

                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    width: 290,
                  ),
                  IconButton(
                      onPressed: () {
                        
                      },
                      icon: const Icon(
                        Icons.drag_indicator,
                        color: Colors.black,
                      ))
                ])),
            Positioned(
                top: 300,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                           Text(
                            detail.places.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Text(
                            "\$"+detail.places.price.toString(),
                            style: TextStyle(
                                color: Colors.indigo[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 21),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.indigo[700],
                          ),
                          const SizedBox(width: 5),
                          Text(
                          detail.places.location,
                            style: TextStyle(
                              color: Colors.indigo[700],
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 17),
                      Row(
                        children: [
                          Wrap(
                            // cest un widget comme row mais si il nya pas de place pour autre
                            //element elle retourne a la ligne et complete les autres
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color:
                                    index < detail.places.stars ? Colors.amber : Colors.grey,
                              );
                            }),
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 5,
                              ),
                              Text("(5.0)",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey))
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: const [
                          Text(
                            "People",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: const [
                          Text(
                            "Number of people in your group",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            child: Container(
                              margin:  const EdgeInsets.all(8),
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: selectedindex == index
                                    ? Colors.black
                                    : Colors.grey[200],
                              ),
                              child: Center(
                                  child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedindex == index
                                        ? Colors.white
                                        : Colors.black),
                              )
                              ),
                            ),
                          );
                        }
                        ),
                      ),
                      const SizedBox(height: 15,),
                      const Text("Description", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                      Wrap(
                        children:  [
                          Text(detail.places.description),
                        ],
                      ), 
                    



                    ],
                  ),
                )
                ),
                Positioned(
                  left: 20,
                  bottom: 20,

                  child: 
                    Row(
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black,width: 1.0),
                              borderRadius: BorderRadius.circular(15),
                        
                            ),
                            child: const  Icon(Icons.favorite_border),
                          ),
                        ),
                       const  SizedBox(width: 20,),
                       Container(
                        height: 55,
                        width: 290,
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                            color: const  Color.fromARGB(255, 3, 39, 68) ,
                           
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 30,),
                            const Text("Back To Trip Now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            const SizedBox(width: 40,),

                            Image.asset("img/arrow2.png")
                          ],
                        ),
                       )
                      ],
                    ))
          ]),
        ),
      ),
    );

    } );
  }
}
