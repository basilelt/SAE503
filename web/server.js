const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const path = require('path');

const app = express();
const PORT = 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public'))); // Servir les fichiers statiques

// Exemple de base de données d'utilisateurs
const users = [
    { id: 1, username: 'Steve', email: 'steve@example.com', password: 'password123' },
    { id: 2, username: 'Alex', email: 'alex@example.com', password: 'pass456' },
    { id: 3, username: 'Herobrine', email: 'herobrine@example.com', password: 'secret789' }
];

// Simuler une base de données de joueurs
const players = {
    'Steve': {
        uuid: '123e4567-e89b-12d3-a456-426614174000',
        lastLogin: '2024-12-01 10:30:45',
        currentGame: 'Skyblock',
        map: 'Survival Map',
        score: 1560,
        level: 15,
        status: 'Online'
    },
    'Alex': {
        uuid: '123e4567-e89b-12d3-a456-426614174001',
        lastLogin: '2024-12-03 14:12:22',
        currentGame: 'Bedwars',
        map: 'Parkour Map',
        score: 2350,
        level: 22,
        status: 'Offline'
    },
    'Basile': {
        uuid: '123e4567-e89b-12d3-a456-426614174002',
        lastLogin: '2024-12-05 16:45:12',
        currentGame: 'Creative World',
        map: 'Creative Map',
        score: 3000,
        level: 25,
        status: 'Online'
    },
    'Justin': {
        uuid: '123e4567-e89b-12d3-a456-426614174003',
        lastLogin: '2024-12-04 10:15:22',
        currentGame: 'Adventure',
        map: 'Adventure Map',
        score: 1850,
        level: 18,
        status: 'Online'
    },
    'Evan': {
        uuid: '123e4567-e89b-12d3-a456-426614174004',
        lastLogin: '2024-12-02 08:30:00',
        currentGame: 'Survival',
        map: 'Survival Map',
        score: 2100,
        level: 20,
        status: 'Offline'
    },
    'Christo': {
        uuid: '123e4567-e89b-12d3-a456-426614174005',
        lastLogin: '2024-12-06 12:00:00',
        currentGame: 'Parkour',
        map: 'Parkour Map',
        score: 2500,
        level: 23,
        status: 'Online'
    }
};

// Route d'authentification unifiée
app.post('/api/auth/login', (req, res) => {
    const { identifier, password } = req.body;

    // Rechercher l'utilisateur par nom d'utilisateur ou email
    const user = users.find(u => (u.username === identifier || u.email === identifier) && u.password === password);

    if (user) {
        res.json({ success: true, username: user.username });
    } else {
        res.json({ success: false });
    }
});

// Route pour obtenir les statistiques d'un joueur spécifique
app.get('/api/player/:username', (req, res) => {
    const username = req.params.username;
    if (players[username]) {
        res.json(players[username]);
    } else {
        res.status(404).json({ error: 'Player not found.' });
    }
});

// Route pour obtenir tous les joueurs
app.get('/api/players', (req, res) => {
    res.json(players);
});

// Servir le fichier index.html à la racine
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Route pour servir le fichier index.html
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Démarrer le serveur
app.listen(PORT, '0.0.0.0', () => { // Modifier ici pour écouter sur toutes les interfaces
    console.log(`Serveur démarré sur le port ${PORT}`);
});