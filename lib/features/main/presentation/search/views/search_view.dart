import 'package:in_service/features/main/presentation/home/views/widget/drawer/custom_drawer.dart';
import 'package:in_service/features/main/presentation/home/views/widget/home_ads_card.dart';
import 'package:in_service/features/main/presentation/home/views/widget/home_appbar.dart';
import 'package:in_service/features/main/presentation/search/controllers/search_controller.dart';

import '/index.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchControllr>(
      builder: (controller) {
        return const Scaffold(
          appBar: AppBaar(),
          drawer: CustomDrawer(),
          backgroundColor: KColors.scaffoldBackground2,
          extendBody: true,
          body: SingleChildScrollView(child: _BuildSearchBody()),
        );
      },
    );
  }
}

class _BuildSearchBody extends StatelessWidget {
  const _BuildSearchBody();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: gPadding(right: 15, left: 15, bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchSection(),
          _countrySection(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int i) =>
                const HomeAdsCard(null),
            itemCount: 3,
          ),
        ],
      ),
    );
  }

  _searchSection() => Padding(
        padding: gPaddingSymmetric(horizontal: 20),
        child: TextInputWidget(
          hintText: "البحث".tr,
          hintStyle: gStyle14(fontSize: 15, color: KColors.textGray4),
          // prefixIcon: Kimage.searchIcon,
          onChanged: (value) {},
          suffixIcon: Kimage.searchIcon,
          suffixIconColor: KColors.primary,
          onPressed: () {},
        ),
      );

  _countrySection() {
    // ChooseLanguageControllerImp controllerImp = ChooseLanguageControllerImp.to;

    return Container(
      margin: gPadding(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: 10.radius,
        // border: Border.all(width: .4.w, color: KColors.primary),
        color: KColors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: 10.radius,
            child: Container(
              // constraints: BoxConstraints(minWidth: 80.w),
              padding: gPaddingAll(10),
              decoration: BoxDecoration(
                borderRadius: 10.radius,
                color: KColors.primary,
              ),
              child: Text(
                Kstrings.country.tr,
                overflow: TextOverflow.ellipsis,
                style:
                    gStyle12(color: KColors.white, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          CountryCodePicker(
            padding: EdgeInsets.zero,
            onChanged: (value) => {},
            initialSelection: "+20",
            favorite: const ["+20"],
            showCountryOnly: false,
            showDropDownButton: true,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
          ),
        ],
      ),
    );
  }
}
