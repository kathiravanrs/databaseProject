import 'package:flutter/material.dart';
import 'package:flutter_login/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_example/helpers/global.dart';
import 'package:login_example/screens/flight_details.dart';
import 'package:login_example/screens/insurance_details.dart';
import 'package:login_example/screens/invoice_page.dart';
import 'package:login_example/screens/passenger_details.dart';
import 'package:login_example/screens/payment_details.dart';

import '../helpers/constants.dart';
import '../helpers/transition_route_observer.dart';
import '../widgets/fade_in.dart';
import '../widgets/round_button.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/auth')
        .then((_) => false);
  }

  final routeObserver = TransitionRouteObserver<PageRoute?>();
  static const headerAniInterval = Interval(.1, .3, curve: Curves.easeOut);
  late Animation<double> _headerScaleAnimation;
  AnimationController? _loadingController;

  void submit(route) {
    Navigator.pushNamed(context, route);
  }

  @override
  void initState() {
    super.initState();

    print(isLoggedIn);
    print(userEmail);

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );

    _headerScaleAnimation =
        Tween<double>(begin: .6, end: 1).animate(CurvedAnimation(
      parent: _loadingController!,
      curve: headerAniInterval,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute<dynamic>?);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _loadingController!.dispose();
    super.dispose();
  }

  @override
  void didPushAfterTransition() => _loadingController!.forward();

  AppBar _buildAppBar(ThemeData theme) {
    final signOutBtn = IconButton(
      icon: const Icon(FontAwesomeIcons.signOutAlt),
      color: theme.colorScheme.secondary,
      onPressed: () => _goToLogin(context),
    );
    final title = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Hero(
              tag: Constants.logoTag,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/ecorp.png',
                  filterQuality: FilterQuality.high,
                  height: 50,
                ),
              ),
            ),
          ),
          HeroText(
            Constants.appName,
            tag: Constants.titleTag,
            viewState: ViewState.shrunk,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

            // style: LoginThemeHelper.loginTextStyle,
          ),
          const SizedBox(width: 20),
        ],
      ),
    );

    return AppBar(
      actions: <Widget>[
        FadeIn(
          controller: _loadingController,
          offset: .3,
          curve: headerAniInterval,
          fadeDirection: FadeDirection.endToStart,
          child: signOutBtn,
        ),
      ],
      title: title,
      backgroundColor: theme.primaryColor.withOpacity(.1),
      elevation: 0,
    );
  }

  Widget _buildHeader(ThemeData theme) {
    final primaryColor =
        Colors.primaries.where((c) => c == theme.primaryColor).first;
    final accentColor =
        Colors.primaries.where((c) => c == theme.colorScheme.secondary).first;
    final linearGradient = LinearGradient(colors: [
      primaryColor.shade800,
      primaryColor.shade200,
    ]).createShader(const Rect.fromLTWH(0.0, 0.0, 418.0, 20.0));

    return ScaleTransition(
      scale: _headerScaleAnimation,
      child: FadeIn(
        controller: _loadingController,
        curve: headerAniInterval,
        fadeDirection: FadeDirection.bottomToTop,
        offset: .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Logged in as ' + userEmail,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      {Widget? icon,
      String? label,
      required Interval interval,
      String? route}) {
    return RoundButton(
      size: 200,
      icon: icon,
      label: label,
      loadingController: _loadingController,
      interval: Interval(
        interval.begin,
        interval.end,
        curve: const ElasticOutCurve(0.42),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route!);
      },
    );
  }

  Widget _buildDashboardGrid() {
    const step = 0.04;
    const aniInterval = 0.75;

    return GridView.count(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 10,
      ),
      childAspectRatio:
          (MediaQuery.of(context).size.width * 0.0006), // crossAxisSpacing: 5,
      crossAxisCount: 6,
      children: [
        _buildButton(
          route: FlightDetails.routeName,
          icon: const Icon(Icons.airplane_ticket),
          label: 'Flight Details',
          interval: const Interval(step, aniInterval + step),
        ),
        _buildButton(
          route: PassengerDetails.routeName,
          icon: const Icon(Icons.people),
          label: 'Passengers',
          interval: const Interval(step * 2, aniInterval + step * 2),
        ),
        _buildButton(
          route: InsuranceDetails.routeName,
          icon: const Icon(Icons.document_scanner_rounded),
          label: 'Insurance',
          interval: const Interval(0, aniInterval),
        ),
        _buildButton(
          route: PaymentDetails.routeName,
          icon: const Icon(Icons.credit_card),
          label: 'Payment',
          interval: const Interval(step * 2, aniInterval + step * 2),
        ),
        _buildButton(
          route: InvoicePage.routeName,
          icon: const Icon(FontAwesomeIcons.newspaper),
          label: 'Generate Invoice',
          interval: const Interval(step * 2, aniInterval + step * 2),
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.user),
          label: 'Profile',
          interval: const Interval(0, aniInterval),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () => _goToLogin(context),
      child: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(theme),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: theme.primaryColor.withOpacity(.1),
            child: Stack(
              children: <Widget>[
                if (isLoggedIn)
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      Expanded(
                        flex: 2,
                        child: _buildHeader(theme),
                      ),
                      Expanded(
                        flex: 8,
                        child: ShaderMask(
                          // blendMode: BlendMode.srcOver,
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              tileMode: TileMode.clamp,
                              colors: <Color>[
                                Colors.deepPurpleAccent.shade100,
                                Colors.deepPurple.shade100,
                                Colors.deepPurple.shade100,
                                Colors.deepPurple.shade100,
                                // Colors.red,
                                // Colors.yellow,
                              ],
                            ).createShader(bounds);
                          },
                          child: _buildDashboardGrid(),
                        ),
                      ),
                    ],
                  ),
                if (!isLoggedIn)
                  const Center(
                    child: Text(
                      "Please Log In To Continue",
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
