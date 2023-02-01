// main.dart
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

import 'CarouselSlider.dart';

class apireleted2 extends StatelessWidget {
  const apireleted2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const Text('Kindacode.com'),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search for something',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.camera_alt)),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 400,
                child: Center(
                  child: Text(
                    'This is an awesome shopping platform',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),

                // margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
                height: 710,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  border: Border.all(
                      color: const Color.fromARGB(255, 145, 86, 86),
                      width: 0.5),
                  color: Colors.grey[100],
                ),
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      // ignore: unnecessary_null_comparison
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                width: 420,
                                child: ListView(
                                  padding: const EdgeInsets.all(0),
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 50,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Colors.white54, width: 5.5),
                                        color: Colors.black12,
                                      ),
                                      child: CarouselSlider(
                                        items: [
                                          //1st Image of Slider
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            margin: const EdgeInsets.all(1.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: Colors.white,
                                              image: const DecorationImage(
                                                  image: NetworkImage(
                                                      "https://th.bing.com/th/id/OIP.0YvjbnRaBh5tvs0O1HgQmAHaFj?pid=ImgDet&rs=1"),
                                                  fit: BoxFit.fitHeight),
                                            ),
                                          ),

                                          //2nd Image of Slider
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            margin: const EdgeInsets.all(1.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: Colors.white,
                                              image: const DecorationImage(
                                                image: NetworkImage(
                                                    "https://cdn.xxl.thumbs.canstockphoto.com/synergy-abstract-objects-isolated-on-white-background-drawing_csp6963314.jpg"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),

                                          //3rd Image of Slider
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            margin: const EdgeInsets.all(1.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: Colors.white,
                                              image: const DecorationImage(
                                                image: NetworkImage(
                                                    "https://www.bing.com/th?id=OIP._q6C-aNnR_kZhIEr46Af8AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.12&pid=3.1&rm=2"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),

                                          //4th Image of Slider
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            margin: const EdgeInsets.all(1.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: Colors.white,
                                              image: const DecorationImage(
                                                image: NetworkImage(
                                                    "https://media.istockphoto.com/vectors/meeting-room-people-logogroup-of-four-persons-in-circle-vector-id980681946?k=6&m=980681946&s=612x612&w=0&h=hlSJ7ttA-0TC13y0H3v57Y4AX5KxFeMmuDlszhNUjrM="),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),

                                          //5th Image of Slider
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            margin: const EdgeInsets.all(1.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: Colors.white,
                                              image: const DecorationImage(
                                                image: NetworkImage(
                                                    "https://st.depositphotos.com/1025177/4095/v/450/depositphotos_40951747-stock-illustration-colorful-icon.jpg"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),

                                          //6th Image of Slider
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            margin: const EdgeInsets.all(1.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: Colors.white,
                                              image: const DecorationImage(
                                                image: NetworkImage(
                                                    "https://th.bing.com/th/id/OIP.ncYzH_R2SgCoCj3rsbJ3CQHaHa?pid=ImgDet&rs=1"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ],

                                        //Slider Container properties
                                        options: CarouselOptions(
                                          height: 200.0,
                                          enlargeCenterPage: true,
                                          autoPlay: true,
                                          reverse: true,
                                          aspectRatio: 16 / 9,
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enableInfiniteScroll: true,
                                          autoPlayAnimationDuration:
                                              const Duration(milliseconds: 800),
                                          viewportFraction: 0.8,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 15.0,
                            ),

                            Container(
                              width: 500,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.black38, width: 1),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 3),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search Here",
                                      hintStyle: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            // // ignore: unnecessary_null_comparison
                            // (catalogmodel.Items != null &&
                            //         catalogmodel.Items.isNotEmpty)
                            //     ? Expanded(
                            //         flex: 3,
                            //         child: Padding(
                            //           padding: const EdgeInsets.only(bottom: 10),
                            //           child: GridView.builder(
                            //             padding: const EdgeInsets.all(10),
                            //             gridDelegate:
                            //                 const SliverGridDelegateWithFixedCrossAxisCount(
                            //               crossAxisCount: 2,
                            //               mainAxisSpacing: 10,
                            //               crossAxisSpacing: 8,
                            //             ),
                            //             itemBuilder: (context, index) {
                            //               // ignore: unused_local_variable
                            //               final item = catalogmodel.Items[index];

                            //               return Card(
                            //                 clipBehavior: Clip.antiAlias,
                            //                 shape: RoundedRectangleBorder(
                            //                     borderRadius:
                            //                         BorderRadius.circular(5.0)),
                            //                 child: GridTile(
                            //                   header: InkWell(
                            //                     child: Container(
                            //                       padding: const EdgeInsets.all(5),
                            //                       // ignore: sort_child_properties_last
                            //                       child: Text(
                            //                         item.name ?? "",
                            //                         textAlign: TextAlign.center,
                            //                         style: const TextStyle(
                            //                             fontSize: 16,
                            //                             color: Colors.white),
                            //                       ),

                            //                       decoration: const BoxDecoration(
                            //                         color: Colors.black38,
                            //                       ),
                            //                     ),
                            //                   ),

                            //                   // ignore: sort_child_properties_last
                            //                   child: ProgressiveImage(
                            //                     blur: 10,
                            //                     // placeholder: AssetImage('assets/images/car.jpg'),
                            //                     thumbnail: const NetworkImage(
                            //                       'https://i0.wp.com/codemyui.com/wp-content/uploads/2017/03/loading-animation.gif',
                            //                     ), // 64x36
                            //                     image: NetworkImage(
                            //                       item.image ?? "",
                            //                     ),
                            //                     // 3842x2160
                            //                     height: 250,
                            //                     width: 500,
                            //                     fit: BoxFit.fitHeight,
                            //                     placeholder: null,
                            //                   ),

                            //                   // Image.network(
                            //                   //   // item.image ?? "",
                            //                   // ),

                            //                   footer: Container(
                            //                     padding: const EdgeInsets.all(5),

                            //                     // ignore: sort_child_properties_last
                            //                     child: Text(
                            //                       item.price.toString(),
                            //                       textAlign: TextAlign.center,
                            //                       style: const TextStyle(
                            //                           color: Colors.black45),
                            //                     ),

                            //                     decoration: const BoxDecoration(
                            //                       color: Colors.white,
                            //                     ),
                            //                   ),
                            //                 ),
                            //               );
                            //             },
                            //             itemCount: catalogmodel.Items.length,
                            //           ),
                            //         ),
                            //       )

                            // ignore: unnecessary_null_comparison
                            // : (catalogmodel.Items != null &&
                            //         catalogmodel.Items.isNotEmpty)
                            //     ? Expanded(
                            //         flex: 3,
                            //         child: ListView.builder(
                            //           itemBuilder: (context, index) {
                            //             // ignore: unused_local_variable
                            //             final item = catalogmodel.Items[index];

                            //             return Card(
                            //               clipBehavior: Clip.antiAlias,
                            //               shape: RoundedRectangleBorder(
                            //                   borderRadius:
                            //                       BorderRadius.circular(5.0)),
                            //               child: ListTile(
                            //                 leading: Container(
                            //                   padding: const EdgeInsets.all(5),
                            //                   // ignore: sort_child_properties_last
                            //                   child: Text(
                            //                     item.name ?? "",
                            //                     style: const TextStyle(
                            //                         fontSize: 15,
                            //                         color: Colors.white),
                            //                   ),

                            //                   decoration: const BoxDecoration(
                            //                     color: Color.fromARGB(
                            //                         255, 201, 99, 224),
                            //                   ),
                            //                 ),

                            //                 // ignore: sort_child_properties_last
                            //                 title: ProgressiveImage(
                            //                   // placeholder: AssetImage('assets/images/car.jpg'),
                            //                   thumbnail: const NetworkImage(
                            //                       'https://i.imgur.com/eOQL4jg.jpg'), // 64x36
                            //                   image: NetworkImage(
                            //                       item.image ?? ""), // 3842x2160
                            //                   height: 250,
                            //                   width: 500,
                            //                   fit: BoxFit.fitHeight,
                            //                   placeholder: null,
                            //                 ),

                            //                 // Image.network(
                            //                 //   // item.image ?? "",
                            //                 // ),
                            //               ),
                            //             );
                            //           },
                            //           itemCount: catalogmodel.Items.length,
                            //         ),
                            //       )
                            // : const CircularProgressIndicator(),
                          ],
                        ),
                      )),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
