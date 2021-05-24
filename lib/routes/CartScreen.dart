import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/provider/cartItem.dart';
import 'package:gp_project/routes/product_details.dart';
import 'package:gp_project/services/store.dart';
import 'package:provider/provider.dart';
import 'package:gp_project/widgets/custom_menu.dart';

/*class CartScreen extends StatelessWidget {
  static String id = 'CartScreen';
  @override
  Widget build(BuildContext context) {
    List<product> products = Provider.of<CartItem>(context).products;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: KMainColor,
        elevation: 0,
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          LayoutBuilder(builder: (context, constrains) {
            if (products.isNotEmpty) {
              return Container(
                height: screenHeight -statusBarHeight -appBarHeight -(screenHeight * .08),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: GestureDetector(
                        onTapUp: (details) {
                          showCustomMenu(details, context, products[index]);
                        },
                        child: Container(
                          height: screenHeight * .15,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: screenHeight * .15 / 2,
                                backgroundImage:
                                    NetworkImage(products[index].pImage),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            products[index].pTitle,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '\$ ${products[index].pPrice}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text(
                                        products[index].pQuantity.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          color:Colors.white,
                        ),
                      ),
                    );
                  },
                  itemCount: products.length,
                ),
              );
            } else {
              return Container(
                height: screenHeight -
                    (screenHeight * .08) -
                    appBarHeight -
                    statusBarHeight,
                child: Center(
                  child: Text('Cart is Empty'),
                ),
              );
            }
          }),
         
        ],
      ),
    );
  }

  void showCustomMenu(details, context, product) async {
    double dx = details.globalPosition.dx;
    double dy = details.globalPosition.dy;
    double dx2 = MediaQuery.of(context).size.width - dx;
    double dy2 = MediaQuery.of(context).size.width - dy;
    await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
        items: [
          MyPopupMenuItem(
            onClick: () {
              Navigator.pop(context);
              Provider.of<CartItem>(context, listen: false)
                  .deleteProduct(product);
              Navigator.pushNamed(context, productdetails.id, arguments: product);
            },
            child: Text('Edit'),
          ),
          MyPopupMenuItem(
            onClick: () {
              Navigator.pop(context);
              Provider.of<CartItem>(context, listen: false)
                  .deleteProduct(product);
            },
            child: Text('Delete'),
          ),
        ]);
  }
}*/

class CartScreen extends StatelessWidget {
  static String id ='CartScreen';
  @override
  Widget build(BuildContext context) {
    List<product> products = Provider.of<CartItem>(context).products;
    final double screenHeight =MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset :false,
      appBar: AppBar(
        backgroundColor: KMainColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
         /* Row(
            children: <Widget>[
              Expanded(
                child: Divider(),
              ),
              Text("Cart Items"),
              Expanded(
                child: Divider(),
              ),
            ],
          ),*/
          LayoutBuilder(
            builder:(context,constrains){
              if(products.isNotEmpty){
              return  Container(
                height: screenHeight - statusBarHeight -appBarHeight - (screenHeight *.08),
                  child: ListView.builder(
                    itemBuilder : (context, index)
                    {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child :GestureDetector(
                          onTapUp:(details){
                            showCustomMenu(details, context, products[index]);
                          } ,
                        child: Container(
                          height : screenHeight*.15,
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: screenHeight* .15 /2,
                                  backgroundImage: NetworkImage(products[index].pImage),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(products[index].pTitle ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10,),
                                            Text(
                                              '\$ ${products[index].pPrice}',
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding : const EdgeInsets.only(right : 20),
                                      child :Text(
                                        products[index].pQuantity.toString()
                                       ),
                                      ),
                                    ],

                                  ),
                                )
                              ],
                            ),
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    itemCount : products.length,
                  ),
                );
              
            }else {
              return Container(
                height: screenHeight - (screenHeight * .08) - appBarHeight -statusBarHeight,
                child: Center(
                  child: Text('Cart is Empty'),
                  ),
              );
            }
            }
          ),

        Builder(
          builder: (context) => ButtonTheme(
           // minWidth: screenWidth,
           // height: screenHeight* .08,
            child :RaisedButton(
              onPressed: (){
                showCustomDialog(products,context);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
               padding: EdgeInsets.all(0.0),
               child: Ink(
              decoration: BoxDecoration(
               gradient: LinearGradient(colors: [KMainColor, Colors.deepPurple[200]],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
                 borderRadius: BorderRadius.circular(30.0)
               ),
              child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
              alignment: Alignment.center,
             child: const Text(
                 "Order",
                 textAlign: TextAlign.center,
                 style: TextStyle(
              color: Colors.white
             ),
             ),
             ),
             ),
            ),
          ),
        )
        ],
      ),
    );
  }

  

void showCustomDialog(List<product> products , context) async{
  var price =getTotallPrice(products);
  AlertDialog alertDialog = AlertDialog(
    actions: <Widget>[
      MaterialButton(
        onPressed: (){
          try{
            store _store =store();
            _store.storeOrders({
              kTotallPrice : price,
            }, products);
            Scaffold.of(context).showSnackBar(SnackBar(
              content : Text('Ordered Successfully'),
            ));
            Navigator.pop(context);
          }catch(ex){
            print(ex.message);
          }
        },
        child: Text('Confirm'),
      )
    ],
   title: Text('Total Price = \$ $price'),
  );
   await showDialog(
     context: context,
     builder: (context){
       return alertDialog;
     });


  
}
getTotallPrice(List<product> products){
  var price =0;
  for(var pro in products){
    price += pro.pQuantity * pro.pPrice;
  }
return price;
}

void showCustomMenu(details, context, pro) async {
    double dx = details.globalPosition.dx;
    double dy = details.globalPosition.dy;
    double dx2 = MediaQuery.of(context).size.width - dx;
    double dy2 = MediaQuery.of(context).size.width - dy;
    await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
        items: [
          MyPopupMenuItem(
            onClick: () {
              Navigator.pop(context);
              Provider.of<CartItem>(context, listen: false)
                  .deleteProduct(pro);
              Navigator.pushNamed(context, productdetails.id, arguments: pro);
            },
            child: Text('Edit'),
          ),
          MyPopupMenuItem(
            onClick: () {
              Navigator.pop(context);
              Provider.of<CartItem>(context, listen: false)
                  .deleteProduct(pro);
            },
            child: Text('Delete'),
          ),
        ]);
}
  
}
         