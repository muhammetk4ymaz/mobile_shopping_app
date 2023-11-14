import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductNewDetailPage extends StatefulWidget {
  Product product;
  final List<Product> productList;
  List<Product> newProductList;
  ProductNewDetailPage(
      {required this.product,
      required this.productList,
      required this.newProductList,
      super.key});

  @override
  State<ProductNewDetailPage> createState() => _ProductNewDetailPageState();
}

class _ProductNewDetailPageState extends State<ProductNewDetailPage> {
  int productIndex = 0;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context, listen: false);
    isFavorite = productModel.listFavoriteProduct.contains(widget.product);
    String imagePath = widget.product.images[productIndex];
    int price = widget.product.price;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            widget.product.title,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                if (!isFavorite) {
                  setState(() {
                    productModel.addFavoriteProducts(widget.product);
                    isFavorite = !isFavorite;
                  });
                } else {
                  setState(() {
                    productModel.deleteFavoriteProduct(widget.product);
                    isFavorite = !isFavorite;
                  });
                }
              },
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline),
              color: isFavorite ? Colors.red : Colors.grey.shade700,
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.25,
              child: ListView(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.black,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    image: DecorationImage(image: NetworkImage(imagePath)),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product.images.length,
                    itemBuilder: (context, value) {
                      return Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                productIndex = value;
                              });
                            },
                            child: Container(
                              height: 70,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  widget.product.images[value],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Product Description',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    subtitle: const Column(
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
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Column(
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
                SizedBox(
                  // color: Colors.orange,
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Same Products',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
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
                                        widget.newProductList.shuffle();
                                      });
                                    },
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          image: DecorationImage(
                                              image: NetworkImage(widget
                                                  .newProductList[index]
                                                  .images[0]),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  const SizedBox(
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
                        '\$$price',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Free cargo',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black)),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          productModel.addBagProducts(widget.product);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            side: const BorderSide(color: Colors.black)),
                        child: const Text('Add Bag'),
                      )),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
