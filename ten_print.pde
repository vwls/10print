int spacing = 20;
int spacingResetValue = spacing;
int x = 0;
int y = 0;

void setup() {
  size(800, 800);
  background(240);
  //background(0,255,0);
  //background(0);
}

void draw() {
  //stroke(0, 255, 0);
  stroke(0);

  // Generate random number between 0 and 1
  float randomNumber = random(1);
  float likelihood = 0.9;
  
  //tenPrintRectangles(randomNumber, likelihood);
  //tenPrintCircles(randomNumber, likelihood);
  tenPrintLines(randomNumber, likelihood);
  //tenPrintChars(randomNumber, likelihood, "-", "^");
  
  // If we're at the bottom of the canvas, go back to top
  //goToTop();
 
  // if we've painted over the canvas so much that the spacing is tiny, clear canvas and start over
  //if (spacing <= 2){
  //  spacing = spacingResetValue;
  //  background(240);
  //}
  
}

void tenPrintCircles(float randomNum, float conditionalFrequency) {
  noFill();
  if (randomNum < conditionalFrequency) {
    ellipse(x, y, 20, 20);
  } else {
    ellipse(x, y, 10, 10);
    x += 5; // this gives us even spacing
  }

  // If we get to end of line, move to next line
  reset();
}

void tenPrintLines(float randomNum, float conditionalFrequency){
  if (randomNum < conditionalFrequency) {
    line(x, y, x + spacing, y + spacing);
  } else {
    line(x, y + spacing, x + spacing, y);
    //line(x + spacing, y, x + spacing, y + spacing);
  }

  // If we get to end of line, move to next line
  reset();
}

void tenPrintRectangles(float randomNum, float conditionalFrequency){
  //noFill();
  fill(0);
  if (randomNum < conditionalFrequency) {
    rect(x, y, spacing, spacing);
  } else {
    // empty space
  }

  // If we get to end of line, move to next line
  reset();
}

void tenPrintChars(float randomNum, float conditionalFrequency, String char1, String char2){
  fill(0);
  if(randomNum < conditionalFrequency){
    text(char1, x, y);
  } else {
    text(char2, x, y);
  }
  reset();
}

// This is our reset utility function
// It packages our newline funcitonality so all of our
// different tenprint functions can use it.
void reset(){
  // If we get to the end of the line, move to next line
  x += spacing;
  if (x > width) {
    x = 0;
    y = y + spacing;
  }
}

// Function for going to top of canvas
void goToTop(){
  // if we're at the bottom of the canvas go back to the top
  if (y > height) {
    y = 0;
    spacing /= 2;
  }

}
