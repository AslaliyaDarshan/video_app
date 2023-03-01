import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:video_calling_app/model/ApiModel.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

BannerAd? bannerAd;
InterstitialAd? interstitialAd;
InterstitialAd? interstitialVideoAd;
RewardedAd? rewardedAd;
AppOpenAd? appOpenAd;

void bannerAds() {
  bannerAd = BannerAd(
    size: AdSize.banner,
    adUnitId: "${GlobalWidget.bannerAd}",
    listener: const BannerAdListener(),
    request: const AdRequest(),
  );
  bannerAd!.load();
}

void interAds() {
  InterstitialAd.load(
    adUnitId: "${GlobalWidget.interstitialAd}",
    request: const AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (ad) {
        interstitialAd = ad;
        interstitialAd!.show();
      },
      onAdFailedToLoad: (error) {
        interAds();
      },
    ),
  );
}

void interVideoAds() {
  InterstitialAd.load(
    adUnitId: "${GlobalWidget.interstitialVideoAd}",
    request: const AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (ad) {
        interstitialVideoAd = ad;
        interstitialVideoAd!.show();
      },
      onAdFailedToLoad: (error) {
        interVideoAds();
      },
    ),
  );
}

void rewardAds() {
  RewardedAd.load(
    adUnitId: "${GlobalWidget.rewardedAd}",
    request: const AdRequest(),
    rewardedAdLoadCallback: RewardedAdLoadCallback(
      onAdLoaded: (ad) {
        rewardedAd = ad;
        rewardedAd!.show(
          onUserEarnedReward: (ad, reward) {},
        );
      },
      onAdFailedToLoad: (error) {
        rewardAds();
      },
    ),
  );
}

void openAds() {
  AppOpenAd.load(
      adUnitId: "${GlobalWidget.openAd}",
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;
          appOpenAd!.show();
        },
        onAdFailedToLoad: (error) {
          openAds();
        },
      ),
      orientation: AppOpenAd.orientationPortrait);
}
