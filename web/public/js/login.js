document.addEventListener('DOMContentLoaded', () => {

  const users = {
    Steve: { password: 'steve123' },
    Alex: { password: 'alex123' },
  };

  document.getElementById('loginBtn').addEventListener('click', () => {
      const username = document.getElementById('username').value.trim();
      const password = document.getElementById('password').value.trim();
      const errorMessage = document.getElementById('error-message');

     
      if (users[username] && users[username].password === password) {
        localStorage.setItem('currentUser', username); // Stocke l'utilisateur
         window.location.href = 'index.html'; // Redirige vers la page principale
      } else {
          errorMessage.classList.remove('d-none');
          errorMessage.textContent = 'Invalid username or password. Please try again.';
      }
  });
});
