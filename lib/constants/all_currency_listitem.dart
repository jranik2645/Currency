
 import 'package:currency_app/model/currencymodel.dart';
import 'package:flutter/material.dart';

class AllCurrencyListItem extends StatelessWidget {
     final  Currencymodel  currencymodel;
   const AllCurrencyListItem({super.key, required this.currencymodel});

   @override
   Widget build(BuildContext context) {
     return  Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
           margin: EdgeInsets.all(8),
           decoration: BoxDecoration(
              color: Colors.blue.withAlpha(88),
              borderRadius: BorderRadius.circular(10),

           ),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [ 
                 Text(currencymodel.code.toString(),
                  style: TextStyle(color: Colors.white,fontSize: 17),
                 ),
               Text(currencymodel.value?.toStringAsFixed(2).toString()??"",
                 style: TextStyle(color: Colors.white,fontSize: 17),
               ),

             ],
          ),
     );
   }

 }
