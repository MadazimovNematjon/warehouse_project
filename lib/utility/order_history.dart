// import 'package:flutter/material.dart';
// import 'package:warehouse_project/model/order_model.dart';
// import 'package:warehouse_project/utility/my_text_style.dart';
//
// class OrderHistory extends StatefulWidget {
//   const OrderHistory({Key? key}) : super(key: key);
//
//   @override
//   State<OrderHistory> createState() => _OrderHistoryState();
// }
//
// class _OrderHistoryState extends State<OrderHistory> {
//   List<OrderModel> order = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     order.add(OrderModel(name: "Palonchi", data: "02.06.2023"));
//     order.add(OrderModel(name: "Palonchi", data: "02.06.2023"));
//     order.add(OrderModel(name: "Palonchi", data: "02.06.2023"));
//     order.add(OrderModel(name: "Palonchi", data: "02.06.2023"));
//     order.add(OrderModel(name: "Palonchi", data: "02.06.2023"));
//     order.add(OrderModel(name: "Palonchi", data: "02.06.2023"));
//     order.add(OrderModel(name: "Palonchi", data: "02.06.2023"));
//     order.add(OrderModel(name: "Palonchi", data: "02.06.2023"));
//     order.add(OrderModel(name: "Palonchi", data: "02.06.2023"));
//     order.add(OrderModel(name: "Palonchi", data: "02.06.2023"));
//     order.add(OrderModel(name: "Palonchi", data: "02.06.2023"));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.vertical,
//       itemCount:order.length,
//       itemBuilder: (context, index) => OrderItems(order[index]),
//     );
//   }
//
//   Widget OrderItems(OrderModel order) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       // padding: const EdgeInsets.only(left: 10,right: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween ,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("name",style: MyTextStyle.text20,),
//               Text("title",style: MyTextStyle.text16,)
//             ],
//           ),
//           Text("order.data!",style: MyTextStyle.text16,)
//         ],
//       ),
//     );
//   }
// }
