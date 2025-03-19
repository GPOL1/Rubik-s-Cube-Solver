class Face {
    PVector normal;
    color c;

    Face(PVector normal, color c){
        this.normal = normal;
        this.c = c;
    }

    void show(){
        pushMatrix();
        fill(c);
        noStroke();
        rectMode(CENTER);
        translate(0.5 * normal.x, 0.5 * normal.y, 0.5 * normal.z);
        if (abs(normal.x) > 0){
            rotateY(HALF_PI);
        } else if (abs(normal.y) > 0){
            rotateX(HALF_PI);
        }
        square(0, 0, 1);
        popMatrix();
    }

    void turnZ(float angle){
        PVector temp = new PVector();
        temp.x = round(normal.x * cos(angle) - normal.y * sin(angle));
        temp.y = round(normal.x * sin(angle) + normal.y * cos(angle));
        temp.z = round(normal.z);
        normal = temp;
    }
    
    void turnY(float angle){
        PVector temp = new PVector();
        temp.x = round(normal.x * cos(angle) - normal.z * sin(angle));
        temp.z = round(normal.x * sin(angle) + normal.z * cos(angle));
        temp.y = round(normal.y);
        normal = temp;
    }

    void turnX(float angle){
        PVector temp = new PVector();
        temp.y = round(normal.y * cos(angle) - normal.z * sin(angle));
        temp.z = round(normal.y * sin(angle) + normal.z * cos(angle));
        temp.x = round(normal.x);
        normal = temp;
    }
}