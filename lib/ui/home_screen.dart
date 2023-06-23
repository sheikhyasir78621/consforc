import 'package:consforc/costants/colors.dart';
import 'package:consforc/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:consforc/costants/assets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppTheme.purpleColor,

          statusBarBrightness: Brightness.dark),
    );
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBar(context),
            SizedBox(height: 20,),
            _typeList(context),

            SizedBox(height: 10,),

            Container(
              height: MediaQuery.of(context).size.height/1.5,
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: 20,),

                  saleRow(),

                  SizedBox(height: 20,),

                  listWidget(context, personImage, 'Spoken English', true),
                  SizedBox(height: 20,),

                  Padding
                    (
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Text('POPULAR COURSES', style: TextStyle(color: AppTheme.darkPurpleColor,fontWeight: FontWeight.bold, fontSize: 14),)),

                  SizedBox(height: 14,),

                  listWidget(context, mathImage, 'Product Design', false),
                  SizedBox(height: 10,),

                  listWidget(context, boyImage, 'Project Managment', false),
                  SizedBox(height: 200,),

                ],
              ),
            ),




          ],

        ),
      ),
    );
  }
/////////////////////////////////////////////////////////////////////////////////
  _appBar(context){
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppTheme.purpleColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),

        ),


      )
      ,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.lightPurpleColor,
                    shape: BoxShape.circle,

                  ),
                  child: Image.asset(menuIcon),
                ),

                Stack(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/1.7,
                      decoration: BoxDecoration(
                          color: AppTheme.lightPurpleColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppTheme.borderColor)


                      ),
                      alignment: Alignment.centerLeft,
                      child: Container(

                        width: MediaQuery.of(context).size.width/2.5 ,

                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,

                              hintText: 'Search here',
                              hintStyle: TextStyle(

                                color: Colors.white,


                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16)
                          ),
                        ),
                      ),


                    ),
                    Positioned(
                        right: 0,
                        top: 0,

                        child:  Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppTheme.whiteColor,shape: BoxShape.circle
                          ),
                          child: Image.asset(searchIcon),
                        ) )
                  ],
                )
              ],
            ),


            SizedBox(height: 40,),


           Text('Good Morning, Qubo!', style: TextStyle(
             color: AppTheme.whiteColor,
             fontSize: 26,
             fontWeight: FontWeight.w700
           ),),
            SizedBox(height: 10,),


            Text('Be educated so that you can change the world.', style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: 16
            ),)



          ],
        ),
      ),

    );
  }

/////////////////////////////////////////////////////////////////////////////////

  _typeList(context){
    AppState provider = Provider.of<AppState>(context);
    return
      Container(
      height: 40,
      padding: EdgeInsets.only(left: 14),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          GestureDetector(
            onTap: (){
              provider.updateAllStatus();
            },
            child: _typeContainer('All', provider.all),
          ),
          GestureDetector(
            onTap: (){
              provider.updateDesignStatus();
            },
            child: _typeContainer('Design', provider.design),
          ),
          GestureDetector(
            onTap: (){
              provider.updateCommunicationStatus();
            },
            child: _typeContainer('Communication', provider.communication),
          ),GestureDetector(
            onTap: (){
              provider.updateDevelopmentStatus();
            },
            child:  _typeContainer('Development', provider.development),
          ),




        ],
      ),
    );

  }





_typeContainer(String value, bool selected){
    return Container(
      margin: EdgeInsets.only(
        right: 10
      ),
      padding: EdgeInsets.symmetric(horizontal: 18,),
      decoration: BoxDecoration(
        color: selected ? AppTheme.purpleColor: AppTheme.purpleTabColor,
        borderRadius: BorderRadius.circular(20),


      ),
      alignment: Alignment.center,
      child: Text(value, style: TextStyle(
        fontSize: 18,
        color: selected ? AppTheme.whiteColor : AppTheme.blackColor,
      ),),
    );
}
/////////////////////////////////////////////////////////////

saleRow(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
        Text('ON SALE', style: TextStyle(color: AppTheme.darkPurpleColor,fontWeight: FontWeight.w700, fontSize: 14),),

          Text('View all', style: TextStyle(color: AppTheme.lightPurpleColor, fontSize: 14),),

        ],
      ),
    );
}
//////////////////////////////////////////////////////////////////////////////////////

  listWidget(context, image, title, onSale){
   return Container(
      height: 180,
      padding: EdgeInsets.only(left: 14),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,

        children: [
          listTile(image, title, onSale, context),
          listTile(image, title, onSale, context)




        ],
      ),
    );

  }



listTile(image, title, onSale, context){
    return Container(
      height: 180,
      margin: EdgeInsets.only(right: 10),
      width: MediaQuery.of(context).size.width/1.1,

      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.purpleTabColor, width: 1.5),
        borderRadius: BorderRadius.circular(18),
        
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Align(
              alignment: FractionalOffset.centerRight,
              child: Image.asset(image),

            ),
          ),
          Positioned(
            top: 20,
            left: 10,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(text: TextSpan(
                    text: '$title ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppTheme.darkPurpleColor),
                    children: [
                      onSale ?
                      TextSpan(
                        text: '\$49.99',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.darkPurpleColor,
                          decoration: TextDecoration.lineThrough

                        )
                      ) : TextSpan(),
                      TextSpan(
                          text: '  \$9.99',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: AppTheme.darkPurpleColor,


                          )
                      )
                    ]

                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      tiles(classesIcon, 'Live classes', 26),
                      SizedBox(
                        width: 6,
                        
                      ),
                      tilesWithMargin(examIcon, 'Weekly exam')
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      tiles(videoIcon, 'Recorded videos', 40),
                      SizedBox(
                        width: 6,

                      ),
                      tilesWithMargin(notesIcon, 'Study notes')
                    ],
                  )
                 





                  ],
              )),

          Positioned(
            bottom: 10,
              right: 6,
              

              child: Container(
                height: 40,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.darkPurpleColor,
                  shape: BoxShape.circle,
                  
                ),
                child: Image.asset(playIcon),
                
              ))
        ],
      ),

    );
}

tiles(image, title, count){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.purpleTabColor,
        borderRadius: BorderRadius.circular(20),


      ),
      child: Row(
        children: [
          Container(
            height: 22,
            child: Image.asset(image),
          ),
          SizedBox(width: 6,),
          RichText(text: TextSpan(
            text: count.toString(), style: TextStyle(
            color: AppTheme.darkPurpleColor,
            fontSize: 13, fontWeight: FontWeight.w600,
          ),

            children: [
              TextSpan(
              text: ' $title', style: TextStyle(
            color: AppTheme.darkPurpleColor,
            fontSize: 13, fontWeight: FontWeight.w400,
          ),)
            ]
          ))

        ],
      ),
    );
}
  tilesWithMargin(image, title,){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.purpleTabColor,
        borderRadius: BorderRadius.circular(20),


      ),
      child: Row(
        children: [
          Container(
            height: 22,
            child: Image.asset(image),
          ),
          SizedBox(width: 6,),
         Container(
           margin: EdgeInsets.only(top: 8 ),
           child: Text(title, style: TextStyle(
             fontSize: 13,
             fontWeight: FontWeight.w400,
             color: AppTheme.darkPurpleColor
           ),),
         )

        ],
      ),
    );
  }







}
