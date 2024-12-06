import Time "mo:base/Time";
import Text "mo:base/Text";
import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";
import Blob "mo:base/Blob";
import Nat16 "mo:base/Nat16";
import Array "mo:base/Array";
import Types "./types";
import Utils "./utils";

actor {
    type HttpRequest = Types.HttpRequest;
    type HttpResponse = Types.HttpResponse;

    public query func getTime() : async Text {
        let currentTime = Time.now();
        let formattedTime = Utils.formatTime(currentTime);
        return formattedTime;
    };

    public query func http_request(request : HttpRequest) : async HttpResponse {
        let time = Utils.formatTime(Time.now());
        let response = "Current time: " # time;
        let blob = Text.encodeUtf8(response);
        
        let headers = Buffer.Buffer<(Text, Text)>(2);
        headers.add(("Content-Type", "text/plain"));
        headers.add(("Content-Length", Nat.toText(blob.size())));

        {
            body = blob;
            headers = Buffer.toArray(headers);
            status_code = 200 : Nat16;
            streaming_strategy = null;
        }
    };
}