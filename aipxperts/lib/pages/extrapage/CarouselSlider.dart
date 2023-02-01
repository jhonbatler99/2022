import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider(
      {Key? key, required List items, required CarouselOptions options})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        //1st Image of Slider
        Container(
          padding: EdgeInsets.all(5),
          margin: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
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
            borderRadius: BorderRadius.circular(15.0),
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
            borderRadius: BorderRadius.circular(15.0),
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
            borderRadius: BorderRadius.circular(15.0),
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
            borderRadius: BorderRadius.circular(15.0),
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
            borderRadius: BorderRadius.circular(15.0),
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
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
