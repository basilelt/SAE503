<script>
  const fetchPlayerStats = async () => {
    try {
      const response = await fetch('http://localhost:7000/v1/players', {
        method: 'GET',
        headers: {
          'Authorization': 'toto',
          'accept': 'application/json'
        }
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json();
      updatePlayerStats(data.onlinePlayers);
    } catch (error) {
      console.error('Failed to fetch player stats:', error);
    }
  };

  const updatePlayerStats = (players) => {
    const container = document.getElementById('players-table-body');
    container.innerHTML = '';

    if (players.length === 0) {
      container.innerHTML = '<tr><td colspan="8">No players online.</td></tr>';
      return;
    }

    players.forEach((player) => {
      const row = document.createElement('tr');
      row.innerHTML = `
        <td>${player.name}</td>
        <td>${player.uuid}</td>
        <td>${player.lastLogin}</td>
        <td>${player.currentGame || 'N/A'}</td>
        <td>${player.map || 'N/A'}</td>
        <td>${player.score || 0}</td>
        <td>${player.level || 0}</td>
        <td>${player.status || 'Offline'}</td>
      `;
      container.appendChild(row);
    });
  };

  document.addEventListener('DOMContentLoaded', fetchPlayerStats);
</script>
