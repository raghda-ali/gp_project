import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/provider/cartItem.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/product.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
=======
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
>>>>>>> b9ce5b7e1c97d21ebebefbc489c0798539c3e648

import 'CartScreen.dart';

class productdetails extends StatefulWidget {
<<<<<<< HEAD
  static String id = 'ProductInfo';
  @override
  _productdetailsState createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  int _quantity = 1;
  final _store = store();
=======
  static String id ='product details';
>>>>>>> b9ce5b7e1c97d21ebebefbc489c0798539c3e648

  @override
  _productdetailsState createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
    var selectedcurrency,selsctedtype;

  final _store = store();

    List<String> _category =<String>[
     ' Intellectual disability','Impaired mobility','Visual impairment','Impaired hearing','Others'
    ];

    @override
  Widget build(BuildContext context) {
    product pro = ModalRoute.of(context).settings.arguments;
    return Scaffold(
<<<<<<< HEAD
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image(
              fit: BoxFit.fill,
              image : NetworkImage(pro.pImage),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CartScreen.id);
                      },
                      child: Icon(Icons.shopping_cart,color: Colors.white,))
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: <Widget>[
                Opacity(
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .3,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            pro.pTitle,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            pro.pDescription,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$${pro.pPrice}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipOval(
                                child: Material(
                                  color: KMainColor,
                                  child: GestureDetector(
                                    onTap: add,
                                    child: SizedBox(
                                      child: Icon(Icons.add),
                                      height: 29,
                                      width: 29,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                _quantity.toString(),
                                style: TextStyle(fontSize: 40),
                              ),
                              ClipOval(
                                child: Material(
                                  color: KMainColor,
                                  child: GestureDetector(
                                    onTap: subtract,
                                    child: SizedBox(
                                      child: Icon(Icons.remove),
                                      height: 29,
                                      width: 29,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  opacity: .5,
               
                ),
                ButtonTheme(
                 /* minWidth: MediaQuery.of(context).size.width,*/
                  
                  child: Builder(
                    builder: (context) => RaisedButton(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
                      color: KMainColor,
                      child: Text('Add To Cart'),
                      onPressed: () {
                      CartItem cartItem = Provider.of<CartItem>(context, listen: false);
                      pro.pQuantity = _quantity;
                      bool exist = false;
                      var productsInCart = cartItem.products;
                      for (var productInCart in productsInCart) {
                      if ( productInCart.pTitle == pro.pTitle){
                         exist = true;
                          }
                        }
                      if (exist) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('you\'ve added this item before'),
                      ));
                       } else {
                       cartItem.addProduct(pro);
                       Scaffold.of(context).showSnackBar(SnackBar(
                       content: Text('Added to Cart'),
                       ));
                       }
                      }
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

   subtract() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        print(_quantity);
      });
    }
  }

  add() {
    setState(() {
      _quantity++;
      print(_quantity);
    });
  }
}


/*void addToCart(context,pro){
  CartItem cartItem = Provider.of<CartItem>(context, listen: false);
    pro.pQuantity = _quantity;
    bool exist = false;
    var productsInCart = cartItem.products;
    for (var productInCart in productsInCart) {
    if ( productInCart == pro){

        exist = true;
      }
    }
    if (exist) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('you\'ve added this item before'),
      ));
    } else {
      cartItem.addProduct(pro);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Added to Cart'),
      ));
    }
  }
}*/
 

  /*void addToCart(context, pro){
    CartItem cartItem = Provider.of<CartItem>( context , listen: false);
    pro.pQuantity = _quantity;
    cartItem.addProduct(pro);
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Added to Cart'),

    ));

  }*/

/*class productdetails extends StatefulWidget {
  static String id = 'product details';
  @override
  _productdetailsState createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  @override
  Widget build(BuildContext context) {
    product pro = ModelRoute.of(context).settings.arguments;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
          image: AssetImage(pro.pImage),
          ),
        ],),
      
    );
  }
}*/
/*class productdetails extends StatefulWidget {
  static String id ='product details';

  @override
  _productdetailsState createState() => _productdetailsState();
}
=======
      resizeToAvoidBottomInset: false,
>>>>>>> b9ce5b7e1c97d21ebebefbc489c0798539c3e648

class _productdetailsState extends State<productdetails> {
  int _quantity =1;

  final _store = store();

  @override
  Widget build(BuildContext context) {
    product pro = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          
        child :Image(
          fit:  BoxFit.fill,
          image: AssetImage(pro.pImage), 
          ),
        ),

      ],
      ),
      );
  }
}*/
   /* return Scaffold(
      resizeToAvoidBottomPadding: false,

      appBar: AppBar(title: Text('Product details'),backgroundColor: KMainColor,),  
      body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height * .3,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(
                        'Title :  ${pro.pTitle}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Price :  ${pro.pPrice}',

                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(

                        'Description :  ${pro.pDescription}',
                        //'\$${product.pPrice}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'phone :  ${pro.pContact_phone}',
                        //'\$${product.pPrice}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
<<<<<<< HEAD
                        children : <Widget>[
                           Text(
                        "Quantity : ",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                          ClipOval(
                            child: Material(
                            color:KMainColor,
                            child:GestureDetector(
                              onTap: plus,
                              child: SizedBox(
                              child: Icon(Icons.add),
                              height: 25,
                              width: 25,  
                              ),
                            ),
                            ),
                          ),
                       Text(
                         _quantity.toString(),
                         style:TextStyle(fontSize: 30),

                       ),
                        ClipOval(
                            child: Material(
                            color:KMainColor,
                            child:GestureDetector(
                              onTap: subtract,
                              child: SizedBox(
                              child: Icon(Icons.remove),
                              height: 25,
                              width: 25,  
                              ),
                            ),
                            ),
                          ),
                           
                        ]
                      ),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                         child : Builder(
                         builder : (context) =>RaisedButton(
                           shape: RoundedRectangleBorder(
                           borderRadius:BorderRadius.circular(80.0)),
                          color: KMainColor,
                          onPressed: (){
                          CartItem cartItem =Provider.of<CartItem>(context,listen: false);
                          pro.pQuantity = _quantity;
                          cartItem.addProduct(pro);
                          Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Added to Cart'
                          ),
                           ));
                          },
                          child: Text("Add to Cart",
                          style: TextStyle(color: Colors.white,),
                          ),
                          
                      ),
                       )
                      )
=======
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                Icon(FontAwesomeIcons.solidArrowAltCircleUp,
                                size:25.0,
                                color: Color(0xff622F74), ),
                                SizedBox(width:50.0,),
                                DropdownButton(
                                           items: _category.map((value)=> DropdownMenuItem(
                                             child: Text(
                                             //'value :  ${serv.servcategory}',
                                               value,
                                               style: TextStyle(color:Color(0xff622F74)),
                                             ),
                                             value: value, ))
                                               .toList(),
                                        onChanged : (selectCategoryType) {
                                             print('$selectCategoryType');
                                             setState(() {
                                           selsctedtype  =selectCategoryType;
                                            });
                                         },

                                           value:selsctedtype,
                                           isExpanded: false,
                                           hint:Text('Choose service type',
                                           style: TextStyle(color:Color(0xFF2A0B35)),),
                          ),

                       SizedBox(height: 40.0,),
                      StreamBuilder<QuerySnapshot>(
                      stream:Firestore.instance.collection("Products").snapshots(),
                      builder:(context,Snapshot){
                        if(!Snapshot.hasData){
                          Text("loading");
                        }
                        else{
                          // ignore: missing_return
                          List<DropdownMenuItem> currencyItems = [];
                          for(int i=0;i<Snapshot.data.documents.length;i++){
                            DocumentSnapshot snap=Snapshot.data.documents[i];
                            currencyItems.add( DropdownMenuItem(
                                child : Text(
                                  snap.documentID,
                                  style:TextStyle(color: Color(0xFF2A0B35)),

                                ),
                                value:"${snap.documentID}"
                              )
                            );
                          }

                        }
                      },
                      ),
             ],
                      ),
>>>>>>> b9ce5b7e1c97d21ebebefbc489c0798539c3e648
                    ],
                   
                  )

              ),
            ),
            //),
                       
          ],
        ),

      ],
    ),
    );
  }

plus(){
    setState(() {
          _quantity++;
        });
  }
    subtract(){
  if(_quantity>1){
    setState((){
    _quantity--;
    });
  }  
    }

   }*/
