class Segment{
    //private Segment next;
    //private Segment prev;
    private float xCoord1;
    private float xCoord2;
    private float yCoord;
    private int red, green, blue;
    private String name;
    private int sWeight;
    private boolean isAlive;  
    
    public Segment( String sname,float x1, float x2, float y, int r, int g, int b)
    {
        xCoord1 = x1 ;
        xCoord2 = x2;
        yCoord = y ; //help translate the y-coordinate system
        name = sname;
        red = r;
        blue = b;
        green = g;
        sWeight = 3;
        isAlive = false;
        
    }//END Constructor
    
    /************* Getters and Setters for Segment Object *********/
    public void setX(float x1, float x2){
        xCoord1 = x1;
        xCoord2 = x2;
    }
    
    public float getX1(){
        return xCoord1;
    }
    
    public float getX2()
    {
        return xCoord2;
    }
    
    public void setY(float y)
    {
        yCoord = y;
    }
    
    public float getY()
    {
        return yCoord;
    }
    
    public void setName(String sname)
    {
        name = sname;
    }
    
    public String getName()
    {
        return name;
    }
    
    //public void setNext(Segment nextSeg)
    //{
    //    next = nextSeg;
    //}
    
    //public Segment getNext()
    //{
    //    return next;
    //}
    
    //public void setPrev(Segment prevSeg)
    //{
    //    prev = prevSeg;
    //}
    
    //public Segment getPrev()
    //{
    //    return prev;
    //}
    
    public String toString()
    {
        String str = null;
        str = name + "\n";
        str += "   x1: "+ xCoord1 + " x2: " + xCoord2 + " y: " + (yCoord);
        return str;
    }
    
    public void setStrokeWeight(int weight)
    {
        sWeight = weight;
    }
    
    public void setState(boolean state)
    {
        isAlive = state;
    }
    
    public boolean getState()
    {
        return isAlive;
    }
    
    /*********** End Getters and Setters ********/
    
    /*
    * Implement draw for drawing segment
    */
    
    void drawSeg()
    {
        //scale(1,-1);
        //translate(0,-height);
        strokeWeight(sWeight);
        /*
        * Need to subtract 700 that line is drawn properly pretending that (0,0) is on bottom left corner of 
        * of white rectangle
        */
        stroke(red, green, blue);
        line(xCoord1, 700-yCoord, xCoord2, 700-yCoord);
        //stroke(red, green, blue);
    }//END drawSwg
    
    
    
}//END Segment Class