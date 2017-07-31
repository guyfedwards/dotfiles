if application "Spotify" is running then
  tell application "Spotify"
    set theName to name of the current track
    set theArtist to artist of the current track
    set theAlbum to album of the current track
    set theUrl to spotify url of the current track

    if length of theName is less than 50 then
      set shrtName to theName
    else
      set shrtName to text 1 thru 50 of theName
    end if

    if length of theArtist is less than 50 then
      set shrtArtist to theArtist
    else
      set shrtArtist to text 1 thru 50 of theArtist
    end if

    try
      return "♫  " & shrtName & " - " & shrtArtist
    on error err
    end try
  end tell
end if
