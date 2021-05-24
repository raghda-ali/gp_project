import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/rate.dart';

class Rating extends StatefulWidget{
final int mazimunRating;
final Function(int) onRatingSelected;

Rating(this.onRatingSelected, [this.mazimunRating =5]);

@override
_Rating createState()=> _Rating();
}


class _Rating extends State<Rating> {
int _currentRating =0;
Widget _buildRatingStar(int index){
  if(index < _currentRating){
return Icon(Icons.star, color:Colors.yellow[800]);
}else{
  return Icon(Icons.star_border_outlined);
}
}



Widget _buildBody(){
  final stars = List<Widget>.generate(this.widget.mazimunRating, (index) {
    return GestureDetector(
      child:  _buildRatingStar(index),
      onTap: (){
        setState(() {
                  _currentRating =index+1;
                });
                this.widget.onRatingSelected(_currentRating);

      },
    );

  });
  return SingleChildScrollView(
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              children: stars,
            ),
          SizedBox(width: 15,),
          if(_currentRating!=null&&_currentRating!=0)
          Text("you selected $_currentRating rating",
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.start,)
         /* FlatButton(
            child: Text("Clear", style: TextStyle(color: KMainColor )),
            onPressed: (){
              setState(() {
                          _currentRating=0;
                        });
                        this.widget.onRatingSelected(_currentRating);
            },
          )*/
        ],
      
    ),
  );

}

@override
Widget build(BuildContext context){
  return _buildBody();
}
}
