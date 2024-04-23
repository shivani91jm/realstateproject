class MenuModels{
  String? menuname;
  MenuModels(this.menuname);
}
List<MenuModels> getMenus(){
  return <MenuModels>[
    MenuModels("Buy"),
    MenuModels("Rent"),
    MenuModels("Sell")
    
  ];
}