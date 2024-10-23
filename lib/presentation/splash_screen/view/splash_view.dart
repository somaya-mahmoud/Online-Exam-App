// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// import '../states/splash_states.dart';
// import '../viewmodel/splash_viewmodel.dart';
// import 'widgets/splash_body.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => SplashViewModel()..start(),
//         child: BlocConsumer<SplashViewModel, BaseStates>(
//           listener: (context, state) {
//             if (state is UserSignedState) {
//               if (kIsWeb && state.person.role == UserRole.user) {
//                 WidgetsBinding.instance.addPostFrameCallback(
//                   (_) {
//                     Navigator.pushReplacementNamed(
//                       context,
//                       Routes.downloadAppRoute,
//                     );
//                   },
//                 );
//               }
//               if (state.person.status == AccountStatus.pending) {
//                 Navigator.pushReplacementNamed(
//                   context,
//                   Routes.registerPendingRoute,
//                 );
//               } else if (state.person.role == UserRole.hotelOwner &&
//                   (state.person as HotelOwnerModel).hotel == null) {
//                 Navigator.pushReplacementNamed(
//                   context,
//                   Routes.registerHotelRoute,
//                 );
//               } else {
//                 switch (state.person.role) {
//                   case UserRole.user:
//                     Navigator.pushReplacementNamed(
//                       context,
//                       Routes.mainLayoutRoute,
//                     );
//                     break;
//                   case UserRole.homeOwner:
//                     Navigator.pushReplacementNamed(
//                       context,
//                       Routes.ownerDashboardHomeRoute,
//                     );
//                     break;
//                   case UserRole.hotelOwner:
//                     Navigator.pushReplacementNamed(
//                       context,
//                       Routes.hotelHomeRoute,
//                     );
//                     break;
//                   case UserRole.chaletOwner:
//                     Navigator.pushReplacementNamed(
//                       context,
//                       Routes.chaletOwnerDashboardHomeRoute,
//                     );
//                     break;
//                   case UserRole.tourCompanyOwner:
//                     Navigator.pushReplacementNamed(
//                       context,
//                       Routes.transportationHomeRoute,
//                     );
//                     break;
//                   case UserRole.admin:
//                     Navigator.pushReplacementNamed(
//                       context,
//                       Routes.adminDashboardHomeRoute,
//                     );
//                     break;
//                 }
//               }
//             } else if (state is UserNotSignedState) {
//               Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
//             }
//             baseListener(context, state);
//           },
//           builder: (context, state) {
//             return baseBuilder(context, state, const SplashScreenBody());
//           },
//         ),
//       ),
//     );
//   }
// }
