import 'package:flutter/material.dart';
import 'package:organic/views/auth/view/main/auth_main.dart';
import 'package:organic/views/home/view/cart/view/bag_view.dart';
import 'package:organic/views/home/view/cart/view/orderStatusView.dart';
import 'package:organic/views/home/view/cart/view/order_status_view.dart';
import 'package:organic/views/home/view/cart/view/orger_view.dart';
import 'package:organic/views/home/view/cupon_view.dart';
import 'package:organic/views/home/view/info_view.dart';
import 'package:organic/views/home/view/main/main_view.dart';
import 'package:organic/views/home/view/search_view.dart';
import 'package:organic/views/profile/address/address_view.dart';
import 'package:organic/views/profile/customs/custom_service_view.dart';
import 'package:organic/views/profile/editprofile/changednumberconfirmation_view.dart';
import 'package:organic/views/profile/editprofile/edit_profile_view.dart';
import 'package:organic/views/profile/notifications/notification_settings_view.dart';
import 'package:organic/views/profile/notifications/notification_view.dart';
import 'package:organic/views/profile/password/change_password_view.dart';
import 'package:organic/views/profile/paymentmethod/add_payment_method_view.dart';
import 'package:organic/views/profile/paymentmethod/payment_method_view.dart';
import 'package:organic/views/splash/view/splashview.dart';

class AllRoutes {
  static final AllRoutes _instance = AllRoutes.init();
  static AllRoutes get instance => _instance;
  AllRoutes.init();

  Route? ongenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/splash':
        return pageReturner(const SplashView());
      case '/auth':
        return pageReturner(const AuthMain());
      case '/main_view':
        return pageReturner(const MainView());
       case '/status_view':
        return pageReturner(StatusView(forcontext: args as BuildContext,));  
      case '/info_view':
        return pageReturner(InfoView(
          product: args as Map,
        ));
      case '/bag_view':
        return pageReturner(BagView(
          newcontext: args as BuildContext,
        ));
      case '/search_view':
        return pageReturner(SearchView(
          newcontext: args as BuildContext,
        ));
      case '/cupon_view':
        return pageReturner(CuponView(
          context1: args as BuildContext,
        ));
      case '/order_view':
        return pageReturner(OrderView(newcontext: args as BuildContext,));
      case '/orderStatus_view':
        return pageReturner(OrderStatusView(newcontext: args as BuildContext,));  
      case '/notificationview':
        return pageReturner(NotificationView());
      case '/notificationsettingsview':
        return pageReturner(NotificationSettingsView());
      case '/changepasswordview':
        return pageReturner(
            ChangePasswordView(forcontext: args as BuildContext));
      case '/paymentmethodview':
        return pageReturner(
            PaymentMethodView(forcontext: args as BuildContext));
      case '/addressview':
        return pageReturner(AddressView());
      case '/editprofileview':
        return pageReturner(EditProfileView(forcontext: args as BuildContext));
      case '/changednumberconfirmationview':
        return pageReturner(
            ChangedNumberConfirmationView(forcontext: args as BuildContext));
      case '/addpaymentmethodview':
        return pageReturner(
            AddPaymentMethodView(forcontext: args as BuildContext));
      case '/customerserviceview':
        return pageReturner(
            CustomerServiceView(forcontext: args as BuildContext));
    }
    return null;
  }

  pageReturner(Widget page) => MaterialPageRoute(builder: (_) => page);
}
