import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  final String? img;
  final String? title;
  final String? price;
  final String? date;
  final String? time;

  const Order({
    required this.img,
    required this.title,
    required this.price,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                image: DecorationImage(image: AssetImage(img!))),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.37,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                price!,
                style: TextStyle(
                  color: Color(0xFF474646),
                  fontSize: 17.37,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 90,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0E7391),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      date!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.47,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 90,
                    decoration: ShapeDecoration(
                      color: Color(0xFFE07BB2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      time!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.47,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
