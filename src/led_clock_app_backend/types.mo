module {
    public type HttpRequest = {
        body: Blob;
        headers: [(Text, Text)];
        method: Text;
        url: Text;
    };

    public type HttpResponse = {
        body: Blob;
        headers: [(Text, Text)];
        status_code: Nat16;
        streaming_strategy: ?StreamingStrategy;
    };

    public type StreamingStrategy = {
        #Callback: {
            callback: shared () -> async ();
            token: StreamingCallbackToken;
        };
    };

    public type StreamingCallbackToken = {
        content_encoding: Text;
        index: Nat;
        key: Text;
    };
}