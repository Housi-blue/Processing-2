class Box extends Particle{
  
  Box(float x,float y,float r_){
    super(x,y,r_);
  }
  
  void change(){
    col=color(0,0,255);
  }
  
  void display(){
   Vec2 pos2=box2d.getBodyPixelCoord(body);
    
    float a=body.getAngle();
    
    pushMatrix();
    translate(pos2.x,pos2.y);
    rotate(-a);
    fill(col);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0,0,r*2,r*2);
    popMatrix(); 
  }
  
  void makeBody(float x,float y,float r){
    
    PolygonShape ps=new PolygonShape();
    float box2dW=box2d.scalarPixelsToWorld(r);
    float box2dH=box2d.scalarPixelsToWorld(r);
    ps.setAsBox(box2dW,box2dH);
    
    FixtureDef fd2=new FixtureDef();
    fd2.shape=ps;
    fd2.density=1;
    fd2.friction=0.01;
    fd2.restitution=0.3;
    
    BodyDef bd2=new BodyDef();
    bd2.type=BodyType.DYNAMIC;
    bd2.position.set(box2d.coordPixelsToWorld(x,y));
    body=box2d.createBody(bd2);
    body.createFixture(fd2);
    
    body.setLinearVelocity(new Vec2(random(-10f, 10f), random(5f, 10f)));
    body.setAngularVelocity(random(-10, 10));
  }
}
