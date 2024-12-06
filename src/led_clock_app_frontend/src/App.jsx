import React, { useEffect, useState } from "react";
import axios from "axios";
import "./index.scss"; // Updated to use SCSS for LED styling

const App = () => {
  const [time, setTime] = useState("00:00:00");

  useEffect(() => {
    const fetchTime = async () => {
      try {
        const response = await axios.get("/api/v2/canister/bkyz2-fmaaa-aaaaa-qaaaq-cai/query", {
          params: {
            method: "getTime"
          }
        });
        setTime(response.data);
      } catch (error) {
        console.error("Error fetching time:", error);
      }
    };
    
    fetchTime();
    const interval = setInterval(fetchTime, 1000);

    return () => clearInterval(interval);
  }, []);

  return (
    <div className="led-clock">
      <h1>LED Animated Clock</h1>
      <div className="led-time">{time}</div>
    </div>
  );
};

export default App;