    Bacteria [] one = new Bacteria[20];
    Stimulus [] two = new Stimulus[3];
    void setup()   
    {     
    	size(600,600);
        
    	frameRate(10);
    	for (int i=0;i<one.length;i++){
    		one[i]= new Bacteria();
    	}
    	for (int i=0;i<two.length;i++){
    		two[i]= new Stimulus();
    	}
    }   
    void draw()   
    {    
    	background(255);
    	noStroke();
    	for (int i=0; i<one.length;i++){
    		one[i].show();
    		one[i].ranWalk();
    	}
    	for (int i=0; i<two.length;i++){
    		two[i].show();
    	}
        for (int j = 0; j<one.length; j++){
            for(int i = 0; i<two.length;i++){
                if (two[i].sX < one[j].myX){
                    one[j].movToX=-13;
                }
                else{
                    one[j].movToX=-9;
                }

                if (two[i].sY < one[j].myY){
                    one[j].movToY=-13;
                }
                else{
                    one[j].movToY=-9;
                }
                if(dist(two[i].sX, two[i].sY, one[j].myX, one[j].myY) <= one[j].rad)
                {
                    two[i].sX=(int)(Math.random()*550);
                    two[i].sY=(int)(Math.random()*550);
                    
                }
            }
        }
    }  
    void mousePressed(){
       two = new Stimulus[1 + two.length];
       for (int i=0;i<two.length;i++){
            two[i]= new Stimulus();
    }
    }
    class Bacteria    
    {     
    	//lots of java!
    	int myX,myY,rad, color1,color2,color3,opax;
    	int movToX,movToY;
    	Bacteria(){
    		myX=(int)(Math.random()*400)+100;
    		myY=(int)(Math.random()*400)+100;
    		color1=(int)(Math.random()*100);
    		color2=(int)(Math.random()*100)+100;
    		color3=(int)(Math.random()*100)+150;
    		movToX=-11;
    		movToY=-11;
    		rad=20;
            opax=255;
    	}   
    	void ranWalk(){
    		myX=myX + (int)(Math.random()*21)+movToX;
    		myY=myY + (int)(Math.random()*21)+movToY;
    		//myX=myX + (int)(Math.random()*5)-2;
    		//myY=myY + (int)(Math.random()*5)-2;
    	}
    	void show(){
    		fill(color1,color2,color3,opax);
    		ellipse(myX,myY,rad,rad);
    	}
    }
    class Stimulus{
    	int sX,sY,sC1,sC2,sC3;

    	Stimulus(){
    		sX=(int)(Math.random()*400)+100;
    		sY=(int)(Math.random()*400)+100;
    		sC3=(int)(Math.random()*100);
    		sC2=(int)(Math.random()*100)+100;
    		sC1=(int)(Math.random()*100)+150;
    	}
    	void show(){
    		fill(sC1,sC2,sC3);
    		rect(sX,sY,15,15);
    	}
    }