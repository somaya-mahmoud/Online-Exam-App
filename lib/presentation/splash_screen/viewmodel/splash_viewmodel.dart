// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:online_exam_app/di/di.dart';
//
// import '../../../data/services/user_manager.dart';
// import '../../base/base_cubit.dart';
// import '../../base/base_states.dart';
// import '../states/splash_states.dart';
//
// class SplashViewModel extends BaseCubit
//     implements SplashViewModelInput, SplashViewModelOutput {
//   static SplashViewModel get(context) => BlocProvider.of(context);
//
//   final GetCurrentUserUseCase _getCurrentUserUseCase =
//       sl<GetCurrentUserUseCase>();
//   final UserManager _userManager = getIt<UserManager>();
//
//   @override
//   void start() {
//     emit(ContentState());
//   }
//
//   Future<void> getCurrentUser() async {
//     await _getCurrentUserUseCase(null).then(
//       (value) {
//         value.fold(
//           (l) {
//             emit(
//               ErrorState(
//                 failure: l,
//                 retry: start,
//                 buttonStyle: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(AppPadding.p8),
//                   backgroundColor: ColorManager.white,
//                   foregroundColor: ColorManager.primary,
//                 ),
//                 width: AppSize.s200,
//               ),
//             );
//           },
//           (r) {
//             if (r) {
//               emit(UserSignedState(_userManager.getCurrentPerson!));
//             } else {
//               emit(UserNotSignedState());
//             }
//           },
//         );
//       },
//     );
//   }
// }
//
// abstract class SplashViewModelInput {}
//
// abstract class SplashViewModelOutput {}
