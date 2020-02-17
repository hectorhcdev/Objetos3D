
PShape obj;
ArrayList <float []> puntos;
int countX, countY;
boolean create,primero;
boolean rotate;
boolean [] keys;
float rotation,rotationValue;
void setup(){
  size(750,500,P3D);
  rotation=0;
  create=true;
  rotate=false;
  puntos = new ArrayList();
  countX=0;
  countY=0;
  rotationValue=0.01;
  keys= new boolean [3];
  keys[0]=false;
  keys[1]=false;
  primero=true;
  puntos.add(new float [] {width/2,0,0});
}

void draw(){
  background(0);
  if(create){
    rotation=0;
    obj=createShape();
    obj.beginShape();
    obj.fill(255,144,0);
    obj.stroke(255);
    obj.strokeWeight(5);
    obj.vertex(width/2,0,0);
    for(float [] coordenada:puntos){
      obj.vertex(coordenada[0],coordenada[1],coordenada[2]);
    }
    if(mouseX<width/2){
      obj.vertex(width/2,mouseY,0);
    }else{
      obj.vertex(mouseX,mouseY,0);
    }
    
    obj.vertex(width/2,height,0);
    obj.vertex(width/2,0,0);
    obj.endShape();
    translate(0,0);
    shape(obj);
    fill(0);
    stroke(255);
    rect(10,10,width/2-25,height-20);
    fill(255);
    textSize(30);
    text("INSTRUCCIONES",width/4-110,50);
    textSize(20);
    text("-Para añadir puntos pulsar clic\n  izq del ratón",40,80);
    textSize(20);
    text("-Para crear objeto 3d pulsar la\n  tecla ENTER",40,140);
    textSize(20);
    text("-Una vez creado el objeto 3d\n  pulsar ENTER para volver a\n  crear un objeto nuevo",40,200);
    textSize(20);
    text("-Una vez creado el objeto 3d\n  pulsar W para avanzar en la\n  creacion de objeto",40,290);
    textSize(20);
    text("-Una vez creado el objeto 3d\n  pulsar S para retroceder en\n  la creacion de objeto",40,380);
  }else{
    
    obj=createShape();
    obj.beginShape(TRIANGLE_STRIP);
    obj.fill(255,144,0);
    //obj.noFill();
    obj.stroke(255);
    obj.strokeWeight(5);
    
    rotar((ArrayList <float []>)puntos.clone());
    obj.endShape();
    
    
    translate(mouseX,mouseY-height/2,-200);
    rotateY(rotation);
    shape(obj);
    if(keys[0]){
      if(rotationValue>=1){
        rotationValue=1;
      }else{
        rotationValue+=0.01;
      }
      
    }
    if(keys[1]){
      if (rotationValue<=-1){
        rotationValue=-1;
      }else{
        rotationValue-=0.01;
      }
      
    }
    rotation+=rotationValue;
    rotate=true;
    //textSize(15);
    
    //text("Para crear objeto\n nuevo pulsar ENTER",40,380,0);
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
          lista2.add(new float[]{a[0],a[1],a[2]});
        }else{
          float [] b= lista2.get(countlist).clone();
          obj.vertex(b[0],b[1],b[2]);
          obj.vertex(a[0],a[1],a[2]);
          lista2.add(new float[]{a[0],a[1],a[2]});
          countlist++;
        }
      }
      
      primero=false;
      if(countlist>=countX){
        break;
      }
      
    }
  
  
}

void mouseClicked(){
  if(create){
    if(mouseX<width/2){
       puntos.add(new float [] {width/2,mouseY,0});
    }else{
      puntos.add(new float [] {mouseX,mouseY,0});
    }
    
  }
}
void keyReleased(){
  if(key=='+' && !create){
     keys[0]=false;
    //puntos.add(new float [] {mouseX,mouseY,0});
  }
  if(key=='-' && !create){
     keys[1]=false;
    //puntos.add(new float [] {mouseX,mouseY,0});
  }
}

void keyPressed(){
  if(key=='+' && !create){
     keys[0]=true;
    //puntos.add(new float [] {mouseX,mouseY,0});
  }
  if(key=='-' && !create){
     keys[1]=true;
    //puntos.add(new float [] {mouseX,mouseY,0});
  }
   
 if(keyCode==ENTER && !create){
   setup();
   return;
 }
 if(keyCode==ENTER && create){
   puntos.add(new float [] {width/2,height,0});
   puntos.add(new float [] {width/2,0,0});
   create=false;
   countX=puntos.size()*8;
 }

 if(key=='w' && !create){
   if(countX>=puntos.size()*8){
     countX=puntos.size()*8;
   }else{
     countX+=puntos.size();
   }
   
 }
 if(key=='s' && !create){
   if(countX==0){
     countX=0;
   }else{
     countX-=puntos.size();
   }
   
 }
}
