import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/cubit/detay_sayfa_cubit.dart';

class DetaySayfa extends StatefulWidget {
  Kisiler kisi;
  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {

  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  /*Future<void> guncelle(int kisi_id ,String kisi_ad, String kisi_tel) async {
    print("kişi guncelle: $kisi_id - $kisi_ad - $kisi_tel");

  }*/
@override
  void initState() {
   
    super.initState();
    var kisi = widget.kisi;
    tfKisiAdi.text = kisi.kisi_ad;
    tfKisiTel.text = kisi.kisi_tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detay sayfa"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left:50, right:50),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfKisiAdi , decoration: const InputDecoration(hintText: "kişi ad"),),
              TextField(controller: tfKisiTel , decoration: const InputDecoration(hintText: "kişi tel"),),
              ElevatedButton(onPressed: (){
                context.read<DetaySayfaCubit>().guncelle(widget.kisi.kisi_id, tfKisiAdi.text, tfKisiTel.text);
               
          
              }, child: const Text("guncelle"))
              
          
            ],
            ),
        ),


      ),
    );
  }
}