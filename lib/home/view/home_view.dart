// part of 'view.dart';
//
// class HomeView extends StatelessWidget {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseScaffold(
//       appBar: CustomAppBar(
//         title: 'Home',
//         actions: [
//           GestureDetector(
//             onTap: () {
//               // context.push(NotificationPage.route());
//               Navigator.push(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (_) => const NotificationPage(),
//                 ),
//               );
//             },
//             child: const AssetIcon.monotone(AssetIcons.alert),
//           ),
//         ],
//         leading: Builder(
//           builder: (context) {
//             return InkWell(
//               onTap: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               child: const Padding(
//                 padding: EdgeInsets.all(12.0),
//                 child: AssetIcon.monotone(AssetIcons.menu),
//               ),
//             );
//           },
//         ),
//       ),
//       drawer: const CustomDrawer(),
//       body: const Column(
//         children: [],
//       ),
//     );
//   }
// }
