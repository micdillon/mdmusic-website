module DiscogHelper

  def create_release_rows(releases)
    rows = (releases.count / 2.0).ceil;
    release_arr = Array.new(rows)
    release_arr[0] = Array.new(2)
    x = 0
    y = 0
    releases.order("release_date DESC").each do |release|
      release_arr[y][x] = release 
      x = x + 1
      if x == 2
        x = 0
        y = y + 1
        release_arr[y] = Array.new(2)
      end
    end
    return release_arr
  end

  def get_track_max(c1, c2)
    track_max = 0
    if c1 != nil and c2 != nil
      track_max = [c1.tracks.count,c2.tracks.count].max
    elsif c1 != nil
      track_max = c1.tracks.count
    elsif c2 != nil
      track_max = c2.tracks.count
    end
    return track_max
  end

end
