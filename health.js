const os = require('os');
const express = require('express');

const app = express();
const PORT = 3000;
const MEMORY_THRESHOLD = 80; // Memory usage threshold in percentage

// Function to calculate memory usage
function getMemoryUsage() {
    const totalMem = os.totalmem();
    const freeMem = os.freemem();
    const usedMemPercent = ((totalMem - freeMem) / totalMem) * 100;
    return usedMemPercent;
}

// Health check endpoint
// Return 500 if memory usage > MEMORY_THRESHOLD
app.get('/', (req, res) => {
    const usedMemPercent = getMemoryUsage();
    const usedMemPercentFormatted = usedMemPercent.toFixed(2);
    
    if (usedMemPercent < MEMORY_THRESHOLD) {
        res.status(200).send('Memory usage OK: ' + usedMemPercentFormatted);
    } else {
        res.status(500).send('Memory usage too high: ' + usedMemPercentFormatted);
    }
});

// Start the server
app.listen(PORT, () => {
    console.log(`Health monitoring service running on port ${PORT}`);
});
