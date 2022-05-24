//modified code JasonMDavey
//mixed my own

void keyPressed() {
  if (key != CODED) return;
  
  // Determine which note this key corresponds to 
  int note;
  if (keyCode  == LEFT)note = 0;
    else if (keyCode  == UP)note = 1;
    else if (keyCode  == RIGHT)note =2;
    else return;
  
  float playbackPos = musicTrack.position() - trackData.introLength;
  
  // Scan through the track to find notes/hits matching the input
  TrackData.Hit matchedHit = null;
      
  float barLengthSeconds = 60f / (trackData.bpm/4f);
  for (int barIndex = 0; barIndex < trackData.bars.size(); ++barIndex) {
    TrackData.Bar bar = trackData.bars.get(barIndex);
    
    float barStartSeconds = barIndex*barLengthSeconds;
    
    // Skip considering bars which are entirely out of range of the current playback position
    if (barStartSeconds > playbackPos + greatTime) break;  // Bar starts too late to be considered
    if (barStartSeconds+barLengthSeconds < playbackPos - okTime) continue;  // Bar starts too early to be considered
    
    // Bar metadata can contain different numbers of beats, but they are always evenly divided throughout the bar
    float beatStepSeconds = barLengthSeconds / bar.numBeats;
        
    for (TrackData.Hit hit : bar.hits) {
      if (hit.state != TrackData.Hit.HIT_PENDING) continue; // Already triggered this hit
      if (hit.note != note) continue; // Note doesn't match
      
      float hitTimeSeconds = barStartSeconds + hit.beat*beatStepSeconds;
      float timeDiff = abs(hitTimeSeconds - playbackPos);
      
      if (timeDiff < perfectTime) {
        println("Perfect!!!");
        text("Perfect!!!", width-10, 50);
        score += PERFECT_SCORE * comboMultiplier;
         myPort.write(0);
        matchedHit = hit;
        break;
      }
      else if (timeDiff < greatTime) {
        println("Great but not perfect!");
        text("Perfect!!!", width-10, 30);
        score += GREAT_SCORE * comboMultiplier;
        matchedHit = hit;
        break;
      }
      else if (timeDiff < okTime) {
        println("OK i see you!");
        text("OK i see you!!!!", width-10, 50);
        score += OK_SCORE * comboMultiplier;
        myPort.write(1);
        matchedHit = hit;
        break;
      }
    }
  }
  
  if (matchedHit == null) {
    // No note matched
    println("Are you even trying!");
    text("Are you even trying!", width-10, 50);
    comboMultiplier = 1;
    comboUpCounter = 0;
  }
  else {
    matchedHit.state = TrackData.Hit.HIT_SUCCESS;
    matchedHit.stateTime = musicTrack.position();
    ++comboUpCounter;
    if (comboUpCounter == COMBO_UP_INTERVAL) {
      comboMultiplier = min(COMBO_MAX_MULTIPLIER, comboMultiplier + 1);
      comboUpCounter = 0;
    }
  }
 }
