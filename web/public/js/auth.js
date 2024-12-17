/* ...existing code... */

// Supprimer la gestion du modal d'authentification Smart
/*
const smartAuthModal = document.getElementById('smartAuthModal');
const smartAuthBtn = document.getElementById('smartAuthBtn');
const smartAuthClose = smartAuthModal.querySelector('.close');

smartAuthBtn.onclick = function() {
    smartAuthModal.style.display = "block";
}

smartAuthClose.onclick = function() {
    smartAuthModal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == smartAuthModal) {
        smartAuthModal.style.display = "none";
    }
}
*/

// Supprimer la gestion de la soumission du formulaire d'authentification Smart
/*
document.getElementById('smartAuthForm').addEventListener('submit', function(event) {
    handleLoginSubmit(event, 'smart');
});
*/

// Modifier la gestion de la soumission du formulaire de connexion traditionnel pour utiliser uniquement une modal unifiée
document.getElementById('loginForm').addEventListener('submit', function(event) {
    handleLoginSubmit(event, 'traditional');
});

/* ...existing code... */

// Assurez-vous que la fonction handleLoginSubmit n'a plus de références à 'smart'
function handleLoginSubmit(event, formType) {
    event.preventDefault();
    const identifier = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();

    fetch('/api/auth/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ identifier, password })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            localStorage.setItem('username', data.username);
            updateAuthLinks();
            closeLoginModal();
            alert(`Bienvenue, ${data.username}!`);
        } else {
            alert('Identifiants invalides. Veuillez réessayer.');
        }
    })
    .catch(error => {
        console.error('Erreur:', error);
        alert('Une erreur est survenue lors de la connexion.');
    });
}

/* ...existing code... */