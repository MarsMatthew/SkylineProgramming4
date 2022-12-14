class IceTower extends Tower{
  int spcRadius = 0;
  IceTower(int health, int radius, int atkDmg, int cost, int space, String type){
    this.health = 10;
    this.radius = 20;
    this.atkDmg = 15;
    this.cost = 15;
    this.space = 1;
    this.type = "ice";
  }
  void spcPwr(int spcRadius){
    //Only temporary
  }
}
