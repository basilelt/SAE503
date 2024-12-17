document.addEventListener('DOMContentLoaded', () => {
    updateAuthLinks(); // Met à jour les liens de connexion/déconnexion
    fetchPlayers(); // Récupère les joueurs depuis le backend

    const currentPlayerId = getCurrentPlayerId(); // Récupère l'ID du joueur actuel

    if (currentPlayerId) {
        activatePlayer(currentPlayerId); // Active le joueur

        // Envoie un heartbeat toutes les minutes
        const heartbeatInterval = setInterval(() => {
            sendHeartbeat(currentPlayerId);
        }, 60000);

        // Désactive le joueur lorsqu'il quitte la page
        window.addEventListener('beforeunload', () => {
            deactivatePlayer(currentPlayerId);
            clearInterval(heartbeatInterval);
        });
    }
});

async function fetchPlayers() {
    try {
        const response = await fetch('http://localhost:3000/api/players'); // URL mise à jour
        if (!response.ok) throw new Error('Erreur lors de la récupération des joueurs');

        const players = await response.json();
        renderPlayers(players);
    } catch (error) {
        console.error('Error fetching players:', error);
    }
}

function renderPlayers(players) {
    const tableBody = document.getElementById('playerTable').querySelector('tbody');
    tableBody.innerHTML = '';
    players.forEach(player => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${player.id}</td>
            <td>${player.name}</td>
            <td>${player.lastLogin}</td>
            <td>${player.currentGame}</td>
            <td>${player.score}</td>
            <td>${player.level}</td>
            <td class="${player.isActive ? 'status-active' : 'status-inactive'}">
                ${player.isActive ? 'Active' : 'Inactive'}
            </td>
        `;
        tableBody.appendChild(row);
    });
}

async function activatePlayer(playerId) {
    try {
        await fetch(`http://localhost:3001/api/player/${playerId}/activate`, { method: 'POST' }); // URL mise à jour
        console.log(`Player ${playerId} activated.`);
    } catch (error) {
        console.error('Error activating player:', error);
    }
}

async function deactivatePlayer(playerId) {
    try {
        await fetch(`http://localhost:3001/api/player/${playerId}/deactivate`, { method: 'POST' }); // URL mise à jour
        console.log(`Player ${playerId} deactivated.`);
    } catch (error) {
        console.error('Error deactivating player:', error);
    }
}

async function sendHeartbeat(playerId) {
    try {
        await fetch(`http://localhost:3001/api/player/${playerId}/heartbeat`, { method: 'POST' }); // URL mise à jour
        console.log(`Heartbeat sent for player ID: ${playerId}`);
    } catch (error) {
        console.error('Error sending heartbeat:', error);
    }
}

function getCurrentPlayerId() {
    const username = localStorage.getItem('username');
    return username ? 1 : null; // Simule un ID récupéré pour le joueur actuel
}

async function login(username, password) {
    try {
        const response = await fetch('http://localhost:3001/api/auth/login', { // URL mise à jour
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ identifier: username, password }),
        });

        if (!response.ok) throw new Error('Erreur lors de la connexion');

        const data = await response.json();
        if (data.success) {
            localStorage.setItem('username', data.username);
            updateAuthLinks();
            alert(`Welcome, ${data.username}!`);
        } else {
            alert('Login failed: Invalid credentials.');
        }
    } catch (error) {
        alert('Login failed: ' + error.message);
    }
}

function logout() {
    localStorage.removeItem('username');
    updateAuthLinks();
    alert('You have been logged out.');
}

function updateAuthLinks() {
    const authLinks = document.getElementById('authLinks');
    const username = localStorage.getItem('username');
    if (username) {
        authLinks.innerHTML = `
            <span class="desktop_navbar_link2">Hi, ${username}</span>
            <a href="#" class="desktop_navbar_link2" onclick="logout()">Logout</a>
        `;
    } else {
        authLinks.innerHTML = `
            <a href="#login" class="desktop_navbar_link2" onclick="openLoginModal()">Login</a>
        `;
    }
}

function openLoginModal() {
    document.getElementById('joinModal').style.display = 'block';
}

function closeLoginModal() {
    document.getElementById('joinModal').style.display = 'none';
}
