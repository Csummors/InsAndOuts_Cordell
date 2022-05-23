import java.util.List;
import java.nio.file.Files;
import java.nio.charset.StandardCharset;
import java.nio.file.Paths;

class TrackData{
  class Hit{
    int beat;
    int note;
    int duration;
    
    public Hit(int beat, int note, int duration){
      this.beat = beat;
      this.note = note;
      this.duration = duration;
    }
    

}
  float introlenght;
  float bpm;
  
  List<List<Hit>>bars;
  
  public TrackData(String filename){
    try{
      String fileAsString = new String(Files.readAllBytes(Paths.get(filename)));
      String[] lines = fileAsString.split("\n");
    }
    catch(IOException e){
      throw new RuntimeException("Failed to load track data", e);
    }
  }
  }
