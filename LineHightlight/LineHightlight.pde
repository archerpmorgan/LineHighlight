import controlP5.*; //INSTALL CONTROLP5 via: sketch -> Import Library -> Add Library
/**** Global Variables *****/
/*--------------------------------------------------------------------------------------------
 * Author: Carlos Carbajal 
 * 
 * Description: Main program to draw segments read from a file and highlight part of a segment
 *              Gets user input to open a file.
 *
 *-------------------------------------------------------------------------------------------
 */
 
ControlP5 cp5;
Button button;
int clicks = 0;
ArrayList<Segment> segHL;
Segment[] segs;
boolean flag = true, drawSegsFlag = false;

void settings()
{
    size(800,900);
}

void setup()
{
    /**** Added console for reading user input *****/
    cp5 = new ControlP5(this);
    cp5.addTextfield("input")
       .setPosition(width-220, height-70)
       .setSize(200,40)
       .setFont(createFont("arial", 20))
       .setFocus(true)
       .setColor(255);
       
    //Get label from Control
    Label label = cp5.get(Textfield.class, "input").getCaptionLabel();
    label.setColor(0).setText("Enter Filename");
    button = new Button("Click", 10, 825, 100, 35);
    
}
/*
* loadData()
* Purpose: Load data from file to draw segments
* Parameters: filename - name of file to be opened
*
*/
void loadData(String filename)
{
    BufferedReader read;
    
 
    String str = null;
    float x1 , x2, y;
    int r, g, b, i = 0;
    try{
        read = createReader(filename);
        while((str = read.readLine()) != null)
        {
            if(str.length() == 1) //Check to see if we are reading the first line
            {
                segs = new Segment[Integer.parseInt(str)];
            }
            else{ // Readline to get values for the segment to be created
                String[] ary = str.split("\\s"); //Split string on spaces
               
                // Get position values
                x1 = Float.parseFloat(ary[0]);
                x2 = Float.parseFloat(ary[1]);
                y = Float.parseFloat(ary[2]);
                
                // Get color for segment
                r = Integer.parseInt(ary[3]);
                g = Integer.parseInt(ary[4]);
                b = Integer.parseInt(ary[5]);
                
                //create new segment
                Segment seg = new Segment("segment-" + i, x1, x2, y, r, g, b);
                seg.setStrokeWeight(3);
                segs[i] = seg;
                i++;
            }          
        }
    }catch(IOException e)
    {
        println("Something bad happened");
        e.printStackTrace();
    }
    segHL = new ArrayList<Segment>();
    drawSegsFlag = true;
}
void draw()
{
    background(255);
    button.buttonDraw();
    
    /*Check to see if segments need to be drawn.
    * Flag will be turned on once a file has been read
    */
    if(drawSegsFlag){
        // Draw segments in array
        for(Segment seg: segs){
            seg.drawSeg();
        }
    
        //Draw highlight
        for(Segment seg: segHL){
            seg.drawSeg();
        }
    }
}

void mousePressed()
{
    if(button.mouseOver())
    {
        // Create highlighting segment
        Segment seg3 = new Segment("highlight", segs[0].getX1(), segs[1].getX1(), segs[0].getY(), 0,0,0);
        seg3.setStrokeWeight(8);
        //Check to see if need to add or remove highlight
        if(flag)
        {    
            segHL.add(seg3);
        }
        else{
            segHL.remove(segHL.size()-1);
        }
        flag = !flag; // switch flag
    }
}

/* Check to see if the ENTER key has been pressed*/
void keyPressed()
{
    String filename = "";
    if(key == ENTER)
    {
        //Get string from text field
        filename = cp5.get(Textfield.class, "input").getText(); 
        
        // CHeck to make sure string is not empty/null
        if(filename != null && !filename.isEmpty())
        {
            cp5.get(Textfield.class, "input").clear(); // Clear text in text field
            loadData(filename);       
        }
    }
}