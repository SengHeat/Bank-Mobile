import 'package:bank_mobile_app/constant/routes/app/route_name.dart';
import 'package:bank_mobile_app/data/entity/model/bank_service.dart';
import 'package:bank_mobile_app/data/entity/model/mini_app_service.dart';
import 'package:bank_mobile_app/data/entity/model/slide_service.dart';
import 'package:bank_mobile_app/data/entity/model/user_service.dart';
import 'package:bank_mobile_app/theme/color_resources.dart';
import 'package:bank_mobile_app/views/screen/home/home_mixin.dart';
import 'package:bank_mobile_app/views/security/security_mixin.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SecurityMixin, HomeMixin {

  final ScrollController _scrollController = ScrollController();
  bool isAtTop = true;
  bool isAtBottom = false;
  int activeIndex = 0;

  List<BankService> bankServices = [
    BankService(name: 'Payments', imagePath: "assets/icons/icon_payment.png", routeName: ""),
    BankService(name: 'Mobile Top-Up', imagePath: "assets/icons/icon_top_up.png", routeName: RoutesName.aboutScreen),
    BankService(name: 'Transfer', imagePath: "assets/icons/icon_transfer.png", routeName: ""),
    BankService(name: 'Pay-Me', imagePath: "assets/icons/icon_bank.png", routeName: ""),
    BankService(name: 'Scan QR', imagePath: "assets/icons/icon_scan.png", routeName: RoutesName.aboutScreen),
    BankService(name: 'Accounts', imagePath: "assets/icons/icon_account.png", routeName: ""),
    BankService(name: 'Deposits', imagePath: "assets/icons/icon_desposit.png", routeName: ""),
    BankService(name: 'Loans', imagePath: "assets/icons/icon_loans.png", routeName: ""),
    BankService(name: 'Quick Cash', imagePath: "assets/icons/icon_quick_cash.png", routeName: ""),
  ];

  List<UserService> userService = [
    UserService(id: "1", name: "Coffee Amazon", imagePath: "", routeName: ""),
    UserService(id: "2", name: "Coffee Nova", imagePath: "", routeName: ""),
    UserService(id: "3", name: "Coffee Cute", imagePath: "", routeName: ""),
    UserService(id: "4", name: "Seng Heat", imagePath: "", routeName: ""),
    UserService(id: "5", name: "Flutter Dev", imagePath: "", routeName: ""),
  ];

  List<SlideService> slideService = [
    SlideService(id: "1", name: "Get your loans for business \nexpansion or other use quickly.", imagePath: "https://www.acledabank.com.kh/kh/assets/image/img_acledatoanchet2.jpg", routeName: ""),
    SlideService(id: "1", name: "Get your loans for business \nexpansion or other use quickly.", imagePath: "https://www.acledabank.com.kh/kh/assets/image/banner-bill-mobile-eng.jpg", routeName: ""),
    SlideService(id: "1", name: "Get your loans for business \nexpansion or other use quickly.", imagePath: "https://www.acledabank.com.kh/kh/assets/image/banner-toanchet-loanrequest-eng.jpg", routeName: ""),

  ];

  List<String> list = [
    "https://cdn.kiripost.com/static/images/acleda-new-idcard.2e16d0ba.fill-960x540.jpg",
    "https://www.acledabank.com.kh/kh/assets/promotion/Credit.jpg",
    "https://www.acledabank.com.kh/kh/assets/promotion/300k-offer.jpg",
    "https://www.acledabank.com.kh/kh/assets/promotion/give-tip.jpg",
    "https://www.acledabank.com.kh/qr/toanchet-manual/loan.jpg",
    "https://cambodiainvestmentreview.com/wp-content/uploads/2024/10/Capture-7.jpg"
  ];

  List<Color> customColors = [
    Color(0xA1FF0000), // Red
    Color(0x8900FF00), // Green
    Color(0x6B0000FF),
    Color(0x7EFF00FF), // Magenta
    Color(0x7600FFFF), // Cyan
    Color(0x59800080), // Purple
  ];

  List<MiniAppService> miniAppService = [
    MiniAppService(id: "1", name: "CSX", imagePath: "assets/images/logo_csx.jpg", routeName: "csxRoute",),
    MiniAppService(id: "2", name: "Garden City", imagePath: "assets/images/logo_garden_city.jpg", routeName: "gardenCityRoute",),
    MiniAppService(id: "3", name: "Live WonderPass", imagePath: "assets/images/logo_live_wonderpass.png", routeName: "liveWonderPassRoute",),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  double previousOffset = 0.0;
  bool isFabVisible = false;

  void _scrollListener() {
    final currentOffset = _scrollController.offset;
    final minOffset = _scrollController.position.minScrollExtent;
    final maxOffset = _scrollController.position.maxScrollExtent;

    if (currentOffset < previousOffset) {
      setState(() {
        isFabVisible = false;
      });
      // Scrolling up
      if (currentOffset <= minOffset) {
        setState(() {
          isAtTop = true;
          isFabVisible = false;
        });
        print("User is at the top of the scroll view.");
      } else {
        print("User is scrolling up.");
      }
    } else if (currentOffset > previousOffset) {
      setState(() {
        isFabVisible = true;
      });
      if (currentOffset >= maxOffset) {
        setState(() {
          isAtBottom = true;
          isAtTop = false;
        });
        print("User is at the bottom of the scroll view.");
      } else {
        print("User is scrolling down.");
      }
    }
    previousOffset = currentOffset;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leadingWidth: 160,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Image.asset(
            "assets/images/logo_name_acleda.png",
          ),
        ),
        backgroundColor: ColorResources.getPrimaryColor(context),
        actions: [
          InkWell(
            child: Image.asset(
              "assets/icons/icon_support.png",
              width: 25,
              fit: BoxFit.cover,
              color: ColorResources.getWhiteColor(context),
            ),
          ),
          const SizedBox(width: 16,),
          InkWell(
            child: Image.asset(
              "assets/icons/icon_qr_user.png",
              width: 25,
              height: 25,
              fit: BoxFit.cover,
              color: ColorResources.getWhiteColor(context),
            ),
          ),
          const SizedBox(width: 16,),
        ],
        elevation: 4,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: Get.width,
                      height: Get.width,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment.center,
                          radius: 0.45,
                          colors: [
                            ColorResources.getWhiteColor(context),
                            ColorResources.getPrimaryColor(context),
                          ],
                          stops: const [0.3, 1.0],
                        ),
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 items per row
                          crossAxisSpacing: 1.5,
                          mainAxisSpacing: 1.5,
                          childAspectRatio: 1,
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Container(
                            color: ColorResources.getPrimaryColor(context),
                          );
                        },
                      ),
                    ),
                    ReorderableGridView.builder(
                      padding: EdgeInsets.zero,
                      onDragStart: (v) {
                        setState(() {
                          HapticFeedback.heavyImpact();
                        });
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          if (newIndex > oldIndex) {
                            newIndex == newIndex;
                          }
                          if (newIndex < 0) {
                            newIndex = 0;
                          }
                          if (newIndex >= bankServices.length) {
                            newIndex = bankServices.length - 1;
                          }
                          final tems = bankServices[oldIndex];
                          bankServices[oldIndex] = bankServices[newIndex];
                          bankServices[newIndex] = tems;
                          HapticFeedback.heavyImpact();
                        });
                      },
                      itemCount: bankServices.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1.5,
                        mainAxisSpacing: 1.5,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return ServiceCard(
                          key: ValueKey(bankServices[index].name),
                          service: bankServices[index],
                        );
                      },
                    ),
                  ],
                ),
                buildBalanceExchange(context),
                Container(
                  width: Get.width,
                  color: ColorResources.getPrimaryColor1(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Recent Transactions",
                          style: TextStyle(
                            color: ColorResources.getWhiteColor(context),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 180,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 4, right: 12),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: userService.length,
                          itemBuilder: (context, index) {
                            return  buildPaymentUser(context, userService[index], customColors[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  color: ColorResources.getWhiteColor(context),
                  padding: const EdgeInsets.all(0),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: Text(
                          "Recommended",
                          style: TextStyle(
                            color: ColorResources.getPrimaryColor(context),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      buildSlider(
                          context,
                          onPageChanged: (index) {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                          index: activeIndex,
                        service: slideService[activeIndex],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: Text(
                          "Special Offers",
                          style: TextStyle(
                            color: ColorResources.getPrimaryColor(context),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          child: Image.network(list[0], width: Get.width, height: 180,fit: BoxFit.fill,),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: Get.width,
                        height: Get.width,
                        margin: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 3 items per row
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1,
                          ),
                          itemCount: list.length - 2,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                              child: Image.network(list[index+1], width: Get.width, height: 180,fit: BoxFit.fill,),
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                        padding: EdgeInsets.all(16.0),
                        width: Get.width,
                        height: Get.width,
                        decoration: BoxDecoration(
                            color: Color(0x49accde1),
                          borderRadius: BorderRadius.all(Radius.circular(12.0))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Others",
                              style: TextStyle(
                                color: ColorResources.getPrimaryColor(context),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4,),
                            ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                              child: Image.network(list[5], width: Get.width ,height: 180,fit: BoxFit.fill,),
                            ),
                            Spacer(),
                            Container(
                              width: Get.width,
                              height: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  miniAppService.length,
                                      (index) {
                                    var service = miniAppService[index];
                                    return GestureDetector(
                                      onTap: () {
                                        authenticateWithPasscode(routeName: RoutesName.scanQrScreen);
                                      },
                                      child: SizedBox(
                                        width: Get.width * 0.27,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Container(
                                                width: 70,
                                                height: 70,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: ColorResources.getPrimaryColor(context),
                                                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                                  child: Image.asset(service.imagePath),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              service.name,
                                              style: TextStyle(
                                                color: ColorResources.getPrimaryColor(context),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Insurance",
                            style: TextStyle(
                              color: ColorResources.getPrimaryColor(context),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Appearance",
                            style: TextStyle(
                              color: ColorResources.getPrimaryColor(context),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: isAtTop
          ? ColorResources.getPrimaryColor(context)
          : isAtBottom
          ? ColorResources.getWhiteColor(context)
          : ColorResources.getPrimaryColor(context),
      floatingActionButton: isFabVisible
          ? FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        },
        child: const Icon(Icons.arrow_upward),
      ) : null,
    );
  }

  Future<void> _launchInAppWithBrowserOptions(String url) async {
    try {
      bool launched = await launch(url, forceSafariVC: false);
      if (!launched) {
        await launch(
          url,
          forceSafariVC: false,
          forceWebView: false,
        );
      }
    } catch (e) {
      // Handle exception if any
      print(e);
    }
  }

  Widget buildBalanceExchange(BuildContext context) {
    return Container(
      height: 120,
      width: Get.width,
      color: ColorResources.getPrimaryColor(context),
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () async {
              // authenticateWithPasscode(routeName: RoutesName.favoriteScreen);
              final url = Uri.parse("https://app.scholarar.com/thank-you");
              await _launchInAppWithBrowserOptions(url.toString());
            },
            child: Container(
              width: (Get.width - 40) / 2,
              padding: const EdgeInsets.only(top: 6, left: 12, right: 12, bottom: 12.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft, // Start from the left
                  end: Alignment.centerRight,  // End at the right
                  colors: [
                    Color(0xFF005A84),
                    Color(0xFF003F63),  // Right color - deep blue
                  ],
                ),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ], // Optional shadow
              ),
              child: Wrap(
                children: [
                  Text(
                    "Total Balance",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorResources.getWhiteColor(context),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorResources.getGoldColor(context),
                        ),
                      ),
                      const SizedBox(width: 6.0,),
                      Text(
                        "KHR", // Currency label
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorResources.getWhiteColor(context)// Blue color for KHR
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "3,877.00",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorResources.getWhiteColor(context),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: Get.width,
                    height: 1.2,
                    decoration: BoxDecoration(
                        color: ColorResources.getDarkGrey(context),
                        borderRadius: const BorderRadius.all(Radius.circular(12.0))
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorResources.successColor,
                        ),
                      ),
                      const SizedBox(width: 6.0,),
                      Text(
                        "USA", // Currency label
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorResources.getWhiteColor(context)// Blue color for KHR
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "54.14",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorResources.getWhiteColor(context),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: Get.width,
                    height: 4,
                    decoration: BoxDecoration(
                        color: ColorResources.getPrimaryColor(context),
                        borderRadius: const BorderRadius.all(Radius.circular(12.0))
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                                color: ColorResources.getGoldColor(context),
                                borderRadius: const BorderRadius.all(Radius.circular(12.0))
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 4,
                            decoration: const BoxDecoration(
                                color: ColorResources.transparentColor,
                                borderRadius: BorderRadius.all(Radius.circular(12.0))
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              authenticateWithPasscode(routeName: RoutesName.generateQrScreen);
            },
            child: Container(
              width: (Get.width - 40) / 2,
              height: 95,
              margin: EdgeInsets.symmetric(vertical: 6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft, // Start from the left
                  end: Alignment.centerRight,  // End at the right
                  colors: [
                    Color(0xFF003F63),
                    Color(0xFF005A84),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ], // Optional shadow
              ),
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Image.asset(
                        "assets/icons/icon_exchange.png",
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        color: ColorResources.successColor,
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Exchange Rate",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: ColorResources.getWhiteColor(context),
                            ),
                          ),
                          SizedBox(height: 6,),
                          Text(
                            "\$1 = 4,042",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: ColorResources.getWhiteColor(context),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 3,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentUser(BuildContext context, UserService service, Color color) {
    return  GestureDetector(
      onTap: () {
        authenticateWithPasscode(routeName: RoutesName.scanQrScreen);
      },
      child: Container(
        width: Get.width * 0.27,
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.only(top: 6, left: 12, right: 12, bottom: 12.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter, // Start from the left
            end: Alignment.bottomCenter,  // End at the right
            colors: [
              Color(0xffE0E0E0),  // Right color - deep blue
              Color(0xffE0E0E0),  // Right color - deep blue
            ],
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ], // Optional shadow
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 24,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                  child: Text(
                    convertToAbbreviation(service.name),
                    style: TextStyle(
                      color: ColorResources.getWhiteColor(context),
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Text(
              service.name,
              style: TextStyle(
                color: ColorResources.getPrimaryColor(context),
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String convertToAbbreviation(String input) {
    List<String> words = input.split(' ');
    String abbreviation = words.map((word) => word[0]).join();
    return abbreviation.toUpperCase();
  }

  Widget buildSlider(BuildContext context,{
    required Function(int index) onPageChanged,
    required int index,
    required SlideService service
  }) {
    return Column(
      children: [
        ClipRRect(
          child: Container(
            width: Get.width,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: CarouselSlider.builder(
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: const EdgeInsets.only(left: 1,right: 1),
                  child: GestureDetector(
                    child: Container(
                      width: Get.width - 32,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        color: ColorResources.getDarkGrey(context),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                            child: Image.network(service.imagePath, width: Get.width, height: Get.height,fit: BoxFit.fill,),
                          ),
                          Positioned(
                            left: 12,
                            bottom: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Welcome",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: ColorResources.getWhiteColor(context)// Blue color for KHR
                                  ),
                                ),
                                Text("Seng Heat!".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: ColorResources.getWhiteColor(context)// Blue color for KHR
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    Text(service.name,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: ColorResources.getLightGrey(context)// Blue color for KHR
                                      ),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 12.0),
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft, // Start from the left
                                        end: Alignment.centerRight,  // End at the right
                                        colors: [
                                          Color(0x3C32E11C),
                                          Color(0x90003F63),  // Right color - deep blue
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(16))
                                    ),
                                    child: Text(
                                      "Click here",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: ColorResources.getWhiteColor(context)// Blue color for KHR
                                      ),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 3,
              options: CarouselOptions(
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                height: 250,
                viewportFraction: 1.0,
                autoPlay: true,
                reverse: false,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  onPageChanged(index);
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: SizedBox(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                AnimatedSmoothIndicator(
                  activeIndex: index,
                  count: 3,
                  effect: SlideEffect(
                    dotWidth: index ==  activeIndex ? 22 : 3.56,
                    dotHeight: 6,
                    activeDotColor: ColorResources.getPrimaryColor(context),
                    dotColor: ColorResources.getGoldColor(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}

class ServiceCard extends StatelessWidget with SecurityMixin {
  final BankService service;

  ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        authenticateWithPasscode(routeName: RoutesName.generateQrScreen);
      },
      child: Container(
        color: ColorResources.getPrimaryColor(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              service.imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              color: ColorResources.getWhiteColor(context),
            ),
            const SizedBox(height: 8.0),
            Text(
              service.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorResources.getWhiteColor(context),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



