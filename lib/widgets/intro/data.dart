class SliderModel {
  String imageAssetPath;
  String desc;

  SliderModel({this.imageAssetPath, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Register on the app to join your friends on a funny Azimout game!");
  sliderModel.setImageAssetPath("assets/intro/1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Join your friends and complete all of your challenges!");
  sliderModel.setImageAssetPath("assets/intro/2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "The first one to finish all of his challenges or with the most points win!");
  sliderModel.setImageAssetPath("assets/intro/3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
