import 'package:flutter/material.dart';
import 'package:retrovault/components/checkboxform.dart';

class WishListItem extends StatelessWidget {
  final String? price;
  final String? title;
  final String? imgTxt;
  
  const WishListItem({
    required this.price,
    required this.title,
    required this.imgTxt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CheckboxForm(),
          SizedBox(width: 10.0,),
          Container(
            width: 50,
            height: 50,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(
                    imgTxt!),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(width: 10.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.37,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  price!,
                  style: TextStyle(
                      color: Color(0xFF474646),
                      fontSize: 17.37,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
