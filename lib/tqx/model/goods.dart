class Goods {
  final num iD;
  final String goodsId;
  final String goodsName;
  final String goodsClass;
  final String goodsLink;
  final String actLink;
  final String imgUrl;
  final num actMoney;
  final double goodsPrice;
  final double lastPrice;
  final String beginDate;
  final String endDate;
  final num saleCount;
  final num tKMoneyRate;
  final String tjRemark;
  final num couponCount;
  final num couponSaleCount;
  final int ly;
  final String marketImage;
  final int activityType;
  final num orderCount;
  final num towHourCount;
  final num allDayCount;
  final String sellerId;
  final num commssionType;
  final String shopName;
  final String video;
  final num commissionTwo;
  final num commissionDay;
  final num couponStartFee;

  Goods.fromJson(Map json)
      : iD = json['ID'],
        goodsId = json['GoodsId'],
        goodsName = json['GoodsName'],
        goodsClass = json['GoodsClass'],
        goodsLink = json['GoodsLink'],
        actLink = json['ActLink'],
        imgUrl = json["ImgUrl"],
        actMoney = json["ActMoney"],
        goodsPrice = json["GoodsPrice"],
        lastPrice = json["LastPrice"],
        beginDate = json["BeginDate"],
        endDate = json["EndDate"],
        saleCount = json["SaleCount"],
        tKMoneyRate = json["TKMoneyRate"],
        tjRemark = json["TjRemark"],
        couponCount = json["Coupon_Count"],
        couponSaleCount = json["Coupon_SaleCount"],
        ly = json["ly"],
        marketImage = json["MarketImage"],
        activityType = json["ActivityType"],
        orderCount = json["OrderCount"],
        towHourCount = json["TowHourCount"],
        allDayCount = json["AllDayCount"],
        sellerId = json["SellerId"],
        commssionType = json["CommssionType"],
        shopName = json["ShopName"],
        video = json["video"],
        commissionTwo = json["commissionTwo"],
        commissionDay = json["commissionDay"],
        couponStartFee = json["couponStartFee"];


// Map toJson() => {
//   'title': title,
//   'descritpion': description,
// };
}