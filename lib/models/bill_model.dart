import 'product_model.dart';

class TotalBillModel {
  late int id;
  // totolcash = price list order + tax + overtime
  late String totalcash;
  late String payment;
  late String tid;
  late String seat;
  late List<ProductModel> orderdetail;
  late String checkintime;
  late String checkouttime;

  TotalBillModel({
    required this.id,
    required this.totalcash,
    required this.payment,
    required this.tid,
    required this.seat,
    required this.orderdetail,
    required this.checkintime,
    required this.checkouttime,
  });

  Map<String, dynamic> getTotalBillMap() {
    return {
      "totalcash": totalcash,
      "payment": payment,
      "tid": tid,
      "seat": seat,
      "orderdetail": orderdetail.map((order) => order.toJson()).toList(),
      "checkintime": checkintime,
      "checkouttime": checkouttime,
    };
  }
}
