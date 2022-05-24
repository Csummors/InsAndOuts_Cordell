//modified code JasonMDavey

void drawTrack() {
  pushMatrix();
  
  // Apply centering and perspective
  translate(width/2, height*0.75f);
  rotateX(0.75f);
  
  
   //Draw the tracks / bars / notes
   float playbackPos = musicTrack.position();
    
  // Figure out spacing / layout
  float barStartX = -LANE_SPACING_PIXELS*(NUM_NOTE_TYPES-1)*0.5f;  
  float barLengthSeconds = 60f / (trackData.bpm/4f);
  float offsetY = ((playbackPos-trackData.introLength)/barLengthSeconds) * BAR_LENGTH_PIXELS;
  
  for (int barIndex = 0; barIndex < trackData.bars.size(); ++barIndex) {
    TrackData.Bar bar = trackData.bars.get(barIndex);
    float beatStepY = -BAR_LENGTH_PIXELS / bar.numBeats;
    float barStartY = -BAR_LENGTH_PIXELS * barIndex + offsetY;
    
    // Cull bars which are not on-screen
    if (barStartY > height*0.75f) continue; // Bar has already scrolled off-screen
    if (barStartY < -height*2.5f) break; // Bar is not yet on-screen 
    
    noFill();
    
    // Draw horizontal lines at the start of each bar
    stroke(255,255,255,128);
    strokeWeight(1);
    line(-width, barStartY, width, barStartY);

    // Draw each hit / note
    imageMode(CENTER);
    blendMode(ADD);
    hint(DISABLE_DEPTH_TEST);
    for (TrackData.Hit hit : bar.hits) {
      float hitX = barStartX + hit.note*LANE_SPACING_PIXELS;
      float hitY = barStartY + hit.beat*beatStepY;
      
      pushMatrix();
      translate(hitX, hitY);
            
      switch (hit.state) {
        case TrackData.Hit.HIT_PENDING:
          tint(NOTE_COLORS[hit.note]);
          image(hitMarkerImage, 0, 0);
          break;
          
        case TrackData.Hit.HIT_FAILURE: {
          float timeSinceHit = playbackPos - hit.stateTime;
          float alpha = Math.max(1f - timeSinceHit / NOTE_FADE_TIME_SECONDS, 0f);
          color noteColor = NOTE_COLORS[hit.note];
          tint(red(noteColor), green(noteColor), blue(noteColor), alpha*255);
          image(hitMarkerFailureImage, 0, 0);
          break;
        }
        case TrackData.Hit.HIT_SUCCESS: {
          float timeSinceHit = playbackPos - hit.stateTime;
          float alpha = Math.max(1f - timeSinceHit / NOTE_FADE_TIME_SECONDS, 0f);
          color noteColor = NOTE_COLORS[hit.note];
          tint(red(noteColor), green(noteColor), blue(noteColor), alpha*255);
          image(hitMarkerSuccessImage, 0, 0);
          break;
        }
      }
      hint(ENABLE_DEPTH_TEST);
      blendMode(NORMAL);
      popMatrix();      
    }
  }
  
  // Draw line to indicate current
  stroke(255);
  strokeWeight(2);
  line(-width, 0, width, 0);
  
  popMatrix();
}
