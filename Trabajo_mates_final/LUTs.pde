
void LUT_kill_enemy(){
 for(int i = 0; i <= width; i++){
   for(int j = 0; j <= height; j++){     
     //1.- Agafo el color del pixel
      color colorPixel= get(i, j);  // Agafo el color del pixel i, j amb el get.

      //2.- Agafar els components RGB per separat
      float r= red(colorPixel);
      float g= green(colorPixel);
      float b= blue(colorPixel);

      //3.- Processar, canviar, modificar... els components
      //Y es la lluminancia (model YUV de color)
      float y= 0.299*r + 0.587*g + 0.114*b;

      //4.- Gravar el nou color al seu pixel associat
      color colorNou= color(y,y,y);   //Le paso tres y porque tienen que ser la misma ya que esta en escala de grises
      set(i,j,colorNou);
   }
 }
}

void LUT_calor(){
   for(int i = 0; i <= width; i++){
   for(int j = 0; j <= height; j++){     
     //1.- Agafo el color del pixel
      color colorPixel= get(i, j);  // Agafo el color del pixel i, j amb el get.

      //2.- Agafar els components RGB per separat
      float r= red(colorPixel);
      float g= green(colorPixel);
      float b= blue(colorPixel);

      //3.- Processar, canviar, modificar... els components
      
      if(colorPixel == color(189, 84, 18)){ // civiles
        r = 236;
        g = 112;
        b = 99;
      }
      else if(colorPixel == color(189, 86, 20)){ // robots
        r = 52;
        g = 152;
        b = 219;
      }
      
      if(colorPixel == color(245, 238, 248)){ // fondo
       r = 46;
       g = 204;
       b = 113;
      }
      
      if(colorPixel == color(130, 249, 30)){ // PJ
        r = 241;
        g = 148;
        b = 138;
      }
      
      if(colorPixel == color(20, 90, 50)){ // pajaros
        r = 52;
        g = 152;
        b = 219;  
      }

      //4.- Gravar el nou color al seu pixel associat
      color colorNou= color(r,g,b);   //Le paso tres y porque tienen que ser la misma ya que esta en escala de grises
      set(i,j,colorNou);
   }
 }
}
