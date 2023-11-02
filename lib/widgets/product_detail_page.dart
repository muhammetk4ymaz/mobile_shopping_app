import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';

class ProductDetailPage extends StatefulWidget {
  Product product;
  final List<Product> productList;
  List<Product> newProductList;
  ProductDetailPage(
      {required this.product,
      required this.productList,
      required this.newProductList,
      super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int productIndex = 0;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    String imagePath = widget.product.products[productIndex]['imagePath'];
    String price = widget.product.products[productIndex]['price'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Running Shoes',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline),
              color: isFavorite ? Colors.red : Colors.grey.shade700,
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.25,
              child: ListView(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.black,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    image: DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 50,
                  // color: Colors.red,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              productIndex = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              productIndex = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              productIndex = 2;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 150,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.product.products.length,
                        itemBuilder: (context, productsIndex) {
                          return Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                        image: AssetImage(widget
                                                .product.products[productsIndex]
                                            ['imagePath']),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Product Description',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        Text(
                          'Lola, retro esintili bir tasarıma sahip uzun bir çizmedir. Kalın ve hafif tabanı iç ağız kısmındaki suni kürk detayıyla gerçek deriden üretilmiştir.',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Materials and Production',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text('    • Saya Üst: Hakiki Deri'),
                              Text(
                                  '    • Astar: Hakiki Deri, Sıcak Astar Tekstil'),
                              Text('    • İç Taban: Deri'),
                              Text('    • Dış Taban: Light Termo Taban'),
                              Text('    • Topuk Yüksekliği: 9 cm'),
                              Text('    • Saya Yüksekliği: 46 cm'),
                              Text('    • Bacak Genişliği: 41 cm'),
                              Text(
                                  '    • Bağlama Şekli: Fermuarsız çekme kalıp'),
                              Text('    • Kalıp Bilgisi: Tam Kalıp'),
                              Text('    • Üretim Yeri: Türkiye El Üretimi'),
                              Text(
                                  '    • Ayakkabı Kutusu: Geri dönüştürülmüş kağıt, yapıştırıcı ve renklendirici içermez, su bazlı mürekkep kullanılmıştır.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.orange,
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Same Products',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.newProductList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        productIndex = 0;
                                        widget.product =
                                            widget.newProductList[index];
                                        widget.newProductList =
                                            List.from(widget.productList);

                                        widget.newProductList
                                            .remove(widget.product);
                                      });
                                    },
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          image: DecorationImage(
                                              image: AssetImage(widget
                                                  .newProductList[index]
                                                  .products[0]['imagePath']),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
            Expanded(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$' + price,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Free cargo',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.black))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Add Bag'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              side: BorderSide(color: Colors.black)),
                        )),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
