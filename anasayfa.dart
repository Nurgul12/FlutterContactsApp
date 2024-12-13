import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/cubit/anasayfa_cubit.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  /*
  Future<void> ara(String aramaKelimesi) async {
    print("kişi ara: $aramaKelimesi");
  }*/

  /*
  Future<List<Kisiler>> kisileriYukle() async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "ahmet", kisi_tel: "11111");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "zeynep", kisi_tel: "2222");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "beyza", kisi_tel: "333333");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;

  } */

  /*
  Future<void> sil(int kisi_id) async {
    print("kişi sil: $kisi_id");
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ? 
        TextField(decoration: const InputDecoration(hintText: "ara"),
        onChanged: (aramaSonucu){
          context.read<AnasayfaCubit>().ara(aramaSonucu);
        },
        
        
        
        ) :
        const Text("kişiler"),
      actions: [
        aramaYapiliyorMu ?
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = false;
          });
          context.read<AnasayfaCubit>().kisileriYukle();

        }, icon: const Icon(Icons.clear)) :
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = true;
          });

        }, icon: const Icon(Icons.search))
      ],
      
      ),
      body: /* ElevatedButton(onPressed: (){
        var kisi = Kisiler(kisi_id: 1, kisi_ad: "ahmet", kisi_tel: "11111");
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi)))
          .then((value) {
            print("anasayfaya dönüldü");

          });
                
               
          
      }, child: const Text("detay")), */
      BlocBuilder<AnasayfaCubit,List<Kisiler>>(
        
        builder: (context,kisilerListesi){
          if(kisilerListesi.isNotEmpty){
            
            return ListView.builder(
              itemCount: kisilerListesi.length,//3
              itemBuilder: (context, indeks) {
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi)))
          .then((value) {
            //print("anasayfaya dönüldü");
            context.read<AnasayfaCubit>().kisileriYukle();

          });
                    print("${kisi.kisi_ad} seçildi");
                  },
                  child: Card(
                    child: SizedBox(height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(kisi.kisi_ad, style: const TextStyle(fontSize: 20),),
                            Text(kisi.kisi_tel),
                              ],
                                                
                            ),
                          ),
                          const Spacer(),
                           IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${kisi.kisi_ad} silinsin mi?"),
                                action: SnackBarAction(
                                  label: "evet",
                                  onPressed: (){
                                     context.read<AnasayfaCubit>().sil(kisi.kisi_id);
                                  },
                                
                                ),
                                
                                
                                )
                            );
                              
                      
                              }, icon: const Icon(Icons.clear,color: Colors.black54,),)
                         
                        ],
                        ),
                    ),
                  ),
                );
              },
            );

          }else{
            return const Center();

          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
          .then((value) {
            //print("anasayfaya dönüldü");
            context.read<AnasayfaCubit>().kisileriYukle();

          });
        
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}