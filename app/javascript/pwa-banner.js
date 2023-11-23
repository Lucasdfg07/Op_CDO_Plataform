function isRunningAsPWA() {
  return (window.matchMedia('(display-mode: standalone)').matches) || (window.navigator.standalone) || document.referrer.includes('android-app://');
}

let deferredPrompt;

window.addEventListener('beforeinstallprompt', (e) => {
  // Não exibe o banner se estiver rodando como PWA
  if (isRunningAsPWA()) {
    console.log('Rodando como um PWA, banner não será exibido.');
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
