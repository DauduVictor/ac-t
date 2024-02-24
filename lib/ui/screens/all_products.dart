import 'package:acm_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax/iconsax.dart';

class AllProducts extends StatefulWidget {
  static const String id = 'allProducts';
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        // if (_tabController?.index != 0) {
        //   isShowAdditionalBioInfo = false;
        // } else {
        //   isShowAdditionalBioInfo = true;
        // }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Products',
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              splashColor: AppColors.primaryColor.withOpacity(0.2),
              highlightColor: AppColors.primaryColor.withOpacity(0.2),
              onTap: () => Navigator.pushNamed(context, SummaryScreen.id),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.how_to_vote,
                      size: 15,
                      color: AppColors.secondaryColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Summary',
                      textScaler: const TextScaler.linear(1),
                      style: textTheme.bodySmall!.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(color: AppColors.blackColor2),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomTextFormField(
              hintText: 'Search...',
              textEditingController: searchController,
              keyboardType: TextInputType.text,
              prefix: const Icon(
                Iconsax.search_normal_14,
                color: AppColors.greyColor3,
                size: 17,
              ),
              textInputAction: TextInputAction.search,
              bottomSpacing: false,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, 1.3),
                      child: const Divider(
                        color: AppColors.strokeColor,
                        height: 5,
                        thickness: 0.8,
                      ),
                    ),
                    TabBar(
                      controller: _tabController,
                      isScrollable: false,
                      indicatorColor: AppColors.primaryColor,
                      labelStyle: textTheme.bodyMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: textTheme.bodyMedium!.copyWith(
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w600,
                      ),
                      tabs: const [
                        Tab(
                          child: Text(
                            'All',
                            textScaler: TextScaler.linear(1),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Skin',
                            textScaler: TextScaler.linear(1),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Hair',
                            textScaler: TextScaler.linear(1),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Face',
                            textScaler: TextScaler.linear(1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ProductItems(noOfItems: 3),
                ProductItems(noOfItems: 1),
                ProductItems(noOfItems: 6),
                ProductItems(noOfItems: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItems extends HookWidget {
  const ProductItems({
    super.key,
    this.noOfItems = 0,
  });

  final int noOfItems;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: RawScrollbar(
        controller: scrollController,
        thumbVisibility: true,
        thumbColor: AppColors.primaryColor.withOpacity(0.4),
        radius: const Radius.circular(5.0),
        thickness: 2,
        child: GridView.builder(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
          itemCount: noOfItems,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            // final product = products![index];
            return const ProductWidget();
          },
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: mqr.height * 0.18,
          color: AppColors.greyColor,
        ),
        Text(
          'BLUE Rescue Clay Skin Renewal Mask Clay ',
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '\$2.00 ',
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.goldColor,
          ),
        ),
      ],
    );
  }
}
