
PShape obj;
ArrayList <float []> puntos;
int countX, countY;
boolean create,primero;
boolean rotate;
void setup(){
  size(750,500,P3D);
  create=true;
  rotate=false;
  puntos = new ArrayList();
  countX=0;
  countY=0;
  primero=true;
  puntos.add(new float [] {width/2,0,0});
}

void draw(){
  background(0);
  if(create){
    obj=createShape();
    obj.beginShape();
    obj.fill(255,144,0);
    obj.stroke(255);
    obj.strokeWeight(5);
    obj.vertex(width/2,0,0);
    for(float [] coordenada:puntos){
      obj.vertex(coordenada[0],coordenada[1],coordenada[2]);
    }
    obj.vertex(mouseX,mouseY,0);
    obj.vertex(width/2,height,0);
    obj.vertex(width/2,0,0);
    obj.endShape();
    translate(0,0);
    shape(obj);
  }else{
    
    obj=createShape();
    obj.beginShape(TRIANGLE_STRIP);
    obj.fill(255,144,0);
    //obj.noFill();
    obj.stroke(255);
    obj.strokeWeight(5);
    
    rotar((ArrayList <float []>)puntos.clone());
    obj.endShape();
    
    translate(mouseX-width/2,mouseY-height/2);
    shape(obj);
    rotate=true;
    
  }
  
}

void rotar(ArrayList <float []> lista){
    
    ArrayList<float []> lista2= new ArrayList();
    float[] a= new float[3];
    int countlist=0;
    primero=true;

    for(float i =0;i<PI*2;i+=PI/4.0){
      //obj.vertex(width/2,0,-200);
      
      for (int j=0;j< lista.size();j++){
        
        float [] aux=lista.get(j).clone();
        aux[0]-=width/2;
        
        a[0]=(aux[0])*cos(i)-aux[2]*sin(i);
        a[1]=aux[1];
        a[2]=-(aux[0])*sin(i)+aux[2]*cos(i);
        if(primero){
          lista2.add(new float[]{a[0]+width/2,a[1],a[2]-200});
        }else{
          float [] b= lista2.get(countlist).clone();
          obj.vertex(b[0],b[1],b[2]);
          obj.vertex(a[0]+width/2,a[1],a[2]-200);
          lista2.add(new float[]{a[0]+width/2,a[1],a[2]-200});
          countlist++;
        }
      }
      
      primero=false;
      if(countlist>countX){
        break;
      }
      
    }
  
  
}


void keyPressed(){
  if(key==' ' && create){
    puntos.add(new float [] {mouseX,mouseY,0});
  }
   
 if(keyCode==ENTER && !create){
   setup();
   return;
 }
 if(keyCode==ENTER && create){
   puntos.add(new float [] {width/2,height,0});
   puntos.add(new float [] {width/2,0,0});
   create=false;
 }

 if(key=='w'){
   countX+=puntos.size();
 }
 if(key=='s'){
   countX-=puntos.size();
 }
}