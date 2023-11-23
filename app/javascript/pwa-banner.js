let deferredPrompt;

window.addEventListener('beforeinstallprompt', (e) => {
  e.preventDefault();
  deferredPrompt = e;
  const installBanner = document.getElementById('install_banner');
  if (installBanner && window.innerWidth <= 500) {
    installBanner.style.display = 'flex';
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const installBanner = document.getElementById('install_banner');
  if (installBanner) {
    installBanner.addEventListener('click', () => {
      if (deferredPrompt) { // Verifica se deferredPrompt foi definido
        installBanner.style.display = 'none';
        deferredPrompt.prompt(); // Mostra o prompt de instalação
        deferredPrompt.userChoice.then((choiceResult) => {
          if (choiceResult.outcome === 'accepted') {
            console.log('Usuário aceitou a instalação do PWA');
          } else {
            console.log('Usuário recusou a instalação do PWA');
          }
          deferredPrompt = null;
        });
      }
    });
  }
});
