let deferredPrompt;
const installBanner = document.getElementById('install_banner'); // Referência ao banner

window.addEventListener('beforeinstallprompt', (e) => {
  e.preventDefault();
  deferredPrompt = e;
  if (window.innerWidth <= 500) {
    installBanner.style.display = 'flex';
  }
});

installBanner.addEventListener('click', () => {
  installBanner.style.display = 'none';
  deferredPrompt.prompt();
  deferredPrompt.userChoice.then((choiceResult) => {
    if (choiceResult.outcome === 'accepted') {
      console.log('Usuário aceitou a instalação do PWA');
    } else {
      console.log('Usuário recusou a instalação do PWA');
    }
    deferredPrompt = null;
  });
});
