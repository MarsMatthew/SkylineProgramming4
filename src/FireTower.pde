class FireTower extends Tower{
  int spcRadius = 5;
  FireTower(int health, int radius, int atkDmg, int cost, int space, String type){
    this.health = 10;
    this.radius = 20;
    this.atkDmg = 15;
    this.cost = 15;
    this.space = 1;
    this.type = "Fire";
  }
  void spcAtk(int spcRadius){
    //Only temporary
  }
}
