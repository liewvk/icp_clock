import Time "mo:base/Time";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

module {
    public func formatTime(time: Time.Time): Text {
        let hours = Int.abs((time / 3_600_000_000_000) % 24);
        let minutes = Int.abs((time / 60_000_000_000) % 60);
        let seconds = Int.abs((time / 1_000_000_000) % 60);
        
        let hoursText = if (hours < 10) "0" # Nat.toText(hours) else Nat.toText(hours);
        let minutesText = if (minutes < 10) "0" # Nat.toText(minutes) else Nat.toText(minutes);
        let secondsText = if (seconds < 10) "0" # Nat.toText(seconds) else Nat.toText(seconds);
        
        return hoursText # ":" # minutesText # ":" # secondsText;
    };
}