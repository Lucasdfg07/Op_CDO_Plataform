function wasBannerRecentlyClosed() {
  const bannerClosedTime = localStorage.getItem('bannerClosedTime');
  if (!bannerClosedTime) {
    return false;
  }

  const timeElapsed = new Date().getTime() - new Date(bannerClosedTime).getTime();
  return timeElapsed < 3 * 24 * 60 * 60 * 1000; // 3 dias em milissegundos
}

document.addEventListener('DOMContentLoaded', () => {
  const installBanner = document.getElementById('install_banner');
  const closeBannerButton = document.getElementById('close_banner');

  if (wasBannerRecentlyClosed()) {
    if (installBanner) {
      installBanner.style.display = 'none';
    }
    return;
  }

  let deferredPrompt;
  window.addEventListener('beforeinstallprompt', (e) => {
    if (isRunningAsPWA()) {
      return;
    }

    e.preventDefault();
    deferredPrompt = e;
    if (installBanner && window.innerWidth <= 500) {
      installBanner.style.display = 'flex';
    }
  });

  if (installBanner && closeBannerButton) {
    closeBannerButton.addEventListener('click', () => {
      installBanner.style.display = 'none';
      localStorage.setItem('bannerClosedTime', new Date().toISOString());
    });

    if (deferredPrompt) {
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
    }
  }
});
