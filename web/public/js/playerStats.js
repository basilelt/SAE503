// ...existing code...

function fetchPlayerStats() {
    const username = document.getElementById('player-username').value;

    // Appeler l'API pour obtenir les statistiques du joueur
    fetch(`/api/player/${username}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Player not found.');
            }
            return response.json();
        })
        .then(player => {
            document.getElementById('player-name').textContent = username;
            document.getElementById('player-uuid').textContent = player.uuid;
            document.getElementById('player-last-login').textContent = player.lastLogin;
            document.getElementById('player-current-game').textContent = player.currentGame;
            document.getElementById('player-map').textContent = player.map;
            document.getElementById('player-score').textContent = player.score;
            document.getElementById('player-level').textContent = player.level;
            document.getElementById('player-status').textContent = player.status;

            document.getElementById('player-details').style.display = 'block';
            document.getElementById('player-error').style.display = 'none';
        })
        .catch(error => {
            document.getElementById('player-error').textContent = error.message;
            document.getElementById('player-error').style.display = 'block';
            document.getElementById('player-details').style.display = 'none';
        });
}

function viewAllPlayers() {
    // Appeler l'API pour obtenir tous les joueurs
    fetch('/api/players')
        .then(response => response.json())
        .then(players => {
            const tableBody = document.getElementById('players-table-body');
            tableBody.innerHTML = '';

            for (const [name, stats] of Object.entries(players)) {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${name}</td>
                    <td>${stats.uuid}</td>
                    <td>${stats.lastLogin}</td>
                    <td>${stats.currentGame}</td>
                    <td>${stats.map}</td>
                    <td>${stats.score}</td>
                    <td>${stats.level}</td>
                    <td>${stats.status}</td>
                `;
                tableBody.appendChild(row);
            }

            document.getElementById('player-info').style.display = 'none';
            document.getElementById('all-players').style.display = 'block';
        });
}

function hideAllPlayers() {
    document.getElementById('all-players').style.display = 'none';
    document.getElementById('player-info').style.display = 'block';
}