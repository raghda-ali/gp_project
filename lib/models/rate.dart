import 'dart:ffi';

class rates {
  String userID;
  String productId;
  int myrate;
  Float avg;

  rates(
  {     this.productId,
        this.avg,
        this.myrate,
        this.userID
        });
}