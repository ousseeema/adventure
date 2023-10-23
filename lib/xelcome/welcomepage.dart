import 'package:adventure/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class welcomepage extends StatefulWidget {
  const welcomepage({super.key});

  @override
  State<welcomepage> createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  List images = [
    [
      "welcomthree.png",
      "Trips",
      "Mountain",
      "Mountain hikes gives you an incredible sens of freedom along with endurance tests"
    ],
      ["hiking.png", 
     "Trips",
      "Mountain",
      "Mountain hikes gives you an incredible sens of freedom along with endurance tests"
      ],

    ["welcome1.png",
    "Trips",
      "Mountain",
      "Mountain hikes gives you an incredible sens of freedom along with endurance tests"
       ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("img/${images[index][0]}"),
                fit: BoxFit.cover,
              )),
              child: Container(
                // AAMLNA CONTAINER BESH NAAJMO NET7AKMO FI MARGINB W PADDING  mtaana
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  // row can hold two columns  one with the text
                  // explaining and one with liltle bar
                  //indicating the pso your in in the aaplication

                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("${images[index][1]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 29)),
                        const SizedBox(
                          height: 15,
                        ),
                        Text("${images[index][2]}",
                            style:  TextStyle(
                                 fontSize: 30, color: Colors.grey[800])),
                                 SizedBox(height: 5,),
                        Container(
                          width: 250,
                          child: Text(
                             "${images[index][3]}",
                            style:  TextStyle(
                                 fontSize: 14,color: Colors.grey[800])
                    
                          ),
                         
                        ),
                        const SizedBox(height: 35,),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubit>(context).getdata();
                          },
                          child: Container(
                            
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 3, 39, 68) ,
                              image: DecorationImage(image: AssetImage("img/arrow2.png"))
                        
                        
                            ),
                          ),
                        )
                        
                        
                    
                      ]),
                    ),
                    Expanded(
                      flex: 0,
                      child: Column(
                        children: List.generate(3, (indexdots){// this willl check and return 3 containers
                        // if the index of the pagebuilder== index dots in listgenerate the one it have
                        //// the index will be more bigger then the others
                          return Container(
                            margin: const EdgeInsets.only(top: 2,bottom: 2),
                            width: 8,
                            height: index == indexdots?25:8,// if the to index equals then the container for example 1 will be bigger then the others
                            decoration: BoxDecoration(
                              color: index == indexdots? Color.fromARGB(255, 3, 39, 68):Color.fromARGB(255, 3, 39, 68).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8)
                               
                               ),
                    
                          );
                        }),
                    
                    
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
