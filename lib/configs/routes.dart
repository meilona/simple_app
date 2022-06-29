import 'package:simple_app/views/add_page.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/add',
        page: () => AddPage(),
        transition: Transition.leftToRight,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];

class MyMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
