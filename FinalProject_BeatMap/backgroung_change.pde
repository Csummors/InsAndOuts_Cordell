void pic1(){

//idea create a solar system with the eye of illuminati as the sun
//Ring 1
//ellipse(x1, y1, width, height);
stroke(0);
fill(255, 200, 200);
ellipse(450,350,550,550);


//Ring 2
stroke(0);
fill(0);
ellipse(450,350,450,450);

//Ring 3
stroke(0);
fill(255, 0, 0);
ellipse(450,350,350,350);

//Ring 4
stroke(6);
fill(0);
ellipse(450,350,250,250);

//rect(x1, y1, width, height);
/** Trying to create a fade and illusion affect which the closer 
you get the traingle stand out*/ 
fill(20);
rect(375,280,150,150);

//All Sesing Eye(ASE)
//triangle(x1, y1, x2, y2, x3, y3);
stroke(25);
fill(209);
triangle(450, 280, 525, 425,  375, 425);

//All seeing Eye(ASE) PV
//traingle(x1,y1,x2,y2,x3,y3,);
//line part was a happy accident
stroke(50);
fill(250);
triangle(120, 300, 232, 100, 344, 300);
line(300, 120, 232, 100);

//Eye pupil prt 1
stroke(6);
fill(255);
ellipse(450,350,50,50);

//Eye pupil prt 2
stroke(2);
fill(0);
ellipse(450,350,10,10);

//outlines pof the shapes
stroke(100);
noFill();
ellipse(450,350,550,550);
ellipse(450,350,450,450);
ellipse(450,350,350,350);
ellipse(450,350,250,250);
triangle(120, 300, 232, 100, 344, 300);
}
