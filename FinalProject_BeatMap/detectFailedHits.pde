//borrowed code JasonMDavey

void detectFailedHits() {
  float playbackPos = musicTrack.position() - trackData.introLength;
  
  // Scan through the track to find notes/hits matching the input
  float barLengthSeconds = 60f / (trackData.bpm/4f);
  for (int barIndex = 0; barIndex < trackData.bars.size(); ++barIndex) {
    TrackData.Bar bar = trackData.bars.get(barIndex);
    
    float barStartSeconds = barIndex*barLengthSeconds;
    
    // Skip considering bars which are entirely out of range of the current playback position
    if (barStartSeconds > playbackPos + okTime) break;  // Bar starts too late to be considered
    if (barStartSeconds+barLengthSeconds < playbackPos - okTime*2.0f) continue;  // Bar starts too early to be considered
    
    // Bar metadata can contain different numbers of beats, but they are always evenly divided throughout the bar
    float beatStepSeconds = barLengthSeconds / bar.numBeats;
    
    for (TrackData.Hit hit : bar.hits) {
      if (hit.state != TrackData.Hit.HIT_PENDING) continue; // Already triggered this hit
      
      float hitTimeSeconds = barStartSeconds + hit.beat*beatStepSeconds;
      
      if (playbackPos - hitTimeSeconds > okTime) {
        println("Nope!");
         text("Nope!", width-10, 50);
        hit.state = TrackData.Hit.HIT_FAILURE;
        hit.stateTime = musicTrack.position();
        comboMultiplier = 1;
        comboUpCounter = 0;
      }
    }
  }
}
