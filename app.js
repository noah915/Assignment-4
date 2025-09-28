const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

// Serve static files from public directory
app.use(express.static('public'));

// Basic route
app.get('/api/status', (req, res) => {
    // Indicate whether the app is running inside a container via env var
    const containerized = process.env.CONTAINERIZED === 'true';
    res.json({ 
        status: 'running',
        message: 'server running',
        containerized,
        timestamp: new Date().toISOString(),
        port: PORT
    });
});

// Health check endpoint
app.get('/health', (req, res) => {
    res.status(200).send('OK');
});

// Start server
app.listen(PORT, '0.0.0.0', () => {
    const containerized = process.env.CONTAINERIZED === 'true';
    console.log(`Server running on port ${PORT} (containerized=${containerized})`);
});