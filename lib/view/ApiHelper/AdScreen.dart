import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:video_calling_app/model/ApiModel.dart';

BannerAd? bannerAd;
InterstitialAd? interstitialAd;
InterstitialAd? interstitialVideoAd;
RewardedAd? rewardedAd;
AppOpenAd? appOpenAd;

ApiModel? newsJson;
dynamic ao = newsJson!.data![1].keyId;
dynamic ba = newsJson!.data![2].keyId;
dynamic ia = newsJson!.data![3].keyId;
dynamic iva = newsJson!.data![4].keyId;
dynamic ra = newsJson!.data![5].keyId;
dynamic na = newsJson!.data![6].keyId;

void bannerAds() {
  bannerAd = BannerAd(
    size: AdSize.banner,
    adUnitId: "$ba",
    listener: const BannerAdListener(),
    request: const AdRequest(),
  );
  bannerAd!.load();
}

void interAds() {
  InterstitialAd.load(
    adUnitId: "$ia",
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
    adUnitId: "$iva",
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
    adUnitId: "$ra",
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
      adUnitId: "$ao",
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
