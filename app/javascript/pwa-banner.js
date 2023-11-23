let deferredPrompt;

window.addEventListener('beforeinstallprompt', (e) => {
  // Verificar se o usuário já interagiu com o prompt de instalação
  if (localStorage.getItem('pwaInstallPrompted')) {
    return;
  }

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
      if (deferredPrompt) {
        installBanner.style.display = 'none';
        deferredPrompt.prompt(); // Mostra o prompt de instalação
        deferredPrompt.userChoice.then((choiceResult) => {
          localStorage.setItem('pwaInstallPrompted', 'true'); // Armazenar que o usuário foi solicitado
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
