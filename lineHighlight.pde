Button button;
Segment seg1;
Segment seg2;
Segment seg3;
int clicks = 0;
ArrayList<Segment> segs;
boolean flag = true;

void settings()
{
    size(800,900);
}

void setup()
{
    //size(800,900);
    
    //rect(0, 0, 800, 800);
    button = new Button("Click", 10, 825, 100, 35);
    segs = new ArrayList<Segment>();
    seg1 = new Segment("segment-1", 100, 500, 300, 0,0,0);
    seg2 = new Segment("segment-2", 200, 600, 400, 0,0,0);
    
    segs.add(seg1);
    segs.add(seg2);
    
}

void draw()
{
    background(255);
    button.buttonDraw();
   
    for(Segment seg: segs){
        seg.drawSeg();
    }
}

void mousePressed()
{
    if(button.mouseOver())
    {
        seg3 = new Segment("segment-3", seg1.getX1(), seg2.getX1(), seg1.getY(), 0,0,0);
        seg3.setStrokeWeight(8);
        if(flag)
        {    
            segs.add(seg3);
        }
        else{
      //      seg3.setStrokeWeight(3);
            segs.remove(segs.size()-1);
            
        }
        flag = !flag;
    }
    //for(Segment s :  segs)
    //    println(s.toString());
    //println();
}
