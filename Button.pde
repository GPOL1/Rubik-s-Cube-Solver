class Button{
    int w = 100;
    int h = 100;
    int x = 100;
    int y = 100;
    String label = "";
    boolean hover = false;

    Button(int w, int h, int x, int y, String label){
        this.w = w;
        this.h = h;
        this.x = x;
        this.y = y;
        this.label = label;
    }

    void update(){
        hover = (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h);
    }

    void draw(){
        update();
        if (hover) {
            fill(color(100));
        } else {
            fill(color(200));
        }
        stroke(0);
        strokeWeight(1);
        rect(x,y,w,h);
        fill(0);
        textAlign(CENTER, CENTER);
        text(label, x + w/2, y + h/2);
    }

    boolean isClicked(){
        return hover && mousePressed;
    }
}