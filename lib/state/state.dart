import 'package:flutter/material.dart';


class AppState extends ChangeNotifier{

  int tabIndex =0;
  updateTabIndex(index){
    tabIndex = index;
    notifyListeners();
  }



  //////////////////////////////// Type List ///////////////////////////

  bool all = true;
  bool design = false;
  bool communication = false;
  bool development = false;


  updateAllStatus(){
     all = true;
     design = false;
     communication = false;
     development = false;

     notifyListeners();
  }

  updateDesignStatus(){
    all = false;
    design = true;
    communication = false;
    development = false;

    notifyListeners();
  }
  updateCommunicationStatus(){
    all = false;
    design = false;
    communication = true;
    development = false;

    notifyListeners();
  }
  updateDevelopmentStatus(){
    all = false;
    design = false;
    communication = false;
    development = true;

    notifyListeners();
  }








}