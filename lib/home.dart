import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';


class BikeClubHomePage extends StatefulWidget {
  const BikeClubHomePage({Key? key}) : super(key: key);

  @override
  State<BikeClubHomePage> createState() => _BikeClubHomePageState();
}

class _BikeClubHomePageState extends State<BikeClubHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _showBanner = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    // Listen for tab changes
    _tabController.addListener(() {
      setState(() {});
    });

    // Show/hide banner based on scroll position
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 150 && _showBanner) {
        setState(() {
          _showBanner = false;
        });
      } else if (_scrollController.position.pixels <= 150 && !_showBanner) {
        setState(() {
          _showBanner = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // App Bar
            SliverAppBar(
              backgroundColor: Colors.red,
              centerTitle: true,
              pinned: true,
              floating: true,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.menu, color: Colors.white,weight: 24,),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'keerthi',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/hpday.png',
                      width: 80,
                      height: 80,
                      // Use a placeholder method if the asset isn't available
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 40,
                          height: 40,
                          color: Colors.blue.shade800,
                          child: const Center(
                            child: Text(
                              'HP\nPAY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Icon(Icons.notifications_none,
                color: Colors.white,
                weight: 24,),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 8),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'SOS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Conditional Banner
            if (_showBanner)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/m3.jpg'),
                            fit: BoxFit.cover,
                            // Fallback if asset isn't available
                            onError: (exception, stackTrace) {},
                          ),
                          color: Colors.grey.shade700,
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                            Stack(
                              children: [
                                // Background image
                                Container(
                                  height: 250,
                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/m3.jpg',  // Your background image path
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // Dark overlay for better text readability
                                Container(
                                  height: 100,
                                  width: double.infinity,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                // Content row
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Left text
                                      Row(
                                        children: [

                                          const Text(
                                            '8 DayBike Trip To LEH LADAK',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Right container with price
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              // Image.asset(
                                              //   'assets/mtouch2.jpg',  // Your price icon image path
                                              //   width: 20,
                                              //   height: 20,
                                              // ),
                                              const SizedBox(width: 4),
                                              const Text(
                                                'Register Now',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/m4.jpg'),
                            fit: BoxFit.cover,
                            // Fallback if asset isn't available
                            onError: (exception, stackTrace) {},
                          ),
                          color: Colors.grey.shade700,
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                            Stack(
                              children: [
                                // Background image
                                Container(
                                  height: 250,
                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/m4.jpg',  // Your background image path
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // Dark overlay for better text readability
                                Container(
                                  height: 100,
                                  width: double.infinity,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                // Content row
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Left text
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'HAYABUSA',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                const Text(
                                                  '2019 HYDERABAD RIDERS MEETUP',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Right container with price
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              // Image.asset(
                                              //   'assets/mtouch2.jpg',  // Your price icon image path
                                              //   width: 20,
                                              //   height: 20,
                                              // ),
                                              const SizedBox(width: 4),
                                              const Text(
                                                '2000-8000 INR',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Tab Bar
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorWeight: 3.0,
                  indicatorColor: Colors.black,
                  tabs: const [
                    Tab(text: 'RIDES'),
                    Tab(text: 'STORIES'),
                    Tab(text: 'MARKET'),
                    Tab(text: 'GARAGE'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            // RIDES Tab
            _buildRidesTab(),

            // STORIES Tab
            _buildStoriesTab(),

            // MARKET Tab
            _buildMarketTab(),

            // GARAGE Tab
            _buildGarageTab(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget? _buildFloatingActionButton() {
    if (_tabController.index == 1 || _tabController.index == 2) {
      return Container(
        height: 130,
        width: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(200, 60, 30, 30),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(Icons.more_horiz, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Icon(Icons.cut_outlined, color: Colors.white),
            ),
          ],
        ),
      );
    }
    return null;
  }

  Widget _buildRidesTab() {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        _buildRideCard(
          title: 'ride to nandi hills',
          riderName: 'manish surapaneni',
          bikeBrand: 'Ducati',
          distance: '900 km',
          date: 'July 20 2024',
          location: 'hyderabad',
          coRiders: '12',
        ),
        _buildRideCard(
          title: 'ride to cochi hills',
          riderName: 'manish surapaneni',
          bikeBrand: 'Ducati',
          distance: '900 km',
          date: 'July 20 2024',
          location: 'hyderabad',
          coRiders: '12',
        ),
        _buildRideCard(
          title: 'ride to vayanad hills',
          riderName: 'manish surapaneni',
          bikeBrand: 'Ducati',
          distance: '900 km',
          date: 'July 20 2024',
          location: 'hyderabad',
          coRiders: '12',
        ),
        _buildRideCard(
          title: 'ride to kerala hills',
          riderName: 'manish surapaneni',
          bikeBrand: 'Ducati',
          distance: '900 km',
          date: 'July 20 2024',
          location: 'hyderabad',
          coRiders: '12',
        ),
      ],
    );
  }

  Widget _buildRideCard({
    required String title,
    required String riderName,
    required String bikeBrand,
    required String distance,
    required String date,
    required String location,
    required String coRiders,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: DecorationImage(
                image: AssetImage('assets/mtouch2.jpg'),
                fit: BoxFit.cover,
                // Fallback for asset not available
                onError: (exception, stackTrace) {},
              ),
              color: Colors.amber.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.indigo,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          riderName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          bikeBrand,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      'Co Riders: $coRiders',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.route, color: Colors.red, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.calendar_today, color: Colors.red, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.location_on, color: Colors.red, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMarketTab() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Market Item $index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGarageTab() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Garage Item $index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStoriesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFEE5E5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title ${index + 1}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}