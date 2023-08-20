
import 'package:bloc/bloc.dart';
import 'package:firstflutterproject/constant.dart';
import 'package:firstflutterproject/layout/home_lyout/cubite/cubite.dart';
import 'package:firstflutterproject/layout/home_lyout/cubite/states.dart';
import 'package:firstflutterproject/modules/avilabeldayes/avilabel_dayes.dart';
import 'package:firstflutterproject/modules/econo_project/change_password/change_password.dart';
import 'package:firstflutterproject/modules/econo_project/login_econo/login/signin.dart';
import 'package:firstflutterproject/modules/econo_project/pages/splash_screen.dart';
import 'package:firstflutterproject/modules/econo_project/product_ditels/ditels_cubite/cubit_details.dart';
import 'package:firstflutterproject/modules/econo_project/profile/econo_profile.dart';
import 'package:firstflutterproject/modules/econo_project/profile/profile_cubit/profile_cubit.dart';
import 'package:firstflutterproject/modules/exprtinformation/expertinformation_screen.dart';
import 'package:firstflutterproject/modules/login/login_screen.dart';
import 'package:firstflutterproject/modules/signin/signup_screen.dart';
import 'package:firstflutterproject/modules/splash/splash_screen.dart';
import 'package:firstflutterproject/shared/bloc_observer.dart';
import 'package:firstflutterproject/shared/components/constants.dart';
import 'package:firstflutterproject/shared/network/language/cubit_lan.dart';
import 'package:firstflutterproject/shared/network/language/status_lan.dart';
import 'package:firstflutterproject/shared/network/local/cache_helper.dart';
import 'package:firstflutterproject/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/home_lyout/home_lyout.dart';
import 'modules/econo_project/cubit_sign_up/cubit.dart';
import 'modules/econo_project/favorite/favorite_cubit/fav_cubit.dart';
import 'modules/econo_project/login_econo/login_cubit/cubit.dart';
import 'modules/econo_project/product_categoies/accessoriess/accessoriess_cubit/accessoriess_cubit.dart';
import 'modules/econo_project/product_categoies/books/books_cubit/books_cubit.dart';
import 'modules/econo_project/product_categoies/clothes/clothes_cubit/clothes_cubit.dart';
import 'modules/econo_project/product_categoies/food/food_cubit/food_cubit.dart';
import 'modules/econo_project/product_categoies/furneture/furniture_cubit/furniture_cubit.dart';
import 'modules/econo_project/product_categoies/gifts/gifts_cubit/gifts_cubit.dart';
import 'modules/econo_project/product_categoies/shoses/shose_cubit/shose_cubit.dart';
import 'modules/econo_project/product_categoies/technology/technology_cubit/technology_cubit.dart';
import 'modules/econo_project/purchases/order_cubit/order_cubite.dart';
import 'modules/econo_project/sales/sales_cubit/sales_cubit.dart';
import 'modules/econo_project/sign1.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  //token=CacheHelper.getData(key: 'token');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override


  Widget build(BuildContext context) {
    return
      MultiBlocProvider(providers: [
        BlocProvider(
            create:(BuildContext context)=>BooksCubite()..getBooksdata()),
        BlocProvider(
            create:(BuildContext context)=>ELoginCubit()),
        BlocProvider(
            create: (BuildContext context)=>SignUpCubit(),),
        BlocProvider(
            create:(BuildContext context)=>AccessoriesCubite()..getAccessoriesdata()),
        BlocProvider(
            create:(BuildContext context)=>ClothesCubit()..getClothesdata()),
        BlocProvider(
            create:(BuildContext context)=>FoodCubite()..getFooddata()),
        BlocProvider(
            create:(BuildContext context)=>FurnitureCubite()..getFurnituredata()),
        BlocProvider(
            create:(BuildContext context)=>GiftsCubite()..getGiftsdata()),
        BlocProvider(
            create:(BuildContext context)=>ShoseCubite()..getShosedata()),
        BlocProvider(
            create:(BuildContext context)=>TechnologyCubite()..getTechnologydata()),
        BlocProvider(
            create: (BuildContext context)=>ProfileCubit()..getprofileinfo()),
        BlocProvider(
            create:(BuildContext context)=>OrderCubit()..getMyOrders()),
        BlocProvider(
            create:(BuildContext context)=>SalesCubit()..getMySales()),
        BlocProvider(
            create:(BuildContext context)=>FavCubit()..getFav()),
        BlocProvider(
          create: (BuildContext context) => EconoCubite()),
        BlocProvider(
            create: (BuildContext context) => DetailsCubit()),
        BlocProvider(
            create: (BuildContext context) => LanCubit()..getSavedLanguage()),

      ],
          child: BlocConsumer<EconoCubite,EconoStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    drawerTheme:DrawerThemeData(backgroundColor: Colors.white
                    ,surfaceTintColor: Colors.white,
                      scrimColor: Colors.white
                    ),
                    scaffoldBackgroundColor:Colors.white,
                    colorScheme:ColorScheme.light(),
                    backgroundColor:Colors.white ,
                    appBarTheme: AppBarTheme(
                        elevation: 0.0,
                        backgroundColor: Colors.white,
                        titleTextStyle: TextStyle(
                          color: Color(0xFF333739),
                          fontFamily: 'Mulish Medium'
                        ),
                        iconTheme: IconThemeData(
                            color:Color(0xFF333739),
                        )
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor:Colors.white,
                      selectedItemColor: strongColor,
                      unselectedItemColor: Colors.grey,
                    ),
                    textTheme: TextTheme(
                      //1تالة
                      headlineLarge: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Colors.black87,
                          fontFamily: 'Mulish Medium'),
                        //تالة2
                      headlineMedium: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          fontFamily: 'Mulish Medium'

                      ),
                        //تالة3
                      headlineSmall: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          fontFamily: 'Mulish Medium'

                      ),
                        //5+4+زينة1
                        displayLarge: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                            fontFamily: 'Mulish Medium'

                        ),
                        //زينة2
                      displayMedium: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                          fontFamily: 'Mulish Medium'

                      ),
                        //زينة 6 + 7
                      displaySmall: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          fontFamily: 'Mulish Medium'

                      ),

                      //zena3
                      bodyLarge: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                          fontFamily: 'Mulish Medium'

                      ),
                    ),


                  ),


                  darkTheme: ThemeData(
                    drawerTheme:DrawerThemeData(backgroundColor: Colors.black45,
                    scrimColor: Colors.black45,
                      surfaceTintColor: Colors.black45
                    ),
                    colorScheme: ColorScheme.dark(),
                    scaffoldBackgroundColor:Color(0xFF333739),
                    backgroundColor: Color(0xFF333739),
                    appBarTheme: AppBarTheme(
                        elevation: 0.0,
                        backgroundColor: Colors.black12,
                        titleTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                        iconTheme: IconThemeData(
                            color: Colors.white
                        )
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Color(0xFF333739),
                      type: BottomNavigationBarType.fixed,
                        selectedItemColor:Colors.white,
                        unselectedItemColor: Colors.grey

                    ),
                    textTheme: TextTheme(
                      //zena3
                      bodyLarge: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                          fontFamily: 'Mulish Medium'


                      ),
                      //1تالة
                        headlineLarge: TextStyle(
                            fontSize: 14,
                            height: 1.3,
                            color: Colors.white,
                            fontFamily: 'Mulish Medium'

                        ),
                        //تالة2
                        headlineMedium: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Mulish Medium'

                        ),
                        //تالة3
                        headlineSmall: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'Mulish Medium'

                        ),
                        //5+4+زينة1
                        displayLarge: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontFamily: 'Mulish Medium'

                        ),
                        //زينة2
                        displayMedium: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontFamily: 'Mulish Medium'

                        ),
                        //زينة 6 + 7
                        displaySmall: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'Mulish Medium'

                        ),


                    ),

                  ),
                  themeMode:EconoCubite.get(context).isDark?ThemeMode.dark:ThemeMode.light,
                  home: Splash(),
                );
              }
          )
      );
  }

}
